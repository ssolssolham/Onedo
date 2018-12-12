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
            <h3 class="box-title" style="font-weight: bold;">일별 로그인 ~ 대출상담 예약</h3>
            <div class="box-body">
              <div class="chart-body">
                <canvas id="myChart" width="200px" height="50px"></canvas>
              </div>
              <table id="example2"
                class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th style="width:140px">내역 / 활동</th>
                    <th style="width:430px">유지</th>
                    <th>유지율</th>
                    <th>이탈율</th>
                    <th>참여수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>접속</td>
                    <td><div class="progress progress-s">
                            <div
                              class="progress-bar progress-bar-success"
                              style="width: 100%"></div>
                          </div></td>
                    <td><span class="badge bg-green">100%</span></td>
                    <td><span class="badge bg-red">none</span></td>
                    <td>${statByDay.get(0)}</td>
                  </tr>
                  <tr>
                    <td>로그인</td>
                    <td><div class="progress progress-s">
                            <div
                              class="progress-bar progress-bar-success"
                              style="width: 100%"></div>
                          </div></td>
                    <td><span class="badge bg-green" id="loginPos">33%</span></td>
                    <td><span class="badge bg-red" id="loginPos">33%</span></td>
                    <td>${statByDay.get(4)}</td>
                  </tr>
                  <tr>
                    <td>분석</td>
                    <td><div class="progress progress-s">
                            <div
                              class="progress-bar progress-bar-success"
                              style="width: 100%"></div>
                          </div></td>
                    <td><span class="badge bg-green" id="analysisPos">55%</span></td>
                    <td><span class="badge bg-red" id="analysisPos">55%</span></td>
                    <td>${statByDay.get(1)}</td>
                  </tr>
                  <tr>
                    <td>대출상담 예약</td>
                    <td><div class="progress progress-s">
                            <div
                              class="progress-bar progress-bar-success"
                              style="width: 100%"></div>
                          </div></td>
                    <td><span class="badge bg-green" id="reservePos">55%</span></td>
                    <td><span class="badge bg-red" id="reservePos">55%</span></td>
                    <td>${statByDay.get(2)}</td>
                  </tr>
              </table>
            </div>
          </div>
          <div class="box">
            <div class="box-header">
              <h3 class="box-title" style="font-weight: bold;">월별 분석상품 BEST 5</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <table id="example2"
                class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>순번</th>
                    <th>상권 이름</th>
                    <th>분석 수(월)</th>
                    <th>지분율</th>
                    <th style="width: 40px">Label</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${statByDay.get(7)}" var="adbd">
                    <tr>
                      <td><c:out value="${adbd.Rownum}" /></td>
                      <td><c:out value="${adbd.alleybizcodeName}" /></td>
                      <td class="abdbCnt"><c:out value="${adbd.Cnt}" /></td>
                      <td>
                          <div class="progress progress-s">
                            <div
                              class="progress-bar progress-bar-primary"
                              style="width: 55%"></div>
                          </div>
                        </td>
                        <td><span class="badge bg-blue">55%</span></td>
                    </tr>
                  </c:forEach>
              </table>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box">
            <div class="box-header">
              <h3 class="box-title" style="font-weight: bold;">월별 대출상품 BEST 3</h3>
              <div class="box-body">

                <table id="example3"
                  class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>순번</th>
                      <th>상품 이름</th>
                      <th>예약 수(월)</th>
                      <th>지분율</th>
                      <th style="width: 40px">지분</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${statByDay.get(3)}" var="loan">
                      <tr>
                        <td><c:out value="${loan.rownum}" /></td>
                        <td><c:out value="${loan.loanName}" /></td>
                        <td class="lpbuCnt"><c:out value="${loan.cnt}" /></td>
                        <td>
                          <div class="progress progress-s">
                            <div
                              class="progress-bar progress-bar-yellow"
                              style="width: 55%"></div>
                          </div>
                        </td>
                        <td><span class="badge bg-yellow">55%</span></td>
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

  <input type="hidden" id="logCnt" value="${statByDay.get(0)}" />
  <input type="hidden" id="adbdCnt" value="${statByDay.get(1)}" />
  <input type="hidden" id="lpbuCnt" value="${statByDay.get(2)}" />
  <input type="hidden" id="loginCnt" value="${statByDay.get(4)}" />
  <input type="hidden" id="totalLpbuCnt" value="${statByDay.get(5)}" />
  <input type="hidden" id="totalADBDCnt" value="${statByDay.get(6)}" />
</body>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	var logCnt = $('#logCnt').val();
	var loginCnt = $('#loginCnt').val();
	var adbdCnt = $('#adbdCnt').val();
	var lpbuCnt = $('#lpbuCnt').val();

	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ "접속자 수","로그인 수", "분석 수", "대출상담 예약" ],
			datasets : [ {
				label : '접속 ~ 대출상담 예약',
				data : [ logCnt, loginCnt, adbdCnt, lpbuCnt ],
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
	
	var loginPos = loginCnt / logCnt;
	var analysisPos = adbdCnt / logCnt;
	var reservePos = lpbuCnt / logCnt;
	
	var escapeAll = reservePos - logCnt;
	var logLoginE = (logCnt - loginCnt) / escapeAll;
	var loginAnalysisE = (loginCnt - adbdCnt) / escapeAll;
	var analysisReserveE = (adbdCnt - lpbuCnt) / escapeAll;
	var totalLpbuCnt = $('#totalLpbuCnt').val();
	var totalADBDCnt = $('#totalADBDCnt').val();
	
	var abdbPer1 =  parseInt($('.abdbCnt')[0].innerText) / totalADBDCnt;
	var abdbPer2 =  parseInt($('.abdbCnt')[1].innerText) / totalADBDCnt;
	var abdbPer3 =  parseInt($('.abdbCnt')[2].innerText) / totalADBDCnt;
	var abdbPer4 =  parseInt($('.abdbCnt')[3].innerText) / totalADBDCnt;
	var abdbPer5 =  parseInt($('.abdbCnt')[4].innerText) / totalADBDCnt;
	
	var lpbuPer1 = parseInt($('.lpbuCnt')[0].innerText) / totalLpbuCnt;
	var lpbuPer2 = parseInt($('.lpbuCnt')[1].innerText) / totalLpbuCnt;
	var lpbuPer3 = parseInt($('.lpbuCnt')[2].innerText) / totalLpbuCnt;
	
	$($('.progress-bar.progress-bar-success')[1]).css('width', (loginPos * 100).toFixed() + "%");
	$('.badge.bg-green')[1].innerText = (loginPos * 100).toFixed() + "%";
	$('.badge.bg-red')[1].innerText = (logLoginE * 100).toFixed() + "%";
	
	$($('.progress-bar.progress-bar-success')[2]).css('width', (analysisPos * 100).toFixed() + "%");
	$('.badge.bg-green')[2].innerText = (analysisPos * 100).toFixed() + "%";
	$('.badge.bg-red')[2].innerText = (loginAnalysisE * 100).toFixed() + "%";
	
	$($('.progress-bar.progress-bar-success')[3]).css('width', (reservePos * 100).toFixed() + "%");
	$('.badge.bg-green')[3].innerText = (reservePos * 100).toFixed() + "%";
	$('.badge.bg-red')[3].innerText = (analysisReserveE * 100).toFixed() + "%";
	
	$($('.progress-bar.progress-bar-primary')[0]).css('width', (abdbPer1 * 100).toFixed() + "%");
	$($('.progress-bar.progress-bar-primary')[1]).css('width', (abdbPer2 * 100).toFixed() + "%");
	$($('.progress-bar.progress-bar-primary')[2]).css('width', (abdbPer3 * 100).toFixed() + "%");
	$($('.progress-bar.progress-bar-primary')[3]).css('width', (abdbPer4 * 100).toFixed() + "%");
	$($('.progress-bar.progress-bar-primary')[4]).css('width', (abdbPer5 * 100).toFixed() + "%");
	
	$('.badge.bg-blue')[0].innerText = (abdbPer1 * 100).toFixed() + "%";
	$('.badge.bg-blue')[1].innerText = (abdbPer2 * 100).toFixed() + "%";
	$('.badge.bg-blue')[2].innerText = (abdbPer3 * 100).toFixed() + "%";
	$('.badge.bg-blue')[3].innerText = (abdbPer4 * 100).toFixed() + "%";
	$('.badge.bg-blue')[4].innerText = (abdbPer5 * 100).toFixed() + "%";
	
	$($('.progress-bar.progress-bar-yellow')[0]).css('width', (lpbuPer1 * 100).toFixed() + "%");
	$($('.progress-bar.progress-bar-yellow')[1]).css('width', (lpbuPer2 * 100).toFixed() + "%");
	$($('.progress-bar.progress-bar-yellow')[2]).css('width', (lpbuPer3 * 100).toFixed() + "%");
	// $($('.progress-bar.progress-bar-yellow')[3]).css('width', (abdbPer1 * 100).toFixed() + "%");
	// $($('.progress-bar.progress-bar-yellow')[4]).css('width', (abdbPer1 * 100).toFixed() + "%");

	$('.badge.bg-yellow')[0].innerText = (lpbuPer1 * 100).toFixed() + "%";
	$('.badge.bg-yellow')[1].innerText = (lpbuPer2 * 100).toFixed() + "%";
	$('.badge.bg-yellow')[2].innerText = (lpbuPer3 * 100).toFixed() + "%";
</script>
</html>