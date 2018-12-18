<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>login_form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
	angular.module("myApp",[])
	.controller("myCtrl", function($scope, $http){
		
		$scope.canUseId=false;
		
		//id 입력란이 포커스를 잃었을 때 호출되는 함수
		$scope.idCheck=function(){
			var id=$scope.id;
			var isEmail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var isPhone=/^01[016789][0-9]{3,4}[0-9]{4}$/;
			
			if(!isPhone.test(id) && !isEmail.test(id)){
				$scope.canUseId=false;
				return false;
				console.log($scope.canUseId);
			}
			$scope.canUseId=true;
			console.log($scope.canUseId);
		}
	});
</script>
<style>
	.control-label{
		display: none;
	}
	
	.panel-title > img{
		width:250px;
		height:150px;
	}
	
	.mainImg{
		width:600px;
		height:660px;
		margin-left:100px;
	}
	
	.mainImg > img{
		width:400px;
		height:636px;
	}
	
	.panel-default > .panel-heading{
		background-color:#fff;
		border-color:#fff;
	}
	
	.glyphicon.form-control-feedback.glyphicon-remove-circle, .glyphicon.form-control-feedback.glyphicon-ok-circle{
		top: 0px;
	}
</style>
</head>
<body ng-controller="myCtrl">
<div class="container">
	<div class="row">
		<!-- image (left) -->
		<div id="content-left" class="col-lg-5 col-sm-offset-1 hidden-sm hidden-xs">
			<div class="mainImg">
				<img src="${pageContext.request.contextPath}/resources/images/main.png" />
			</div>
		</div>
		
		<div class="col-lg-4">
				<a href="${google_url }">
				<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width:100%">
					<i class="fa fa-google" aria-hidden="true"></i>Google Login		
				</button></a>
			<form action="login.do" id="loginForm" name="lf" method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">
							<img src="${pageContext.request.contextPath}/resources/images/instagram-new-logo.png" />
						</div>
					</div>
					<div class="panel-body" style="text-align:center">
						<div class="form-group has-feedback" ng-class="{'has-success':canUseId, 'has-error': !canUseId && lf.id.$dirty}">
							<label class="control-label" for="id">전화번호 또는 이메일</label>
							<input class="form-control" type="text" id="id" name="id" ng-model="id" ng-required="true" ng-blur="idCheck()" placeholder="전화번호 또는 이메일"/>
							<span ng-show="lf.id.$valid" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
							<span ng-show="lf.id.$invalid && lf.id.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
							<p ng-show="!canUseId && lf.id.$dirty" class="help-block">전화번호나 이메일 형식에 맞게 입력해주세요</p>
						</div>
						<div class="form-group">
							<label class="control-label" for="pwd">비밀번호</label>
							<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호" />
						</div>
					</div>
					<button ng-disabled="lf.$invalid || !canUseId" class="btn btn-primary btn-block" type="submit">로그인</button>
				</div>
			</form>
			<!-- sign up -->
			<div class="panel panel-default">
				<div class="panel-body" style="align:center;">
					<p>계정이 없으신가요? <a href="signup_form.do">가입하기</a></p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>