<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h1>/sample/Login Member Page</h1>
  <form action="/customLogout" method="post">
    <button>로그아웃</button>
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
  </form>
</body>
</html>