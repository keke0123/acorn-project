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
	
</style>
</head>
<body>
<div class="container">

<!-- 구글 로그인 화면으로 이동 시키는 URL -->
<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
<div id="google_id_login" style="text-align:center">
<a href="${google_url}">
gg</a></div>
	
	<div class="col-sm-6 col-sm-offset-3">
		<form action="login.do" method="post">
			<div class="form-group">
				<label class="control-label" for="id">전화번호 또는 이메일</label>
				<input class="form-control" type="text" id="id" name="id" placeholder="전화번호 또는 이메일"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호" />
			</div>
			<button class="btn btn-primary btn-block" type="submit">로그인</button>
		</form>
	</div>
</div>
</body>
</html>