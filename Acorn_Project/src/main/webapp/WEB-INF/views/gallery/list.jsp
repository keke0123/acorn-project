
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	<script	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/upload-image.js"></script>

</head>
<body>
	<div class="container">
		<a href="upload_form.do">이미지 업로드</a> |
		<h3>Gallery 이미지 목록 입니다.</h3>

		<div class="col-xs-6 col-sm-3">
			<h4></h4>
			<img class="img-responsive" src="" />
			<p>작성자: <strong></strong></p>
			<p>날짜: <strong></strong></p>
		</div>	
	</div>
	
	<div class="container">
		<h3>모달 테스트</h3>
		<button data-toggle="modal" data-target="#myModal" class="btn btn-info">모달 띄우기</button>
	</div>
	<div class="modal fade" id="myModal">
		<!-- modal-lg  | default | modal-sm -->	
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
					<h4 class="modal-title">모달의 제목</h4>
				</div>
				<div class="modal-body" id = "loadModalBody">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
	<script>
		// .modal(옵션)
		$("#myModal").modal({
			backdrop:false, // backdrop 여부
			show:false // 로딩 시점에 modal 을 띄울지 여부
			 $("#loadModalBody").load("upload_form.jsp");
		});
	</script>

</body>
</html>









