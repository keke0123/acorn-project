
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<a href="private/upload_form.jsp">이미지 업로드</a>
	| <a href="private/upload_form2.jsp">이미지 업로드2</a>
	| <a href="private/upload_form3.jsp">이미지 업로드3</a>
	<h3>Gallery 이미지 목록 입니다.</h3>
	
		<div class="col-xs-6 col-sm-3">
			<h4></h4>
			<img class="img-responsive" src=""/>
			<p>작성자: <strong></strong></p>
			<p>날짜: <strong></strong></p>
		</div>
	
	</div>
</div>
</body>
</html>









