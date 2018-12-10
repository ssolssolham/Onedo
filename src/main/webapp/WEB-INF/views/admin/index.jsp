<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <h1>관리자 메인 페이지</h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
          <li class="active">Here</li>
        </ol>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">로그인 ~ 대출상담 예약</h3>
            <div class="box-body">
              <div class="chart-body">
                <canvas id="myChart" width="200px" height="50px"></canvas>
              </div>
              <table id="example2"
                class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>내역 / 활동</th>
                    <th>로그인</th>
                    <th>분석 </th>
                    <th>이탈율</th>
                    <th style="width: 40px">Label</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${statByDay.get(3)}" var="loan">
                    <tr>
                      <td><c:out value="${loan.rownum}" /></td>
                      <td><c:out value="${loan.loanName}" /></td>
                      <td><c:out value="${loan.cnt}" /></td>
                      <td>
                          <div class="progress progress-xs">
                            <div
                              class="progress-bar progress-bar-danger"
                              style="width: 55%"></div>
                          </div>
                        </td>
                        <td><span class="badge bg-red">55%</span></td>
                    </tr>
                  </c:forEach>
              </table>
            </div>
          </div>
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">분석상품 BEST 5</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <table id="example2"
                class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>순번</th>
                    <th>상품 이름</th>
                    <th>예약 수(월)</th>
                    <th>지분율</th>
                    <th style="width: 40px">Label</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${statByDay.get(3)}" var="loan">
                    <tr>
                      <td><c:out value="${loan.rownum}" /></td>
                      <td><c:out value="${loan.loanName}" /></td>
                      <td><c:out value="${loan.cnt}" /></td>
                      <td>
                          <div class="progress progress-xs">
                            <div
                              class="progress-bar progress-bar-danger"
                              style="width: 55%"></div>
                          </div>
                        </td>
                        <td><span class="badge bg-red">55%</span></td>
                    </tr>
                  </c:forEach>
              </table>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">대출상품 BEST 5</h3>
              <div class="box-body">

                <table id="example3"
                  class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>순번</th>
                      <th>상품 이름</th>
                      <th>예약 수(월)</th>
                      <th>지분율</th>
                      <th style="width: 40px">Label</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${statByDay.get(3)}" var="loan">
                      <tr>
                        <td><c:out value="${loan.rownum}" /></td>
                        <td><c:out value="${loan.loanName}" /></td>
                        <td><c:out value="${loan.cnt}" /></td>
                        <td>
                          <div class="progress progress-xs">
                            <div
                              class="progress-bar progress-bar-danger"
                              style="width: 55%"></div>
                          </div>
                        </td>
                        <td><span class="badge bg-red">55%</span></td>
                      </tr>
                    </c:forEach>
                </table>
              </div>

            </div>
            <!-- /.box -->
            
                <!-- /.box-body -->

              </form>
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

  <jsp:include
    page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/plugin_js.jsp" />

  <input type="hidden" id="loginCnt" value="${statByDay.get(0)}" />
  <input type="hidden" id="adbdCnt" value="${statByDay.get(1)}" />
  <input type="hidden" id="lpbuCnt" value="${statByDay.get(2)}" />
</body>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	var loginCnt = $('#loginCnt').val();
	loginCnt = loginCnt.substring(0,loginCnt.length - 1);
	var adbdCnt = $('#adbdCnt').val();
	var lpbuCnt = $('#lpbuCnt').val();

	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ "로그인 수", "분석 수", "대출상담 예약" ],
			datasets : [ {
				label : '로그인 ~ 대출상담 예약',
				data : [ loginCnt, adbdCnt, lpbuCnt ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)' ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
</script>
</html>