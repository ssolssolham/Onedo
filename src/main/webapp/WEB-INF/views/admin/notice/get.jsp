<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>

<!-- HEAD -->
<jsp:include
  page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/head.jsp" />

<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <jsp:include
      page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/header.jsp" />
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include
      page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/left_column.jsp" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          공지관리 <small>공지 등록, 수정, 삭제</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
          <li class="active">Here</li>
        </ol>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">

        <!--------------------------
        | Your Page Content Here |
        -------------------------->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">공지 내용</h3>
          </div>
          <!-- /.box-header -->

		<!-- 공지 상세내용 -->
		<table id="example2"
		              class="table table-bordered table-hover">
			<colgroup>
			<col width="18%">
			<col width="32%">
		    <col width="18%">
		    <col width="32%">
			</colgroup>
		    <tr>
		    	<td><b>공지제목</b></td>
		    	<td>${notice.title }</td>
		    	
		    	<td><b>작성자</b></td>
		    	<td>${notice.userid }</td>
		    </tr>
		    
		    <tr>
		    	<td><b>공지등록일</b></td>
		    	<td><fmt:parseDate pattern="yyyy-mm-dd" value="${notice.regdate }"/></td>
		    	<td><b>게시여부</b></td>
		    	<td>${notice.enabled }</td>
		    </tr>
		    <tr>
		    	<td colspan="4">
		    	${notice.content }
		    	</td>
		    </tr> 
		</table>
		<br>
		<div style="margin: 10px;">
		<a href="/admin/notice/" class="btn btn-primary">목록</a>
		<c:set var="enabled" value="Y"/>
		<c:if test="${notice.enabled eq enabled}">
		<a href="/admin/notice/modifyView?article_num=${notice.article_num }" class="btn btn-primary">공지내용수정</a>
		<a href="/admin/notice/withdraw?article_num=${notice.article_num }" class="btn btn-primary">공지내리기</a>
		</c:if>
		</div>
        <br />
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <jsp:include
      page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/footer.jsp" />

    <!-- controller -->
    <jsp:include
      page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/control_sidebar.jsp" />
  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED JS SCRIPTS -->

  <jsp:include
    page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/plugin_js.jsp" />
   
   <script type="text/javascript">
   // 공지상태변경 클릭시
   function withdraw(e) {
	e.preventDefault();
	alert("공지 상태를 변경하시겠습니까?");
	
}
   </script>
</body>
</html>