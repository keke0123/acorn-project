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
	</style>
</head>
<body ng-controller="myCtrl">
<div class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a href="#" class="navbar-brand">Acorn</a>
			<!-- <button class="navbar-toggle" data-toggle="collapse" data-target="#three">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button> -->
		</div>
		<div class="collapse navbar-collapse" id="three">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}/main/mainpage.do">메인페이지</a></li>
				<li><a href="#myModal2" data-toggle="modal" data-target="#myModal2">글쓰기</a></li>
				<li><a href="${pageContext.request.contextPath}/profile/myprofile.do">회원정보 수정페이지</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" ng-model="searchValue" placeholder="Search" />
				</div>
				<button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal4" ng-click="getData2(searchValue);test(searchValue2)">검색</button>
			</form>
		</div>
	</div>
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
			<button onclick="fn_movePage('profile')" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >프로필편집</button>
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
			<div class="col-xs-4" ng-switch-when="0">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px" ng-style="backImage({{$index}})">
					<img class="img-responsive" src=""/>
					<div ng-init="onLoad()"></div>
				</div>
			</div>
			<div class="col-xs-4" ng-switch-when="0" ng-if="($index+1)<dtoList.length">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px" ng-style="backImage({{$index+1}})">
					<img class="img-responsive" src=""/>
					<div ng-init="onLoad()"></div>
				</div>
			</div>
			<div class="col-xs-4" ng-switch-when="0" ng-if="($index+2)<dtoList.length">
				<div class="imgLiquidFill imgLiquid" style="width:350px; height:350px" ng-style="backImage({{$index+2}})">
					<img class="img-responsive" src=""/>
					<div ng-init="onLoad()"></div>
				</div>
			</div>
		</div>
	</div><!-- postContent -->
</div>
	<!-- 사진 업로드 모달 -->
	<div class="modal fade" id="myModal2">
		<!-- modal-lg  | default | modal-sm -->	
		<div class="modal-dialog modal-lg">
			<div class="modal-content" >
				<div class="modal-body" id = "loadModalBody" >
				<!-- 업로드 폼 Modal -->	
				<div class="container">
					<div style="width: 480px; margin: auto;">
						<div class="panel panel-primary"  >
							<form id="upload-image-form" method="post" enctype="multipart/form-data">			
								<label for="content"></label>					
								<div class="panel-body">								
									<div class="form-group">
										<!-- <input class="form-control" rows = "5" type="text" name="content" id="content"/> -->
										<textarea name="content" id="content" rows="5" class = "form-control" placeholder="오늘 기분이 어떻신가요?"></textarea>
									</div>
									<input type="text" name="tag" placeholder="tag를 입력하세요">							
									<input type="file" name="file" id="myFile" required>
									<div id="image-preview-div" style="display: none">
										<img id="preview-img" src="">
									</div>
								</div>		
								<div class="panel-footer">
									<button class="btn  btn-primary" id="upload-button" type="submit" disabled>업로드</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>				
					</div>
			<!-- 여기까지!!!!! -->
						<br>
						<div class="alert alert-info" id="loading" style="display: none;"
							role="alert">
							Uploading image...
							<div class="progress">
								<div class="progress-bar progress-bar-striped active"
									role="progressbar" aria-valuenow="45" aria-valuemin="0"
									aria-valuemax="100" style="width: 100%"></div>
							</div>
						</div>
					<div id="message">
					</div>
				</div>					
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 모달로 뜨는 검색 결과창 -->
	<div class="modal fade" id="myModal4">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-body">
	        <button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
	        <div class="modal-title">
	        	<!-- 검색어 입력 -->
		 		<div class="mb-3 mx-sm-3 mb-2">
			   		<input type="text" ng-keyup="getData2(searchValue2)" ng-model="searchValue2" class="form-control" aria-describedby="basic-addon2"
			   			id="innerSearch" placeholder="검색조건을 입력해주세요">
		 		</div>		
	        	<!-- 카테고리 -->
		   		<div class="form-group mx-sm-3 mb-2" id="">    	
			    	<ul class="nav nav-pills nav-justified">
					    <li class="active">
					      <a href="#a" ng-click="selectValue='pop'; getData2(searchValue);" data-toggle="tab">인기</a>
					    </li>
					    <li>
					      <a href="#a" ng-click="selectValue='human'; getData2(searchValue);" data-toggle="tab">사람</a>
					    </li>
					    <li>
					      <a href="#a" ng-click="selectValue='tag'; getData2(searchValue);" data-toggle="tab">태그</a>
					    </li>
				    </ul>
		  		</div>
		  				
	        </div>   
	      <!-- 검색 결과창 modal-body -->      
	      	<div class="tab-contents">
	      		<div class="tab-pane fade in active" id="a">
					<table class="table table-striped table-bordered table-hover">
						<tbody class="tab-pane">
							<tr data-link="row" class="rowlink" ng-required="true" ng-model="ulli" ng-repeat="tmp in searchList">
								<td><img ng-src="${pageContext.request.contextPath}/upload/{{tmp.orgFileName}}" width="50" style="border-radius: 50%; display:inline-block;" alt="" />
								<a href="${pageContext.request.contextPath}/search/userpage.do?id={{tmp.id}}" style="display:inline-block">{{tmp.name}} {{tmp.id}}</a>{{tmp.count}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	      </div>
	     
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>