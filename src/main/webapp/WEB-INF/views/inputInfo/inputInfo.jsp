<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>이용자 정보 입력</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  
	<!-- header include 시작 -->
    <jsp:include page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp"/>
    <!-- header include 종료 -->
</head>
<body class="animsition bg1-pattern">
  
  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/header.jsp"/>
  <!-- header include 종료 -->
  
  <!-- asideMenu include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/asideMenu.jsp"/>
  <!-- asideMenu include 종료 -->

  <!-- 로그인 모달 include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/modal/loginModal.jsp"/>
  <!-- 로그인 모달 include 종료 -->

  <!-- 회원가입 모달 include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/modal/registModal.jsp"/>
  <!-- 회원가입 모달 include 종료 -->

<section id="analysis_section">
	<div class="container">
		<div> 
			<span style="color: white; background-color: #27b2a5; width: 100%; border-radius: 4px; padding: 5px 8px; font-size: 24px;">필수</span>&nbsp;&nbsp;
			<span style="color: #27b2a5; font-size:24px;" >금리와 한도예측을 위한 질문</span>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-sm-8">
				<div class="card">
					<div class="card-body">
						<div style="font-size: 0.8em; color: darkgray;">금리산출을 위한 질문</div>
						<div><b>필요하신 대출금액은 얼마인가요?</b><span style="color: orangered;">&nbsp;*</span></div>
						<div class="form-group" style="width: 100%; font-size: 1.2em;">
							<input style="border: 0; width: 80%; text-align: right; display: inline-block;" type="text" /> <span style="width: 10%;">만원</span>
							
						</div>
						<div>
							<button class="analysisBtn">300만</button>
							<button class="analysisBtn">500만</button>
							<button class="analysisBtn">1000만</button>
							<button class="analysisBtn">3000만</button>
							<button class="analysisBtn">5000만</button>
							<button class="analysisBtn">1억</button>
						</div>
						<br>
						<div style="width: 100%; height: 3px; background-color: #27b2a5;">&nbsp;</div>
						<br>
						<div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
						<div><b>신용등급을 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
						<select class="form-control" style="display: inline-block;">
							<option>1등급</option>
							<option>2등급</option>
							<option>3등급</option>
							<option>4등급</option>
							<option>5등급</option>
							<option>6등급</option>
							<option>7등급</option>
							<option>8등급</option>
							<option>9등급</option>
						</select>
						<br>
						<br>
						<div style="width: 100%; height: 3px; background-color: #27b2a5;">&nbsp;</div>
						<br>
						<div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
						<div><b>현재 직업을 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
						<select class="form-control" style="display: inline-block;">
							<option>무직</option>
							<option>프로그래머</option>
							<option>경찰</option>
							<option>공무원</option>
							<option>회사원</option>
						</select>
						<br>
						<br>
						<div style="width: 100%; height: 3px; background-color: #27b2a5;">&nbsp;</div>
						<br>
						<div style="font-size: 0.8em; color: darkgray;">한도산출을 위한 질문</div>
						<div><b>연 소득은 얼마인가요?</b><span style="color: orangered;">&nbsp;*</span></div>
						<div class="form-group" style="width: 100%; font-size: 1.2em;">
							<input style="border: 0; width: 80%; text-align: right; display: inline-block;" type="text" /> <span style="width: 10%;">만원</span>
							<div style="width: 100%; height: 3px; background-color: #27b2a5;">&nbsp;</div>
						</div>
						<div style="float: right;">
							<button class="analysisBtn">300만</button>
							<button class="analysisBtn">500만</button>
							<button class="analysisBtn">1000만</button>
							<button class="analysisBtn">3000만</button>
							<button class="analysisBtn">5000만</button>
							<button class="analysisBtn">1억</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card" style="border-bottom-left-radius: 0; border-bottom-right-radius: 0;">
					
					<div class="card-body" style="padding-top: 10px; padding-bottom: 10px; font-size: 0.8em;">
					<b style="color: darkgray;">입력 항목</b>
					</div>
				</div>
				<div class="card" style="border-radius: 0; border-top: 0;">
					
					<div class="card-body" style="padding-top: 10px; padding-bottom: 10px; font-size: 0.8em;">
					<div style="color: darkgrey;"><b>대출 희망금액</b></div>
						<div style="color: lightgrey; text-align: right;"><b>??만원</b></div>
						<div style="color: darkgrey;"><b>직업</b></div>
						<div style="color: lightgrey; text-align: right;"><b>무직</b></div>
						<div style="color: darkgrey;"><b>신용등급</b></div>
						<div style="color: lightgrey; text-align: right;"><b>1등급</b></div>
						<div style="color: darkgrey;"><b>연 소득</b></div>
						<div style="color: lightgrey; text-align: right;"><b>??만원</b></div>
					</div>
				</div>
				<div class="card">
					<button class="loanResultBtn" onclick="location.href='/loanResult/'"><b>결과보기</b></button>
				</div>
			</div>
		</div>
	</div>
</section>
	
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
