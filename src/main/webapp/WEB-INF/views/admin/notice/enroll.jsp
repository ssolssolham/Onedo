<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>

<!-- HEAD -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/head.jsp"/>

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
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/header.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/left_column.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        공지관리
        <small>공지 등록, 수정, 삭제</small>
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
  <div class="box">
            <div class="box-header">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>순번</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성날짜</th>
                  <th>게시여부</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>신상품 출시에 대한 공지
                  </td>
                  <td>박호준</td>
                  <td>11.28</td>
                  <td>X</td>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
            <div style="text-align:end;"><input type="button" style="margin:10px;" class="btn btn-primary btn-flat" value="공지 등록"/></div>
            
            
          </div>
          
         
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/footer.jsp"/>
 
 <!-- controller -->
 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/control_sidebar.jsp"/>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/plugin_js.jsp"/>
</body>
</html>