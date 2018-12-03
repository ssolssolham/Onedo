<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>추천 대출 상품 확인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

  <!-- asideMenu include 시작 -->
  <jsp:include
    page="${pageContext.request.contextPath}/resources/includes/asideMenu.jsp" />
  <!-- asideMenu include 종료 -->

  <!-- 로그인 모달 include 시작 -->
  <jsp:include
    page="${pageContext.request.contextPath}/resources/includes/modal/loginModal.jsp" />
  <!-- 로그인 모달 include 종료 -->

  <!-- 회원가입 모달 include 시작 -->
  <jsp:include
    page="${pageContext.request.contextPath}/resources/includes/modal/registModal.jsp" />
  <!-- 회원가입 모달 include 종료 -->

 <section class="section-review">
    <div class="container">
    
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
          <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;
          <span style="font: bold 20px a드림고딕4; font-size: 18px;">
            회원님의 정보와 일치하는 대출 상품을 확인하시고, 상담 예약을 진행하세요!</span> <br><br>
          
          
          
          <!-- 상품 리스트 출력  -->
          <div class="row" style="margin-top: 20px;">
          
        <!--상품목록 -->
      <c:choose>
           <c:when test="${loanlist != null}">
            <c:forEach items="${loanlist}" var="loan">
            <div class="container">
              <div class="ziehharmonika">
                <h3>${loan.get('LOAN_NAME')} 
                <span style="font-weight: bold; color: #27b2a5;">업데이트 날짜 : </span><p>${loan.get('UPDATE_DATE')}</p>
                </h3>
                <div>
                
                <c:if test="${loan.get('LOANCOMP_NAME') == '하나은행'}">
                  <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
                    style="width: 50px; height: 50px; border: 1px solid #cdcdcd">&nbsp;&nbsp;
                  <span style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">KEB 하나은행</span>
                </c:if> 
                
                <c:if test="${loan.get('LOANCOMP_NAME') == '하나저축은행'}">
                  <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
                    style="width: 50px; height: 50px; border: 1px solid #cdcdcd">&nbsp;&nbsp;
                  <span style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">하나저축은행</span>
                </c:if> 
                
                 <c:if test="${loan.get('LOANCOMP_NAME') == '하나캐피탈'}">
                  <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png"
                    style="width: 50px; height: 50px; border: 1px solid #cdcdcd">&nbsp;&nbsp;
                  <span style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">하나캐피탈</span>
                </c:if> 
                  
                  <table>
                    <colgroup>
                      <col width="20%">
                      <col width="80%">
                    </colgroup>
                    <tbody>
                      <tr>
                        <td>1. 상품명</td>
                        <td><c:out value="${loan.get('LOAN_NAME')}" /></td>
                      </tr>
                      <tr>
                        <td>2. 상품설명</td>
                        <td><c:out value="${loan.get('LOAN_CONTENT')}" /></td>
                      </tr>
                      <tr>
                        <td>3. 예상연금리</td>
                        <td>평균 + 3.55%</td>
                      </tr>
                      <tr>
                        <td>4. 대출자격</td>
                        <td><c:out value="${loan.get('TARGET_DESCRIPTION')}" /></td>
                      </tr>
                      <tr>
                        <td>5. 가입대상</td>
                        <td>하나은행을 이용하는 고객 모두</td>
                      </tr>
                      <tr>
                        <td>6. 대출한도</td>
                        <td>1000만원 까지</td>
                      </tr>
                      <tr>
                        <td>7. 제품상세보기</td>
                        <td><a href='<c:out value="${loan.get('DETAIL_URL')}" />'>이동</a></td>
                      </tr>
                    </tbody>
                  </table>
                  <button type="button" class="float-r" id="loanModalBtn" data-toggle="modal" data-target="#loanModal1">
                          해당 대출로 상담 예약</button>
                </div>

              </div>
            </div>
             </c:forEach>
            </c:when>
            <c:otherwise>
              <div class="container">
                  <h3>죄송합니다. 현재 입력해주신 정보로 조회되는 상품이 없습니다.
                    <span style="font-weight: bold; color: #27b2a5;">바로 상담원 연결 </span>
                  </h3>
                  <button type="button" class="float-r" id="loanModalBtn" data-toggle="modal" data-target="#loanModal1">
                          해당 대출로 상담 예약</button>
              </div>
            </c:otherwise>
            </c:choose>

            <!--상품목록 끝-->

          </div>
        </div>
      </div>
     </div>
  </section>

  <!--   
	 <div class="modal fade" id="loanModal1" tabindex="-1" role="dialog" aria-labelledby="loanModal1Label" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" style="color: gray;"><b>대출 상담 예약 정보</b></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						
							<h6 style="color: gray;"><b>이름</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">강원준</div>
							<h6 style="color: gray;"><b>대출 희망금액</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">??만원</div>
							<h6 style="color: gray;"><b>직업</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">개발자</div>
							<h6 style="color: gray;"><b>신용등급</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">1등급</div>
							<h6 style="color: gray;"><b>연 소득</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">??만원</div>
							<h6 style="color: gray;"><b>대출 상품</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">대출 상품 1</div>
							<h6 style="color: gray;"><b>예약 일시</b></h6>
							<div style="text-align: right; font-size: 0.8em; color: darkgray;">2018년 12월 12일 15:00 ~ 15:30</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" style="background-color: #27b2a5; border-color: #27b2a5;" class="btn btn-primary">예약 완료</button>
					</div>
				</div>
			</div>
		</div>   -->


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
		</script>

</body>
</html>
