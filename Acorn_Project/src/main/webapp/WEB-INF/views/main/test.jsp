<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
<title>test</title>
</head>
<body>
<div class="container" style="margin-top:50px">
	<h3>테스트 페이지 입니다.</h3>
	<p><a href="getTest.do?id=user1">getTest 페이지로 이동</a></p>
</div>
</body>
</html>