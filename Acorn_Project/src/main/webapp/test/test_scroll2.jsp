<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
<style>

</style>
<title>Insert title here</title>
</head>
<body ng-controller="MainController">
<div class="container" style="margin-top:50px">
	<div id="fixed" when-scrolled="loadMore()">
		<ul>
			<li ng-repeat="i in items">{{product.name}}</li>
		</ul>  
	</div>
</div>
<script>
app = angular.module("myApp", []);
app.controller("MainController", function($scope, $http){
	var counter = 0;
	$scope.products = [];
	$scope.loadMore = function() {
	    for (var i = 0; i < 10; i++) {
	        $scope.products.push({name: counter});
	        counter += 10;
	    }
	};
	$scope.loadMore(); 
});

app.directive("whenScrolled", function(){
	return{
	
		restrict: 'A',
		link: function(scope, elem, attrs){
		
			// we get a list of elements of size 1 and need the first element
			raw = elem[0];
			
			// we load more elements when scrolled past a limit
			elem.bind("scroll", function(){
				if(raw.scrollTop+raw.offsetHeight+5 >= raw.scrollHeight){
					scope.loading = true;
					
					// we can give any function which loads more elements into the list
					scope.$apply(attrs.whenScrolled);
				}
			});
		}
	}
});
</script>
</body>
</html>