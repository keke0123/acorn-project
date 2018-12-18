<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<style>
	.control-label{
		display: none;
	}
	
	.panel-title > img{
		width:250px;
		height:150px;
	}
	
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<a href="${google_url }">
		<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width:100%">
			<i class="fa fa-google" aria-hidden="true"></i>Google Login		
		</button></a>
	
	
		<div class="col-sm-6 col-sm-offset-3">
			<form action="login.do" id="loginForm" method="post">
				<div class="panel">
					<div class="panel-heading">
						<div class="panel-title">
							<img src="${pageContext.request.contextPath}/resources/images/instagram-new-logo.png" />
						</div>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label" for="id">전화번호 또는 이메일</label>
							<input class="form-control" type="text" id="id" name="id" placeholder="전화번호 또는 이메일"/>
						</div>
						<div class="form-group">
							<label class="control-label" for="pwd">비밀번호</label>
							<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호" />
						</div>
					</div>
					<button class="btn btn-primary btn-block" type="submit">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>