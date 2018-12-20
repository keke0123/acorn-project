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
<script src="${pageContext.request.contextPath}/resources/js/jasny-bootstrap.min.js"></script> 
<script>
		angular.module("myApp",[])
		.controller("myCtrl",function($scope,$http){
			$scope.searchList=[];
			$scope.searchValue;
			$scope.selectValue="pop";
			
			console.log($scope.selectValue);
			console.log($scope.searchValue);
			$scope.getData=function(){
				console.log($scope.searchValue);
				
				$http({
					url:"Search_like.do",
					method:"get",
					params:{"keyword":$scope.searchValue,"keyword2":$scope.selectValue}
		
				}).success(function(data){
					console.log($scope.selectValue);
					console.log(data);
					$scope.searchList=data;
				});
			};
			$scope.getChange=function(){
				$scope.searchList=[];
				$scope.getData();
			};
			
			$scope.getData();
			
		});
		

	</script>
	<style>
		table.row-clickable tbody tr td {
		    padding: 0;
		}
		
		table.row-clickable tbody tr td a {
		    display: block;
		    padding: 8px;
		}
	</style>
</head>
<body ng-controller="myCtrl">

<div class="container" style="margin-top:50px;">
	<p>검색</p>
</div>

<div class="container">
	<form class="form-inline" id="myForm" name="myForm">
	   	<div class="form-group mx-sm-3 mb-2">
    		<label for="inputState">검색조건</label>
    		<select id="inputState" class="form-control" ng-model="selectValue" ng-change="getChange()">
      			<option value="pop">인기</option>
  		 		<option value="human">사람</option>
   		 		<option value="tag">태그</option>
     		</select>
   		</div>
  		<div class="form-group mx-sm-3 mb-2">
    		<label for="staticEmail2" class="sr-only">Email</label>
    		<input type="text" ng-keyup="getData()" ng-model="searchValue" class="form-control-plaintext" 
    			id="staticEmail2" ng-required="true" placeholder="검색조건을 입력해주세요">
  		</div>
  		<p ng-show="myForm.searchValue.$invalid && myForm.searchValue.$dirty" 
  			class="help-block">반드시 입력하세요</p>
  		<button ng-click="getData()" class="btn btn-primary mb-2" ng-disabled="myForm.$invalid">검색</button>
	</form>
	
	
	<!-- <table class="table table-hover row-clickable">
    <tbody>
        <tr>
            <td><a href="#">Column 1</a></td>
            <td><a href="#">Column 2</a></td>
            <td><a href="#">Column 3</a></td>
        </tr>
    </tbody>
	</table> -->
	
	<h3>검색조건입니다.</h3>
	<table class="table table-striped table-bordered table-hover">
		<tbody>
				<tr data-link="row" class="rowlink" ng-required="true" ng-model="ulli" ng-repeat="tmp in searchList">
					<td><img src="${pageContext.request.contextPath}{{tmp.orgFileName}}" width="50" style="border-radius: 50%; display:inline-block;" alt="" />
					<a href="userpage.do?id={{tmp.id}}" style="display:inline-block">{{tmp.name}} {{tmp.id}}</a>{{tmp.count}}</td>
				</tr>
		</tbody>
	</table>
	</div>
	<a href="userpage.do?id=user1">유저 페이지</a>
	






</body>
</html>