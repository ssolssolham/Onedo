<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>OneDo - 로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=2">
  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp"/>
  <!-- header include 종료 -->
</head>
<body class="animsition bg1-pattern" style="overflow-y: hidden; overflow-x: hidden;">

  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/header.jsp"/>
  <!-- header include 종료 -->
  
  <!-- asideMenu include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/asideMenu.jsp"/>
  <!-- asideMenu include 종료 -->

  
  <section id="analysis_section">
    <div class="container" style="max-width: 1500px;">
      <div class="card">
        <div class="card-body" style="text-align: center; margin:40px 40px 40px 40px;">
          <div class="col-sm-4" style="margin-top: 36px;">
          <h1 style="font-weight: bold; font-family: a드림고딕4;">
            <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">
              로그인
          </h1><br>
          <h4 style="font-weight: bold; font-family: a드림고딕4;">
            OneDo 홈페이지에 오신 것을 환영합니다
          </h4>
          <p>${error}</p>
          <p>${logout}</p>
            <form id="loginForm" action="/login" method="post">
              <div class="form-group">
                <input type="text"
                       class="form-control"
                       placeholder="ID 입력(12자 이내의 영문, 숫자 조합)"
                       required="required" name="username">
              </div>
              <div class="form-group">
                <input type="password"
                       class="form-control"
                       placeholder="PW입력(12자 이내의 영문, 숫자 조합)"
                       required="required" name="password">
              </div>
              <div class="form-group">
                &nbsp;&nbsp;
                <div class="display-i fsize-16 vertical-align-s" style="font-weight:bold; font-family: a드림고딕4;">아이디
                  기억하기</div>
                <input name="remember-me" type="checkbox">
              </div>
  
              <div class="form-group">
                <input type="hidden" name="${_csrf.parameterName}"
                  value="${_csrf.token}" /> <input type="submit"
                  class="btn btn-primary btn-block btn-lg" value="로그인">
              </div>
            </form>

            <div class="modal-footer">
              <a id="findInfo" href="#">ID, PW를 잊으셨나요?</a>
            </div>
            <br><br><br><br>
            <div id="findInfoWindow" class="dis-none" >
              <h1 style="font-weight: bold; font-family: a드림고딕4;">
                <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">
                  계정 정보 찾기
              </h1><br>
              <h4 style="font-weight: bold; font-family: a드림고딕4;">
                가입 당시 입력 했던 정보들을 입력하세요
              </h4>
                <form id="findForm" action="" method="post">
                  <div class="form-group">
                    <input type="text"
                           class="form-control"
                           placeholder="이름 입력"
                           required="required" name="username">
                  </div>
                  <div class="form-group">
                    <input type="text" style="width: 64%; display: inline;"
                           class="form-control"
                           placeholder="이메일 주소 입력"
                           required="required" name="password">
                    <input type="submit" id="sendBtn" value="인증 메일 전송">
                  </div>
                  
                  <div class="form-group">
                    <input type="text"
                           class="form-control" style="width: 64%; display: inline;"
                           placeholder="인증번호 입력"
                           required="required" name="username">
                    <input type="submit" id="emailCertifyBtn" value="확인">
                  </div>
      
                  <div class="form-group">
                    <input type="hidden" name="${_csrf.parameterName}"
                      value="${_csrf.token}" /> 
                     <input type="submit"
                      class="btn btn-primary btn-block btn-relg" value="다시 로그인"> 
                  </div>
                </form>
            </div>
        </div>
        
        
        <div class="col-sm-8">
          <section class="section-slide">
            <div class="wrap-slick1">
              <div class="slick1">
                <div class="item1-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/images/master-slides-04.jpg);">
                  <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150" style=" min-height: 700px; max-height:700px;">
                  </div>
                </div>
        
                <div class="item2-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/images/master-slides-04.jpg);">
                  <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150" style=" min-height: 700px; max-height:700px;">
                  </div>
                </div>
        
                <div class="item3-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/images/master-slides-04.jpg);">
                  <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150" style=" min-height: 700px; max-height:700px;">
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
        </div>
      </div>
    </div>
  </section>

  <!-- footer include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/footer.jsp"/>
  <!-- footer include 종료 -->
  
<script type="text/javascript">
// 아이디, 패스워드 찾기 전송
$('#btn-lg').on("click", function(e){
	e.preventDefault();
	$("#loginForm").submit();
});
</script>


<script type="text/javascript">
// 아이디, 패스워드 찾기 전송
$('#findInfo').click(function(){
	if($('#findInfoWindow').hasClass('dis-none') === true) {
		$('#findInfoWindow').removeClass('dis-none');
	} else {
		$('#findInfoWindow').addClass('dis-none');
	}
})
</script>
<!-- ================================= 자바스크립트(JavaScript) ================================== -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
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
<!--===============================================================================================-->

<!-- 회원가입관련 javascript -->
<!-- 모달띄우고 form제출 -->
<script type="text/javascript">
// before submit, make phoneNum, email
function beforeSubmit() {
  var memberPhoneNum = $('#memberPhone1').val()
      + $('#memberPhone2').val() + $('#memberPhone3').val();
  $('#memberPhoneNum').val(memberPhoneNum);
  var memberEmail = $('#email').val() + '@'
      + $('#emailHost').val();
  $('#memberEmail').val(memberEmail);
}
</script>  
</body>
</html>