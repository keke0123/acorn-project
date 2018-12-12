<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/greeting.jsp</title>
</head>
<body>
<p><strong>${id }</strong> 님 가입을 축하 합니다.</p>
<a href="login_form.do">로그인 하러 가기</a>
<a href="${pageContext.request.contextPath}/home.do">인덱스로 가기</a>
</body>
</html>









