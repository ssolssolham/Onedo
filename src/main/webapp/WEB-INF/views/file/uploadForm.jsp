<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>파일 업로드</title>
</head>
<body>
<h1> 파일 업로드 준비  </h1>
<form action= "uploadFormAction" method="post" enctype="multipart/form-data"> 
  <input type="file" name="uploadFile" multiple>
  <button>Submit</button>
</form>

</body>
</html>
