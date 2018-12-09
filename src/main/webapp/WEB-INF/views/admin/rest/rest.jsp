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
        URL 및 RESTful 관리
        <small>url매핑과 해당 url에서 오가는 데이터 관리</small>
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
			<th>URL</th>
			<th>URL설명</th>
			<th>요청방식</th>
			<th>접근권한</th>
		</tr>
		</thead><br>
		<tbody>
		<c:forEach items="${urls}" var="url" varStatus="idx">
		  <tr style="background-color: #d2d6de;">
		  	<td>${idx.index +1 }</td>
		  	<td>${url.url }</td>
		  	<td>${url.url_summary }</td>
		  	<td>${url.method }</td>
		  	<td>${url.auth }</td>
		  </tr>
		  <c:if test="${fn:length(url.paramList) gt 1 }">
 		  	<tr>
		  		<th style="text-align: center; background-color: #EAEAEA;" rowspan="${fn:length(url.paramList)+2}">요청 파라미터</th>
		  	</tr>
 			<tr style="background-color: #EAEAEA;">
		  		<th>key</th>
		  		<th>value</th>
		  		<th>type</th>
		  		<th>설명</th>
		  	</tr>
		  	<c:forEach items="${url.paramList}" var="param" varStatus="status">
		  		<tr>
		  		  <td>${url.paramList[status.index].key}</td>
		  		  <td>${url.paramList[status.index].value}</td>
		  		  <td>${url.paramList[status.index].type}</td>
		  		  <td>${url.paramList[status.index].description}</td>
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


<!-- ================================================================== -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!-- 페이지 및 검색 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	//page이동
	var actionForm = $('#actionForm');
	$('.paginate_button a').on("click", function(e) {
		e.preventDefault(); //원래 a태그 동작 방지
		
		//form태그 내, pageNum은 href속성으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// 변경후 form제출
		actionForm.submit();
	});
	
	// 검색
	var searchForm = $('#searchForm');
	
	$("#reviewSearchBtn").on("click", function(e) {
		
		console.log("선택옵션: " + $('#optionSel option:selected').val());
		console.log("입력키워드: " + $('#keyword').val());

		if(!$('#optionSel option:selected').val()){
			alert("검색종류를 선택해 주세요");
			return false;
		}
		if(!$('#keyword').val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
});
</script>

<!-- 파람영역 아코디언 자바스크립트 -->
<script type="text/javascript">
// 이름수정 아코디언이벤트	
var panels = $(".panel"); //아코디언으로 보일영역
var btns = $(".accordion"); //아코디언이벤트 버튼
var i=0;

for(i=0; i<panels.length; i++){
	panels[i].style.display = "none";
	btns[i].addEventListener("click", function() {
	    var panel = this.parentElement.parentElement.nextElementSibling;
		if(panel.style.display === "none"){
			panel.style.display = "table-row";
		}else{
			panel.style.display = "none";
		}
	});
}

}

</script>

</body>
</html>