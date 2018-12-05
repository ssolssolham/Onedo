<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지내용</h1>
<c:forEach items="${notices }" var="notice">
	<c:if test="${notice.enabled eq 'Y' }">
	<div><small>${notice.enabled }</small>
		<p>제목: ${notice.title }</p>
		내용: ${notice.content }
	</div>
	<br>
	</c:if>
</c:forEach>
</body>
</html>