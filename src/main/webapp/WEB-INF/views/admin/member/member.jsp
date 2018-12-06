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
			<th>회원여부</th>
			<th>수정/탈퇴/권한관리</th>
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
		  	<td>
		  	<c:forEach items="${user.authList }" var="auth" varStatus="status">
		  	${status.index+1 }: ${auth.auth }<br>
		  	</c:forEach>
		  	</td>
		  	<td>${user.enabled }</td>
		  	<td>
              <button type="button" style="margin: 0px 0px 0px 10px;"
              class="accordion btn btn-primary btn-primary btn-flat"
               value="이름 수정">이름수정</button>
              <input type="button" style="margin:  0px 0px 0px 10px;"
              class="btn btn-primary btn-warning btn-flat" value="회원 탈퇴"  
              onclick="location.href = '/admin/notice/enrollForm' "/>
              <input type="button" style="margin:  0px 0px 0px 10px;"
              class="btn btn-primary btn-danger btn-flat" value="권한 관리"  
              onclick="location.href = '/admin/notice/enrollForm' "/>
            </td>
		  </tr>
		  <!-- 아코디언영역 -->
		  <tr class="panel">
		  	<td colspan="8">
		  		<h4>아코디언영역</h4>
		  		아코디언으로 회원관리에 필요한 input값을 받을 예정
		  	</td>
		  </tr>
		</c:forEach>
		</tbody>
	</table>
	<br>
	
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

<!-- 관리영역 아코디언 자바스크립트 -->
<script type="text/javascript">

/* var acc = document.getElementsByClassName("accordion"); //아코디언이벤트줄 버튼
var panels = document.getElementsByClassName("panel");  //아코디언으로 내용이 보여질영역
var i=0;
for(i; i<acc.length; i++){
	console.log("이벤트리스너등록");
	var panel = panels[i];
	acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
		//var panel = document.getElementsByClassName("panel")[i];
		if(panel.style.display === "block"){
			panel.style.display = "none";
		}else {
			panel.style.display = "block";
		}
	});
}
 */

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
</script>

</body>
</html>