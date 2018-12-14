<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
<style>
	li {
	  height: 120px;
	  border-bottom: 1px solid gray;
	}
	
	#fixed {
	    height: 400px;
	    overflow: auto;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top:50px">
	<div id="fixed" when-scrolled="loadMore()">
		<ul>
 			<li ng-repeat="i in items">{{i.id}}</li>
		</ul>  
	</div>
</div>
<script>
	function Main($scope) {
	    $scope.items = [];
	    
	    var counter = 0;
	    $scope.loadMore = function() {
	        for (var i = 0; i < 5; i++) {
	            $scope.items.push({id: counter});
	            counter += 10;
	        }
	    };
	    
	    $scope.loadMore();
	}
	
	angular.module('scroll', []).directive('whenScrolled', function() {
	    return function(scope, elm, attr) {
	        var raw = elm[0];
	        
	        elm.bind('scroll', function() {
	            if (raw.scrollTop + raw.offsetHeight >= raw.scrollHeight) {
	                scope.$apply(attr.whenScrolled);
	            }
	        });
	    };
	});
</script>
</body>
</html>