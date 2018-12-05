<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>OneDo - 회원가입</title>
<meta charset="UTF-8">
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
          <div class="col-sm-4" style="margin-top: 36px;">
          <h1 style="font-weight: bold; font-family: a드림고딕4;">
            <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">
              회원가입
          </h1><br>
          <h4 style="font-weight: bold; font-family: a드림고딕4;">
            회원가입을 진행 하시고, 서비스 혜택을 누리세요!
          </h4>
          <p>${error}</p>
          <p>${logout}</p>
          <form action="/member/regist" method="post" onsubmit="return beforeSubmit(event)">
            <div class="form-group">
              <input type="text" name="userid" id="userid"
                class="form-control width-60 display-i"
                placeholder="ID 입력 (12자 이내의 영문, 숫자 조합)"
                required="required"
                style="padding-left: 10px; width:60%; display:inline;" /> 
                &nbsp;
                <input type="button" value="중복확인" id="dupCheck" style="width: 38%; vertical-align: bottom;"
                class="display-i btn btn-primary btn-lg width-37 height-40"/>
            </div>
            <br>
            <div class="form-group">
              <input type="password" name="userpw" id="userpw"
                class="form-control "
                placeholder="PW 입력 (12자 이내의 영문, 숫자 조합)"
                required="required" style="padding-left: 10px;" />
            </div>
            <br>
            <div class="form-group">
              <input type="password" name="passConfirm"
                class="form-control " placeholder="PW 확인"
                required="required" style="padding-left: 10px;" />
            </div>
            <br>
            <div class="form-group">
              <input type="text" name="userName" class="form-control "
                placeholder="이름 입력 (2~4 자리의 한글 이름)" required="required"
                style="padding-left: 10px;" />
            </div>
            <br>
            <div class="form-group">
              <input type="text" id="email"
                class="display-i form-control width-50"
                placeholder="이메일을 입력하세요" required="required"
                style="padding-left: 10px; width:50%; display:inline;"> <span
                class="fsize-16 width-8">&nbsp;@&nbsp;</span>&nbsp;<select
                id="emailHost"
                class="display-i form-control vertical-align-t p-l-0 width-40"
                name="emailHost" id="emailHost"
                style="padding-left: 10px; width:40%; display:inline; height: 40px;">
                <option selected>이메일선택</option>
                <option>daum.net</option>
                <option>gmail.com</option>
                <option>naver.com</option>
                <option>nate.com</option>
                <!-- <option>직접입력</option> 이거선택시 input text만들어져야함..-->
              </select> <input type="hidden" id="useremail" name="email">
            </div>
            <br>
            <div class="form-group" id="emailDiv">
              <!-- <input type="text" class="display-i form-control width-40" placeholder="직접입력" required="required" style="padding-left:10px;"> -->

              <input type="text" id="certifyCodeInput"
                class="display-i form-control width-60"
                placeholder="인증번호를 입력하세요" disabled="disabled"
                required="required" style="padding-left: 10px; width: 60%; display:inline;">&nbsp;
              <button type="button" id="emailCertify"
                class="display-i btn btn-primary btn-block btn-lg width-37 height-40" 
                style="width:38%; vertical-align: bottom; display:inline;">
              이메일인증
              </button>
            </div>
            <br>
            <!-- 인증 결과 표시해주는 DIV 태그 -->
            <div class="form-group"></div>

            <div class="form-group">
              <input type="submit"
                class="btn btn-primary btn-block btn-lg" value="회 원 가 입">
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</section>

  <%-- <!-- footer include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/footer.jsp"/>
  <!-- footer include 종료 --> --%>

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
<!-- 회원가입관련 javascript -->
<!-- <script type="text/javascript">
// before submit, make phoneNum, email
function beforeSubmit() {
  var memberEmail = $('#email').val() + '@'
      + $('#emailHost').val();
  $('#useremail').val(memberEmail);
}
</script>  
 -->
<script>
// 아이디 중복확인을 위한 비동기
$(function() {
   	// id체크여부
   	var idck = false;
   	var emailck = false;
	var target = $('#snackbar');
   
   
   // idDup버튼 클릭 시, 비동기로 아이디 중복확인
   $('#dupCheck').on('click', function() {
      var userid = $('#userid').val();
      
      $.ajax({
         type : 'GET',
         url : "/member/idDupCheck/" + userid,
         dataType : "json",
         success : function(data) {
            //비동기 성공 시
            if(data.cnt > 0){
            	target.text('중복된 아이디 입니다. 다른 아이디를 입력해 주세요:(');
            	toast();
               	$('#userid').val("");
               	$('#userid').focus();
            }else{
				target.text('사용가능한 아이디 입니다:D');
				toast();
               	$('#userid').val(userid);
               	$('#userid').attr('readonly', 'readonly');
               	$('#dupCheck').attr('disabled', 'disabled');
               	$('#userpw').focus();
               	idck = true;
            }
         },
         error : function(error) {
            alert("비동기 오류!");
         }
      });
   });
});

// email과 emailHost 연결


   // 인증버튼클릭으로 생성된 임의의 코드저장할 변수
   var code;

   $('#emailCertify').on('click', function() {
	  var target = $('#snackbar');
      // email값 비동기로 전송
      var useremail = $('#email').val()+'@'+$('#emailHost').val();
      console.log("이메일값: "+$('#email').val());
      console.log("이메일+이메일호스트: "+useremail);
      
      //이메일 입력 안했을경우 return
      if($('#email').val().trim() === ''){
         target.text('이메일을 입력해 주세요!');
         toast();
         return;
      }
      $('#useremail').val(useremail); //form submit에 보내질 변수 설정(hidden)

      // 비동기통신을통해 이메일전송
      $.ajax({
         type : 'GET',
         url : "/member/emailCertify/"+useremail,
         dataType : "json",
         success : function(data) {
        	target.text('인증번호를 보냈습니다. 확인 후 입력해 주세요:)');
      		toast(); 
			// 메일로 보낸 코드값 변수로 저장
      		code = data.code;
            console.log(code);
            // 코드입력란 활성화, focus, 기존 이메일인증버튼 display none, 새 버튼 생성
            $('#certifyCodeInput').removeAttr('disabled');
            $('#certifyCodeInput').focus();
            $('#emailCertify').css('display', 'none');
            
            // 코드확인을 위한 새 버튼 생성 및 위치시켜주기
            var emailDiv = $('#emailDiv');
            var $certifyBtn = $("<button type='button' id='checkCertify' class='display-i btn btn-primary btn-block btn-lg width-37 height-40' style='width:38%; vertical-align: bottom; display:inline;'>확인</button>");
			$certifyBtn.appendTo(emailDiv);   
			$('#checkCertify').on('click', function(e) {
				var inputCode = $('#certifyCodeInput').val();
				alert();
				// 코드값 입력 안했을 경우
				if(inputCode === ''){
					target.text('메일로 전송된 코드값을 입력해 주세요!');
					toast();
				}
				else if(inputCode == code){
					target.text('인증이 완료되었습니다! 회원가입을 계속 진행해 주세요:D');
					toast();
					console.log("인증성공경우!!!!")
					$('#certifyCodeInput').attr('readonly', 'readonly');
					$('#checkCertify').attr('disabled','disabled');
					emailck = true;
				}
			});
         },
         error : function(request,status,error) {
        	 alert("에러");
        	 console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   });

// form제출 전, 아이디중복체크와 이메일인증을 했는지 체크
function beforeSubmit(e) {
	e.preventDefault();
	console.log("제출전, 중복체크, 이메일인증 했는지..");
	alert("idck값: "+idck+"emailck값: "+emailck);
	if(emailck && idck){
		return true;
	}else if(!idck || !emailck)	{
		target.text('아이디 중복체크와 이메일인증을 먼저 진행해 주세요!');
		toast();
		return false;
	}
}


}


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
<script src="${pageContext.request.contextPath}/resources/js/toastMessage.js"></script>
<!--===============================================================================================-->

<!-- 토스트메세지 -->
<div id="snackbar"></div>
</body>
</html>