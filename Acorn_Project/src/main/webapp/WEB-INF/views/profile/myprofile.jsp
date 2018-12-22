<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/upload-image.js"></script>
<title>Insert title here</title>
<style>
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
<script>
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){
		//전달된 object 의 내용을 serialize 문자열로 반환하는 함수 
		function getSerialize(obj){
			var query;
			var isFirst=true;
			for(var key in obj){
				if(isFirst){
					query=key+"="+obj[key];
					isFirst=false;
				}else{
					query+="&"+key+"="+obj[key];
				}
			}
			return query;
		}
		$scope.boardList={};
		// session 의 id 값을 바탕으로 게시판 data 가져오기
		$scope.getData=function(){
			$http({
				url:"../getuserprofile.do",
				method:"get"
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				$scope.boardList=data;
			});
		};
		$scope.getData();
		//$scope.pwdForm={};
		$scope.updatePwd=function(e){
			e.preventDefault();
			console.log("aa");
 			$http({
				url:"../selectpwd.do",
				method:"get",
				params:{
					'prev_pwd':$scope.pwdForm.prev_pwd
				}
			}).success(function(data){
				console.log(data);
				if(data=='false'){
					console.log("비밀번호를 잘못 입력하셧습니다.");
					//
					document.getElementById("pwdForm").submit();
					
				}else{
					document.getElementById("pwdForm").submit();
				}
				
			});
			
		};
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
	<h3 align="center">프로필 편집</h3>
	<div class="row " style="border:1px solid #BDBDBD;">
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<ul  class="nav nav-stacked" >
				<li class="a_click active">
					<a href="#profile" data-toggle="tab" class="menu" >프로필 편집</a>
				</li>
				<li>
					<a href="#pwd" data-toggle="tab" class="menu">비밀번호 변경 </a>
				</li>
			</ul>
		</div><!-- col-xs-4 -->
		<div class="col-sm-8 col-xs-12 " >
			<div class="tab-content" style="min-height:333px;">
				<!-- 1. id가 profile일때 -->
				<div class="tab-pane in active" id="profile"> 
					<form action="../update.do" method="post" id="updateForm" class="form-horizontal" enctype="multipart/form-data"> 
						<div class="form-group">
							<div class="col-sm-3 control-label">
							<img ng-src="${pageContext.request.contextPath}/upload/{{boardList.orgfilename}}" width="50" style="border-radius: 100%;">
							</div>
							<div class="col-sm-9 control-label " id="basic">
								<div style="float:left;">
							<div style="font-size:20px;">Acorn</div>
							<label class="btn-file" style="cursor:pointer; color:#6699ff;">
							프로필 사진 수정 <input  type="file" name="file" style="display:none;">
									</label>
								</div>
								
							</div>
						</div>				
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name" ng-model="boardList.name"/>
							</div>
						</div>
				
						<div class="form-group">
							<label for="user_name" class="col-sm-3 control-label">사용자 이름</label>
							<div class="col-sm-9">
								<input value="Acorn" type="text" class="form-control" id="user_name" name="nick" ng-model="boardList.nick"/>
								
							</div>
						</div>
				
						<div class="form-goup">
							<div class="col-sm-offset-3 col-sm-9">
								<span id="helpBlock" class="help-block">개인정보</span>
							</div>							
						</div>
						 
				
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">이메일</label>
							<div class="col-sm-9">
								<input value="Acorn@naver.com" type="text" class="form-control" id="email" name="email" ng-model="boardList.email"/>
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-3 control-label">전화번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" ng-model="boardList.phone"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-6 col-sm-offset-3">
								<button type="submit" >제출</button>
							</div>
						</div>
					</form>
				</div> <!-- id=profile (프로필 변경 ) -->
				<div class="tab-pane" id="pwd">					
					<div class="form-horizontal">
						<form action="../updatepwd.do" method="post" id="pwdForm" >
							 <div class="form-group">
							 	<br /><br />
								<label class="col-sm-3 control-label">이전 비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="prev_pwd" name="prev_pwd" ng-required="true" ng-model="pwdForm.prev_pwd" />
								</div>
							</div> 
							<div class="form-group">
								<label for="pwd" class="col-sm-3 control-label">새 비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="pwd" id="pwd" ng-required="true" ng-model="pwdForm.new_pwd1"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">새 비밀번호 확인</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="pwd2" id="pwd2" ng-required="true" ng-model="pwdForm.new_pwd2">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-6 col-sm-offset-3">
									<button type="submit" ng-click="updatePwd($event)">비밀번호 변경</button>
								</div><br/>

							</div>
						</form>
					</div>
				</div>
		</div>
	</div>
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
<script>
$("#pwdForm").on("submit", function(){
	//입력한 두 비밀번호가 일치하는지 확인해서 일치하지 않으면 폼전송 막기
	var pwd=$("#pwd").val();
	var pwd2=$("#pwd2").val();
	if(pwd != pwd2){
		alert("비밀번호를 확인 하세요!");
		return false;//폼전송 막기
	}
});
</script>

</body>
</html>