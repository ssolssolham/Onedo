<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>One Do - 상담 History</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=2">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- header include 시작 -->
 <jsp:include page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp"/>
  <!-- header include 종료 -->
<style>
/* main elements layouts */
   #Wrapper {
   font-family: Arial, Helvetica, sans-serif;
   font-size: 11px;
   color: #333333;
   text-align: left;
   width: 500px;
   margin-top: 0px;
   margin-right: auto;
   margin-bottom: 0px;
   margin-left: auto;
   padding: 0px;
   }

   #Container {
   background-color: white;
   color: #333;
   clear: both;
   margin: 0px;
   padding: 0;
   width: 100%;
   float: left;
   display: block;
   padding-left:20px;
   padding-right:20px;
   }

   #Content {
   background-color: #FFFFFF;
   border-top-width: 1px;
   border-top-style: solid;
   border-top-color: white;
   padding-top: 10px;
   padding-bottom: 20px;
   margin: 0px;
   width: auto;
   height: auto;
   }
   
#Navigation {
   margin-left: 20px;
   margin-right: 20px;
   padding: 0px;
   font-family: Arial, Helvetica, sans-serif;
   font-size: 12px;
   color: #333333;
   position: relative;
   height: 50px;
   display: block;
   width: auto;
   }

/* top level list "primary" */
ul#primary {
   margin: 0;
   padding: 0;
   position: absolute;
   bottom: -1px;
   width: 100%;
   margin-left: 5px;
}

ul#primary li {
   display: inline;
   list-style: none;
}

ul#primary a,ul#primary a.active {
   width: 100%;
   display: block;
   float: left;
   text-align: center;
   font-family: tahoma, verdana, sans-serif;
   font: normal 23px a드림고딕4;
   text-decoration: none;
   color: #333;
   letter-spacing: .1em;
   margin-top: 0px;
   margin-right: 2px;
   margin-bottom: 0;
   margin-left: 0;
   padding-top: 4px;
   padding-right: 0;
   padding-bottom: 4px;
   padding-left: 0;
}

ul#primary a.active,ul#primary a.active:hover {
   border-top: 5px solid #27b2a5;
    color: black;
    margin-top: 0;
    margin-top: 0;
    margin-right: 2px;
    margin-bottom: 0px;
    margin-left: 0px;
    padding-top: 4px;
    padding-right: 0px;
    padding-bottom: 4px;
    padding-left: 0px;
    width: 49.5%;
}

ul#primary a {
   background: #e8e9e1;
   border-top: 1px solid #c0c0c0;
   border-right: 1px solid #c0c0c0;
   border-bottom: none;
   border-left: 1px solid #c0c0c0;
   margin-top: 0px;
   margin-right: 2px;
   margin-bottom: 0px;
   margin-left: 0px;
   padding-top: 4px;
   padding-right: 0px;
   padding-bottom: 3px;
   padding-left: 0px;
   width: 49.5%;
   height: 50px;
}

ul#primary a:hover {
   margin-top: 1;
   border-color: #c0c0c0;
   background: #F1F1ED;
   color: #333;
   padding-bottom: 3px;
   margin-right: 2px;
   margin-bottom: 0px;
   margin-left: 0px;
   padding-top: 4px;
   padding-right: 0px;
   padding-left: 0px;
}

#MyReserveloanList  td{
  font-size: 18px;
}


/* 대출 상세 토글 이벤트 */
  #image {
  line-height: 1.5em;
  list-style-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/4621/treehouse-marker.png);
  }

  .loanPanel{
    margin-right: auto;
    margin-left: auto;
    width: 80%;
  }
  
  .loanPanel h4{    
    border-bottom: 2px solid #018085;
    color: #037b7c;
    font-size: 19px;
    font-weight: bold;
    margin: 0 0px 3px -45px;
    padding: 20px 0 13px 1px;
    width: 100% !important;
    height: auto;
  }
/* 대출 상세 토글 이벤트 */  
  
/* 예약 취소용 모달 */  
 .pop_ty11 {
    position: relative;
    overflow: hidden;
    border: 5px solid #2e9498;
    width: 350px;
    padding: 25px 29px 43px 29px;
    background: #fff;
} 

.pop_ty11 h4 {
    border-bottom: 2px solid #018085;
    color: #037b7c;
    font-size: 19px;
    font-weight: bold;
    margin: 0;
    padding: 0 0 13px;
    width: 100% !important;
    height: auto;
}

.pop_ty11 h4 + .contBox01 {
    margin-top: 20px !important;
}

.pop_ty11 .contBox01 {
    padding: 15px 0;
    border-top: 1px solid #dcdcdc;
    border-bottom: 1px solid #dcdcdc;
}

.pop_ty11 .contBox01 p {
    text-align: center;
    line-height: 20px;
}

.btn_ex01 {
    overflow: hidden;
    margin-top: 25px;
    padding: 0 0 15px;
    text-align: center;
}

.pop_close {
    width: 100%;
    height: 30px;
    position: absolute;
    right: 0;
    text-align: right;
    top: 0;
}

.pop_close a {
    position: absolute;
    top: 0;
    right: 0;
    width: 29px;
    height: 29px;
}

img {
    border: none;
}

:root .btn_ex01 span a {
    padding: 7px 19px 6px 19px;
}
</style>
</head>
<body class="animsition" style="overflow-y: hidden; overflow-x: hidden;">

  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/header.jsp"/>
  <!-- header include 종료 -->


      <section class="section-mypage">
         <div class= "container" style="max-width: 1500px;">
         <sec:authentication property="principal" var="member"/>
            <div class="card">
               <div class="card-body menu-title-div" >
                     <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">내 대출 상담 History 확인하기</h3>
               </div>
            <div id="wrapper">
               <div id="Container">
                  <div id="Content">
                  <!-- 마이페이지 회원 정보 수정 -->
                 <div id="myLoanReserveResult" class="card-boday">
                     <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;"><label style="color: #27b2a5;"><sec:authentication property="principal.member.userName"/></label> 님의 대출상담 예약 목록입니다. </span><br>
                  <br>
                     <table id="MyReserveloanList">
                        <colgroup>
                           <col width="10%" style="text-align: center;">
                           <col width="20%" style="text-align: center;">
                           <col width="10%" style="text-align: center;">
                           <col width="25%" style="text-align: center;">
                           <col width="15%" style="text-align: center;">
                           <col width="20%" style="text-align: center;">
                           
                        </colgroup>
                        <thead>
                           <tr>
                              <th style="text-align: center;">예약번호</th>
                              <th style="text-align: center;">상품명</th>
                              <th style="text-align: center;">대출금액</th>
                              <th style="text-align: center;">예약시간</th>
                              <th style="text-align: center;">예약변경</th>
                              <th style="text-align: center;">상세보기</th>
                           </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${list}" var="reserve">
                            <c:choose>
                            <c:when test="${list != null}">
                              <tr>
                                <td style="text-align:center;">${reserve.get('LPBU_NUM')}</td>
                                <td style="text-align:cdnter; padding-left: 7px;">${reserve.get('LOAN_NAME')}</td>
                                  <td style="text-align:center;"><label>₩</label>
                                  <fmt:formatNumber value="${reserve.get('REQUEST_BM')}" pattern="#,###" /></td>
                                <td style="text-align:center;">${reserve.get('RESERVE_TIME')}</td>
                              <c:if test="${reserve.get('ISANSWERED') == '0'}">
                                <td style="text-align:center;"><button type="button" style="vertical-align: top; height:30px; width: 50%;" class="reserveCancle" id="reserveCancleBtn" value="${reserve.LPBU_NUM}">예약취소</button></td>
                              </c:if>
                              <c:if test="${reserve.get('ISANSWERED') == '1'}">
                                <td style="text-align:center;"><button type="button" style="vertical-align: top; height:30px; width: 50%; background-color: gray" disabled>답변완료</button></td>
                              </c:if>
                                <td style="text-align:center;"><button type="button" style="vertical-align: top; height:30px; width: 50%;" class="reserveOpen" id="reserveOpenBtn" >열람</button>
                                </td>
                              </tr>
                              
                              <tr class="panel" style="display:none;">
                                <td colspan="6" >
                                  <div class="loanPanel">
                                    <h4>예약하신 대출상품 정보</h4>
                                     <div class="loanDetail">
                                    <ul id="image">
                                       <li><label>상담요청시간 : &nbsp;</label>
                                       <fmt:formatDate value="${reserve.get('REQUESTTIME')}" pattern="yyyy-MM-dd E요일 a hh:mm " type="date"/>
                                       </li>
                                       <li><label>업무 담당자 : &nbsp;</label>박의수</li>
                                       
                                       <c:if test="${reserve.get('ISANSWERED') == '1'}">
                                       <li><label>상담완료시간 : &nbsp;</label>
                                          <fmt:formatDate value="${reserve.get('ANSWER_TIME')}" pattern="yyyy-MM-dd E요일 a hh:mm" type="date"/>
                                      </li>  
                                      <li><label>진행상태 : &nbsp;</label>완료</li>
                                      </c:if>
                                      
                                      <!--  관리자가 변경하는 순간 update -->               
                                       <c:if test="${reserve.get('ISANSWERED') == '0'}">
                                         <li><label>진행상태 : &nbsp;</label>대기 중</li>
                                         </c:if>
                                       <li><label>상세보기 : &nbsp;</label><a href="${reserve.get('DETAIL_URL')}">상세보기</a></li>
                                    </ul>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                              
                              <tr>
                              <td colspan="6">
                                <div id="opbLayerMessage0" tabindex="-1" class="OPB_layerClass_generateByJS ui-draggable" style="position: absolute; z-index: 999; left: 677.5px; top: 261.5px; display: block;">
                                  <div id="opbLayerMessage0OPB_layerPrevFocus_generatedByJS" tabindex="0"></div>
                                  <div class="pop_ty11">
                                    <h4>대출상담예약 취소</h4>
                                    <div class="contBox01">
                                      <p>${reserve.get('LOAN_NAME')} <label> 상품 상담을 취소하시겠습니까?</label></p>
                                      <p><label>( 예약시간 : </label>${reserve.get('RESERVE_TIME')} <label> )</label></p>
                                    </div>
                                    <div class="btn_ex01">
                                      <span><a href="/lpbu/${reserve.LPBU_NUM}" class="opbLayerMessage0_OK">예약취소</a></span>
                                      <span><a href="#" class="opbLayerMessage0_NO">창닫기</a></span>
                                    </div>
                                    <div class="pop_close draggable" style="cursor: move;">
                                      <a id="opbLayerMessage0_Close" class="opbLayerMessage0_Close"><img
                                        src="https://image.kebhana.com/pbk/resource/img/common/btn_popclose.gif"
                                        alt="대출상담방법 팝업 닫기"></a>
                                    </div>
                                  </div>
                                  <div id="opbLayerMessage0OPB_layerNextFocus_generatedByJS" tabindex="0"></div>
                                </div>
                                </td>
                               </tr> 
                              <!--  -->
                            </c:when>
                            <c:otherwise>
                              <tr>
                                <td style="text-align:center;" colspan="6">1</td>
                               </tr>
                            </c:otherwise>
                           </c:choose>
                          </c:forEach>
                        </tbody>
                     </table>
               		</div>
               </div>
            </div>
            </div>
         </div>   
      </div>
   </section>

  <!-- footer include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/footer.jsp"/>
  <!-- footer include 종료 -->

<!-- ================================= 자바스크립트(JavaScript) ================================== -->
<!-- 메인페이지 홈페이지 소개 타이핑 메시지 JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/typingMessage.js"></script>
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
<!--===============================================================================================-->
<!-- 모달 javascript -->
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>


<!-- 토글용 Jquery Ui  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

<script type="text/javascript">
      $("#primary a").click(function(){
            $("#primary a").removeClass("active");
            $(this).addClass("active");
            $("#Content div").css("display", "none");
            var tabname = $(this).text();
            var value;
            if(tabname === '회원정보수정') {
               value='updateUserInfo';
            } else {
               value='myAnalysisResult';
            }
            $("#"+value).css("display","block");
      });
</script>

<script>

var getUrl = '/lpbu/';
var lpbuNum = 0;

//이름수정 아코디언이벤트	
var panels = $(".panel"); //아코디언으로 보일영역
var btns = $(".reserveOpen"); //아코디언이벤트 버튼
var i=0;

for(i=0; i<panels.length; i++){
	panels[i].style.display = "none";
	btns[i].addEventListener("click", function() {
	    var panel = this.parentElement.parentElement.nextElementSibling;
		if(panel.style.display === "none"){
			panel.style.display = "table-row";
		}else{
			panel.style.display = "none";
		}
	});
} 
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/lpbu.js"></script>
<script>
/*  $(function(){
  $(".reserveCancle").each(function(index){
    	$(this).on("click", function(){
      		$(".OPB_layerClass_generateByJS").show();
    	  });

    
    	$(".opbLayerMessage0_Close").on("click", function(){
    		$(".OPB_layerClass_generateByJS").hide();	
   		 });
    	
    	
    	$(".opbLayerMessage0_NO").on("click", function(){
    		$(".OPB_layerClass_generateByJS").hide();	
   		 });
  });
 }); */
 
 var modals = $(".OPB_layerClass_generateByJS"); //띄울 모달
 var btns = $(".reserveCancle"); // 모달 취소창 버튼
 var close = $(".opbLayerMessage0_Close");
 var close2 = $(".opbLayerMessage0_NO");
 var cancleBtns = $(".opbLayerMessage0_OK");
 var i=0;
 
 for(i=0; i<modals.length; i++){
	 modals[i].style.display = "none";
  	 btns[i].addEventListener("click", function(e) {
  		lpbuNum = e.currentTarget.value;
 	    var panel = this.parentElement.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.firstChild.nextSibling;
 		if(panel.style.display === "none"){
 			panel.style.display = "block";
 		}else{
 			panel.style.display = "none";
 		}
 	}); 
  	 
  	 close[i].addEventListener("click", function() {
 	    var panel = this.parentElement.parentElement.parentElement;
 		if(panel.style.display === "none"){
 			panel.style.display = "block";
 		}else{
 			panel.style.display = "none";
 		}
 	}); 
  	 
  	 close2[i].addEventListener("click", function() {
  	    var panel = this.parentElement.parentElement.parentElement.parentElement;
  		if(panel.style.display === "none"){
  			panel.style.display = "block";
  		}else{
  			panel.style.display = "none";
  		}
  	});
 }
 
 var trs = new Array();
 for(var i = 0; i < $('tr').length; i++){
	    if(i % 2 == 1){trs.push($('tr')[i])}
	    }
 
 $('opbLayerMessage0_OK').on('click',function(){
	 console.log(3333);
	 $.ajax({
		 type: 'GET',
		 url: getUrl + lpbuNum,
		 dataType : 'json',
		 success : function(data){
			 console.log(1);
		 },
		 error : function(error){
			 console.log(2);
		 }
	 });
 });
</script>
</body>
</html>
