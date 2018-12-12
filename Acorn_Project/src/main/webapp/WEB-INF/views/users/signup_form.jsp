<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
	angular.module("myApp",[])
	.controller("myCtrl", function($scope, $http){
		
		//id 중복여부를 체크하는 함수
		$scope.canUseId=false;
		
		//id 입력란이 포커스를 잃었을 때 호출되는 함수
		$scope.idCheck=function(){
			//입력한 아이디를 ajax 요청을 통해 서버에 보내기
			$http({
				url:"checkid.do",
				method:"get",
				params:{inputId:$scope.id}
			})
			.success(function(responseData){
				//responseData는 json으로 true or false
				$scope.canUseId=responseData.canUse;
			});
		};
	});
</script>
<style>
	/* .control-label{
		display: none;
	} */
</style>
</head>
<body ng-controller="myCtrl">
<div class="container">
		<form action="signup.do" method="post" name="sf" id="signupForm" novalidate>
			<div class="form-group has-feedback"
				ng-class="{'has-success':canUseId , 'has-error': !canUseId && sf.id.$dirty}">
				<label class="control-label" for="id">휴대폰 번호 또는 이메일 주소</label>
				<input class="form-control" ng-model="id" ng-blur="idCheck()" ng-required="true" 
				type="text" id="id" name="id" placeholder="휴대폰 번호 또는 이메일 주소"/>
				<span ng-show="sf.id.$valid && canUseId" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
				<span ng-show="(sf.id.$invalid || !canUseId) && sf.id.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
				<p ng-show="sf.id.$error.required && sf.id.dirty" class="help-block">아이디를 입력해주세요</p>
				<p ng-show="!canUseId && sf.id.$dirty" class="help-block">이미 등록된 아이디 입니다.</p>
			</div>
			<div class="form-group has-feedback"
				ng-class="{}">
				<label class="control-label" for="name">성명</label>
				<input class="form-control" type="text" id="name" name="name" placeholder="성명"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="nick">사용자 이름</label>
				<input class="form-control" type="text" id="nick" name="nick" placeholder="사용자 이름"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호"/>
			</div>
			
			<button class="btn btn-primary btn-block" type="submit">submit</button>
		</form>
</div>
</body>
</html>