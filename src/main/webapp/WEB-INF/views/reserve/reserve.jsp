<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
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

	<!-- 상담 예약 페이지 -->
	<section class="reserve">
		<div class="container" >
			<div class="card">
				<div class="card-body menu-title-div" >
						<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">상담예약</h3>
				</div>
				<div class="card-body">
					<div class="txtArea" id="divAgreeContent">
						<p class="">고객님의 이메일상담을 처리하기 위해서는 개인정보보호법 제15조 1항 및 제24조 1항에 따라 아래의 내용에 대하여 고객님의 동의가 필요합니다.</p>
						<ul>
							<li><strong>1. 개인정보의 수집,이용목적</strong><br>
								서비스 이용에 따른 상담업무 처리를 위한 본인식별, 본인의사확인 및 상담결과 통보</li><br>
							<li><strong>2.수집하는 개인정보의 항목</strong><br>
								성명, 생년월일, 성별, e-mail 주소, 전화번호, 이메일 질문내용</li><br>
							<li><strong>3. 개인정보의 보유 및 이용 기간</strong><br>
								위 개인정보는 수집·이용에 관한 동의일로부터 처리 종료일까지 위 이용목적을 위하여 보유·이용됩니다.<br>
								단,(금융)거래 종료일 후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 및 당행의 리스크 관리업무만을 위하여 보유·이용됩니다.</li><br>
							<li><strong>4. 고객님은 개인정보 수집 및 이용을 거부할 권리가 있으며 권리행사 시 상담이 거부될 수 있습니다.</strong></li><br>
						</ul>
					</div>
					<table class="table" style="font-size: 0.9em;">
						<tr>
							<td style="width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;">
								<b>업무선택</b>
							</td>
							<td style="width: 75%;">
								<select class="form-control form-control-sm" style="width: 50%;">
									<option>대출</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>성명</b></td>
							<td style="width: 75%;">
								<input style="text-align: center; width: 50%;" class="form-control form-control-sm" type="text"/>
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>생년월일</b></td>
							<td style="width: 75%;">
								<div class="wrap-inputdate pos-relative  bo-rad-2" style="width: 50%;">
									<input style="height: 31px;" class="form-control my-calendar bo-rad-2 sizefull p-l-20" type="text" name="date">
									<i style="padding-left: 20px;" class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18" aria-hidden="true"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>연락처</b></td>
							<td style="width: 75%;">
								<select style="text-align: center; width: 10%; display: inline" class="form-control form-control-sm">
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>019</option>
								</select>
								&nbsp;&nbsp;-&nbsp;&nbsp;
								<input style="text-align: center; width: 20%; display: inline" class="form-control form-control-sm" type="text"/>
								&nbsp;&nbsp;-&nbsp;&nbsp;
								<input style="text-align: center; width: 20%; display: inline" class="form-control form-control-sm" type="text"/>
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>상담예약일시</b></td>
							<td style="width: 75%;">
								<select style="text-align: center; display: inline-block; width: 50%;" class="form-control form-control-sm">
									<option>시간 선택</option>
									<option>오전 10:00 - 10:30</option>
									<option>오전 10:30 - 11:00</option>
									<option>오전 11:00 - 11:30</option>
									<option>오전 11:30 - 12:00</option>
									<option>오후 14:00 - 14:30</option>
									<option>오후 14:30 - 15:00</option>
									<option>오후 15:00 - 15:30</option>
									<option>오후 15:30 - 16:00</option>
									<option>오후 16:00 - 16:30</option>
									<option>오후 16:30 - 17:00</option>
									<option>오후 17:00 - 17:30</option>
									<option>오후 17:30 - 18:00</option>
								</select>
							</td>
						</tr>
					</table>
					<div style="font-size: 0.8em; color: darkgray;">개인정보 수집 및 이용에 동의하셔야 상담이 가능합니다.</div>
					<div style="font-size: 0.8em; color: darkgray;"><span>개인정보 수집 및 이용 동의</span> <input  type="checkbox" /></div>
					<br />
					<div style="display: flex; align-items: center; justify-content: center;">
						<!-- 상담 예약 신청, 취소 버튼 -->
						<input type="submit" id="consultReserveBtn" value="신청">
						&nbsp;&nbsp;
						<input type="button" id="consultCancelBtn" value="취소">
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
