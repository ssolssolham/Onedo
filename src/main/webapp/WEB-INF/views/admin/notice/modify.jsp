<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  
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
            <h3 class="box-title">공지 내용 수정</h3>
          </div>
          <!-- /.box-header -->

        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">공지 등록</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
          <form action="/admin/notice/register" method="get">
            <div class="box-body">
              <div class="form-group">
                <label for="exampleInputEmail1">제목</label> 
                <input name="title" type="text" class="form-control" value="${notice.title }">
              </div><br>

 			<div class="form-group">
              <label for="exampleInputPassword1">내용</label>
              <textarea name="content" class="form-control" cols="30" rows="5" >${notice.content }</textarea>
			</div><br>

			<input type="hidden" name="article_pw" value="">
			<input type="hidden" name="bno" value="1">
			<input type="hidden" name="article_num" value="${notice.article_num }">
			<input type="hidden" name="userid" value="<sec:authentication property="principal.member.userid"/>">
						
              <div>
                <input type="submit" style="margin: 10px;"
                  class="btn btn-primary btn-flat" value="공지 수정"
                  onclick="location.href = '/admin/notice/modify' " />
              </div>

            </div>
           </form>
		<br>

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
</body>
</html>