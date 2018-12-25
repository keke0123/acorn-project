<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
	angular.module("myApp",[])
	.controller("myCtrl", function($scope, $http){
		$scope.gS="${isSuccess}";
		$scope.canUseId=false;
		$scope.isSuccess=true;
		
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
		}
		
		$scope.onSubmit=function(e){
			$http({
				url:"loginCheck.do",
				method:"post",
				headers:{
					"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"
				},
				data:"id="+$scope.id+"&pwd="+$scope.pwd 
			})
			.success(function(responseData){
				$scope.isSuccess=responseData.isSuccess;
				$scope.msg=responseData.msg;
				console.log("res"+$scope.isSuccess);
				
				if($scope.isSuccess){
					console.log("성공");
					console.log($scope.isSuccess);
					document.getElementById("loginForm").submit();
				}else{
					console.log("실패");
					console.log($scope.isSuccess);
					
				}
			});
			e.preventDefault();
		};
	});
</script>
<style>
	.control-label{
		display: none;
	}
	
	.panel-title > img{
		width:250px;
		height:100px;
	}
	
	.mainImg > img{
		width:450px;
		height:636px;
		margin-left:50px;
	}
	
	.panel-default > .panel-heading{
		background-color:#fff;
		border-color:#fff;
	}
	
	.glyphicon.form-control-feedback.glyphicon-remove-circle, .glyphicon.form-control-feedback.glyphicon-ok-circle{
		top: 0px;
	}
	
	.form-group input {
		margin-bottom: 4px;
		border: 1px solid #efefef;
   		background-color: #fafafa;
   		border-radius: 3px;
	}
	
	.btn-link > img{
		width: 20px;
		height: 20px;
	}
	
	.mainImgWrapper-1 {
		width: 454px;
   		height: 660px;
   		margin-left: 55px;
   		background: url(${pageContext.request.contextPath}/resources/images/main_01.png);
	    background-size: 454px 618px;
	    background-repeat: no-repeat;
	}
	.mainImgWrapper-1 > img {
		width: 247px;
	    height: 436px;
	    margin-left: 148px;
	    margin-top: 95px;
	    position: absolute;
	}
</style>
</head>
<body ng-controller="myCtrl">
<div class="container">
	<div class="row">
		<!-- image (left) -->
		<div id="content-left" class="col-lg-5 col-sm-offset-1 hidden-sm hidden-xs" style="top:70px;">
				<div class="mainImgWrapper-1">
				<img src="${pageContext.request.contextPath}/resources/images/main_inappImage1.jpg" />  
				<img src="${pageContext.request.contextPath}/resources/images/main_inappImage2.jpg"/>  
				<img src="${pageContext.request.contextPath}/resources/images/main_inappImage3.jpg" />  
			</div>
		</div>
		
		<!-- login (right) -->
		<div id="content-right" class="col-lg-4" style="top:90px;">
			<div class="panel panel-default text-center">
				<!-- title image -->
				<div class="panel-heading">
					<div class="panel-title">
						<img src="${pageContext.request.contextPath}/resources/images/instagram-new-logo.png" />
					</div>
				</div>
				<!-- login form -->
				<!-- 로그인 성공시 mainpage로 이동 -->
				<form action="${pageContext.request.contextPath}/main/mainpage.do" id="loginForm" name="lf" method="post" ng-submit="onSubmit($event)">		
					<div class="panel-body" style="text-align:center">
						<div ng-show="!isSuccess">
							<div ng-model="msg" class="alert alert-danger">{{msg}}</div>
						</div>
						<div ng-show="gS=='false'">
							<div class="alert alert-danger">존재하지 않는 구글계정입니다</div>
						</div>
						<div class="form-group has-feedback" ng-class="{'has-success':canUseId, 'has-error': !canUseId && lf.id.$dirty}">
							<label class="control-label" for="id">전화번호 또는 이메일</label>
							<input class="form-control" type="text" id="id" name="id" ng-model="id" ng-required="true" ng-blur="idCheck()" placeholder="전화번호 또는 이메일"/>
							<span ng-show="lf.id.$valid" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
							<span ng-show="lf.id.$invalid && lf.id.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
							<p ng-show="!canUseId && lf.id.$dirty" class="help-block">전화번호나 이메일 형식에 맞게 입력해주세요</p>
						</div>
						<div class="form-group">
							<label class="control-label" for="pwd">비밀번호</label>
							<input class="form-control" type="password" id="pwd" name="pwd" ng-model="pwd" placeholder="비밀번호" />
						</div>
						<button ng-disabled="lf.$invalid || !canUseId" class="btn btn-primary btn-block input-block-level" >로그인</button>
					</div>									
				</form> <!-- form end -->
				<p>또는</p>
				<!-- google login -->
				<a href="${google_url }">
				<button id="btnJoinGoogle" class="btn btn-link" style="width:100%">
					<i class="fa fa-google" aria-hidden="true"></i>
					<img src="${pageContext.request.contextPath}/resources/images/google.jpg"/>
					<b>Google Login	</b>
				</button></a><br /><br />
			</div> <!-- panel end -->
			<!-- sign up -->
			<div class="panel panel-default text-center">
				<div class="panel-body" style="align:center;">
					<p>계정이 없으신가요? <a href="${pageContext.request.contextPath}/users/signup_form.do">가입하기</a></p>
				</div>
			</div>
			<!-- recaptcat -->
			<div class="g-recaptcha"
		          data-sitekey="6LcFcYEUAAAAAMBMeeUh0Rr6Q__wsPienQNERn0Y"
		          data-callback="onSubmit"
		          data-size="invisible">
		    </div>
		</div> <!-- login(right) end -->
	</div>
</div>
<script>
var imgs = $(".mainImgWrapper-1 img");
var imgId = 1;
setInterval(function() {
	$(".mainImgWrapper-1 img").fadeOut(2000);
	$(imgs[imgId-1]).fadeIn(2000);
	if(imgId == 3) imgId = 1;
	else imgId++
}, 4000);
</script>
</body>
</html>