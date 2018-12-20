<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/upload_form.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src = "${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script>
function preview_images() 
{
 var total_file=document.getElementById("images").files.length;
 for(var i=0;i<total_file;i++)
 {
  $('#image_preview').append("<div class='col-md-3'><img class='img-responsive' src='"+URL.createObjectURL(event.target.files[i])+"'></div>");
 }
}

$('#add_more').click(function() {
    "use strict";
    $(this).before($("<div/>", {
      id: 'filediv'
    }).fadeIn('slow').append(
      $("<input/>", {
        name: 'file[]',
        type: 'file',
        id: 'file',
        multiple: 'multiple',
        accept: 'image/*'
      })
    ));
  });

  $('#upload').click(function(e) {
    "use strict";
    e.preventDefault();

    if (window.filesToUpload.length === 0 || typeof window.filesToUpload === "undefined") {
      alert("No files are selected.");
      return false;
    }

    // Now, upload the files below...
    // https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications#Handling_the_upload_process_for_a_file.2C_asynchronously
  });

  deletePreview = function (ele, i) {
    "use strict";
    try {
      $(ele).parent().remove();
      window.filesToUpload.splice(i, 1);
    } catch (e) {
      console.log(e.message);
    }
  }

  $("#file").on('change', function() {
    "use strict";

    // create an empty array for the files to reside.
    window.filesToUpload = [];

    if (this.files.length >= 1) {
      $("[id^=previewImg]").remove();
      $.each(this.files, function(i, img) {
        var reader = new FileReader(),
          newElement = $("<div id='previewImg" + i + "' class='previewBox'><img /></div>"),
          deleteBtn = $("<span class='delete' onClick='deletePreview(this, " + i + ")'>X</span>").prependTo(newElement),
          preview = newElement.find("img");

        reader.onloadend = function() {
          preview.attr("src", reader.result);
          preview.attr("alt", img.name);
        };

        try {
          window.filesToUpload.push(document.getElementById("file").files[i]);
        } catch (e) {
          console.log(e.message);
        }

        if (img) {
          reader.readAsDataURL(img);
        } else {
          preview.src = "";
        }

        newElement.appendTo("#filediv");
      });
    }
  });


</script>
<style>
#formdiv {
  text-align: center;
}
#file {
  color: green;
  padding: 5px;
  border: 1px dashed #123456;
  background-color: #f9ffe5;
}
#img {
  width: 17px;
  border: none;
  height: 17px;
  margin-left: -20px;
  margin-bottom: 191px;
}
.upload {
  width: 100%;
  height: 30px;
}
.previewBox {
  text-align: center;
  position: relative;
  width: 150px;
  height: 150px;
  margin-right: 10px;
  margin-bottom: 20px;
  float: left;
}
.previewBox img {
  height: 150px;
  width: 150px;
  padding: 5px;
  border: 1px solid rgb(232, 222, 189);
}
.delete {
  color: red;
  font-weight: bold;
  position: absolute;
  top: 0;
  cursor: pointer;
  width: 20px;
  height:  20px;
  border-radius: 50%;
  background: #ccc;
}

</style>
</head>


<body>

<div class="row">
<p><strong>${id }</strong>님 로그인중...</p>
 <form action="upload.do" method="post" enctype="multipart/form-data">
  <div class="col-md-6">
      <label for="myFile">첨부파일<input type="file" class="form-control" id="images" name="images[]" onchange="preview_images();" multiple/>
  </div>
  <div class="col-md-6">
      <input type="submit" class="btn btn-primary" name='submit_image' value="Upload Multiple Image"/>
  </div>
 </form>
 </div>
 <div class="row" id="image_preview"></div>
	
	<!-- <h3>파일 업로드 폼 입니다.</h3>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<label for="content">내용</label> <input type="text" name="content" id="content" /><br />
		<label for="myFile">첨부파일</label> <input type="file" name="file" id="myFile" /><br />
		<button type="submit">업로드</button>
	</form> -->
</body>
</html>











