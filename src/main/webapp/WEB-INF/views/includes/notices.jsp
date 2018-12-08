<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
#imgDiv {
	background-size:cover; 
	width:480px; 
	height:300px;
 	background-image: url('${pageContext.request.contextPath}/resources/images/noticeBg.jpg');
 	background-repeat: no-repeat;
}
#conDiv {
	background-color: #27b2a5; 
	border-radius: 5px;
}
table {
	margin: 0 auto;
	border-top: 1px solid white;
    border-collapse: collapse;
    width: 80%;
}
th, td {
    border-bottom: 1px solid white;
    text-align: center;
}
th {
	color: yellow;
}
</style>
</head>
<body>

<div id="imgDiv">
</div>
<div id="conDiv">
	<div style="text-align: center; color: white;">
		<h1>공지내용</h1>
	<c:forEach items="${notices }" var="notice">
	<c:if test="${notice.enabled eq 'Y' }">
	<div>
		<table>
			<thead><tr><th>${notice.title }</th></tr></thead>
			<tbody><tr><td>${notice.content }</td></tr></tbody>
		</table>
	</div>
	<br>
	</c:if>
</c:forEach>
	</div>
</div>
</body>
</html>