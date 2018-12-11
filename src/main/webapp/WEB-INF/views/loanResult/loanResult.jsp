<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>추천 대출 상품 확인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="${pageContext.request.contextPath}/resources/dist/js/Chart.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}

#modal-content {
	position: relative;
	display: flex;
	flex-direction: column;
	width: 100%;
	pointer-events: auto;
	background-color: white;
	background-clip: padding-box;
	border: 1px solid;
	outline: 0;
}

.calculatorTable {
	border-collapse: separate;
	border-spacing: 2px;
	border: none;
	color: #000;
	background-color: white;
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 5%;
}

.calculatorTable th {
	padding: 15px;
	background: url("/resoureces/images/monoton.gif");
	border: none;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	text-shadow: 0 1px #FFF;
	height: 30px;
}

.calculatorTable td {
	padding: 15px;
	border: none;
	text-align: left;
	vertical-align: baseline;
	height: 30px;
}

.calculatorTable>tbody>tr>td>input[type=text] {
	border-radius: 2px;
	text-align: right;
}

.calculatorTable>tbody>tr>td>input[type=radio] {
	margin-right: 1%;
	margin-left: 3%;
}

#table {
	background-color: white;
	background-clip: padding-box;
	color: black;
	font-size: 16px;
}

.ajaxTL {
	font-size: 20px;
	font-family: a드림고딕4;
}

#canvasDiv>button {
	
}

/* 대출상품 상세보기 모달 */
.alert_1cYf2 {
	position: absolute;
	left: calc(50% - 250px);
	top: calc(50% - 200px);
	z-index: 1;
	display: none;
	width: 500px;
	height: 400px;
	background: #fff;
	-webkit-box-shadow: 0 17px 50px 0 rgba(0, 0, 0, .19);
	box-shadow: 0 17px 50px 0 rgba(0, 0, 0, .19);
	overflow: hidden
}

.title_2rL02 {
	position: relative;
	display: block;
	width: 100%;
	padding: 0 20px;
	border-bottom: 2px solid #f5f5f5;
}

.title_2rL02>h5 {
	display: block;
	width: 100%;
	padding: 0 40px 0 0;
	color: #0b0c0c;
	font-size: 16px;
	text-overflow: ellipsis;
	line-height: 48px;
	white-space: nowrap;
	overflow: hidden;
}

.title_2rL02>a {
	position: absolute;
	right: 0;
	top: 0;
	z-index: 1;
	display: block;
	padding: 0 20px;
	color: #acacac;
	font-size: 14px;
	text-decoration: underline;
	line-height: 48px;
	cursor: pointer;
}

.scrollable_3JZtx {
	display: block;
	width: 100%;
	height: calc(100% - 50px);
	overflow-y: scroll;
}

.content_25dID {
	position: relative;
	display: block;
	width: 100%;
	padding: 16px 20px;
}

.wrap_jF18n {
	border: 2px solid #f5f5f5;
}

.title_9MPwh {
	padding: 8px 16px;
	background: #fbfbfb;
	font-size: 14px;
	color: #2b2b2b;
}

.description_3MBfN {
	padding: 8px 16px;
	font-size: 14px;
	color: #434444;
	line-height: 24px;
}

.infoButton_1Fb6y {
	width: 170px;
	height: 23px;
	background: #27b2a5;
	color: white;
	border-radius: 2px;
	font-size: 14px;
	vertical-align: inherit
}

.infoButton_1Fb6y:hover {
	width: 170px;
	height: 23px;
	background: #268f84;
	color: white;
	border-radius: 2px;
	font-size: 14px;
	vertical-align: inherit
}
/* 상담 모달  */
#divAgreeContent {
	overflow-y: scroll;
	max-height: 150px;
}
</style>

<!-- header include 시작 -->
<jsp:include
	page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp" />
<!-- header include 종료 -->
</head>
<body class="animsition bg1-pattern">

	<!-- header include 시작 -->
	<jsp:include
		page="${pageContext.request.contextPath}/resources/includes/header.jsp" />
	<!-- header include 종료 -->


	<section class="section-review">
		<div class="container" style="max-width: 1500px;">

			<div class="card">
				<div class="card-body menu-title-div">
					<img
						src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
						style="width: 35px;">&nbsp;&nbsp;
					<h3
						style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">대출
						상품 확인</h3>
				</div>

				<div class="card-body margin-20">
					<span
						style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;
					<span style="font: bold 20px a드림고딕4; font-size: 18px;"> 회원님의
						정보와 일치하는 대출 상품을 확인하시고, 상담 예약을 진행하세요!</span> <br>


					<!-- 상품 리스트 출력  -->
					<div class="row" style="margin-top: 20px;">
						<div class="col-sm-8">
							<span
								style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;
							<span style="font: bold 20px a드림고딕4; font-size: 18px;"> 대출
								상품 리스트</span> <br> <br>
							<!--상품목록 -->
							<c:choose>
								<c:when test="${loanlist != null}">
									<c:forEach items="${loanlist}" var="loan">
										<div style="width: 100%;">
											<div class="ziehharmonika">
												<h3 class="fs-16 dreamGothic">${loan.get('LOAN_NAME')}
													<span
														style="font-size: 14px; font-weight: bold; color: #27b2a5;">업데이트
														날짜 : ${loan.get('UPDATE_DATE')}</span>
												</h3>
												<div>

													<c:if test="${loan.get('LOANCOMP_NAME') == '하나은행'}">
														<img
															src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
															style="width: 50px; height: 50px; border: 1px solid #cdcdcd">&nbsp;&nbsp;
                  <span
															style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">KEB
															하나은행</span>
													</c:if>

													<c:if test="${loan.get('LOANCOMP_NAME') == '하나저축은행'}">
														<img
															src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
															style="width: 50px; height: 50px; border: 1px solid #cdcdcd">&nbsp;&nbsp;
                  <span
															style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">하나저축은행</span>
													</c:if>

													<c:if test="${loan.get('LOANCOMP_NAME') == '하나캐피탈'}">
														<img
															src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
															style="width: 50px; height: 50px; border: 1px solid #cdcdcd">&nbsp;&nbsp;
                  <span
															style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">하나캐피탈</span>
													</c:if>

													<table>
														<colgroup>
															<col width="20%">
															<col width="80%">
														</colgroup>
														<tbody>
															<tr>
																<td class="fs-16 dreamGothic">1. 상품명</td>
																<td class="fs-16 dreamGothic"><c:out
																		value="${loan.get('LOAN_NAME')}" /></td>
															</tr>
															<tr>
																<td class="fs-16 dreamGothic">2. 상품설명</td>
																<td class="fs-16 dreamGothic"><c:out
																		value="${loan.get('LOAN_CONTENT')}" /></td>
															</tr>
															<tr>
																<td class="fs-16 dreamGothic">3. 예상연금리</td>
																<td class="fs-16 dreamGothic">평균 + 3.55%</td>
															</tr>
															<tr>
																<td class="fs-16 dreamGothic">4. 가입대상</td>
																<td class="fs-16 dreamGothic"><c:out
																		value="${loan.get('TARGET_DESCRIPTION')}" /> <c:if
																		test="${loan.get('TARGET_DETAIL1') != null}">
																		<button class="infoButton_1Fb6y">대출 상세조건 확인하기</button>
																	</c:if></td>
															</tr>
															<tr>
																<td class="fs-16 dreamGothic">5. 대출한도</td>
																<td class="fs-16 dreamGothic"><c:out
																		value="${loan.get('CREDITLINE_DESC')}" /></td>
															</tr>
															<tr>
																<td class="fs-16 dreamGothic">6. 대출상세보기</td>
																<td class="fs-16 dreamGothic"><button
																		class="infoButton_1Fb6y"
																		onclick="location.href='<c:out value="${loan.get('DETAIL_URL')}" />'">대출
																		상세 페이지로 이동</button></td>
															</tr>
														</tbody>
													</table>
													<br>
													<button type="button" class="float-r calculate" style="font-family: a드림고딕4;"
														id="calculateBtn" value="${loan.get('LOAN_ID')}">
														금리계산기</button>
													<span class="float-r">&nbsp;&nbsp;</span>
													<button type="button" class="float-r reserve" style="font-family: a드림고딕4;"
														id="loanModalBtn" data-toggle="modal"
														data-target="#loanModal1">대출상담 예약</button>
												</div>
											</div>
										</div>
										<div class="alert_1cYf2">
											<div class="title_2rL02">
												<h5>${loan.get('LOAN_NAME')}가입조건</h5>
												<a>닫기</a>
											</div>
											<div class="scrollable_3JZtx">
												<div class="content_25dlD">
													<div class="wrap_jF18n">
														<h2 class="title_9MPwh">가입조건(상세)</h2>
														<c:if test="${loan.get('TARGET_DETAIL1') != null}">
															<p class="description_3MBfN">${loan.get('TARGET_DETAIL1')}</p>
														</c:if>
														<c:if test="${loan.get('TARGET_DETAIL2') != null}">
															<p class="description_3MBfN">${loan.get('TARGET_DETAIL2')}</p>
														</c:if>
														<c:if test="${loan.get('TARGET_DETAIL3') != null}">
															<p class="description_3MBfN">${loan.get('TARGET_DETAIL3')}</p>
														</c:if>
													</div>
												</div>
											</div>
										</div>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="container">
										<h3>
											죄송합니다. 현재 입력해주신 정보로 조회되는 상품이 없습니다. <span
												style="font-weight: bold; color: #27b2a5;">바로 상담원 연결</span>
										</h3>
										<button type="button" class="float-r" id="loanModalBtn"
											data-toggle="modal" data-target="#loanModal1">상담 예약</button>
									</div>
								</c:otherwise>
							</c:choose>

							<!--상품목록 끝-->
						</div>
						<!-- 금리 계산기 부분 -->
						<div class="col-sm-4">
							<span
								style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;
							<span style="font: bold 20px a드림고딕4; font-size: 18px;">금리계산기(대출이율
								계산)</span> <br> <br>
							<div id="calculator" class="dis-none">
								<!--  요기에 계산기가 들어와야긋네 -->
							</div>

						</div>
					</div>
					<br><br>
					<div class="row">
						<div class="col-sm-12" style="margin-bottom: 30px;">
							<div id="canvasDiv" class="dis-none" style="width: 100%; background-color: white;">
								<button style="width: 260px; font-family: a드림고딕4;" type="button" id="graphView">월 상환금액 그래프로 보기</button>
								<button style="width: 260px; font-family: a드림고딕4;" type="button" id="tableView">월 상환금액 표로 보기</button>
								<br><br><br>
								<div>
									<canvas id="canvas" style="display: block;"></canvas>
									<table id="table" style="display: none; width: 100%;">
										<colgroup>
											<col width="14%">
											<col width="14%">
											<col width="15%">
											<col width="14%">
											<col width="15%">
											<col width="14%">
											<col width="14%">
										</colgroup>
										<thead>
											<tr>
												<th style="font-family: a드림고딕4; text-align: center;">납입 차수</th>
												<th style="font-family: a드림고딕4; text-align: center;">매월 납입액</th>
												<th style="font-family: a드림고딕4; text-align: center;">월 납입원금</th>
												<th style="font-family: a드림고딕4; text-align: center;">월 납입이자</th>
												<th style="font-family: a드림고딕4; text-align: center;">납입원금 누계</th>
												<th style="font-family: a드림고딕4; text-align: center;">납입이자 누계</th>
												<th style="font-family: a드림고딕4; text-align: center;">대출 잔액</th>
											</tr>
										</thead>
										<tbody id="cell">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 금리 계산기 부분  -->
	<div id="modal-content" style="display: none;">
		<div class="modal" id="calculatorModal">
			<div class="modal-header">
				<h5 class="modal-title" style="color: gray;">
					<b>대출이율 계산하기</b>
				</h5>
				<button type="button" class="close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-footer"></div>

			<div id="canvasDiv"
				style="width: 100%; display: none; background-color: white; margin-bottom: 30px;">
				<canvas id="canvas" style="display: block;">
                        </canvas>
				<table id="table" style="display: none; margin-bottom: 30px;">
					<thead>
						<tr>
							<th>납입 차수</th>
							<th>매월 납입액</th>
							<th>월 납입원금</th>
							<th>월 납입이자</th>
							<th>납입원금 누계</th>
							<th>납입이자 누계</th>
							<th>대출 잔액</th>
						</tr>
					</thead>
					<tbody id="cell">
					</tbody>
				</table>
				<button id="tableView">월 상환금액 표로 보기</button>
				<button id="graphView">월 상환금액 그래프로 보기</button>
			</div>
		</div>
	</div>


	<div class="modal fade" id="loanModal1" tabindex="-1" role="dialog"
		aria-labelledby="loanModal1Label" aria-hidden="true">
		<div class="modal-dialog" role="document" style="max-width: 700px;">
			<div class="modal-content">
				<div class="modal-header" style="justify-content: center;">
					<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">
					<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">상담예약</h3>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="txtArea" id="divAgreeContent">
								<p class="fs-16 dreamGothic">고객님의 상담을 처리하기 위해서는 개인정보보호법 제15조 1항 및 제24조 1항에
									따라 아래의 내용에 대하여 고객님의 동의가 필요합니다.</p>
								<ul>
									<li class="fs-12 dreamGothic"><strong class="fs-14 dreamGothic">1. 개인정보의 수집,이용목적</strong><br> 서비스 이용에 따른
										상담업무 처리를 위한 본인식별, 본인의사확인 및 상담결과 통보</li>
									<br>
									<li class="fs-12 dreamGothic"><strong class="fs-14 dreamGothic">2.수집하는 개인정보의 항목</strong><br> 성명, 생년월일,
										성별, e-mail 주소, 전화번호, 이메일 질문내용</li>
									<br>
									<li class="fs-12 dreamGothic"><strong class="fs-14 dreamGothic">3. 개인정보의 보유 및 이용 기간</strong><br> 위 개인정보는
										수집·이용에 관한 동의일로부터 처리 종료일까지 위 이용목적을 위하여 보유·이용됩니다.<br>
										단,(금융)거래 종료일 후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 및 당행의 리스크
										관리업무만을 위하여 보유·이용됩니다.</li>
									<br>
									<li class="fs-12 dreamGothic"><strong class="fs-14 dreamGothic">4. 고객님은 개인정보 수집 및 이용을 거부할 권리가 있으며
											권리행사 시 상담이 거부될 수 있습니다.</strong></li>
									<br>
								</ul>
							</div>

							<div style="color: darkgray; display: none;"
								id="agreeTab">개인정보 수집 및 이용에 동의하셔야 상담이 가능합니다.</div>

							<form action="/loan/reserveLoan" method="post" id="reserveForm"
								onsubmit="return checkAgree()">
								<table class="table" id="qnaTable" style="font-size: 0.9em;">
									<tr>
										<td colspan="2">
											<div style="height: 24px; color: red;">
												<span class="fs-16 dreamGothic">개인정보 수집 및 이용 동의 (필수)</span> <input class="fs-16" type="checkbox"
												id="checkAgree" />
											</div>
										</td>
									</tr>
									<tr>
										<td
											style="font-size: 18px; font-family: a드림고딕4; width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;">
											<b>업무선택</b>
										</td>

										<td style="width: 75%;"><select
											class="form-control form-control-sm" style="height: 30px; font-size: 16px; width: 50%;">
												<option>대출</option>
										</select></td>
									</tr>

									<tr>
										<td
											style="font-size: 18px; font-family: a드림고딕4; width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>성명</b></td>
										<td style="width: 75%;"><input
											style="text-align: center; width: 50%; height: 30px; font-size: 16px;"
											name="username" class="form-control form-control-sm"
											type="text"
											value='<sec:authentication property="principal.member.userName"/>'
											readonly /></td>
									</tr>

									<tr>
										<td
											style="font-size: 18px; font-family: a드림고딕4; width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>생년월일</b></td>
										<td style="width: 75%;">
											<div class="wrap-inputdate pos-relative  bo-rad-2"
												style="width: 50%;">
												<input style="height: 31px;"
													class="form-control my-calendar bo-rad-2 sizefull p-l-20"
													id="birthdate" type="text" name="birthdate"> <i
													style="padding-left: 20px;"
													class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18"
													aria-hidden="true"></i>
											</div>
										</td>
									</tr>

									<tr>
										<td
											style=" font-size: 18px; font-family: a드림고딕4; width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>연락처</b></td>
										<td style="width: 50%;"><select id="numSelector1"
											style="text-align: center; width: 20%; display: inline; height: 30px; font-size: 16px;" 
											class="form-control form-control-sm">
												<option>010</option>
												<option>011</option>
												<option>017</option>
												<option>019</option>
										</select> &nbsp;&nbsp;-&nbsp;&nbsp; <input id="numSelector2"
											style="text-align: center; width: 20%; display: inline; height: 30px; font-size: 16px;"
											maxlength="4" class="form-control form-control-sm"
											type="text" /> &nbsp;&nbsp;-&nbsp;&nbsp; <input
											id="numSelector3"
											style="text-align: center; width: 20%; display: inline; height: 30px; font-size: 16px;"
											maxlength="4" class="form-control form-control-sm"
											type="text" /></td>
									</tr>

									<tr>
										<td
											style=" font-size: 18px; font-family: a드림고딕4; width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>상담예약일시</b></td>
										<td style="width: 50%;"><select id="reserveTimeSelector"
											style="text-align: center; display: inline-block; width: 45%; height: 30px; font-size: 16px;"
											class="form-control form-control-sm">
												<option>시간 선택</option>
												<option value="1">오전 10:00 - 10:30</option>
												<option value="2">오전 10:30 - 11:00</option>
												<option value="3">오전 11:00 - 11:30</option>
												<option value="4">오전 11:30 - 12:00</option>
												<option value="5">오후 14:00 - 14:30</option>
												<option value="6">오후 14:30 - 15:00</option>
												<option value="7">오후 15:00 - 15:30</option>
												<option value="8">오후 15:30 - 16:00</option>
												<option value="9">오후 16:00 - 16:30</option>
												<option value="10">오후 16:30 - 17:00</option>
												<option value="11">오후 17:00 - 17:30</option>
												<option value="12">오후 17:30 - 18:00</option>
										</select></td>
									</tr>

									<tr>
										<td
											style=" font-size: 18px; font-family: a드림고딕4; width: 25%; text-align: center; vertical-align: middle; color: #27b2a5;"><b>상담내용</b></td>
										<td style="width: 75%;">
											<ul>
												<li><span style="font-size: 16px; font-family: a드림고딕;">대출상품</span> <select id="loanSelector"
													style="text-align: center; margin-left: 32px; display: inline-block; width: 30%; text-align: center; height: 30px; font-size: 16px;"
													class="form-control form-control-sm">
														<option>상품선택</option>
														<c:forEach items="${loanlist}" var="loan">
															<option value="${loan.get('LOAN_ID')}">${loan.get('LOAN_NAME')}</option>
														</c:forEach>
												</select></li>
												<br>
												<li><span style="font-size: 16px; font-family: a드림고딕;">대출희망금액</span> <input
													style="text-align: center; display: inline-block; width: 30%; height: 30px; font-size: 16px;"
													name="requestBM" class="form-control form-control-sm"
													type="text" value="${param.requiredMoney}" /><span style="font-size: 16px; font-family: a드림고딕;">&nbsp;원</span></li>
												<br>
												<li><span style="font-size: 16px; font-family: a드림고딕;">자금사용목적</span> <input
													style="text-align: center; display: inline-block; width: 60%; height: 30px; font-size: 16px;"
													name="reasonLoan" class="form-control form-control-sm"
													type="text" /></li>
											</ul>
										</td>
									</tr>
								</table>

								<br>
								<div
									style="display: flex; align-items: center; justify-content: center;">


									<!-- CREATE LPBU를 위한 인자 전달 -->
									<input type="hidden" name="userId"
										value='<sec:authentication property="principal.username"/>'>
									<input type="hidden" name="reserveTime"> <input
										type="hidden" name="loanId"> <input type="hidden"
										name="userPhone"> <input type="hidden"
										name="${_csrf.parameterName}" value="${_csrf.token}" />
									<!-- 상담 예약 신청, 취소 버튼 -->
									<input style="font-family: a드림고딕4;" type="submit" id="consultReserveBtn" value="신청">
									&nbsp;&nbsp;
									<button style="font-family: a드림고딕4;" type="button" data-dismiss="modal" aria-label="Close">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="snackbar"></div>


	<!-- footer include 시작 -->
	<jsp:include
		page="${pageContext.request.contextPath}/resources/includes/footer.jsp" />
	<!-- footer include 종료 -->

	<!-- 금융계산기 생성  -->
	<script>

function checkRepay(){
	$('#cell').children().remove();
	var interestSum = 0;
	var principalSum = 0;
	var body = document.getElementById('cell');  //행을 추가할 테이블
	var amount_of_loans = $('#principal').val() * 10000;

body.innerHTML += "<tr><td colspan='6' style='font-family: a드림고딕4; text-align:center;'>"
              + "상환 개시전"+"</td><td style='font-family: a드림고딕4; text-align:center; color:#27b2a5; font-weight: bold;'>"
              + numberWithCommas(amount_of_loans) +"</td></tr>";
for (var i = 0; i < monthly_installment_plan; i++) {
  interestSum += interests[i];
  principalSum += principals[i];
  body.innerHTML += "<tr><td style='font-family: a드림고딕4; text-align:center;'>"
                  + (i+1) + "개월"+"</td><td style='font-family: a드림고딕4; text-align:center;'>"
                  +numberWithCommas(repayments[i])+"</td><td style=' font-family: a드림고딕4; text-align:center;'>"
                  +numberWithCommas(principals[i])+"</td><td style='font-family: a드림고딕4; text-align:center;'>"
                  +numberWithCommas(interests[i])+"</td><td style=' font-family: a드림고딕4; text-align:center;'>"
                  +numberWithCommas(principalSum) +"</td><td style='; font-family: a드림고딕4; text-align:center;'>"
                  +numberWithCommas(interestSum)+"</td><td style=' font-family: a드림고딕4; text-align:center;'>"
                  +numberWithCommas(balances[i])+"</td></tr>";
}
body.innerHTML += "<tr><td colspan='4' style='font-family: a드림고딕4; text-align:center;'>"
  + "총 납입금액 "+"</td><td colspan='2' style='font-family: a드림고딕4; color:#27b2a5; text-align:center; font-weight: bold;'>"
  +numberWithCommas(interestSum + principalSum)+" 원</td><td></td></tr>";
  	
var chartData = {
    labels: ['2018-01', '2018-02', '2018-03', '2018-04', '2018-05', '2018-06', '2018-07', '2018-08', '2018-09', '2018-10', '2018-11', '2018-12'],
    datasets:
      [
        {
        type: 'bar',
        label: '대출잔액',
        borderColor: window.chartColors.blue,
        borderWidth: 2,
        fill: false,
        data: balances
        }, 
      
        {
        type: 'bar',
        label: '월 상환금액(이자+원금)',
        backgroundColor: window.chartColors.red,
        data: repayments ,
        borderColor: 'white',
        borderWidth: 2
        }, 
        
        {
        type: 'bar',
        label: '월 상환원금',
        backgroundColor: window.chartColors.green,
        data: principals
        },
      
        {
        type: 'bar',
        label: '월 지출이자',
        backgroundColor: window.chartColors.yellow,
        data: interests
        }
      ]
    };

	
      var ctx = document.getElementById('canvas').getContext('2d');
      window.myMixedChart = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
          responsive: true,
          title: {
            display: true,
            text: '금리 계산기를 통해 도출된 상환 계획 한눈에 보기',
            fontSize: 20
          },
          tooltips: {
            mode: 'index',
            intersect: true
          }
        }
      });

  document.getElementById('tableView').addEventListener('click', function(){
    document.getElementById('canvas').style.display = "none";
    document.getElementById('table').style.display = null;
    var target = document.getElementById('snackbar');
    target.innerHTML = '상환 계획표를 테이블로 확인합니다. 단위는 "원" 입니다!';
    toast();
    });
    
  document.getElementById('graphView').addEventListener('click', function(){
    document.getElementById('canvas').style.display = "block";
    document.getElementById('table').style.display = "none";
    var target = document.getElementById('snackbar');
    target.innerHTML = '상환 계획표를 차트로 확인합니다!';
    toast();
    });   
}





var lending_rate; // 이율(입력)
var monthly_installment_plan; // 상환기간(입력)
var holding_period;  //거치기간(입력)
var holding;//보관용 거치기간(입력)
var type_repayment; //상환타입(입력) var radioVal = $('input[name="radioTxt"]:checked').val();
var my_asset; // 내 연소득(입력)
var my_amount_of_loans; // 대출잔액

var repayments = new Array();
var interests = new Array();
var principals = new Array();
var balances = new Array();
var date = new Array();


function setLoanDatas(){
	amount_of_loans = $('#principal').val() * 10000; // 대출원금 (입력)
	lending_rate = $('#rate').val() / 100; // 이율(입력)
	monthly_installment_plan = $('#period').val(); // 상환기간(입력)
	holding_period = $('#term').val();  //거치기간(입력)
	holding = $('#term').val()//보관용 거치기간(입력)
	type_repayment = $('input[name="repay"]:checked').val(); //상환타입(입력) var radioVal = $('input[name="radioTxt"]:checked').val();
	my_asset = $('#salary').val(); // 내 연소득(입력)
	my_amount_of_loans = amount_of_loans; // 대출잔액

	repayments = new Array();
	interests = new Array();
	principals = new Array();
	balances = new Array();
	date = new Array();
}

function addEventCheckRepayment(){
$('#checkRepayment').on('click', function(){
	setLoanDatas();
	
//if문이든 switch문으로 분기 시키기 만기일시상환
if(type_repayment == "1"){
for(var i=0; i<monthly_installment_plan - 1; i++) {
if(holding_period != 0){
    var repayment = 0; //상환금액
    var interest = my_amount_of_loans * lending_rate / 12; //납입이자    
    var principal = 0;  //납입원금
    var balance = my_amount_of_loans; //대출금잔액
    
    repayments.push(Math.round(repayment));
    interests.push(Math.round(interest));
    principals.push(Math.round(principal));
    balances.push(Math.round(balance));
    
    holding_period--;
}else{
var power = Math.pow(1 + lending_rate/12, monthly_installment_plan);    
var interest = my_amount_of_loans * lending_rate/12; //이자    
var repayment = interest //상환금   
var principal = repayment - interest;  //원금
var balance = my_amount_of_loans - principal; //잔액

repayments.push(Math.round(repayment));
interests.push(Math.round(interest));
principals.push(Math.round(principal));
balances.push(Math.round(balance));

my_amount_of_loans = balance;
}
//마지막 달에 만기상환, 잔액 초기화 시키기 위한 원금납입
repayments.push(my_amount_of_loans);
interests.push(my_amount_of_loans * lending_rate/12);
principals.push(0);
balances.push(0);
} 
//checkRepay();
/* if($('#canvasDiv').hasClass('dis-none')) {
  $("#canvasDiv").removeClass('dis-none');
  $("#canvasDiv").addClass('dis-block');
  $("#canvas").show();
} else {
  $("#canvasDiv").removeClass('dis-block');
  $("#canvasDiv").addClass('dis-none');
} */


}else if(type_repayment == "3"){
//원금 균등상환
for(var i=0; i < monthly_installment_plan; i++) {
console.log("------------   "+Number(i+1)+"개월   ------------");
if(holding_period != 0){
    var repayment = 0; //상환금액
    var interest = my_amount_of_loans * lending_rate / 12; //납입이자    
    var principal = 0;  //납입원금
    var balance = my_amount_of_loans; //대출금잔액
    
    repayments.push(Math.round(repayment));
    interests.push(Math.round(interest));
    principals.push(Math.round(principal));
    balances.push(Math.round(balance));
    
    holding_period--;
    console.log(holding_period);
}else{
	var repayment = (amount_of_loans / (monthly_installment_plan - holding)) + (my_amount_of_loans * lending_rate / 12); //상환금액
    var interest = my_amount_of_loans * lending_rate / 12; //납입이자    
    var principal = repayment - interest;  //납입원금
    var balance = my_amount_of_loans-principal; //대출금잔액

  repayments.push(Math.round(repayment));
  interests.push(Math.round(interest));
  principals.push(Math.round(principal));
  balances.push(Math.round(balance));

	 my_amount_of_loans = balance;
	}
}
//checkRepay();
/* if($('#canvasDiv').hasClass('dis-none')) {
  $("#canvasDiv").removeClass('dis-none');
  $("#canvasDiv").addClass('dis-block');
  $("#canvas").show();
} else {
  $("#canvasDiv").removeClass('dis-block');
  $("#canvasDiv").addClass('dis-none');
} */

}else if(type_repayment == "2"){
//원리금 균등 상환
for(var i=0; i<monthly_installment_plan; i++) {
if(holding_period != 0){
    var repayment = 0; //상환금액
    var interest = my_amount_of_loans * lending_rate / 12; //납입이자    
    var principal = 0;  //납입원금
    var balance = my_amount_of_loans; //대출금잔액
    
    repayments.push(Math.round(repayment));
    interests.push(Math.round(interest));
    principals.push(Math.round(principal));
    balances.push(Math.round(balance));
    
    holding_period--;
    
}else{
var power = Math.pow(1 + lending_rate / 12, monthly_installment_plan - holding);  
var repayment = amount_of_loans * lending_rate/12 * power / (power-1); //상환금
var interest = my_amount_of_loans * lending_rate/12; //이자
var principal = repayment - interest;  //원금
var balance = my_amount_of_loans - principal; //잔액

repayments.push(Math.round(repayment));
interests.push(Math.round(interest));
principals.push(Math.round(principal));
balances.push(Math.round(balance));

my_amount_of_loans = balance;
 }
}
}
checkRepay();
 if($('#canvasDiv').hasClass('dis-none')) {
	  $("#canvasDiv").removeClass('dis-none');
	  $("#canvasDiv").addClass('dis-block');
	  $("#canvas").show();
  } else {
	  $("#canvasDiv").removeClass('dis-block');
	  $("#canvasDiv").addClass('dis-none');
  } 

});
}


//신용등급별 이율 컨트롤
    $(".float-r.calculate" ).each(function(index) {
        $(this).on("click", function(){
            var loanId = parseInt($(this).val());
            var table = "<table class='calculatorTable'>";
            console.log(loanId);
    	 	$.ajax({
    	 		type : 'GET',
    	        url : '/loan/loan?loanId=' + loanId,
    	        dataType : 'json',
    	        success : function(data) {
    	          console.log(data);
    	           var holding = data.holding;
    	           var creditLineMax = data.creditLineMax;
    	           var loanPeriodMax = data.loanPeriodMax;
				   var holdingMax = data.holdingMax;
				   var repay1 = data.repay1;
				   var repay2 = data.repay2;
				   var repay3 = data.repay3;
				   var repayM = data.repayM;
    	           
				   table += "<tr><td><label class='ajaxTL'>대출원금</label></td><td><input type='text' class='form-control' style='width: 50%; display: inline;' id='principal' name='principal' maxlength='"+creditLineMax+"' value='"+ (${param.requiredMoney} / 10000)+" 'class='inp1 money'>&nbsp;&nbsp;<label class='ajaxTL'>만원</label></td></tr>";
				   table += "<tr><td><label class='ajaxTL'>대출기간</label></td><td><input type='text' class='form-control' style='width: 50%; display: inline;' id='period' name='period' maxlength='"+loanPeriodMax+"' class='inp1 onlyNum' style='width:110px;'/>&nbsp;&nbsp;<label class='ajaxTL'>개월</lable></td></tr>";
				   table += "<tr><td><label class='ajaxTL'>거치기간</label></td>";
				   
				   if(holding){
				   	  table += "<td><input type='text' style='width: 50%; display: inline;' class='form-control' id='term' name='term' maxlength='"+holdingMax+"'>&nbsp;&nbsp;<label>개월</label></td>";
				   }else{
					  table += "<td><input type='text' style='width: 50%; display: inline;' class='form-control' id='term' value='0' name='term' disabled>&nbsp;&nbsp;<label class='ajaxTL'>개월</label></td></tr>"; 
				   }
				    table += "<tr><td><label class='ajaxTL'>대출금리</label></td><td><input type='text' style='width: 50%; display: inline;' id='rate' name='rate' maxlength='7' class='form-control w-half inp1 float'>&nbsp;&nbsp;<label class='ajaxTL'>%</label></td></tr>";
				    table += "<tr><td><label class='ajaxTL'>상환방법</label></td><td>";
				    
				    if(repay1){
				    	table += "<input type='radio' name='repay'  value='1'><label for='1' class='ajaxTL'>만기일시상환</label><br>";
				    };
				    if(repay2){
				    	table += "<input type='radio' name='repay' value='2'><label for='2' class='ajaxTL'>원리금균등상환</label><br>";
				    };
				    if(repay3){
				    	table += "<input type='radio' name='repay' value='3'><label for='3' class='ajaxTL'>원금균등상환</label><br>";
				    };
				    table += "</td></tr>";
				    table += "<tr><td><label class='ajaxTL'>연 소득 </label></td><td><input style='width: 50%; display: inline;' type='text' class='form-control w-half' id='salary' name='salary' >&nbsp;&nbsp;<label class='ajaxTL'>만원</label>";
				    table += "</table>";
					$("#calculator").html(table);
					$("#calculator").append("<button type='button' style='width: 100%; font-family:a드림고딕4; background-color: #27b2a5; border-color: #27b2a5;' class='btn btn-primary' id='checkRepayment'>상환계획 조회 </button>");
					
					$(function() {
						if($('#calculator').hasClass('dis-none')) {
		     	 			$('#calculator').removeClass('dis-none');
		     	 			$('#calculator').addClass('dis-block');
		     	 		} else {
		     	 			$('#calculator').removeClass('dis-block');
		     	 			$('#calculator').addClass('dis-none');
		     	 		}
					});
					
					addEventCheckRepayment();
    	        },
    	        error : function(data){
    	        	console.log("비동기 실패요~");
    	        }
    	    });
        });
    });

    	 	
    
    
</script>


	<!-- 상품별 금융계산기  -->
	<script>


</script>

	<!--대출조건 상세보기 -->
	<script>
$(function(){
$(".infoButton_1Fb6y").each(function(index) {
      $(this).on("click", function(){
      	$(".alert_1cYf2").show();
    });
    
      $(".title_2rL02 > a").on("click", function(){
      	$(".alert_1cYf2").hide();
      });
	});
});
</script>


	<!-- 상담예약  -->
	<script>
function checkAgree(){
	var target = document.getElementById('snackbar');
	if($("input:checkbox[id='checkAgree']").is(":checked") == false){
	  	 target.innerHTML = '개인정보 수집 및 이용에 동의해주세요.';
	  	 toast(); 
	  	$("#agreeTab").show();
	  	return false;
	};
	
	if($("#numSelector2").val() == null || $("#numSelector3").val() == null){
		if($("#numSelector2").val() == null){
			$("#numSelector2").focus();
			target.innerHTML = '연락처를 기입해주세요.';
			toast();
			return false;
		}else if($("#numSelector3").val() == null){
			$("#numSelector3").focus();
			target.innerHTML = '연락처를 기입해주세요.';
			toast();
			return false;
		}else{
			$("#numSelector2").focus();
			$("#numSelector3").focus();
			target.innerHTML = '연락처를 기입해주세요.';
			toast();
			return false;
		}
		return false;
	};
	
	$('input[name=userPhone]').val($("#numSelector1").val() + '-' + $("#numSelector2").val() + '-' + $("#numSelector3").val());
	
	if($("#reserveTimeSelector option:selected").val() == "시간 선택"){
		target.innerHTML = '원하시는 시간대를 설정해주세요.';
		toast();
		$("#reserveTimeSelector").focus();
		return false;
	};
	
	
	if($("#loanSelector option:selected").val() == "상품선택"){
		target.innerHTML = '예약하실 상품을 선택해주세요.';
		toast();
		$("#loanSelector").focus();
		return false;
	};
	
};


$(function(){
			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content");
			var target = document.getElementById('snackbar');
			var phoneNumber = "";
			var number1 ="";
			var number2 ="";
			var number3 ="";
			var reg = /^[0-4]*$/;
			//연락처 value 설정
		  $('#numSelector1').on('change', function(){
              number1 = $('#numSelector1 option:selected').text(); //input에 담을 값
           });
              
           $('#numSelector2').keyup(function(){
       		//유효성 검증 포함해야함.
       		number2 = $('#numSelector2').val();
                if(!reg.test(number2)){
              		$(this).val(number2.replace(reg,''));
              		$(this).focus();
              		target.innerHTML = "숫자만 입력해주세요.";
              		toast();
                  }
          });
              
           $('#numSelector3').keyup(function(){
          		//유효성 검증 포함해야함.
          	number3 = $('#numSelector3').val();
            if(!reg.test(number3)){
          		$(this).val(number3.replace(reg,''));
          		$(this).focus();
          		target.innerHTML = "숫자만 입력해주세요.";
          		toast();
              }
          	});
              
			phoneNumber = number1 + "-" + number2 + "-" + number3;
           $("#reserveForm input[name=userPhone]").val(phoneNumber);

           
	//예약 시간 설정
	var reserveTime = "";
	var my_date_string = new Date();
	var dd = my_date_string.getDate();
	var mm = my_date_string.getMonth()+1; //January is 0!
	var yyyy = my_date_string.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	my_date_string = yyyy +'-'+ mm +'-'+dd+ " ";
	
    $('#reserveTimeSelector').on('click', function(){
    	var job = $('#reserveTimeSelector option:selected').val();
    	var time = "";
		switch (job) {
		case '1':  time = "10:00:00"; break;
		case '2':  time = "10:30:00"; break;
		case '3':  time = "11:00:00"; break;
		case '4':  time = "11:30:00"; break;
		case '5':  time = "14:00:00"; break;
		case '6':  time = "14:30:00"; break;
		case '7':  time = "15:00:00"; break;
		case '8':  time = "15:30:00"; break;
		case '9':  time = "16:00:00"; break;
		case '10':  time = "16:30:00"; break;
		case '11':  time = "17:00:00"; break;
		case '12':  time = "17:30:00"; break;
		}
		reserveTime = my_date_string + time;
    	$("#reserveForm input[name=reserveTime]").val(reserveTime);
    });
    
	  $('#loanSelector').on('click', function(){
		  var loanId = $('#loanSelector option:selected').val();
		  $("#reserveForm input[name=loanId]").val(loanId);
       });
	
    $("#consultReserveBtn").on("click", function(e){
        e.preventDefault();
        $("#reserveForm").submit();
    });
});   
</script>

	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
			$('.parallax100').parallax100();
		</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/lightbox2/js/lightbox.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/toastMessage.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ziehharmonika.js"></script>
	<script>
			$(document).ready(function() {
				$('.ziehharmonika').ziehharmonika({
					collapsible : true,
					prefix : '★'
				});
			});
		</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	</script>

</body>
</html>
