<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        	영속 테이블 관리
        <small>영속계층으로 관리하는 테이블을 관리</small>
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
		<tr style="background-color: gray;">
			<th>번호</th>
			<th>물리적 테이블명</th>
			<th>논리적 테이블명</th>
			<th>테이블설명요약</th>
		</tr>
		</thead><br>
		<tbody>
		<c:forEach items="${tables}" var="table" varStatus="idx">
		  <tr style="background-color: #d2d6de;">
		  	<td>${table.tbl_no }</td>
		  	<td>${table.tbl_phy_name }</td>
		  	<td>${table.tbl_log_name }</td>
		  	<td>${table.tbl_summary }</td>
		  </tr>
		  <c:if test="${fn:length(table.columnList) gt 1 }">
		    <tr>
		  	<th style="background-color: #EAEAEA; text-align: center;" rowspan="${fn:length(table.columnList)+2 }">columns</th>
		    </tr>
		    <tr style="background-color: #EAEAEA;">
		      <th>물리적컬럼명</th>
		      <th>논리적컬럼명</th>
		      <th>컬럼설명요약</th>
		    </tr>
		    <c:forEach items="${table.columnList }" var="col" varStatus="status">
		      <tr>
		    	<td>${table.columnList[status.index].col_phy_name }</td>
		    	<td>${table.columnList[status.index].col_log_name }</td>
		    	<td>${table.columnList[status.index].col_summary }</td>
		      </tr>
		    </c:forEach>
		  </c:if>
		  </c:forEach>
		</tbody>
	</table>
	<br>	
	</div><!-- /.box-body -->
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

</body>
</html>