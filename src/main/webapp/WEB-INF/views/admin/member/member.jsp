<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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

	<!-- 아이디, 이름 검색 -->
	<form id="searchForm" action="/admin/member/" method="get">
	<select name="type" id="optionSel" style="height: 35px; font-size: 20px; text-align: center; width: 15%; display: inline" class="form-control form-control-sm">
	  <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
	  <option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>아이디</option>
      <option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>이름</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }" style="vertical-align: top; width: 15%; height: 35px; display: inline;" class="form-control"> <!--  id="searchValue" -->
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<button type="button" id="reviewSearchBtn" style="vertical-align: top; height:35px; width: 10%;">검색</button>
	</form>
<br><br>
	<table id="example2" class="table table-bordered table-hover">
		<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>가입일</th>
			<th>수정일</th>
			<th>권한</th>
			<th>탈퇴여부</th>
		</tr>
		</thead><br>
		<tbody>
		<c:forEach items="${users }" var="user" varStatus="idx">
		  <tr>
		  	<td>${idx.index +1 }</td>
		  	<td>${user.userid }</td>
		  	<td>${user.userName }</td>
		  	<td>${user.regDate }</td>
		  	<td>${user.updateDate }</td>
		  	<td>${user.authList }</td>
		  	<td>${user.enabled }</td>
		  </tr>
		</c:forEach>
		</tbody>
	</table><br>
	<!-- pagination -->
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
			<li class="paginate_button">
				<a href="${pageMaker.startPage -1 }">Previous</a>
			</li>
		</c:if>
		
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
				<a href="${num }">${num }</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next }">
			<li class="paginate_button">
			<a href="${pageMaker.endPage +1 }">Next</a>
			</li>
		</c:if>
	</ul><!-- end pagination -->	
		
	<!-- page a태그 원래동작 방지 -->
	<form id="actionForm" action="/admin/member/" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<!-- 검색에서도 페이징처리 -->
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>

<!--               <table id="example2" class="table table-bordered table-hover">
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
              모달을 부탁함니다 ^^..
              </td>
                </tr>
                </tfoot>
              </table>
 -->           
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
<script type="text/javascript">
$(document).ready(function() {
	//page이동
	var actionForm = $('#actionForm');
	$('.paginate_button a').on("click", function(e) {
		console.log("들어왔니??????")
		e.preventDefault(); //원래 a태그 동작 방지
		
		console.log('페이지눌림!!!');
		
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

</body>
</html>