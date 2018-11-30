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
        회원관리
        <small>회원 이름 바꾸기, 회원 강제 탈퇴</small>
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

            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
              
                <thead>
                <tr>
                  <th>순번</th>
                  <th>회원이름</th>
                  <th>이메일</th>
                  <th>가입날짜</th>
                  <th>수정날짜</th>
                  <th>탈퇴여부</th>
                  <th>수정 / 탈퇴</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>신상품 출시에 대한 공지
                  </td>
                  <td>박호준</td>
                  <td>11.28</td>
                  <td>11.28</td>
                  <td>X</td>
                  <td>
                  <input type="button" style="margin: 0px 0px 0px 10px;"
              class="btn btn-primary btn-flat" value="이름 수정"  onclick="location.href = '/admin/notice/enrollForm' "/>
              <input type="button" style="margin:  0px 0px 0px 10px;"
              class="btn btn-primary btn-warning btn-flat" value="회원 탈퇴"  onclick="location.href = '/admin/notice/enrollForm' "/>
              <!-- 모달을 부탁함니다 ^^.. -->
              </td>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
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