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
<script>
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){
		window.onscroll=function(){
			scroll_event();
		};
		function scroll_event(){
			console.log(window.scrollY); // 스크롤된 높이
			console.log(window.innerHeight); // 창 높이
			console.log(document.body.scrollHeight); // 전체높이
			//console.log(document.body.scrollTop) // 다른 요소로 scroll 된 높이 체크할때
			//console.log(window.pageYOffset);
			// clientHeight(창높이) / scrollHeight(전체높이) / scrollTop(스크롤 내려온 높이)
			// 스크롤 바닥으로 보내기
			//window.scrollTo(0,document.body.scrollHeight);
			//
			//scrollingElement = (document.scrollingElement || document.body);
			//scrollingElement.scrollop = scrollingElement.scrollHeight;
		}
		//친구 이름 정보를 담을 배열 
		$scope.friends=[];
		//정보 가져오기 버튼을 눌렀을때 실행되는 함수
		$scope.getData=function(){
			$http({
				url:"../main/mainBoard.do",
				method:"get"
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
			});
		};
		$scope.getData();
	});
</script>
</head>
<body ng-controller="myCtrl">

	<div id="scroll">1</div>
	<div class="container" style="margin-top: 150px;">
		<div class="col-md-7 col-sm-7 col-xs-12 col-sm-offset-3">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: white;">
					<h3 class="panel-title">
						<img src="${pageContext.request.contextPath}/resources/images/thumb_image1.png" width="50" style="border-radius: 50%;">
						User1
						<a href="#myModal" sytle="float: right;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-option-horizontal" style="float: right; padding-top: 20px;"></span></a>
					</h3>
		            <div class="modal fade" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header text-center">
									<a href="javascript:" >게시물로 이동</a>
								</div>
								<div class="modal-body text-center">
									<a href="javascript:">부적절한 콘텐츠 신고</a>
								</div>
								<div class="modal-footer" id="mfooter">
									<a href="javascript:" data-dismiss="modal">취소</a><br/>
								</div>
							</div>
						</div>
					</div>
				</div><!-- panel-title -->
				<div class="panel-body" style="background-color: white;">
					<div id="myCarousel1" class="carousel slide" data-ride="carousel" data-interval="100000000">
						<div class="carousel-inner">
							<div class="item active">
								<img src="${pageContext.request.contextPath}/resources/images/1.jpg" class="img-responsive"/>
							</div>
							<div class="item">
								<img src="${pageContext.request.contextPath}/resources/images/6.jpg" class="img-responsive"/>
								
							</div>
						</div>
						<!-- Carousel 하단의 동그란 nav 요소  -->
						<ol class="carousel-indicators">
							<!-- data-target="Carousel 전체의 선택자" 
							data-slide-to="컨텐츠 인덱스" -->
							<li data-target="#myCarousel1" data-slide-to="0"></li>
							<li data-target="#myCarousel1" data-slide-to="1"></li>
						</ol>
						<!-- 이전, 다음 control UI -->
						<a href="#myCarousel1" class="left carousel-control" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">이전</span>
						</a>
						<a href="#myCarousel1" class="right carousel-control" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">다음</span>
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
					<p style="font-weight: bold;">좋아요 <span class="count">68</span>개</p>
					<p class="contentsP"><strong>missha</strong> [달력이 이렇게나 달달해서 어떡해?]<br/> 공감백배 그림들, 실용성은 또 어쩔?<label class="showLabel" class="btn" style="color:gray;"><small>문구 더 보기</small></label><br/>
					<span class="moreSpan" ><span style="color: #002266;">#미샤</span>X<span style="color: #002266;">#grim_b</span> 2018 콜라보 캘린더<br/>@외로운_아이 @남친여친 @썸남녀 소환</span></p>
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
	
</body>
</html>








