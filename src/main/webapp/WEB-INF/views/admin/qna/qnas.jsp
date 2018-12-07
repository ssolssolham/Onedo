<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
  
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
<sec:authentication var="loginId" property="principal.member.userid" /><!-- 로그인한사람 id값 변수로 저장 -->
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
          문의관리 <small>문의 답변</small>
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
          <div class="box-header"></div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example2"
              class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>순번</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>등록날짜</th>
                  <th>답변여부</th>
                  <th>답변달기</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${qnas }" var="qna" varStatus="status">
              	<tr>
              		<td>${status.index+1 }</td>
              		<td>${qna.title }</td> 
              		<td>${qna.userid }</td>
              		<td>${qna.regdate }</td>
              	<c:set var="replycnt" value="${qna.replycnt }"/>
                <fmt:formatNumber value="${qna.replycnt }" type="number" var="replycnt" />
                <c:if test="${replycnt eq 0 }">
					<td>답변처리중</td>
				</c:if>
				<c:if test="${replycnt gt 0 }">
				    <td>답변완료</td>
				</c:if>
					<td>
			  <button type="button" style="margin: 0px 0px 0px 10px;"
              class="accordion btn btn-warning btn-primary btn-flat"
              value="답변달기">답변관리</button>
					</td>
              	</tr>
              	<tr class="panel" style="display: none">
              	  <td colspan="6">
              	    <h4>문의답변달기</h4>
              	     	<label>문의내용: </label>
              	     	${qna.content }<br><br>
              	    <form action="/admin/qna/addReply" method="get">
              	     	답변<br><textarea type="text" name="reply" cols="20" rows="5"></textarea>
              	     	
              	     	<input type="hidden" name="article_num" value="${qna.article_num }">
              	     	<input type="hidden" name="replyer" value="${loginId }">
              	     	<br><input type="submit" value="답변등록">
              	    </form>
              	  </td>
              	</tr>
              </c:forEach>
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
	<form id="actionForm" action="/admin/qna/" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
            
          </div>
        </div>
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
	
});
</script>

<!-- 관리영역 아코디언 자바스크립트 -->
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

</script>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/plugin_js.jsp" />
</body>
</html>