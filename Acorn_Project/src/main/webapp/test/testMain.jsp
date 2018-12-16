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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<title>/test/testMain.jsp</title>
<style>
	.contentsP{
		width:100%;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}

</style>
<script>
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){
		// 
		$scope.boardList=[];
		// session 의 id 값을 바탕으로 게시판 data 가져오기
		$scope.getData=function(){
			$http({
				url:"../main/mainBoard.do",
				method:"get"
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				$scope.boardList=data;
			});
		};
		// 초기에 한번 데이타 가져오기
		$scope.getData();
		/* 스크롤 이벤트 */
		window.onscroll=function(){
			scroll_event();
		};
		function scroll_event(){
			var scrollY = window.scrollY;
			var windowHeight = window.innerHeight;
			var documentHeight = document.body.scrollHeight;
			//console.log(window.scrollY); // 스크롤된 높이
			//console.log(window.innerHeight); // 창 높이
			//console.log(document.body.scrollHeight); // 전체높이
			if(scrollY+windowHeight >= documentHeight){
				console.log("바닥입니다");
				$http({
					url:"../main/mainBoard.do",
					method:"get"
				}).success(function(data){
					//서버에서 응답된 데이터를 모델에 연결
					console.log(data);
				});
			}
		}
	});
</script>

</head>
<body ng-controller="myCtrl">

	<div id="scroll">1</div>
	<div class="container" style="margin-top: 150px;">
		<div class="col-md-7 col-sm-7 col-xs-12 col-sm-offset-3">
			<!-- ng-init 으로 index 값을 list 형식으로 저장할수 있다. -->
			<div class="panel panel-default" ng-repeat="tmp in boardList" ng-init="boardIndex=$index">
				<div class="panel-heading" style="background-color: white;">
					<h3 class="panel-title">
						<img src="${pageContext.request.contextPath}{{tmp.thumbNail}}" width="50" style="border-radius: 50%;">
						{{tmp.id_writer}} // {{boardIndex}}
						<a href="#myModal" sytle="float: right;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-option-horizontal" style="float: right; padding-top: 20px;"></span></a>
					</h3>
		            <div class="modal fade" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header text-center">
									<a href="javascript:" >설정</a>
								</div>
								<div class="modal-body text-center">
									<a href="javascript:">뭔가 넣어야 되나?</a>
								</div>
								<div class="modal-footer" id="mfooter">
									<a href="javascript:" data-dismiss="modal">취소</a><br/>
								</div>
							</div>
						</div>
					</div>
				</div><!-- panel-title -->
				<div class="panel-body" style="background-color: white;">
					<div id="" ng-attr-id="{{'myCarousel'+boardIndex}}" class="carousel slide" data-ride="carousel" data-interval="100000000">
						<div class="carousel-inner">
							<div class="item" ng-repeat="tmp_orgfilename in tmp.orgfilename" ng-class="{'active':$index==0}">
								<img src="${pageContext.request.contextPath}{{tmp_orgfilename}}" class="img-responsive"/>
							</div>
						</div>
						<!-- Carousel 하단의 동그란 nav 요소  -->
						<ol class="carousel-indicators" ng-show="tmp.orgfilename.length>1">
							<!-- data-target="Carousel 전체의 선택자" data-slide-to="컨텐츠 인덱스" -->
							<li data-target="" ng-attr-data-target="{{'#myCarousel'+boardIndex}}" ng-repeat="tmp_orgfilename in tmp.orgfilename" data-slide-to="{{$index}}"></li>
						</ol>
						<!-- 이전, 다음 control UI -->
						<a href="" ng-attr-href="{{'#myCarousel'+boardIndex}}" class="left carousel-control" data-slide="prev" ng-show="tmp.orgfilename.length>1">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a href="" ng-attr-href="{{'#myCarousel'+boardIndex}}" class="right carousel-control" data-slide="next" ng-show="tmp.orgfilename.length>1">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div><!-- panel-body -->
				<div class="panel-footer" style="background-color: white;">
					<a href="javascript:">
						<span class="likeSpan fa fa-heart-o" style="color:black; font-size: 20px;"></span>
					</a>&nbsp;&nbsp;
					<a href="javascript:">
						<span class="textSpan fa fa-comment-o" style="color: black; font-size: 20px; transform: scaleX(-1);"></span>
					</a>
					<a href="javascript:">
						<span class="saveSpan fa fa-bookmark-o" style="color: black; font-size: 20px; float:right;" data-content="저장됨" data-toggle="popover" data-placement="top"></span>
					</a>
					<p style="font-weight: bold;">좋아요 <span class="count">{{tmp.count_like}}</span>개</p>
					<p class="contentsP"><strong>{{tmp.id_writer}}</strong>&nbsp;&nbsp;{{tmp.content}}<br/>
					</p>
					<p><label class="showLabel" class="btn" style="color:gray;"><small>문구 더 보기</small></label></p>
					<a href="javascript:">댓글 더보기</a>
					<a href="#commentModal" data-toggle="modal" data-target="#commentModal">댓글 모두보기</a>	
					<ul class="listUl">
		            	<li><strong>joo123</strong>&nbsp; <span style="color:#002266;">@yeoNa</span>&nbsp; 나 3만원쓰고 이고 받았다.</li>
		            </ul>	
		            <div class="input-group">
			          <input type="text" class="form-control textInput">
			          <span class="input-group-btn">
			            <button class="showBtn btn btn-default" type="button" style="color:#050099">게시</button>
			          </span>
	        		</div>
				</div><!-- panel-footer -->
			</div>
		</div>
	</div>
	<button ng-click="getData()">정보 가져오기</button>
	<!-- 댓글 modal 창 -->
	<div class="modal fade" id="commentModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<a href="javascript:" >댓글</a>
				</div>
				<div class="modal-body text-center">
					<a href="javascript:">댓글임당</a>
				</div>
				<div class="modal-footer" id="mfooter">
					<a href="javascript:" data-dismiss="modal">취소</a><br/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>








