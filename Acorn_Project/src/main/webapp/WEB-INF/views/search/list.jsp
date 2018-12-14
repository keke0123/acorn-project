<!-- 2018 12 12 
송현철 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/views/list/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js "></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
		angular.module("myApp",[])
		.controller("myCtrl",function($scope,$http){
			
			
			$scope.searchList=[];
			$scope.getData=function(){
				console.log($scope.asd);
				 $http({
					url:"Search_like.do",
					method:"get",
					params:{"keyword":"유저"}
				}).success(function(data){
					console.log(data);
					$scope.searchList=data;
				});
			};
			
		});
	</script>
	
</head>
<body ng-controller="myCtrl">

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
    		<input type="text" ng-model="asd" class="form-control-plaintext" id="staticEmail2" placeholder="검색조건을 입력해주세요">
  		</div>
  		<button ng-click="getData()" class="btn btn-primary mb-2">Confirm identity</button>
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
			 	<ul>
			 		<li ng-repeat="tmp in searchList"></li>
			 	</ul>
			 
			 
			 	
			 <%-- 	<c:forEach items="${list }" var="tmp">
			 		<tr>
			 			<td>${tmp.orgFileName}</td>
			 			<td>${tmp.num}</td>
			 			<td>${tmp.id}</td>
			 			<td>${tmp.nick}</td>
			 		</tr>
			 	</c:forEach> --%>
			 </tbody>
		</table>
	
	</div>
	<ul>
		<li ng-repeat="tmp in searchList">{{tmp.name}}</li>
	</ul>
	
</body>
</html>