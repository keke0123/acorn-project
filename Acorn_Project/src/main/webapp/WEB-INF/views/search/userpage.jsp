<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/views/list/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js "></script>
<script src="${pageContext.request.contextPath}/resources/js/imgLiquid.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
		angular.module("myApp",[])
		.controller("myCtrl",function($scope,$http){
			$scope.dto={};
			$scope.dtoList=[];
			$scope.getData=function(){
				$http({
					url:"userpageData.do",
					method:"get",
					params:{"id":"${param.id}"}
				}).success(function(data){
					console.log(data);
					$scope.dto=data;
				});	
			};
			$scope.getBoardList=function(){
				$http({
					url:"userboardlist.do",
					method:"get",
					params:{"id":"${param.id}"}
				}).success(function(data){
					console.log(data);
					$scope.dtoList=data;
				});
			};
			$scope.getData();
			$scope.getBoardList();
		});
		$(document).ready(function() {
			$(".imgLiquidFill").imgLiquid();
		});
	</script>
	<style>
		#three{
		   display: inline;
		   margin-left: 20px;
		   font-size: 17px;
		}
		.row{
			margin-bottom:10px;
		}
	</style>
</head>
<body ng-controller="myCtrl">
<div class="container" style="margin-top:150px;">
	<div class="row">
		<div class="col-xs-3 col-xs-offset-1">
	        <div id="profileImgs" class="text-center">
	            <img id="one" src="${pageContext.request.contextPath}/resources/images/thumb_image1.png" class="rounded" alt="...">
	            <img id="one_2" src="../images/멍멍이.jpg" class="rounded" alt="..." style="display: none;">
        	</div>
		</div><!--col-xs-3-->
	    <div class="col-xs-7 text-center">
			<h1 style="font-weight:lighter; display: inline-block; " >Acorn</h1>
			<button onclick="fn_movePage('profile')" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >프로필편집</button>
			<span class="glyphicon glyphicon-cog" style="font-size: 23px; margin-left: 5px;"  ></span>
			<br/>
			<div id="profileInfo"> 
			    <div style="font-size: 17px; display: inline-block; margin-top: 15px">게시물 24</div>
			    <div id="three">팔로워 5K</div>
			    <div id="three">팔로우 163</div>
			</div>
			<br/>
			<div style="font-size: 20px; font-weight: bold; margin-top: 15px;">acorn </div>
	    </div><!--col-xs-7-->
	</div>
	<div class="postContent">
		<span ng-repeat="tmp in dtoList">
		<div class="row" ng-if="$index%3==0">
			
		</div>
<%-- 	<div class="row">
			<div class="col-xs-4">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/1.jpg"/>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/2.jpg"/>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px">
						<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/3.jpg"/>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/1.jpg"/>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px">
					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/2.jpg"/>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px">
						<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/3.jpg"/>
				</div>
			</div>
		</div> --%>
		</span>
	</div><!-- postContent -->
</div>

</body>
</html>