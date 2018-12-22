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
				url:"mainBoard.do",
				method:"get"
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				$scope.boardList=data;
			});
		};
		// 초기에 한번 데이타 가져오기
		$scope.getData();
		// 좋아요 입력 or 삭제
		$scope.insert_like=function(num_board, id, a){
			// index 를 통해서 list의 값을 받는거 테스트
			console.log(a);
			$http({
				url:"insertLike.do",
				method:"get",
				params:{
					'num_board':num_board,
					'id':id
				}
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				//$scope.boardList=data;
			});
		};
		$scope.delete_like=function(num_board, id){
			$http({
				url:"deleteLike.do",
				method:"get",
				params:{
					'num_board':num_board,
					'id':id
				}
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				//$scope.boardList=data;
			});
		};
		// 북마크 입력 or 삭제
		$scope.insert_bookmark=function(num_board, id, a){
			// index 를 통해서 list의 값을 받는거 테스트
			console.log(a);
			$http({
				url:"insertBookMark.do",
				method:"get",
				params:{
					'num_board':num_board,
					'id':id
				}
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				//$scope.boardList=data;
			});
		};
		$scope.delete_bookmark=function(num_board, id){
			$http({
				url:"deleteBookMark.do",
				method:"get",
				params:{
					'num_board':num_board,
					'id':id
				}
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				//$scope.boardList=data;
			});
		};
		$scope.insert_comment=function(insert_comment, id, id_writer, num_board, index){
			//console.log(comment, id, id_writer);
			$http({
				url:"insertComment.do",
				method:"get",
				params:{
					'comments':insert_comment,
					'id_comment_writer':id,
					'id_comment_target':id_writer,
					'num_board':num_board
				}
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				//$scope.boardList=data;
				$scope.boardList[index].commentList.unshift({		
					'id_comment_writer':id,
					'id_comment_target':id_writer,
					'comments':insert_comment
				});
			});
		};
		$scope.getComment=function(index, startRowNum, num_board){
			console.log(index, startRowNum);
			startRowNum = startRowNum+1;
			var endRowNum = startRowNum+2;
			$http({
				url:"getAddComment.do",
				method:"get",
				params:{
					'num_board':num_board,
					'startRowNum':startRowNum,
					'endRowNum':endRowNum
				}
			}).success(function(data){
				//서버에서 응답된 데이터를 모델에 연결
				console.log(data);
				for(var i=0; i<data.length; i++){
					$scope.boardList[index].commentList.push({		
						'id_comment_writer':data[i].id_comment_writer,
						'id_comment_target':data[i].id_comment_target,
						'comments':data[i].comments
					});
				}
			});
		};
		/* 스크롤 이벤트 */
		window.onscroll=function(){
			scroll_event();
		};
		// 스크롤 이벤트가 발생하는중에 이벤트 다시 안걸리도록 조취
		var scrollOn = false;
		function scroll_event(){
			var scrollY = window.scrollY;
			var windowHeight = window.innerHeight;
			var documentHeight = document.body.scrollHeight;
			//console.log(window.scrollY); // 스크롤된 높이
			//console.log(window.innerHeight); // 창 높이
			//console.log(document.body.scrollHeight); // 전체높이
			if(scrollY+windowHeight >= documentHeight && !scrollOn){
				scrollOn=true;
				console.log("바닥입니다");
				var startRowNum = $scope.boardList.length+1;
				var endRowNum = startRowNum+1;
				console.log(startRowNum);
				$http({
					url:"mainBoard.do",
					method:"get",
					params:{
						'startRowNum':startRowNum,
						'endRowNum':endRowNum
					}
				}).success(function(data){
					//서버에서 응답된 데이터를 모델에 연결
					console.log(data);
					for(var i=0; i<data.length; i++){
						$scope.boardList.push(data[i]);
					}
					scrollOn=false;
				});
			}
		}
		
	});
</script>

</head>
<body ng-controller="myCtrl">
	<div class="container" style="margin-top: 150px;">
		<div class="col-md-7 col-sm-7 col-xs-12 col-sm-offset-3">
			<a href="${pageContext.request.contextPath}/gallery/list.do">이미지 리스트 화면으로 이동</a><br />
			<a href="${pageContext.request.contextPath}/search/list.do">인기인리스트보기</a><br />
			<a href="${pageContext.request.contextPath}/profile/myprofile.do">회원정보 수정페이지</a><br />
			<!-- ng-init 으로 index 값을 list 형식으로 저장할수 있다. -->
			<div class="panel panel-default" ng-repeat="tmp in boardList" ng-init="boardIndex=$index">
				<div class="panel-heading" style="background-color: white;">
					<h3 class="panel-title">
						<img ng-src="${pageContext.request.contextPath}{{tmp.thumbNail}}" width="50" style="border-radius: 50%;">
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
								<img ng-src="${pageContext.request.contextPath}{{tmp_orgfilename}}" class="img-responsive"/>
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
						<span class="fa fa-heart-o" ng-show="tmp.id_like==null" ng-click="insert_like(tmp.num_board, tmp.id, boardList[boardIndex]); tmp.id_like=tmp.id; tmp.count_like=tmp.count_like+1;" style="color:black; font-size: 20px;"></span>
						<span class="fa fa-heart" ng-show="tmp.id_like!=null" ng-click="delete_like(tmp.num_board, tmp.id); tmp.id_like=null; tmp.count_like=tmp.count_like-1" style="color:black; font-size: 20px;"></span>
					</a>&nbsp;&nbsp;
					<a href="javascript:">
						<span class="textSpan fa fa-comment-o" ng-show="!tmp.commentArea" ng-click="tmp.commentArea=!tmp.commentArea" style="color: black; font-size: 20px; transform: scaleX(-1);"></span>
						<span class="textSpan fa fa-comment" ng-show="tmp.commentArea" ng-click="tmp.commentArea=!tmp.commentArea" style="color: black; font-size: 20px; transform: scaleX(-1);"></span>
					</a>
					<a href="javascript:">
						<span class="saveSpan fa fa-bookmark-o" ng-show="tmp.id_bookmark==null" ng-click="insert_bookmark(tmp.num_board, tmp.id); tmp.id_bookmark=tmp.id" style="color: black; font-size: 20px; float:right;" data-content="저장됨" data-toggle="popover" data-placement="top"></span>
						<span class="saveSpan fa fa-bookmark" ng-show="tmp.id_bookmark!=null" ng-click="delete_bookmark(tmp.num_board, tmp.id); tmp.id_bookmark=null" style="color: black; font-size: 20px; float:right;" data-content="저장됨" data-toggle="popover" data-placement="top"></span>
					</a>
					<p style="font-weight: bold;">좋아요 <span class="count">{{tmp.count_like}}</span>개</p>
					<p class="" ng-class="{'contentsP':showContent}" ng-init="showContent=true">
						<strong>{{tmp.id_writer}}</strong>&nbsp;&nbsp;{{tmp.content}}<br/>
						<label class="showLabel" class="btn" ng-click="showContent=!showContent" style="color:gray;"><small>문구 더 보기</small></label><br />
						<span class="moreSpan" ng-repeat="tmp_tag in tmp.tag">@{{tmp_tag}}&nbsp;</span>
					</p>
					<a href="javascript:" ng-click="getComment(boardIndex, tmp.commentList.length, tmp.num_board)">댓글 더보기</a>
					<a href="#commentModal" data-toggle="modal" data-target="#commentModal">댓글 모두보기</a>
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
					<ul class="listUl" ng-repeat="tmp_comment in tmp.commentList">
		            	<li><strong>{{tmp_comment.id_comment_writer}}</strong>&nbsp; <span style="color:#002266;">@{{tmp_comment.id_comment_target}}</span>&nbsp;{{tmp_comment.comments}}</li>
		            </ul>	
		            <div class="input-group" ng-show="tmp.commentArea" ng-init="comment">
			          <input type="text" class="form-control textInput" ng-model="comment">
			          <span class="input-group-btn">
			            <button class="showBtn btn btn-default" ng-click="insert_comment(comment, tmp.id, tmp.id_writer, tmp.num_board, boardIndex)" type="button" style="color:#050099">게시</button>
			          </span>
	        		</div>
				</div><!-- panel-footer -->
			</div>
		</div>
	</div>
</body>
</html>








