<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>

<!-- HEAD -->
<jsp:include
  page="${pageContext.request.contextPath}/WEB-INF/views/admin/include/head.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
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
          사용자 통계 조회 <small>분석 서비스, 대출 상담 요청, 접속자수, 부동산 순위 조회, 대출
            상품 순위 조회</small>
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

        <!-- 분석서비스 통계 -->
        <canvas id="canvas" width="795" height="150"
          class="chartjs-render-monitor"
          style="display: block; height: 318px; width: 636px;"></canvas>

        <!-- 로그파일 기반 사용자 수 통계 -->

        <!--  -->
        <canvas id="canvas2" width="350" height="150"
          class="chartjs-render-monitor"
          style="display: block; height: 318px; width: 636px;"></canvas>
          
        <canvas id="canvas3" width="350" height="150"
          class="chartjs-render-monitor"
          style="display: block; height: 318px; width: 636px;"></canvas>

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

  <script type="text/javascript">
			var color = Chart.helpers.color;
			var barChartData = {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June', 'July' ],
				datasets : [
						{
							type : 'bar',
							label : 'Dataset 1',
							backgroundColor : '#123456',
							borderColor : '#033321',
							data : [ 52,
									255,
									111,
									235,
									432,
									222,
									111 ]
						},
						{
							type : 'line',
							label : 'Dataset 2',
							backgroundColor : '#110000',
							borderColor : '#335511',
							data : [ 52,
									255,
									111,
									235,
									432,
									222,
									111 ]
						},
						{
							type : 'bar',
							label : 'Dataset 3',
							backgroundColor : '#FF0000',
							borderColor : '#01DF74',
							data : [ 52,
									255,
									111,
									235,
									432,
									222,
									111 ]
						} ]
			};
			
			var barChartData2 = {
					labels : [ '접속 후 로그인', '로그인 후 분석', '분석 후 상담예약'],
					datasets : [
							{
								type : 'line',
								label : 'Dataset 2',
								backgroundColor : '#ff5500',
								borderColor : '#335511',
								data : [ 89,
										75,
										50]
							} ]
				};

			var barChartData3 = {
					labels : [ '접속 후 로그인', '로그인 후 분석', '분석 후 상담예약'],
					datasets : [
							{
								type : 'line',
								label : 'Dataset 2',
								backgroundColor : '#ff5500',
								borderColor : '#335511',
								data : [ 89,
										75,
										50]
							} ]
				};
			
			var barChartData4 = {
					labels : [ '접속 후 로그인', '로그인 후 분석', '분석 후 상담예약'],
					datasets : [
							{
								type : 'line',
								label : 'Dataset 2',
								backgroundColor : '#ff5500',
								borderColor : '#335511',
								data : [ 89,
										75,
										50]
							} ]
				};
			// Define a plugin to provide data labels
			Chart.plugins.register({
				afterDatasetsDraw : function(chart) {
					var ctx = chart.ctx;

					chart.data.datasets.forEach(function(dataset, i) {
						var meta = chart.getDatasetMeta(i);
						if (!meta.hidden) {
							meta.data
									.forEach(function(element, index) {
										// Draw the text in black, with the specified font
										
										// 텍스트 색깔
										ctx.fillStyle = 'rgb(100, 200, 0)';

										var fontSize = 25;
										var fontStyle = 'normal';
										var fontFamily = 'Helvetica Neue';
										ctx.font = Chart.helpers
												.fontString(fontSize,
														fontStyle, fontFamily);

										// Just naively convert to string for now
										var dataString = dataset.data[index]
												.toString();

										// Make sure alignment settings are correct
										ctx.textAlign = 'center';
										ctx.textBaseline = 'middle';

										var padding = 5;
										var position = element
												.tooltipPosition();
										ctx.fillText(dataString, position.x,
												position.y - (fontSize / 2)
														- padding);
									});
						}
					});
				}
			});

			window.onload = function() {
				var ctx = document.getElementById('canvas').getContext('2d');
				var ctx2 = document.getElementById('canvas2').getContext('2d');
				var ctx3 = document.getElementById('canvas3').getContext('2d');
				window.myBar = new Chart(ctx, {
					type : 'line',
					data : barChartData,
					options : {
						responsive : true,
						title : {
							display : true,
							text : 'Chart.js Combo Bar Line Chart'
						},
						scales: {
			                yAxes: [{
			                    ticks: {
			                        min: 0,
			                        max: 100,
			                        stepSize:20,
			                        beginAtZero: true
			                    }
			                }]
			            }
					}
		            
				});
				
				window.myBar2 = new Chart(ctx2, {
					type : 'line',
					data : barChartData2,
					options : {
						responsive : true,
						title : {
							display : true,
							text : 'Chart.js Combo Bar Line Chart'
						},
						scales: {
			                yAxes: [{
			                    ticks: {
			                        min: 0,
			                        max: 100,
			                        stepSize:20,
			                        beginAtZero: true
			                    }
			                }]
			            }
					}
		            
				});
				
				window.myBar3 = new Chart(ctx3, {
					type : 'line',
					data : barChartData3,
					options : {
						responsive : true,
						title : {
							display : true,
							text : 'Chart.js Combo Bar Line Chart'
						},
						scales: {
			                yAxes: [{
			                    ticks: {
			                        min: 0,
			                        max: 100,
			                        stepSize:20,
			                        beginAtZero: true
			                    }
			                }]
			            }
					}
		            
				});
			};
		</script>
</body>
</html>