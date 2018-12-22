
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
<style>
.container {
  width: 90%;
  height: 70%;
  margin:  auto;
}
.panel{

  width: 100%;
  height: 80%;
  margin: auto;
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
<body>
	<!-- <div class="container">
		<a href="upload_form.do">이미지 업로드</a> |
		<h3>Gallery 이미지 목록 입니다.</h3>

		<div class="col-xs-6 col-sm-3">
			<h4></h4>
			<img class="img-responsive" src="" />
			<p>작성자: <strong></strong></p>
			<p>날짜: <strong></strong></p>
		</div>	
	</div> -->
	
	<div class="container">
		<h3>모달 테스트</h3>
		<button data-toggle="modal" data-target="#myModal" class="btn btn-info">모달 띄우기</button>
	</div>
	<div class="modal fade" id="myModal">
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
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div> -->
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<script>
		// .modal(옵션)
		$("#myModal").modal({
			$("#myModal").modal("show");
			backdrop:false, // backdrop 여부
			show:false // 로딩 시점에 modal 을 띄울지 여부
		});
	</script>

</body>
</html>









