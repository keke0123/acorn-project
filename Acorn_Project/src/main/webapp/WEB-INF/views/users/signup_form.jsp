<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="428552167540-go5t955lqhknluvjlr7s59421o0g4a8f.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>SIGN UP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
function pwdCheck(){
	var isPwd=document.querySelector("#pwd").getAttribute('type');
	if(isPwd=="password"){
		console.log("pwd");
		document.querySelector("#pwd").setAttribute('type','text');
	}else{
		console.log("no");
		document.querySelector("#pwd").setAttribute('type','password');
	}
	return false;
} 

function submitForm() {
    document.getElementById("signupForm").submit();
}

	angular.module("myApp",[])
	.controller("myCtrl", function($scope, $http){
		
		//id 중복여부를 체크하는 함수
		$scope.canUseId=false;
		$scope.canUseNick=false;
		$scope.canUseReg=false;
		
		
		//id 입력란이 포커스를 잃었을 때 호출되는 함수
		$scope.idCheck=function(){
			var id=$scope.id;
			var isEmail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var isPhone=/^01[016789][0-9]{3,4}[0-9]{4}$/;
			
			if(!isPhone.test(id) && !isEmail.test(id)){
				$scope.canUseReg=false;
				return false;
			}
			$scope.canUseReg=true;
			
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
		
		//nick 입력란이 포커스를 잃었을 때 호출되는 함수
		$scope.nickCheck=function(){
		
			$http({
				url:"checkNick.do",
				method:"get",
				params:{inputNick:$scope.nick}
			})
			.success(function(responseData){
				//true or false 반환
				$scope.canUseNick=responseData.canUseNick;
			});
		};
	});
</script>
<style>
	.control-label{
		display: none;
	}
	.glyphicon.form-control-feedback.glyphicon-remove-circle, .glyphicon.form-control-feedback.glyphicon-ok-circle{
		top: 0px;
	}
	.form-group button{
		position: absolute;
		top: 4px;
		right: 34px;
		text-decoration:none; 
		color:black;
	}
</style>
</head>
<body ng-controller="myCtrl">
<div class="container">
	<div class="col-sm-6 col-sm-offset-3">
	
		<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      };
    </script>
	
		<form action="signup.do" method="post" name="sf" id="signupForm" novalidate>
			<div class="form-group has-feedback"
				ng-class="{'has-success':canUseId && canUseReg , 'has-error': (!canUseId || !canUseReg) && sf.id.$dirty}">
				<label class="control-label" for="id">휴대폰 번호 또는 이메일 주소</label>
				<input class="form-control" ng-model="id" ng-blur="idCheck()" ng-required="true"
				type="text" id="id" name="id" placeholder="휴대폰 번호 또는 이메일 주소"/>
				<span ng-show="sf.id.$valid && canUseId" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
				<span ng-show="(sf.id.$invalid || !canUseId) && sf.id.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
				<p ng-show="sf.id.$error.required && sf.id.dirty" class="help-block">아이디를 입력해주세요</p>
				<p ng-show="!canUseId && sf.id.$dirty" class="help-block">이미 등록된 아이디 입니다.</p>
				<p ng-show="!canUseReg && sf.id.$dirty" class="help-block">전화번호나 이메일을 입력해주세요</p>
			</div>
			<div class="form-group has-feedback"
				ng-class="{'has-success':sf.name.$valid}">
				<label class="control-label" for="name">성명</label>
				<input ng-required="true" ng-pattern="/./" class="form-control" type="text" id="name" name="name" ng-model="name" placeholder="성명"/>
				<span ng-show="sf.name.$valid" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback"
				ng-class="{'has-success':canUseNick, 'has-error': !canUseNick && sf.nick.$dirty}">
				<label class="control-label" for="nick">사용자 이름</label>
				<input class="form-control" ng-model="nick" ng-blur="nickCheck()" ng-required="true" 
				type="text" id="nick" name="nick" placeholder="사용자 이름"/>
				<span ng-show="sf.nick.$valid && canUseNick" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
				<span ng-show="(sf.nick.$invalid || !canUseNick) && sf.nick.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
				
				<p ng-show="sf.nick.$error.required && sf.nick.dirty" class="help-block">사용자 이름을 입력해주세요</p>
				<p ng-show="!canUseNick && sf.nick.$dirty" class="help-block">사용 할 수 없는 사용자 이름 입니다.</p>
			</div>
			<div class="form-group has-feedback"
				ng-class="{'has-success':sf.pwd.$valid, 'has-error': sf.pwd.$invalid && sf.pwd.$dirty}">
				<label class="control-label" for="pwd">비밀번호</label>
				
				<input ng-model="pwd" ng-required="true" ng-pattern="/^[a-z]+$/" class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호"/>
				<button ng-show="sf.pwd.$dirty" class="btn btn-link" type="button" onclick="pwdCheck()">비밀번호 표시</button>
				<span ng-show="sf.pwd.$valid" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
				<span ng-show="sf.pwd.$invalid && sf.pwd.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
				<p ng-show="sf.pwd.$invalid && sf.pwd.$dirty" class="help-block">특수문자 포함 6자 이상 15자 내로 입력하세요.</p>
			</div> 
	
			<button 
			data-sitekey="6LcFcYEUAAAAAMBMeeUh0Rr6Q__wsPienQNERn0Y"
			data-callback="submitForm"
			ng-disabled="sf.$invalid || !canUseId || !canUseNick" 
			class="g-recaptcha btn btn-primary btn-block" type="submit">submit</button>
		</form>
	</div>
</div>
</body>
</html>