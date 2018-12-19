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
/* 비밀번호 표시하는 함수 */
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

/* 리캡차 때문에 만든거 */
function onSubmit() {
    document.getElementById("signupForm").submit();
    grecaptcha.execute();
}

	angular.module("myApp",[])
	.controller("myCtrl", function($scope, $http){
		
		//id 중복여부를 체크하는 함수
		$scope.canUseId=false;
		$scope.canUseNick=false;
		$scope.canUseReg=false;
		
		//구글 가입하기 눌렀을때 세팅 될 값들
		$scope.gId="${gEmail}";
		$scope.gName="${gName}";
		$scope.gNick="${gNick}";
		
		//로그인 페이지로 이동
		$scope.loginBtn=function(){
			location.href='login_form.do';
		}
		
		//id 입력란이 포커스를 잃었을 때 호출되는 함수
		$scope.idCheck=function(){
			var id=$scope.gId;
			var isEmail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var isPhone=/^01[016789][0-9]{3,4}[0-9]{4}$/;
			
			//이메일이랑 핸드폰 정규식 둘 다 만족하지 않으면
			if(!isPhone.test(id) && !isEmail.test(id)){
				$scope.canUseReg=false;
				return false;
			}
			
			//이메일이나 핸드폰 정규식 중 하나를 만족하면
			$scope.canUseReg=true;
			
			//입력한 아이디를 ajax 요청을 통해 서버에 보내기
			$http({
				url:"checkid.do",
				method:"get",
				params:{inputId:$scope.gId}
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
				params:{inputNick:$scope.gNick}
			})
			.success(function(responseData){
				//true or false 반환
				$scope.canUseNick=responseData.canUseNick;
			});
		};
		
		//구글 회원가입해서 값을 넣어줬을때 angular 작동
		$scope.load=function(){
			if($scope.gId!=""){
				$scope.idCheck();
				$scope.nickCheck();
				$scope.sf.id.$dirty=true;
				$scope.sf.nick.$dirty=true;
				
				document.querySelector("#pwd").focus();
			}
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
	
	.mainImg > img{
		width:450px;
		height:636px;
		margin-left:50px;
	}
	
	.panel-default > .panel-heading{
		background-color:#fff;
		border-color:#fff;
	}
	
	.panel-title > img{
		width:250px;
		height:100px;
	}
	
	.form-group input {
		margin-bottom: 4px;
		border: 1px solid #efefef;
   		background-color: #fafafa;
   		border-radius: 3px;
	}
</style>
</head>
<body ng-controller="myCtrl">
<!-- main -->
<div class="container">
	<div class="row">
		<!-- image (left) -->
		<div id="content-left" class="col-lg-5 col-sm-offset-1 hidden-sm hidden-xs" style="top:70px;">
			<div class="mainImg">
				<img src="${pageContext.request.contextPath}/resources/images/main1.png" />
			</div>
		</div>
		
		<!-- sign up (right) -->
		<div id="content-right" class="col-lg-4" style="top:90px;">
			<div class="panel panel-default text-center">
				<div class="panel-heading">	
					<!-- title image -->
					<span class="panel-title">
						<img src="${pageContext.request.contextPath}/resources/images/instagram-new-logo.png"/>
					</span>		
					<!-- google login -->
					<a href="${google_url }">
						<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width:100%">
							<i class="fa fa-google" aria-hidden="true"></i>Google Sign Up		
						</button>
					</a>
				</div>
				
				<p>또는</p>
				<!-- sign up form -->
				<form action="signup.do" method="post" name="sf" id="signupForm" novalidate>		
					<div class="panel-body">			
						<div class="form-group has-feedback"
							ng-class="{'has-success':canUseId && canUseReg , 'has-error': (!canUseId || !canUseReg) && sf.id.$dirty}">
							<label class="control-label" for="id">휴대폰 번호 또는 이메일 주소</label>
							<input class="form-control" ng-blur="idCheck()" ng-required="true"
							type="text" id="id" name="id" placeholder="휴대폰 번호 또는 이메일 주소" ng-model="gId"/>
							<span ng-show="sf.id.$valid && canUseId" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
							<span ng-show="(sf.id.$invalid || !canUseId) && sf.id.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
							<p ng-show="sf.id.$error.required && sf.id.$dirty" class="help-block">아이디를 입력해주세요</p>
							<p ng-show="!canUseId && sf.id.$dirty" class="help-block">이미 등록된 아이디 입니다.</p>
							<p ng-show="!canUseReg && sf.id.$dirty" class="help-block">전화번호나 이메일을 입력해주세요</p>
						</div>
						<div class="form-group has-feedback"
							ng-class="{'has-success':sf.name.$valid}">
							<label class="control-label" for="name">성명</label>
							<input ng-required="true" ng-pattern="/./" class="form-control" type="text" id="name" name="name" ng-model="gName" placeholder="성명"/>
							<span ng-show="sf.name.$valid" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback"
							ng-class="{'has-success':canUseNick, 'has-error': !canUseNick && sf.nick.$dirty}">
							<label class="control-label" for="nick">사용자 이름</label>
							<input class="form-control" ng-model="gNick" ng-blur="nickCheck()" ng-required="true" 
							type="text" id="nick" name="nick" placeholder="사용자 이름"/>
							<span ng-show="sf.nick.$valid && canUseNick" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
							<span ng-show="(sf.nick.$invalid || !canUseNick) && sf.nick.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
							
							<p ng-show="sf.nick.$error.required && sf.nick.$dirty" class="help-block">사용자 이름을 입력해주세요</p>
							<p ng-show="!canUseNick && sf.nick.$dirty" class="help-block">사용 할 수 없는 사용자 이름 입니다.</p>
						</div>
						<div class="form-group has-feedback"
							ng-class="{'has-success':sf.pwd.$valid, 'has-error': sf.pwd.$invalid && sf.pwd.$dirty}">
							<label class="control-label" for="pwd">비밀번호</label>
							
							<input ng-model="pwd" ng-required="true" ng-pattern="/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/" class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호"/>
							<button ng-show="sf.pwd.$dirty" class="btn btn-link" type="button" onclick="pwdCheck()">비밀번호 표시</button>
							<span ng-show="sf.pwd.$valid" class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
							<span ng-show="sf.pwd.$invalid && sf.pwd.$dirty" class="glyphicon glyphicon-remove-circle form-control-feedback"></span>
							<p ng-show="sf.pwd.$invalid && sf.pwd.$dirty" class="help-block">영문, 숫자, 특수문자 포함 6자 이상 20자 내로 입력하세요.</p>
						</div> 
				
						<button 
						ng-disabled="sf.$invalid || !canUseId || !canUseNick" 
						class="btn btn-primary btn-block input-block-level" onclick="onSubmit()">가입</button>
						
						<!-- recaptcat -->
						<div class="g-recaptcha"
					          data-sitekey="6LcFcYEUAAAAAMBMeeUh0Rr6Q__wsPienQNERn0Y"
					          data-callback="onSubmit"
					          data-size="invisible">
					    </div>
						<div>
							<p><br />가입하면 Instagram의 약관, 데이터 정책 및 <br />쿠키 정책에 동의하게 됩니다.</p>
						</div>								
					</div>
				</form> <!-- form end -->
			</div><!-- panel end -->
			
			<div class="panel panel-default" style="text-align:center;">
				<div class="panel-body">
					<p>계정이 있으신가요? <button class="btn btn-link" type="button" ng-click="loginBtn()">로그인</button></p>
					<span ng-init="load()"></span>
				</div>
			</div>
			
		</div> <!-- content right end -->
	</div> <!-- div row end -->
</div>
</body>
</html>