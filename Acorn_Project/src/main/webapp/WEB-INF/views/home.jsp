<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<title>home</title>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.id }">
		<a href="users/login_form.do">로그인</a>
	</c:when>
	<c:otherwise>
		<p> 
			<a href="users/info.do">${id }</a> 님 로그인중 ...
			<a href="users/logout.do">로그아웃</a>
		</p>
	</c:otherwise>
</c:choose>
<div class="container" style="margin-top:50px;">
	<h3>home</h3>
<<<<<<< HEAD
	<a href="users/signup_form.do">회원가입</a>
	<a href="users/login_form.do">로그인</a>
=======
	<p><a href="main/test.do">테스트 페이지</a></p>
	<p><a href="main/main.do">main 페이지</a></p>
>>>>>>> refs/heads/main
</div>
</body>
</html>