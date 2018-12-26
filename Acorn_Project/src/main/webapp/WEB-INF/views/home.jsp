<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<title>Instagram_Acorn</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<style>
.indexImg{
   height:512px;
   align:center;
   margin-left:120px;
}
div a img:hover{
	border:1px solid red;
	border-radius: 30px;
}
</style>
</head>
<body>
<div class="container" style="margin-top:50px">
<c:choose>
   <c:when test="${empty sessionScope.id }">
      <a href="users/login_form.do"></a>
   </c:when>
   <c:otherwise>
      <p> 
         <a href="users/info.do">${id }</a> 님 로그인중 ...
         <a href="users/logout.do">로그아웃</a>
      </p>
   </c:otherwise>
</c:choose> 

   <div>
      <a href="users/login_form.do"><img src="${pageContext.request.contextPath}/resources/images/in.png" class="indexImg"/></a>
   </div>
</div>
</body>
</html>