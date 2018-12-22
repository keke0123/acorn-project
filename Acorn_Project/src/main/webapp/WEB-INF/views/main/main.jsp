<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
<script>
	angular.module("myApp",[]).controller("myCtrl",function($scope){
		$scope.id="${id}";
		$scope.followList=[];
		//$scope.followList=${followList[0].id_follow};
		
		$scope.clickBtn=function(){
			console.log($scope.id);
		};
	});
	
	
</script>
<title>아싸그램</title>
</head>
<body ng-controller="myCtrl">
<div class="container" style="margin-top:50px;">
	<button ng-click="clickBtn()">버튼</button>
	<p>${followList }</p>
	<ul>
		<!-- <li ng-repeat="tmp in followList"></li> -->
	</ul>
	
	
	
	
</div>
</body>
</html>