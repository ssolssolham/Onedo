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
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">분석 서비스 이용통계</h3>
          </div>
          <!-- 들어가야 할 내용 : 일일,월별,연별 이용통계
                 우선순위 : 일일 
             -->
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example2"
              class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>순번</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성날짜</th>
                  <th>게시여부</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>신상품 출시에 대한 공지</td>
                  <td>박호준</td>
                  <td>11.28</td>
                  <td>X</td>
                </tr>
              </tfoot>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Striped Full Width Table</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body no-padding">
            <table class="table table-striped">
              <tr>
                <th style="width: 10px">#</th>
                <th>Task</th>
                <th>Progress</th>
                <th style="width: 40px">Label</th>
              </tr>
              <tr>
                <td>1.</td>
                <td>Update software</td>
                <td>
                  <div class="progress progress-xs">
                    <div class="progress-bar progress-bar-danger"
                      style="width: 55%"></div>
                  </div>
                </td>
                <td><span class="badge bg-red">55%</span></td>
              </tr>
              <tr>
                <td>2.</td>
                <td>Clean database</td>
                <td>
                  <div class="progress progress-xs">
                    <div class="progress-bar progress-bar-yellow"
                      style="width: 70%"></div>
                  </div>
                </td>
                <td><span class="badge bg-yellow">70%</span></td>
              </tr>
              <tr>
                <td>3.</td>
                <td>Cron job running</td>
                <td>
                  <div
                    class="progress progress-xs progress-striped active">
                    <div class="progress-bar progress-bar-primary"
                      style="width: 30%"></div>
                  </div>
                </td>
                <td><span class="badge bg-light-blue">30%</span></td>
              </tr>
              <tr>
                <td>4.</td>
                <td>Fix and squish bugs</td>
                <td>
                  <div
                    class="progress progress-xs progress-striped active">
                    <div class="progress-bar progress-bar-success"
                      style="width: 90%"></div>
                  </div>
                </td>
                <td><span class="badge bg-green">90%</span></td>
              </tr>
            </table>
          </div>
          <!-- /.box-body -->
        </div>

        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Quick Example</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form">
            <div class="box-body">
              <div class="form-group">
                <label for="exampleInputEmail1">Email address</label> <input
                  type="email" class="form-control"
                  id="exampleInputEmail1" placeholder="Enter email">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Password</label> <input
                  type="password" class="form-control"
                  id="exampleInputPassword1" placeholder="Password">
              </div>
              <div class="form-group">
                <label for="exampleInputFile">File input</label> <input
                  type="file" id="exampleInputFile">

                <p class="help-block">Example block-level help text
                  here.</p>
              </div>
              <div class="checkbox">
                <label> <input type="checkbox"> Check me
                  out
                </label>
              </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>

        <!-- 분석서비스 통계 -->
        <canvas id="canvas" width="795" height="397"
          class="chartjs-render-monitor"
          style="display: block; height: 318px; width: 636px;"></canvas>

        <!-- 로그파일 기반 사용자 수 통계 -->

        <!--  -->


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
							backgroundColor : color(window.chartColors.red)
									.alpha(0.2).rgbString(),
							borderColor : window.chartColors.red,
							data : [ randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor() ]
						},
						{
							type : 'line',
							label : 'Dataset 2',
							backgroundColor : color(window.chartColors.blue)
									.alpha(0.2).rgbString(),
							borderColor : window.chartColors.blue,
							data : [ randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor() ]
						},
						{
							type : 'bar',
							label : 'Dataset 3',
							backgroundColor : color(window.chartColors.green)
									.alpha(0.2).rgbString(),
							borderColor : window.chartColors.green,
							data : [ randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor(),
									randomScalingFactor() ]
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
										ctx.fillStyle = 'rgb(0, 0, 0)';

										var fontSize = 16;
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
				window.myBar = new Chart(ctx, {
					type : 'bar',
					data : barChartData,
					options : {
						responsive : true,
						title : {
							display : true,
							text : 'Chart.js Combo Bar Line Chart'
						},
					}
				});
			};
		</script>
</body>
</html>