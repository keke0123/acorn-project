<!-- 2018 12 12 
송현철 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/list/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js "></script>
</head>
<body>

<div class="container">
	<p>검색</p>
</div>

<div class="container">
	<form class="form-inline" id="formSearch">
	   	<div class="form-group mx-sm-3 mb-2">
    		<label for="inputState">검색조건</label>
    		<select id="inputState" class="form-control">
      			<option selected>인기</option>
       		 		<option>사람</option>
       		 		<option>태그</option>
     		</select>
   		</div>
  		<div class="form-group mx-sm-3 mb-2">
    		<label for="staticEmail2" class="sr-only">Email</label>
    		<input type="text"  class="form-control-plaintext" id="staticEmail2" placeholder="검색조건을 입력해주세요">
  		</div>
  		<button  type="submit" class="btn btn-primary mb-2">Confirm identity</button>
	</form>
	
	<h3>인기인목록입니다.</h3>
		<table class="table table-bordered">
			<thead>
				<th>그림</th>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
			</thead>
			 <tbody>
			 	<c:forEach items="${list }" var="tmp">
			 		<tr>
			 			<td>${tmp.orgFileName}</td>
			 			<td>${tmp.num}</td>
			 			<td>${tmp.id}</td>
			 			<td>${tmp.nick}</td>
			 		</tr>
			 	</c:forEach>
			 </tbody>
		</table>
	
	</div>
	
	<script>
		$("#formSearch").on("submit",function(){
			$.ajax({
				url:"search/searchProcess.do",
				method:"get",
				success:function(data){
					console.log(data);
					
					/* mime type application/json 변경 후 파싱이 필요없음 */
					$("#result").text(data.foruneToday) 
					
					/* 파싱이 필요없음 */
					/* var obj=JSON.parse(data); */
					/* console.log(obj);
					$("#result").text(obj.foruneToday) */
				}
			});
		});
	
	</script>
	
</body>
</html>