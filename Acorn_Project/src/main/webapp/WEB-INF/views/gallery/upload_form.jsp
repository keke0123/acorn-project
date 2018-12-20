<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/upload_form.jsp</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/upload-image.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<p>
		<strong>${id }</strong>님 로그인중...
	</p>
	<div class="container">

		<div style="max-width: 480px; margin: auto;">
			<div class="panel panel-primary">
				<form id="upload-image-form" method="post" enctype="multipart/form-data">

					<label for="content"></label>
					
					<div class="panel-body">
						<div class="form-group">
							<!-- <input class="form-control" rows = "5" type="text" name="content" id="content"/> -->
							<textarea name="content" id="content" rows="5" class = "form-control" placeholder="오늘 기분이 어떻신가요?"></textarea>
						</div>
						
						<input type="file" name="file" id="myFile" required>
						<div id="image-preview-div" style="display: none">
							<img id="preview-img" src="noimage">
						</div>
					</div>

					<div class="panel-footer">
						<button class="btn  btn-primary" id="upload-button" type="submit" disabled>업로드</button>
					</div>
				</form>
			</div>
			
		</div>

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
</body>
</html>











