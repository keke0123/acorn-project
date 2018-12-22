<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.jsp</title>
		<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/insta-nav.css">
	<link rel="shortcut icon" href="../favicon.ico">
	<script src="../js/angular.min.js"></script>
	<style>
		.container{
			background-color: #fff;
			margin-top: 150px;
		}

		input[id=intro] { 
		 	/*소개 부분 높이 설정*/
		 padding: 50px;
		 margin: 0px;
		}


		img{
			border-color: gray;
			border-radius:50%;
			padding:15px;
			height: 100px;
			width:110px;

		}
		.col-xs-8{	
			box-sizing: border-box;	
			border-left: 0.5px solid #BDBDBD;
		}
		div{
			box-sizing: border-box;	
		}
		.col-xs-3{
			font-size: 15px;
			padding-right: 0;
			padding-left: 0;

		}
		.bottom_border{
			width: 415px;
			height: 60px;
			border-bottom: 1px solid #BDBDBD; 
			margin-top: 32px;
		    margin-bottom: 16px;
		    padding-bottom: 12px;
		}
		.nav > li > a{
			color:black;
			font-size:16px;
		 	line-height: 20px;
		 	padding: 16px 16px 16px 30px;

		}
		.nav > li > a:hover{
			border-left :2px solid #BDBDBD ;

		}
		.a_click{
			font-weight:bold;
			border-left: 2px solid black;
		}
		.footer{
			background-color: #fafafa;
			position:absolute;
			top:850px;
			text-align: center;
			margin: 0 auto;
			width:100%;
			font-size:12px;
			font-weight: bold;

		}


	</style>
</head>
<body>

	<div id="nprogress" style="display: none;"></div>

	<!-- navbar -->
	<nav class="nav-insta">
	   <div class="nav-container">
	     <div class="nav-logo">
	       <div>
	         <a href="picturelist.html" class="navbar-brand nav-fixed-1"></a>
	         <a href="picturelist.html" class="navbar-brand nav-fixed-2"></a>
	       </div>
	     </div>
	     <div class="nav-search">
	     	<div class="nav-control">
	         	<input type="text" class="form-control"> 
	        	<div class="placeholder">
	            	<i class="glyphicon glyphicon-search">검색</i>
	        	</div>
	       	</div>
	     </div>
	     <div class="nav-menu">
	     	<div class="nav-ico-group">
	         <a href="javascript:fn_movePage('overview');" class="nav-icon nav-icon-overview"></a>
             <a href="javascript:fn_movePage('like');" class="nav-icon nav-icon-like"></a>
             <a href="javascript:fn_movePage('mypictures');" class="nav-icon nav-icon-mypictures"></a>
	        </div>
	     </div>
	   	</div>
	 </nav>
	 <!-- /navbar -->

	<div class="container">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<ul  class="nav nav-stacked" >
			        <li class="a_click active">
			          <a href="#profile" data-toggle="tab" class="menu" >프로필 편집</a>
			        </li>
			        <li>
			          <a href="#pwd" data-toggle="tab" class="menu">비밀번호 변경 </a>
			        </li>
			        <li>
			          <a href="#app" data-toggle="tab"  class="menu">허가된 앱</a>
			        </li>
			        <li>
			        	<a href="#comment" data-toggle="tab" class="menu" >댓글</a>
			        </li>
			        <li>
			        	<a href="#emails" data-toggle="tab" class="menu" >이메일 및 SMS</a>
			        </li>
			        <li>
			        	<a href="#phones" data-toggle="tab" class="menu" >연락처 관리 </a>
			        </li>
			    </ul>
			</div><!-- col-xs-4 -->
 
			<div class="col-sm-8 col-xs-12 " >
				<div class="tab-content" style="min-height:333px;">
					<!-- 1. id가 profile일때 -->
					<div class="tab-pane in active" id="profile"> 
						<form class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-3 control-label">
								<img src="../images/basic.png" alt="">
								</div>
								<div class="col-sm-9 control-label " id="basic">
									<div style="float:left;">
										<div style="font-size:20px;">Acorn</div>
										<label class="btn-file" style="cursor:pointer; color:#6699ff;">
										프로필 사진 수정 <input  type="file" style="display:none;">
										</label>
									</div>
									
								</div>
							</div>

							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">이름</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="name"/>
								</div>
							</div>

							<div class="form-group">
								<label for="user_name" class="col-sm-3 control-label">사용자 이름</label>
								<div class="col-sm-9">
									<input value="Acorn" type="text" class="form-control" id="user_name"/>
									
								</div>
							</div>

							<div class="form-group">
								<label for="web" class="col-sm-3 control-label">웹사이트</label>
								<div class="col-sm-9">
									<input multiple type="text" class="form-control" id="web"/>
								</div>
							</div>
							<div class="form-group" >
								<label for="intro" class="col-sm-3 control-label">소개</label>
								<div class="col-sm-9 "  >
								<input type="text" class="form-control" id="intro">
											
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
									<input value="Acorn@naver.com" type="text" class="form-control" id="email"/>
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-sm-3 control-label">전화번호</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="phone"/>
								</div>
							</div>

							<div class="form-group">
								<label for="sex" class="col-sm-3 control-label">성별</label>
								<div class="col-sm-4">
									<select class="form-control" name="sex" id="sex">
										<option value="none">선택안함</option>
										<option value="female">여성</option>
										<option value="male">남성</option>
									</select>
								
								</div>
							</div>


							<div class="form-group">
								<label  class="col-sm-3 control-label">비슷한 계정 추천</label>

								<div class="col-sm-8 control-label">
									<label>
										<input type="checkbox"/> 팔로우할 만한 비슷한 계정을 추천할 때 회원님의 계정을 포함합니다. 
									</label>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-6 col-sm-offset-3">
									<button type="submit" class="btn btn-primary">제출</button>
								</div>
							</div>
						</form>
					</div> <!-- id=profile (프로필 변경 ) -->
					<div class="tab-pane" id="pwd">
						
						<div class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-3 control-label">
								<img src="../images/basic.png" alt="">
								</div>
								<div class="col-sm-9 control-label " id="basic">
									<div style="float:left;">
										<div style="font-size:20px;">Acorn</div>
										<label class="btn-file" style="cursor:pointer; color:#6699ff;">
										프로필 사진 수정 <input  type="file" style="display:none;">
										</label>
									</div>
									
								</div>
							</div>
							<form action="pwdAction" name="pwdForm" id="pwdForm" novalidate>
								<div class="form-group">
									<label class="col-sm-3 control-label">이전 비밀번호</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="prev_pwd" name="prev_pwd" ng-required="true" ng-model="prev_pwd" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">새 비밀번호</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="new_pwd1" name="new_pwd1" ng-required="true" ng-model="new_pwd1"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">새 비밀번호 확인</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="new_pwd2" name="new_pwd2" ng-required="true" ng-model="new_pwd2">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-6 col-sm-offset-3">
										<button id="pwdBtn" ng-disabled="pwdForm.$invalid"  type="submit" class="btn btn-primary">비밀번호 변경</button>
									</div><br/>
									<div class="col-sm-9 col-sm-offset-3">
										
										<p id="pwdCheck"></p>
										
									</div>
								
								</div>
							</div>

						
							</form>
						
					</div>



					<div class="tab-pane" id="app">

						<div class="form-group">
							<div class="col-sm-offset-1 contorl-label" style="padding-top:50px;">
								<h3> <small>Instagram 계정에 액세스하도록 허용한 앱이 없습니다.</small></h3>
							</div>
							</div>


					</div>

					<div class="tab-pane" id="comment">
						<div style=
						"padding-top:50px;"></div>
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label>
									<input type="checkbox"/>부적절한 댓글 숨기기
								</label>
								<div>불쾌한 내용으로 자주 신고되는 단어 또는 문구가 포함된 댓글을 숨깁니다.</div>
							</div>
						</div>
						<br/>
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label >맞춤 키워드 </label>
								<div>아래의 단어나 문구가 포함된 댓글은 숨겨집니다.</div>
							</br>
								<input type="text" class="form-control" id="intro"
								placeholder="쉼표(,)로 구분하여 키워드를 추가하세요">
							</div>
						</div>

									
					</div>

					<div class="tab-pane" id="emails">
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<h3 style="font-weight:bold;">
									받아보기:
								</h3>
							</div>
						</div>
						<br/>
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label>
									<input type="checkbox" checked>
								</label>
								<label>뉴스 이메일</label>
								<p>새로운 제품에 대한 소식을 가장 먼저 받아보세요.</p>
							</div>
								
						</div>
						<br/>

						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label>
									<input type="checkbox" checked>
								</label>
								<label>알림 이메일</label>
								<p>유용한 최신 정보를 빠짐없이 받아보세요.</p>
							</div>
								
						</div><br/>
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label>
									<input type="checkbox" checked>
								</label>
								<label>제품 이메일</label>
								<p>Instagram 도구 사용에 대한 팁을 확인해보세요. </p>
							</div>
								
						</div><br/>
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label>
									<input type="checkbox" checked>
								</label>
								<label>설문 조사 이메일</label>
								<p>의견을 보내 조사 연구에 참여하세요.</p>
							</div>
								
						</div><br/>
						<div class="form-group">
							<div class="col-sm-offset-1 control-label">
								<label>
									<input type="checkbox" checked>
								</label>
								<label>SMS 메시지</label>
								<p>SMS로 알림을 받아보세요.</p>
							</div>
								
						</div><br/>
					</div>
	

					<div class="tab-pane " id="phones">
						<div class="form-group">
							<div class="control-label col-sm-offset-1">
								<h3 style="font-weight: bold;">연락처 관리</h3>
							</div>
						</div>
						<div class="form-group">
							<div class="control-label col-sm-offset-1">
							<p>
							Instagram에 업로드한 연락처입니다. 연락처를 삭제하려면 해당 연락처를 선택하고 삭제를 누르세요. 동기화된 모든 연락처를 삭제할 수도 있습니다. 단, 연락처 업로드 기능이 계속 설정되어 있는 경우 여기에서 연락처를 삭제해도 해당 정보가 다시 업로드됩니다.
							</p>
							<br/>
							<p>
							업로드한 연락처 정보는 Instagram이 회원님에게 친구를 추천하거나 이용 환경을 개선하는 데 사용됩니다. 이 연락처 정보는 회원님만 볼 수 있습니다.
							</div>
						</div>
						<div class="form-group">
							<div class="control-label col-sm-offset-1">
								<div class="bottom_border">
								<h4 style="font-weight:bold;">동기화된 연락처 0개</h4>
								</div>
								
								<p>
									Instagram에 연락처를 업로드하면 여기에 표시됩니다.
								</p>

								<button type="submit" class="btn btn-primary disabled">삭제</button>
								<br/>
								
							</div>
						</div>
					
					</div>
				</div>	
			
			</div><!-- col-xs-8 -->

		</div> <!-- row -->

	</div><!-- container -->


	<div class="navbar footer">

			<a href="#">Instagram 정보</a>
			&nbsp;&nbsp;
			<a href="#">지원</a>
			&nbsp;&nbsp;
			<a href="#">블로그</a>
			&nbsp;&nbsp;
			<a href="#">홍보센터</a>
			&nbsp;&nbsp;
			<a href="#">API</a>
			&nbsp;&nbsp;
			<a href="#">채용정보 </a>
			&nbsp;&nbsp;
			<a href="#">개인정보처리방침</a>
			&nbsp;&nbsp;
			<a href="#">약관</a>
			&nbsp;&nbsp;
			<a href="#">디렉터리</a>
			&nbsp;&nbsp;
			<a href="#">언어</a>
			&nbsp;&nbsp;
			<p class="navbar-text pull-right">@2017 INSTAGRAM</p>
	</div> 

	<script src="../js/jquery-3.2.1.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script>
		$(".menu").click(function(){
			
			$(".nav-stacked > li").removeClass("a_click");

			$(this)
			.parent()
			.addClass("a_click");

		});
		$("#pwdBtn").click(function(){
			var pwd1= $("#new_pwd1").val;
			console.log(pwd1);
		});

		$("#pwdForm").submit(function(){
			var pwd1= $("#new_pwd1").val();
			var pwd2= $("#new_pwd2").val();
			console.log(pwd);

			if(pwd1!=pwd2){
				$("#pwdCheck")
				.text("새로운 비밀번호 값이 서로 일치하지 않습니다.")
				.css("color","red");
				return false;
			}
		});

	    //Scroll Event
	    $(window).on("scroll", function(e) {
	      var scrollTop = $(window).scrollTop();
	      if(scrollTop > 50) {
	        $('.nav-insta').addClass("nav-small");
	        $('.nav-container').addClass("container-small");

	        $('.nav-fixed-1').stop().hide();
	        $('.nav-fixed-2').stop().fadeIn(500);

			$('body').addClass("body-small");

	      }
	      else {
	        $('.nav-insta').removeClass("nav-small");
	        $('.nav-container').removeClass("container-small");
	        $('.nav-fixed-2').stop().hide();
	        $('.nav-fixed-1').stop().fadeIn(500);

	        $('body').removeClass("body-small");
	      }
	    });

	//Moving to the other pages
    function fn_movePage(pageNm) {
      //Loading a progress bar
      $('#nprogress').show();
        var wPercent = 0;
        var intId = setInterval(function() {
          if(wPercent > 100) {
            clearInterval(intId);
            location.href = pageNm + ".html";
          }
          $('#nprogress').css("width",  wPercent + "%");
          wPercent += 0.6;
        } , 10);
    }

	</script>
</body>
</html>