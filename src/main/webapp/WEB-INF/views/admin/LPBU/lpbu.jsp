<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<style>
button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
    margin-bottom : 15px;
}

button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}

button.accordion:after {
    content: '\02795';
    font-size: 13px;
    color: #777;
    float: right;
    margin-left: 5px;
}

button.accordion.active:after {
    content: "\2796";
}

div.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: 0.6s ease-in-out;
    opacity: 0;
}

div.panel.show {
    opacity: 1;
    max-height: none;  
}


/* 어드민 FORM  */
.form-style-2{
  max-width: auto;
  padding: 20px 12px 10px 20px;
  font: 13px Arial, Helvetica, sans-serif;
}
.form-style-2-heading{
  font-weight: bold;
  font-style: italic;
  border-bottom: 2px solid #ddd;
  margin-bottom: 20px;
  font-size: 15px;
  padding-bottom: 3px;
}
.form-style-2 label{
  display: block;
  margin: 0px 0px 15px 0px;
}
.form-style-2 label > span{
  width: 100px;
  font-weight: bold;
  float: left;
  padding-top: 8px;
  padding-right: 5px;
}
.form-style-2 span.required{
  color:red;
}
.form-style-2 .tel-number-field{
  width: 40px;
  text-align: center;
}
.form-style-2 input.input-field, .form-style-2 .select-field{
  width: 48%; 
}
.form-style-2 input.input-field, 
.form-style-2 .tel-number-field, 
.form-style-2 .textarea-field, 
 .form-style-2 .select-field{
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  border: 1px solid #C2C2C2;
  box-shadow: 1px 1px 4px #EBEBEB;
  -moz-box-shadow: 1px 1px 4px #EBEBEB;
  -webkit-box-shadow: 1px 1px 4px #EBEBEB;
  border-radius: 3px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  padding: 7px;
  outline: none;
}
.form-style-2 .input-field:focus, 
.form-style-2 .tel-number-field:focus, 
.form-style-2 .textarea-field:focus,  
.form-style-2 .select-field:focus{
  border: 1px solid #0C0;
}
.form-style-2 .textarea-field{
  height:100px;
  width: 55%;
}
.form-style-2 input[type=submit],
.form-style-2 input[type=button]{
  border: none;
  padding: 8px 15px 8px 15px;
  background: #FF8500;
  color: #fff;
  box-shadow: 1px 1px 4px #DADADA;
  -moz-box-shadow: 1px 1px 4px #DADADA;
  -webkit-box-shadow: 1px 1px 4px #DADADA;
  border-radius: 3px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
}
.form-style-2 input[type=submit]:hover,
.form-style-2 input[type=button]:hover{
  background: #EA7B00;
  color: #fff;
}


/* 테이블 스타일  */
.table-style-2{
  max-width: auto;
  padding: 20px 12px 10px 20px;
  font: 13px Arial, Helvetica, sans-serif;
}
.table-style-2-heading{
  font-weight: bold;
  font-style: italic;
  border-bottom: 2px solid #ddd;
  margin-bottom: 20px;
  font-size: 15px;
  padding-bottom: 3px;
}
.table-style-2 label{
  display: block;
  margin: 0px 0px 15px 0px;
}
.table-style-2 label > span{
  width: 100px;
  font-weight: bold;
  float: left;
  padding-top: 8px;
  padding-right: 5px;
}
.table-style-2 span.required{
  color:red;
}
.table-style-2 .tel-number-field{
  width: 40px;
  text-align: center;
}
.table-style-2 input.input-field, .form-style-2 .select-field{
  width: 25%; 
}
.table-style-2 input.input-field, 
.table-style-2 .tel-number-field, 
.table-style-2 .textarea-field, 
.table-style-2 .select-field{
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  border: 1px solid #C2C2C2;
  box-shadow: 1px 1px 4px #EBEBEB;
  -moz-box-shadow: 1px 1px 4px #EBEBEB;
  -webkit-box-shadow: 1px 1px 4px #EBEBEB;
  border-radius: 3px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  padding: 7px;
  outline: none;
}
.table-style-2 .input-field:focus, 
.table-style-2 .tel-number-field:focus, 
.table-style-2 .textarea-field:focus,  
.table-style-2 .select-field:focus{
  border: 1px solid #0C0;
}
.table-style-2 .textarea-field{
  height:100px;
  width: 55%;
}
.table-style-2 input[type=submit],
.table-style-2 input[type=button]{
  border: none;
  padding: 8px 15px 8px 15px;
  background: #FF8500;
  color: #fff;
  box-shadow: 1px 1px 4px #DADADA;
  -moz-box-shadow: 1px 1px 4px #DADADA;
  -webkit-box-shadow: 1px 1px 4px #DADADA;
  border-radius: 3px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
}
.table-style-2 input[type=submit]:hover,
.table-style-2 input[type=button]:hover{
  background: #EA7B00;
  color: #fff;
}
</style>


</head>
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
        대출 상품 관리
        <small>대출 상품 등록, 수정, 삭제</small>
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
              
                <button class="accordion">예약상담 관리</button>
                <div class="panel">
                                    <div class="table-style-2">
                    <div class="table-style-2-heading">
                      <form id='searchForm' action="/admin/lpbu/" method='get'>
                      <label for="field1">
                      <select name="type" class="select-field">
                                  <option value=""
                                    <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                                  <option value="T"
                                    <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                                  <option value="C"
                                    <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                                  <option value="W"
                                    <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                                  <option value="TC"
                                    <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
                                    or 내용</option>
                                  <option value="TW"
                                    <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
                                    or 작성자</option>
                                  <option value="TWC"
                                    <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
                                    or 내용 or 작성자</option>
                                </select> <input type='text' class="input-field" name='keyword'
                                  value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
                                  type='hidden' name='pageNum'
                                  value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
                                  type='hidden' name='amount'
                                  value='<c:out value="${pageMaker.cri.amount}"/>' />
                      <button type="button" style="display:inline;">검색 </button>
                      </label>
                      </form>
                      </div>
                   <table id="loanList">
                        <colgroup>
                           <col width="10%" style="text-align: center;">
                           <col width="10%" style="text-align: center;">
                           <col width="25%" style="text-align: center;">
                           <col width="20%" style="text-align: center;">
                           <col width="10%" style="text-align: center;">
                           <col width="20%" style="text-align: center;">
                           <col width="10%" style="text-align: center;">
                           
                        </colgroup>
                        <thead>
                           <tr>
                              <th style="text-align: center;">상품번호</th>
                              <th style="text-align: center;">상품유형</th>
                              <th style="text-align: center;">상품구분</th>
                              <th style="text-align: center;">상품이름</th>
                              <th style="text-align: center;">업데이트날짜</th>
                              <th style="text-align: center;">예약횟수</th>
                              <th style="text-align: center;">판매변경</th>
                           </tr>
                        </thead>
                        <tbody>
                        
                          <c:forEach items="${list}" var="lpbu">
                              <tr>
                                <td style="text-align:center;">${loan.get('LOAN_ID')}</td>
                                <td style="text-align:cdnter; padding-left: 7px;"></td>
                                <td style="text-align:center;"></td>
                                <td style="text-align:center;"></td>
                                <td style="text-align:center;"></td>
                                <td style="text-align:center;"></td>
                                <td style="text-align:center;"><button type="button">able</button></td>
                              </tr>
                         </c:forEach>
                        </tbody>
                     </table>
                     
                     <div class='pull-right'>
                        <ul class="pagination">
                          <c:if test="${pageMaker.prev}">
                            <li class="paginate_button previous"><a
                              href="${pageMaker.startPage -1}">Previous</a></li>
                          </c:if>
              
                          <c:forEach var="num" begin="${pageMaker.startPage}"
                            end="${pageMaker.endPage}">
                            <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                              <a href="${num}">${num}</a>
                            </li>
                          </c:forEach>
              
                          <c:if test="${pageMaker.next}">
                            <li class="paginate_button next"><a
                              href="${pageMaker.endPage +1 }">Next</a></li>
                          </c:if>
              
                        </ul>
                      </div>
        <!--  end Pagination -->
                    </div>
                </div>
                
                <button class="accordion">대출예약 통계</button>
                <div class="panel">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                
            </div>
            <!-- /.box-header -->
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

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
  }
}
</script>
</body>
</html>