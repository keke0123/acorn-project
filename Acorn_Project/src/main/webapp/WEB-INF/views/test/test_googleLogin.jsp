<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top:50px">
	<a href="${google_url }">
		<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width:100%">
			<i class="fa fa-google" aria-hidden="true"></i>Google Login		
		</button>
	</a>
</div>
</body>
</html>