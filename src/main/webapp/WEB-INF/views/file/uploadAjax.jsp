<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ajax로 파일 업로드</title>
</head>
<body>
<h1> 파일 업로드 준비  </h1>

<div class="uploadDiv">
  <input type="file" name='uploadFile' multiple>
</div>
  <button id='uploadBtn'>업로드</button>
</body>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	var regax = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regax.test(fileName)){
			alert("해당 종류 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		//파일을 폼에 추가
		
		for (var i = 0; i < files.length; i++) {
			formData.append("uploadFile", files[i]);
		}
		
		
		$.ajax({
			url : '/file/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(reuslt){
				alert("Uploaded");
			}
		}); //ajax
		
		
	});
});

</script>
</html>
