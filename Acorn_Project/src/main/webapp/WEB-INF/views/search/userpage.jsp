<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/views/list/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/upload-image.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/imgLiquid.js"></script>
<script>
		var myApp=angular.module("myApp",[]);
		myApp.controller("myCtrl",function($scope,$http){
			//
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
			
					$(".imgLiquidFill").imgLiquid();
				});
			};
			$scope.getData();
			$scope.getBoardList();
			
			$scope.backImage=function(index){
				$(".imgLiquidFill").imgLiquid();
				return{
					'background-image':'url(${pageContext.request.contextPath}/upload/'+$scope.dtoList[index].p_orgfilename+')'
				}
			};
			$(".imgLiquidFill").imgLiquid();
			
			$scope.searchList=[];
			$scope.searchValue="";
			$scope.searchValue2="";
			$scope.selectValue="pop";
			
			$scope.onClick=function(a){
				console.log(a);
			}; 
			console.log($scope.selectValue);
			console.log($scope.searchValue);
			$scope.getData2=function(msg){
				$scope.searchValue=msg;
				$scope.searchValue2=msg;
				//console.log($scope.searchValue);
				
				$http({
					url:"${pageContext.request.contextPath}/search/Search_like.do",
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
				$scope.getData2();
			};
			$scope.test=function(test){
				console.log("test : "+test);
			};
			//$scope.getData();
			// 팔로우 된 사람인지, 본인인지 체크해서 저장할 변수
			// 3=본인, 0=not followed, 1=followed
			$scope.isFollowed=0;
			$scope.getFollowCheck=function(){
				console.log("hi");
				$http({
					url:"${pageContext.request.contextPath}/search/search_followed.do",
					method:"get",
					params:{
						"id_follow":"${param.id}"
					}
				}).success(function(data){
					console.log(data);
					$scope.isFollowed=data.isFollowed;
					console.log("isFollowed : "+$scope.isFollowed);
				});
			};
			$scope.getFollowCheck();
			$scope.doFollow=function(){
				console.log("doFollow");
				$http({
					url:"${pageContext.request.contextPath}/search/do_follow.do",
					method:"get",
					params:{
						"id_follow":"${param.id}"
					}
				}).success(function(data){
					console.log(data);
					$scope.isFollowed=1;
					console.log("isFollowed : "+$scope.isFollowed);
				});
			};
			$scope.removeFollow=function(){
				console.log("removeFollow");
				$http({
					url:"${pageContext.request.contextPath}/search/remove_follow.do",
					method:"get",
					params:{
						"id_follow":"${param.id}"
					}
				}).success(function(data){
					console.log(data);
					$scope.isFollowed=0;
					console.log("isFollowed : "+$scope.isFollowed);
				});
			};
			
		});
	</script>
	<style>
		#three{
		   display: inline;
		   margin-left: 20px;
		   /* font-size: 17px; */
		}
		.testImage{
		/* 	width: 350px;
			hegith: 350px; */
			background-size: cover;
			background-position: center center;
			background-repeat: no-repeat;
		}
		.modal-content .container {
		  width: 90%;
		  height: 70%;
		  margin:  auto;
		}
		.modal-content .panel{
		
		  width: 100%;
		  height: 80%;
		  margin: auto;
		  margin-bottom: 20px;
		}
		.modal-content{
			width: 65%;
			margin: auto;
			vertical-align: middle;
			horizontal-align: middle;
			/* padding-top: 10%;
			padding-bottom: 10%; */	
		}
		
		.container {
	    	 width:970px;
		}
		
		.row{
	      position: relative;
	      left: 5px;
	      top: 6px;
	  	}
	  	
	  	.imgLiquidFill{
	  		margin-right:20px;
	  		margin-bottom:15px;
	  	}
	  	
	  	/* nav-logo 작업중 */
		.nav-logo {
		  width: 37.5%;
		  position: relative;
		  float: left;
		}
		.nav-fixed-1 {
		  background: url(${pageContext.request.contextPath }/resources/images/instagram-new-logo.png);
		  position:relative;
		  width: 120px;
		  height: 50px;
		  margin-right:20px;
		  background-size: 120px 50px;
		  background-repeat: no-repeat;
		}
	
	  	
	</style>
</head>
<body ng-controller="myCtrl">
<jsp:include page="../navbar/navbar.jsp"/>
<div class="container" style="margin-top:150px;">
	<div class="row">
		<div class="col-xs-3 col-xs-offset-1">
	        <div id="profileImgs" class="text-center">
	            <img id="one" ng-src="${pageContext.request.contextPath}/upload/{{dto.orgFileName}}" width="100" style="border-radius: 100%;" class="rounded" alt="...">
	            <!-- <img id="one_2" src="../images/멍멍이.jpg" class="rounded" alt="..." style="display: none;"> -->
        	</div>
		</div><!--col-xs-3-->
	    <div class="col-xs-7 text-center">
			<h1 style="font-weight:lighter; display: inline-block;">{{dto.nick}}</h1>
			<button ng-if="isFollowed==3" onclick="location.href='${pageContext.request.contextPath}/profile/myprofile.do'" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >프로필편집</button>
			<button ng-if="isFollowed==0" ng-click="doFollow()" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >팔로우 하기</button>
			<button ng-if="isFollowed==1" ng-click="removeFollow()" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >팔로우 해제</button>
			<span class="glyphicon glyphicon-cog" style="font-size: 23px; margin-left: 5px;"  ></span>
			<br/>
			<div id="profileInfo"> 
			    <div style="font-size: 17px; display: inline-block; margin-top: 15px">게시글 <span ng-if="dto.lcount!=null">{{dto.lcount}}</span>
			    	<span ng-if="dto.lcount==null">0</span>
			    </div>
			    <div id="three">팔로워 <span ng-if="dto.countFollower!=null">{{dto.countFollower}}</span>
			    	<span ng-if="dto.countFollower==null">0</span>
			    </div>
			    <div id="three">팔로우 <span ng-if="dto.countFollow!=null">{{dto.countFollow}}</span> 
			    	<span ng-if="dto.countFollow==null">0</span> 
			    </div>
			</div>
			<br/>
			<div style="font-size: 20px; font-weight: bold; margin-top: 15px;">acorn </div>
	    </div><!--col-xs-7-->
	</div>
	<div class="postContent">
 		<div class="row" ng-repeat="tmp in dtoList" ng-switch on="$index%3">
			<div class="insList col-xs-4" ng-switch-when="0">
				<div class="imgLiquidFill imgLiquid" style="width:300px; height:350px" ng-style="backImage({{$index}})">
					<img class="img-responsive" src=""/>
					<div ng-init="onLoad()"></div>
				</div>
			</div>
			<div class="insList col-xs-4" ng-switch-when="0" ng-if="($index+1)<dtoList.length">
				<div class="imgLiquidFill imgLiquid" style="width:300px; height:350px" ng-style="backImage({{$index+1}})">
					<img class="img-responsive" src=""/>
					<div ng-init="onLoad()"></div>
				</div>
			</div>
			<div class="insList col-xs-4" ng-switch-when="0" ng-if="($index+2)<dtoList.length">
				<div class="imgLiquidFill imgLiquid" style="width:300px; height:350px" ng-style="backImage({{$index+2}})">
					<img class="img-responsive" src=""/>
					<div ng-init="onLoad()"></div>
				</div>
			</div>
		</div>
	</div><!-- postContent -->
</div>
</body>
</html>