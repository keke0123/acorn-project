<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_form</title>
</head>
<body>
<div class="container">
	<form action="login.do" method="post">
	<div>
		<input type="text" id="id" name="id" placeholder="아이디"/>
	</div>
	<div>
		<input type="password" id="pwd" name="pwd" placeholder="비밀번호" />
	</div>
	<button type="submit">로그인</button>
	</form>
</div>
</body>
</html>