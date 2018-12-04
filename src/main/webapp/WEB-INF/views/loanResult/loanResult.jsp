<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>추천 대출 상품 확인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath}/resources/dist/js/Chart.bundle.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/utils.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
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
    width: 70%;
    margin-right: auto;
    margin-left: auto;
    margin-bottom : 5%;
}

.calculatorTable th {
    padding: 15px;
    background: url("/resoureces/images/monoton.gif");
    border: none;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
    text-shadow: 0 1px #FFF;
}
 
.calculatorTable td {
    padding: 15px;
    border: none;
    border-bottom: 1px solid #000;
    text-align: left;
    vertical-align: baseline;
} 
  
.calculatorTable > tbody > tr > td > input[type=text]{
        border-radius: 2px;
        text-align:right;
}
   
.calculatorTable > tbody > tr > td > input[type=radio]{
        margin-right: 1%;
        margin-left: 3%;
}
  
  #table{
    background-color: white;
    background-clip: padding-box;
    color: black;
    border: 1px solid thin;
    font-size : 16px;
  }
  
 .ajaxTL{
  font-size: 20px;
  margin-left: 1%;
 } 
 
 #canvasDiv > button{
  
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
                <span style="font-weight: bold; color: #27b2a5;">업데이트 날짜 : <p>${loan.get('UPDATE_DATE')}</p></span>
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
                        <td><c:out value="${loan.get('TARGET_DESCRIPTION')}" /></td>
                      </tr>
                      <tr>
                        <td>6. 대출한도</td>
                        <td><c:out value="${loan.get('CREDITLINE_DESC')}" /></td>
                      </tr>
                      <tr>
                        <td>7. 제품상세보기</td>
                        <td><a href='<c:out value="${loan.get('DETAIL_URL')}" />'>이동</a></td>
                      </tr>
                    </tbody>
                  </table>
                <button class="float-r" id="calculateBtn" data-toggle="modal" data-target="#calculatorModal" value="${loan.get('LOAN_ID')}">
                        금리계산기</button>
                  <button type="button" class="float-r" id="loanModalBtn" data-toggle="modal" data-target="#loanModal1">
                         대출상담 예약</button>
                </div>
              </div>
            </div>
             </c:forEach>
            </c:when>
            <c:otherwise>
              <div class="container">
                  <h3>죄송합니다. 현재 입력해주신 정보로 조회되는 상품이 없습니다.
                    <span style="font-weight: bold; color: #27b2a5;">바로 상담원 연결</span>
                  </h3>
                  <button type="button" class="float-r" id="loanModalBtn" data-toggle="modal" data-target="#loanModal1">
                           상담 예약</button>
              </div>
            </c:otherwise>
            </c:choose>

            <!--상품목록 끝-->
          </div>
        </div>
      </div>
     </div>
  </section>

               <!-- 금리 계산기 부분  -->
               <div id="modal-content">
                  <div class="modal" id="calculatorModal"  style="display:none;">
                      <div class="modal-header">
                          <h5 class="modal-title" style="color: gray;"><b>대출이율 계산하기</b></h5>
                          <button type="button" class="close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                    <div id="calculator">
                    
                    </div>
                   <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" style="background-color: #27b2a5; border-color: #27b2a5;" class="btn btn-primary" id="checkRepayment">상환계획 조회 </button>
                  </div>
                  
                   <div id ="canvasDiv" style="width: 100%; display:none; background-color: white;">
                        <canvas id="canvas" style="display:block;">
                        </canvas>
                        <table id="table" style="display: none">
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
		</div>
    
<script>

<%-- <table class="table table-condensed">
<tr>
    <td>대출원금</td>
    <td><input type="text" name="principal" maxlength="${loan.get('CREDITLINE_MAX')}" value="${param.requiredMoney}" class="inp1 money"></td>${param.requiredMoney}<label>원</label></tr>
<tr>
    <td>대출기간</td>
    <td><input type="text" name="period" maxlength="${loan.get('LOANPERIOD_MAX')}" value="<?=$month?>" class="inp1 onlyNum" style="width:110px;" /> </td>개월</tr>
<tr>
    <td>거치기간</td>
    <c:if test="${loan.get('HOLDING' == '1')}">
      <td><input type="text" name="term" maxlength="${loan.get('HOLDING_MAX')}"></td><label>개월</label>
    </c:if>
    <td><input type="text" name="term" disabled="disabled"></td><label>개월</label>
    </tr>
<tr>
    <td>대출금리</td>
     <td><input type="text" name="rate" maxlength="7" value="<?=$rate?>" class="inp1 float"></td><label>%</label></tr>
<tr>
  <td>상환방법</td>
  <td>
  <c:if test="${loan.get('REPAY1') == '1'}"><input type="radio" name="rapay1" value="1"><label for="1">만기일시상환</label></c:if>
  <c:if test="${loan.get('REPAY2') == '1'}"><input type="radio" name="rapay2" value="2"><label for="2">원리금균등상환</label></c:if>
  <c:if test="${loan.get('REPAY3') == '1'}"><input type="radio" name="rapay3" value="3"><label for="3">원금균등상환</label></c:if>
  <c:if test="${loan.get('REPAYM') == '1'}"><input type="radio" name="rapayM" value="4"><label for="4">통장대출</label></c:if>
  <option value="07" ${extraInfoList[16].txt != 'null' && extraInfoList[16].txt == '07' ? 'selected="selected"':''}>토</option>
  </td>
</tr>
</table> --%>



//신용등급별 이율 컨트롤
    $(".float-r" ).each(function(index) {
        $(this).on("click", function(){
            var loanId = parseInt($(this).val());
            var table = "<table class='calculatorTable'>";
            console.log(loanId);
    	 	$.ajax({
    	        url : '/loan/loan/' + loanId,
    	        success : function(data) {
    	          console.log(data);
    	           var holding = data.holding;
    	           console.log(holding);
    	           var creditLineMax = data.creditLineMax;
    	           console.log(creditLineMax);
    	           var loanPeriodMax = data.loanPeriodMax;
    	           console.log(loanPeriodMax);
				   var holdingMax = data.holdingMax;
				   console.log(holdingMax);
				   var repay1 = data.repay1;
				   var repay2 = data.repay2;
				   var repay3 = data.repay3;
				   var repayM = data.repayM;
    	           
				   table += "<tr><td><label class='ajaxTL'>대출원금</label></td><td><input type='text' id='principal' name='principal' maxlength='"+creditLineMax+"' value='"+${param.requiredMoney} / 10000+" 'class='inp1 money'><label class='ajaxTL'>만원</label></td></tr>";
				   table += "<tr><td><label class='ajaxTL'>대출기간</label></td><td><input type='text' id='period' name='period' maxlength='"+loanPeriodMax+"' class='inp1 onlyNum' style='width:110px;'/><label class='ajaxTL'>개월</lable></td></tr>";
				   table += "<tr><td><label class='ajaxTL'>거치기간</label></td>";
				   
				   if(holding){
				   	  table += "<td><input type='text' id='term' name='term' maxlength='"+holdingMax+"'><label>개월</label></td>";
				   }else{
					  table += "<td><input type='text' id='term' value='0' name='term' disabled><label class='ajaxTL'>개월</label></td></tr>"; 
				   }
				    table += "<tr><td><label class='ajaxTL'>대출금리</label></td><td><input type='text' id='rate' name='rate' maxlength='7' class='inp1 float'><label class='ajaxTL'>%</label></td></tr>";
				    table += "<tr><td><label class='ajaxTL'>상환방법</label></td><td>";
				    
				    if(repay1){
				    	table += "<input type='radio' name='repay' value='1'><label for='1' class='ajaxTL'>만기일시상환</label>";
				    };
				    if(repay2){
				    	table += "<input type='radio' name='repay' value='2'><label for='2' class='ajaxTL'>원리금균등상환</label>";
				    };
				    if(repay3){
				    	table += "<input type='radio' name='repay' value='3'><label for='3' class='ajaxTL'>원금균등상환</label>";
				    };
				    if(repayM){
				    	table += "<input type='radio' name='repay' value='4'><label for='4' class='ajaxTL'>통장대출</label>";
				    };
				    table += "</td></tr>";
				    table += "<tr><td><label class='ajaxTL'>연 소득 </label></td><td><input type='text' id='salary' name='salary' ><label class='ajaxTL'>만원</label>";
				    table += "</table>";
					$("#calculator").html(table);   
					console.log(table);
					
					$(function() {
						  var modal = document.getElementById("calculatorModal");
						  var btn = document.getElementById("calculateBtn");
						  var span = document.getElementsByClassName("close")[0];
						  
						  // When the user clicks on the button, open the modal 
						  btn.onclick = function() {
						    modal.style.display = 'block';
						  }

						  // When the user clicks on <span> (x), close the modal
						  span.onclick = function() {
						    modal.style.display = 'none';
						  }

						  // When the user clicks anywhere outside of the modal, close it
						  window.onclick = function(event) {
						    if (event.target == modal) {
						      modal.style.display = 'none';
						    }
						  }
						});
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

$('#checkRepayment').on('click', function(){
 	var amount_of_loans = $('#principal').val() * 10000; // 대출원금 (입력)
	var lending_rate = $('#rate').val() / 100; // 이율(입력)
	var monthly_installment_plan = $('#period').val(); // 상환기간(입력)
	var holding_period = $('#term').val();  //거치기간(입력)
	var holding = $('#term').val()//보관용 거치기간(입력)
	var type_repayment = $('input[name="repay"]:checked').val(); //상환타입(입력) var radioVal = $('input[name="radioTxt"]:checked').val();
	var my_asset = $('#salary').val(); // 내 연소득(입력)
	var my_amount_of_loans = amount_of_loans; // 대출잔액

/* 	var amount_of_loans = 1000000; // 대출원금 (입력)
	var lending_rate = 0.12; // 이율(입력)
	var monthly_installment_plan = 12; // 상환기간(입력)
	var holding_period = 6;  //거치기간(입력)
	var holding = 6//보관용 거치기간(입력)
	var type_repayment = "2"; //상환타입(입력)
	var my_asset = ""; // 내 연소득(입력)
	var my_amount_of_loans = amount_of_loans; // 대출잔액 */
	
	var repayments = new Array();
	var interests = new Array();
	var principals = new Array();
	var balances = new Array();
	var date = new Array();
	console.log(type_repayment);  

 //if문이든 switch문으로 분기 시키기 만기일시상환
if(type_repayment == "1"){
for(var i=0; i<monthly_installment_plan - 1; i++) {
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
    console.log(balance);
    }
   //마지막 달에 만기상환, 잔액 초기화 시키기 위한 원금납입
  repayments.push(my_amount_of_loans);
  interests.push(my_amount_of_loans * lending_rate/12);
  principals.push(0);
  balances.push(0);
} 
  checkRepay();
  $("#canvasDiv").show();
  $("#canvas").show();


}else if(type_repayment == "3"){
//원금 균등상환
//거치기간 설정했을 때
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
  checkRepay();
  $("#canvasDiv").show();
  $("#canvas").show();

}else if(type_repayment == "2"){
//원리금 균등 상환
 for(var i=0; i<monthly_installment_plan; i++) {
  if(holding_period != 0){
	    console.log("------------   "+Number(i+1)+"개월   ------------");
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
    console.log("------------   "+Number(i+1)+"개월   ------------");
    console.log(amount_of_loans);
    var power = Math.pow(1 + lending_rate / 12, monthly_installment_plan - holding);  
	console.log("이자율 :" + power);
    var repayment = amount_of_loans * lending_rate/12 * power / (power-1); //상환금
    console.log("상환금 : " + repayment);
    var interest = my_amount_of_loans * lending_rate/12; //이자
    console.log("이자 : " + interest);
    var principal = repayment - interest;  //원금
    console.log("원금 : " + principal);
    var balance = my_amount_of_loans - principal; //잔액
    
	console.log(lending_rate);
    
    repayments.push(Math.round(repayment));
    interests.push(Math.round(interest));
    principals.push(Math.round(principal));
    balances.push(Math.round(balance));
  
    my_amount_of_loans = balance;
     }
  }
  
   checkRepay();
   $("#canvasDiv").show();
	$("#canvas").show();
  
}else{
	console.log("마이너스는 나중에,,");
}


function checkRepay(){
	var interestSum = 0;
	var principalSum = 0;
	var body = document.getElementById('cell');  //행을 추가할 테이블
	var amount_of_loans = $('#principal').val();

body.innerHTML += "<tr><td colspan='6' style='text-align:center;'>"
              + "상환 개시전"+"</td><td>"
              + amount_of_loans +"</td></tr>";
for (var i = 0; i < monthly_installment_plan; i++) {
  interestSum += interests[i];
  principalSum += principals[i];
  body.innerHTML += "<tr><td>"
                  + (i+1) + "개월"+"</td><td>"
                  +repayments[i]+"</td><td>"
                  +principals[i]+"</td><td>"
                  +interests[i]+"</td><td>"
                  +principalSum+"</td><td>"
                  +interestSum+"</td><td>"
                  +balances[i]+"</td></tr>";
}
body.innerHTML += "<tr><td colspan='5' style='text-align:center;'>"
  + "총 납입금액 "+"</td><td colspan='2'>"
  +(interestSum + principalSum)+"원</tr>";
  	
var chartData = {
    labels: ['2018-01', '2018-02', '2018-03', '2018-04', '2018-05', '2018-06', '2018-07', '2018-08', '2018-09', '2018-10', '2018-11', '2018-12'],
    datasets:
      [
        {
        type: 'bar',
        label: '밸런스',
        borderColor: window.chartColors.blue,
        borderWidth: 2,
        fill: false,
        data: balances
        }, 
      
        {
        type: 'bar',
        label: '리페이먼트',
        backgroundColor: window.chartColors.red,
        data: repayments ,
        borderColor: 'white',
        borderWidth: 2
        }, 
        
        {
        type: 'bar',
        label: '프린시팔',
        backgroundColor: window.chartColors.green,
        data: principals
        },
      
        {
        type: 'bar',
        label: '인터레스츠',
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
            text: 'Chart.js Combo Bar Line Chart'
          },
          tooltips: {
            mode: 'index',
            intersect: true
          }
        }
      });

  document.getElementById('tableView').addEventListener('click', function(){
    document.getElementById('canvas').style.display = "none";
    document.getElementById('table').style.display = "block";
    });
    
  document.getElementById('graphView').addEventListener('click', function(){
    document.getElementById('canvas').style.display = "block";
    document.getElementById('table').style.display = "none";
    });   
}
});

</script>
<script>

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
