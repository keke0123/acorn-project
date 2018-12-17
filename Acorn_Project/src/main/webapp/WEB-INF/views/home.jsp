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
<div class="container" style="margin-top:50px;">
	<h3>home</h3>
	<p><a href="main/test.do">테스트 페이지</a></p>
	<p><a href="main/main.do">main 페이지</a></p>
	<p><a href="test_googleLogin.do">google 로그인 페이지</a></p>
	<p><a href="test_googleLogin.do?code=1026387747767-c1n9jqp8i3b318ut4a5tgoc6hbbg8rgs.apps.googleusercontent.com">google 로그인 페이지</a></p>
</div>
</body>
</html>