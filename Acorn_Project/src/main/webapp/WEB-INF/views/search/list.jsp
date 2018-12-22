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
	
	<h3>검색결과 : 총  {{searchList.length}} 개 의 결과</h3>
	<table class="table table-striped table-bordered table-hover">
		<tbody>
				<tr data-link="row" class="rowlink" ng-required="true" ng-model="ulli" ng-repeat="tmp in searchList">
					<td><img src="${pageContext.request.contextPath}{{tmp.orgFileName}}" width="50" style="border-radius: 50%; display:inline-block;" alt="" />
					<a href="userpage.do?id={{tmp.id}}" style="display:inline-block">{{tmp.name}} {{tmp.id}}</a>{{tmp.count}}</td>
				</tr>
		</tbody>
	</table>
	</div>
	
	





=======
<!-- 2018 12 12 
송현철 생성 -->
>>>>>>> refs/heads/test

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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script>
	angular.module("myApp",[])
	.controller("myCtrl",function($scope,$http){
		
		/* $('#category a').click(function(e) {
			  var txt = $(e.target).text();
			  console.log(txt);
		}); */
		
		$scope.searchList=[];
		$scope.searchValue;
		$scope.selectValue="pop";
		
		$scope.onClick=function(a){
			console.log(a);
		}; 
		console.log($scope.selectValue);
		console.log($scope.searchValue);
		$scope.getData=function(){
			console.log($scope.searchValue);
			
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
	
	#searchBtn{
		background-color:white;
	}
	.searchLabel .SearchV{
		display:none;
	}
	.input-group.input-group-unstyled input.form-control {
    -webkit-border-radius: 4px;
       -moz-border-radius: 4px;
            border-radius: 4px;
	}
	.input-group-unstyled .input-group-addon {
	    border-radius: 4px;
	    border: 0px;
	    background-color: transparent;
	}
</style>
</head>
<body ng-controller="myCtrl">
<div class="container" style="margin-top:50px;">
	<p>검색</p>
</div>
	<div class="container">
	<!-- 메인에 연결될 검색폼 -->
	<form class="form-inline" id="myForm" name="myForm">
	   	<!-- <div class="form-group mx-sm-3 mb-2">
	    		<label class="searchLabel" for="inputState">검색조건</label>
	    		
	    		<select id="inputState" class="form-control" ng-model="selectValue" ng-change="getChange()">
	      			<option value="pop">인기</option>
	  		 		<option value="human">사람</option>
	   		 		<option value="tag">태그</option>
	     		</select>
   			</div> -->
   			
   		<div class="form-group has-feedback">
		    <input type="text" ng-keyup="getData()" ng-model="searchValue" ng-required="true" class="form-control" id="searchInput" 
		     placeholder="검색조건을 입력해주세요" aria-label="검색조건" aria-describedby="basic-addon2" style="margin-left:50px;">	 
		    <button ng-click="getData()" ng-disabled="myForm.$invalid" data-toggle="modal" data-target="#myModal"
		    class="btn btn-outline-secondary" id="searchBtn" type="submit"><span class="glyphicon glyphicon-search form-control-feedback"></span></button>  
		</div>
		
  		<!--  <div class="form-group mx-sm-3 mb-2">
    		<label for="staticEmail2" class="sr-only">Email</label>
    		<input type="text" ng-keyup="getData()" ng-model="searchValue" class="form-control-plaintext" 
    			id="staticEmail2" ng-required="true" placeholder="검색조건을 입력해주세요">
  		</div>
  		<p ng-show="myForm.searchValue.$invalid && myForm.searchValue.$dirty" 
  			class="help-block">반드시 입력하세요</p>
  		<button 
  		ng-click="getData()" class="btn btn-primary mb-2" type="submit" ng-disabled="myForm.$invalid" data-toggle="modal" data-target="#myModal">검색</button> -->
	</form>
	
	<!-- 모달로 뜨는 검색 결과창 -->
	<div class="modal fade" id="myModal4">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-body">
	        <button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
	        <div class="modal-title">
	        	<!-- 검색어 입력 -->
		 		<div class="mb-3 mx-sm-3 mb-2">
			   		
			   		<input type="text" ng-keyup="getData()" ng-model="searchValue" class="form-control" aria-describedby="basic-addon2"
			   			id="innerSearch" ng-required="true" placeholder="검색조건을 입력해주세요">
		 		</div>		
	        	<!-- 카테고리 -->
		   		<div class="form-group mx-sm-3 mb-2" id="">
			   		<!-- <select id="inputState" class="form-control" ng-model="selectValue" ng-change="getChange()">
			     			<option value="pop">인기</option>
			 		 		<option value="human">사람</option>
			  		 		<option value="tag">태그</option>
			    	</select> -->
			    	
			    	<ul class="nav nav-pills nav-justified">
					    <li class="active">
					      <a href="#a" ng-click="onClick('pop')" data-toggle="tab">인기</a>
					    </li>
					    <li>
					      <a href="#a" ng-click="onClick('human')" data-toggle="tab">사람</a>
					    </li>
					    <li>
					      <a href="#a" ng-click="onClick('tag')" data-toggle="tab">태그</a>
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
								<td><img src="${pageContext.request.contextPath}{{tmp.orgFileName}}" width="50" style="border-radius: 50%; display:inline-block;" alt="" />
								<a href="userpage.do?id={{tmp.id}}" style="display:inline-block">{{tmp.name}} {{tmp.id}}</a>{{tmp.count}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	      </div>
	     
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>
</body>
</html>