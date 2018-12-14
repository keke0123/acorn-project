<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<style>
	
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ng-infinite-scroll.js"></script>
<script>
	var myApp = angular.module('myApp', ['infinite-scroll']);
	myApp.controller('DemoController', function($scope) {
	  $scope.images = [1, 2, 3, 4, 5, 6, 7, 8];

	  $scope.loadMore = function() {
	    var last = $scope.images[$scope.images.length - 1];
	    for(var i = 1; i <= 8; i++) {
	      $scope.images.push(last + i);
	    }
	  };
	});
</script>
<title>Document</title>
</head>
<body>
<div class="container">
	<div ng-app='myApp' ng-controller='DemoController'>
	  <div infinite-scroll='loadMore()' infinite-scroll-distance='2'>
	    <img ng-repeat='image in images' ng-src='http://placehold.it/225x250&text={{image}}'>
	  </div>
	</div>
</div>
</body>
</html>