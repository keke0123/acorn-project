<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<title>Insert title here</title>
<script>
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){
		$scope.boardList={};
		// session 의 id 값을 바탕으로 게시판 data 가져오기
		$scope.getData=function(){
			$http({
				url:"../getuserprofile.do",
				method:"get"
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				$scope.boardList=data;
			});
		};
		// 초기에 한번 데이타 가져오기
		$scope.getData();
	});
</script>
</head>
<body ng-controller="myCtrl">
<div class="container" style="margin-top:150px;">
	<div class="row " style="border:1px solid #BDBDBD;">
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<ul  class="nav nav-stacked" >
				<li class="a_click active">
					<a href="#profile" data-toggle="tab" class="menu" >프로필 편집</a>
				</li>
				<li>
					<a href="#pwd" data-toggle="tab" class="menu">비밀번호 변경 </a>
				</li>
			</ul>
		</div><!-- col-xs-4 -->
		<div class="col-sm-8 col-xs-12 " >
			<div class="tab-content" style="min-height:333px;">
				<!-- 1. id가 profile일때 -->
				<div class="tab-pane in active" id="profile"> 
					<form class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-3 control-label">
							<img src="${pageContext.request.contextPath}/resources/images/thumb_image1.png" alt="">
							</div>
							<div class="col-sm-9 control-label " id="basic">
								<div style="float:left;">
							<div style="font-size:20px;">Acorn</div>
							<label class="btn-file" style="cursor:pointer; color:#6699ff;">
							프로필 사진 수정 <input  type="file" style="display:none;">
									</label>
								</div>
								
							</div>
						</div>
				
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" ng-model="boardList.name"/>
							</div>
						</div>
				
						<div class="form-group">
							<label for="user_name" class="col-sm-3 control-label">사용자 이름</label>
							<div class="col-sm-9">
								<input value="Acorn" type="text" class="form-control" id="user_name" ng-model="boardList.nick"/>
								
							</div>
						</div>
				
						<div class="form-goup">
							<div class="col-sm-offset-3 col-sm-9">
								<span id="helpBlock" class="help-block">개인정보</span>
							</div>							
						</div>
						 
				
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">이메일</label>
							<div class="col-sm-9">
								<input value="Acorn@naver.com" type="text" class="form-control" id="email" ng-model="boardList.email"/>
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-3 control-label">전화번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" ng-model="boardList.phone"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-6 col-sm-offset-3">
								<button type="submit" class="btn btn-primary">제출</button>
							</div>
						</div>
					</form>
				</div> <!-- id=profile (프로필 변경 ) -->
				<div class="tab-pane" id="pwd">					
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-3 control-label">
								<img src="${pageContext.request.contextPath}/resources/images/thumb_image1.png" alt="">
							</div>
							<div class="col-sm-9 control-label " id="basic">
								<div style="float:left;">
									<div style="font-size:20px;">Acorn</div>
										<label class="btn-file" style="cursor:pointer; color:#6699ff;">
									프로필 사진 수정 <input  type="file" style="display:none;">
									</label>
								</div>	
							</div>
						</div>
						<form action="pwdAction" name="pwdForm" id="pwdForm" novalidate>
							<div class="form-group">
								<label class="col-sm-3 control-label">이전 비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="prev_pwd" name="prev_pwd" ng-required="true" ng-model="prev_pwd" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">새 비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="new_pwd1" name="new_pwd1" ng-required="true" ng-model="new_pwd1"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">새 비밀번호 확인</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="new_pwd2" name="new_pwd2" ng-required="true" ng-model="new_pwd2">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-6 col-sm-offset-3">
									<button id="pwdBtn" ng-disabled="pwdForm.$invalid"  type="submit" class="btn btn-primary">비밀번호 변경</button>
								</div><br/>
								<div class="col-sm-9 col-sm-offset-3">
									<p id="pwdCheck"></p>
								</div>
							</div>
						</form>
					</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>