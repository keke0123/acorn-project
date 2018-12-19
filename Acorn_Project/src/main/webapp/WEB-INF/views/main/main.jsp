<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insta-nav.css">
<script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
<!-- <script>
	angular.module("myApp",[]).controller("myCtrl",function($scope){
		$scope.id="${id}";
		$scope.followList=[];
		//$scope.followList=${followList[0].id_follow};
		
		$scope.clickBtn=function(){
			console.log($scope.id);
		};
	});
	
	
</script> -->
<title>mypage</title>
</head>
<style>
   @media (min-width: 1200px){
  .container {
     width:970px;
  }
   }

   #one{
     width: 160px;
     height: 160px;
     border-radius: 50%;
     top: 65px;
   }

   #one_2{
     width: 90px;
     height: 90px;
     border-radius: 50%;
     top: 65px;
   }
   .wrapper{
      display: inline-block;
      position: relative;
      top: 50px;
      margin-left: 100px;
   }
   #three{
      display: inline;
      margin-left: 20px;
      font-size: 17px;
   }
   .row{
      position: relative;
      top: 100px;
      right: 50px;
   }
   
   .insList:hover .box{display: block}
   
   .insList{
      position: relative;

   }
   .box{
      position: absolute;
      top:0;
      bottom: 0;
      right: 15px;
      left: 15px;
      display: none;
      background: rgba(0,0,0,0.5);
   }

   .likeBox{

      font-size:20px;
      color:#fff;
      position: relative;
      top: 45%;
      text-align: center;

     
      
   }
 
   #pfont{
      font-size: 17px;
      display: inline-block;
      position: relative;  
      left: 5px;
      top: -4px;
   }



   .loader{
      /* 이미지를 좌우로 가운데 정렬  */
      text-align: center;
      /* 하단에 고정위치에 배치 */
      position:fixed;
      bottom: 20px;
      left: 0;
      width: 100%;
      /* 일단 숨겨 놓기 */
      display: none;
   }
   



   .row{
      position: relative;
      left: 5px;
      top: 6px;
   }

   #saved{
      
      
      margin-top: 40px;
   }
   
   
   .Hidden{
      display: none;
   }
   .Hidden1{
      display: none;
   }

   .glyphicon-pencil{
     margin-left: 30px;
   }

   .footer{
      background-color: #fafafa;
      /*position:fixed;*/
      padding-top: 40px;
      bottom:0;
      text-align: left;
      margin: 0 auto;
      width:100%;
      font-size:12px;
      font-weight: bold;

   }

   #nprogress {
     height: 2px;
     background: #27c4f5 linear-gradient(to right,#27c4f5,#a307ba,#fd8d32,#70c050,#27c4f5);
     background-size: 500%;
     animation: 2s linear infinite barprogress, .3s fadein;
     width: 0%;
     z-index: 1400;
     position: fixed;
     top: 0;
   }

   @keyframes barprogress{
     0% {
       background-position:0% 0
     }
     to{
       background-position:125% 0
     }
   }
    .postFont {
    font-weight: normal;
    color: #999;
   }


   .postFont.active {
    font-weight: bold;
    color: #000;
   }

   .glyColor{
    color: #999;
   }

    .glyColor.active{

          color: #003569;
    }
    

 
    .links {
      font-size: 12px;
      font-weight: 600;
      margin: 0;
      padding: 0;
      list-style-type: none;
    }

    .links li{
      margin-right: 8px;
      display: inline-block;
      
    }
    .links a{
      color: #023369;
    }

    .copyright {
      color: #999;
      font-size: 12px;
      font-weight: 600;
      letter-spacing: 0.7px;
    }
   
</style>
<body>
<div id="nprogress" style="display: none;"></div>

  <!-- navbar -->
  <nav class="nav-insta">
     <div class="nav-container">
       <div class="nav-logo">
         <div>
           <a href="" class="navbar-brand nav-fixed-1"></a>
           <a href="" class="navbar-brand nav-fixed-2"></a>
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
           <a href="javascript:fn_movePage('main');" class="nav-icon nav-icon-overview"></a>
           <a href="javascript:fn_movePage('like');" class="nav-icon nav-icon-like"></a>
           <a href="javascript:fn_movePage('home');" class="nav-icon nav-icon-mypictures"></a>
          </div>
       </div>
      </div>
   </nav>
   <!-- /navbar -->

<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-xs-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="${pageContext.request.contextPath}/resources/images/basic.png" class="rounded" alt="${pageContext.request.contextPath}/resources.">
            <img id="one_2" src="${pageContext.request.contextPath}/resources/images/basic.png" class="rounded" alt="${pageContext.request.contextPath}/resources." style="display: none;">
        </div>
    </div><!--col-xs-3-->
    <div class="col-xs-7 text-center">
      <h1 style="font-weight:lighter; display: inline-block; " >Acorn</h1>
      <a href="main/profile_form.jsp" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >프로필편집</a>
      <!-- <button id="profileBtn" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 30px; padding-right: 30px; font-size: 15px; margin-top: -12px; " >프로필편집</button> -->
      <span class="glyphicon glyphicon-cog" style="font-size: 23px; margin-left: 5px;"  ></span>
      <br/>
      <div id="profileInfo"> 
          <div style="font-size: 17px; display: inline-block; margin-top: 15px">게시물 6</div>
          <div id="three">팔로워 0</div>
          <div id="three">팔로우 0</div>
      </div>
      <br/>
      <div style="font-size: 20px; font-weight: bold; margin-top: 15px;"> </div>
    </div><!--col-xs-9-->
  </div><!-- pro-->

<!--tab-->
    <div class="row" id="profileInfo_3" style="margin-top: 50px;"> 
        <div class="col-xs-12" style="border-top: 1px solid #efefef">
            <div class="col-xs-4" style="height: 52px;" >
            </div> 
            <div class="col-xs-1 text-center" id="post" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;"  >
            
                <div class="active postFont" style="margin-top: 15px; font-size: 12px;">게시물
            </div>
            </div>
            <div class="col-xs-1"> </div>
            <div class="col-xs-1 text-center" id="save" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
           
                <div class="postFont" style="margin-top: 15px; font-size: 12px;">저장됨</div>
            </div>
            <div class="col-xs-1"> </div>
            <div class="col-xs-4" >
            </div>
        </div>
  </div>
  <!--tap-->

  <div class="row" id="profileInfo_4">
    <div class="col-xs-12" style="border-top: 1px solid #efefef"> 
        <div class="col-xs-6 text-center" style="height: 44px; cursor: pointer;" id="post2">
        <span class="glyphicon glyphicon-th glyColor" style="margin-top: 15px;"></span>
        </div>
         <div class="col-xs-6 text-center" id="save2">
        <span class="glyphicon glyphicon-bookmark glyColor" style="margin-top: 15px; cursor: pointer;"></span>
        </div>
        </div>
   </div>


 <div class="postContent">
    <div class="row">
    <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">0개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">0개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/y1.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">0개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">0개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/y2.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">0개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">0개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/y3.jpg"/></a>

      </div>
   </div>
   <br/>
   <br/>
   
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">0개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">0개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/y4.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">0개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">0개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/y5.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">0개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">0개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/y6.jpg"/></a>

      </div>
   </div>
   <br/>
   <br/>
   
   </div>
 </div> 
 
  <!-- footer -->
  <div class="container">
    <div class="row" style="margin-top:20px;">

        <div id="mainNav" class="col-lg-8 col-md-8 text-center">
          <div class="links">
               <li><a href="#">INSTAGRAM정보</a></li>
             <li><a href="#">지원</a></li>
         <li><a href="#">블로그</a></li>
         <li><a href="#">홍보 센터</a></li>
         <li><a href="#">API</a></li>
         <li><a href="#">채용정보</a></li>
         <li><a href="#">개인정보처리방침</a></li>
         <li><a href="#">약관</a></li>
         <li><a href="#">디렉터리</a></li>
         <li><a href="#">언어</a></li>
          </div>
        </div>
        <div id="copyright" class="col-lg-2 col-md-3 col-md-offset-1 text-center">
          <div class="copyright">
              © 2018 INSTAGRAM
          </div>
        </div>
    </div>
  </div>
  <!-- /footer -->

  <div class="loader"><img src="${pageContext.request.contextPath}/resources/images/loader3.gif" alt="로딩 이미지"></div> 
  
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
<script>
  var showHidden = [ $(".Hidden"), $(".Hidden1") ] ;
  var index =  0;


  $(window).on("load", function() {
      resizeProImage();
  });   

  $(window).on("scroll", function(){
    var scrollTop=$(window).scrollTop();
    var windowHeight=$(window).height();    
    var documentHeight=$(document).height();
    
    $("#sTop").text("scrollTop:"+scrollTop);
    $("#wHeight").text("windowHeight:"+windowHeight);
    $("#dHeight").text("documentHeight:"+documentHeight);

    var isBottom = documentHeight == scrollTop+windowHeight;
    if(isBottom) {
      $(".loader").show();
      setTimeout(function(){
        $(showHidden[index]).show();
        index++;
        $(".loader").hide();
        $(".loader").hide();
      }, 2000); 
    }

    //프로필수정
    	$("#profileBtn").on("click", function(){
		//javascript 로 페이지 이동 시키기
		//location.href="profile";
		location.href="/main/profile.jsp";
	});
    
       
    //Navbar Change
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

   $("<img/>").mouseover(function(){
      $(".box").show().append(this);
   });

   $(window).resize(function() {
      resizeProImage();
   });

   function resizeProImage() {

      var sWidth = $(window).width(); 
  
      if(sWidth <= 768) {
        $('#one').hide();
        $('#one_2').show();
        $('#profileImgs').css("margin-top", "10%");
        $('#profileInfo').hide();
        $('#profileInfo_2').show();
        $('#profileInfo_3').hide();
         $('#profileInfo_4').show();

      }
      else {
        $('#one').show();
        $('#one_2').hide();
        $('#profileImgs').css("margin-top", "20px;");
        $('#profileInfo').show();
        $('#profileInfo_2').hide();
         $('#profileInfo_3').show();
         $('#profileInfo_4').hide();
      }
   }

   $("#save").click(function(){
    $(".postContent").fadeOut();
    $(".saveContent").fadeIn();
    $(".postFont").removeClass("active");
    $(this).find(".postFont").addClass("active");

   });

   $("#post").click(function(){
    $(".saveContent").fadeOut();
    $(".postContent").fadeIn();
    $(".postFont").removeClass("active");
    $(this).find(".postFont").addClass("active");

   });

    $("#save2").click(function(){
    $(".postContent").fadeOut();
    $(".saveContent").fadeIn();
    $(".postFont").removeClass("active");
    $(this).find(".postFont").addClass("active");

   });

   $("#post2").click(function(){
    $(".saveContent").fadeOut();
    $(".postContent").fadeIn();
    $(".postFont").removeClass("active");
    $(this).find(".postFont").addClass("active");

   });

   $("#save2").click(function(){
    $(".postContent").fadeOut();
    $(".saveContent").fadeIn();
    $(".glyColor").removeClass("active");
    $(this).find(".glyColor").addClass("active");

   });

   $("#post2").click(function(){
    $(".saveContent").fadeOut();
    $(".postContent").fadeIn();
    $(".glyColor").removeClass("active");
    $(this).find(".glyColor").addClass("active");

   });


   function fn_movePage(pageNm) {
      //Loading a progress bar
      $('#nprogress').show();
        var wPercent = 0;
        var intId = setInterval(function() {
          if(wPercent > 100) {
            clearInterval(intId);
            location.href = pageNm + ".jsp";
          }
          $('#nprogress').css("width",  wPercent + "%");
          wPercent += 0.6;
        } , 10);
   }
</script>
</body>
</html>