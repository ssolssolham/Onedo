<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>One Do - 이용 문의</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- header config include 시작 -->
    <jsp:include page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp"/>
    <!-- header config include 종료 -->

</head>

<body class="animsition bg1-pattern">

  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/header.jsp"/>
  <!-- header include 종료 -->
  <section class="section-review" style="font-family: a드림고딕4;">
    <div class= "container" style="max-width:1500px;">
				<div class="card">
					<div class="card-body menu-title-div" >
							<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">이용문의</h3>
					</div>
				<!-- 후기 게시판 상단 Nav 바 (새글 등록, 검색 기능) -->
					<div class="card-body">
						<div class="card-body">
							<span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">자주 묻는 질문(FAQ)</span>
						<br>
						<br>
						<div class="container" style="max-width:1387px;">
							<div class="ziehharmonika">
								<h3>대출 신청준비서류는 어떤게 있나요?</h3>
								<div>
									<span class="fs-18 dreamGothic">A. 대출신청준비서류</span><br><br>
									<img alt="이미지" src="${pageContext.request.contextPath}/resources/images/icons/qnaContent1.png"><br><br>
									<span class="fs-16 dreamGothic">현재 재직중인 직장 또는 영업중인 사업장에서의 소득만 인정함</span><br>
								</div>
								<h3>인터넷으로 대출 신청시 이용절차가 어떻게 되나요?</h3>
								<div>
									<span class="fs-18 dreamGothic">A. 인터넷으로 대출 신청시 이용절차는 아래와 같습니다.</span><br><br>
									<p class="fs-16 dreamGothic">
										1. 원하시는 대출상품 선택 및 주요 내용확인<br>
										2. 신청하기 클릭<br>
										3. 신용정보 조회 등 동의서 작성<br>
										4. 기본정보 투입(거주지, 직장, 대출신청금액 등)<br>
										5. 대출신청 완료 및 증빙서류 팩스송부<br>
										6. 대출심사 및 결과통보<br>
										7. 약정서 등 채권서류 작성 및 대출실행 인터넷뱅킹 등에서 전자적 형태로 약정서 작성 및 대출 실행금 계좌 입금<br>
										<br>
										단, 경우에 따라 담당 영업점에 내점해야할 수 있습니다.
									</p>
								</div>
								<h3>ARS로 대출관련 조회가 가능한가요?</h3>
								<div>
									<span class="fs-18 dreamGothic">A. 네, 가능합니다.</span><br><br>
									<p class="fs-16 dreamGothic">
										대출계좌 보유고객은 폰뱅킹 가입여부와 관계없이 예금계좌번호와 비밀번호 입력 후 조회가 가능합니다.<br>
										※ 예금계좌란 비밀번호가 있는 예적금계좌 포함<br>
										<br>
										대출 잔액 및 이자 조회 : 1599 - 1111 -> 513 -> 1<br>
										대출 상환 조회 : 1599 - 1111 -> 513 -> 2
									</p>
								</div>
								<h3>전자금융 예금담보대출이 무엇인가요?</h3>
								<div>
									<span class="fs-18 dreamGothic">A. 인터넷뱅킹서비스를 통하여 이루어지는 예금담보대출을 말합니다.</span><br><br>
									<p class="fs-16 dreamGothic">
										담보로 제공이 가능한 대상계좌는 본인명의로서 사전에 전자금융 예금담보 가능계좌로 등록한 계좌로 타 대출에 담보로 제공되지 아니한 예적부금을 말합니다.<br>
										<br>
										인터넷뱅킹 공인인증서 발급받은 개인이 가능하며, 미성년자 및 법인은 대출대상에서 제외됩니다. 대출한도는 담보계좌로 등록된 예치금액 범위내에서만 가능합니다.(최대 3천만원한도 10만원단위)<br>
										<br>
										ㆍ영업점, 인터넷뱅킹, 콜센터에서 개설한 예적금의 경우 - 별도 사전신청없이 이용 가능<br>
										※ 금전신탁 및 수익증권저축, 양도성 예금증서, 표지어음, RP(환매조건부채권), 지급정지 및 사고신고등록 계좌는 제외
									</p>
								</div>
								<h3>인터넷대출 신청시 신용정보조회를 했는데, 이 내용을 삭제하고 싶습니다.</h3>
								<div>
									<span class="fs-18 dreamGothic">A. 정당한 절차에 의한 신용정보조회는 임의로 삭제가 불가합니다.</span><br><br>
									<p class="fs-16 dreamGothic">
										고객에 대한 신용정보는 금융기관에서 자유롭게 조회할 수 있는 것이 아니며, 정당한 절차에 의해 동의를 한 경우에만 조회가능합니다.<br>
										
										당행에 대출신청을 하고 대출심사를 하려면 신용정보조회가 필수 사항입니다.<br>
										
										인터넷으로 대출신청을 하는 경우에도 반드시 신용정보제공동의(주민번호투입화면하단)란에 체크한 후 대출신청을 하게 되어있습니다.<br>
										
										따라서 신용정보조회사실에 대한 삭제가 불가한 점을 양해해 주시기 바랍니다.
									</p>
								</div>
								<h3>1년 조금 넘게 근무한 공무원 입니다. 대출이 가능한가요?</h3>
								<div>
									<p class="fs-16 dreamGothic">A. 가능합니다. 금융상품몰에서 공무원클럽대출, 프리미엄직장인론,공무원가계자금대출 상품내용을 참고하여 주십시요.</p>
								</div>
								<h3>담보대출 평가 서류 및 대출 상환 방법을 알려주세요.</h3>
								<div>
									<span class="fs-18 dreamGothic">A. 담보대출의 한도는 지역과 담보인정비율, 소득, 상환능력등에 의해서 결정이 되고 있으며 한도산정시 타대출 현황이 반영됩니다.</span><br><br>
									<p class="fs-16 dreamGothic">
										담보물건의 정확한 한도산정을 원하실 경우 등기부등본을 지참 후 가까운 KEB하나은행을 방문하셔서 상담을 받아보시기 바랍니다.<br>
										(추가적으로 공시지가 확인서, 도시계획확인원, 토지대장, 건축물대장...등이 필요할 수 있습니다)<br>
										<br>
										상환방법은 만기일시상환, 원리금분할상환 모두 가능합니다.
									</p>
								</div>
							</div>
						</div>
						</div>
					</div>

					<div class="card-body">
							<span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">궁금한 점을 남겨주시면 빠른 시간 내에 답변 드립니다!</span>
						<br>
						<br>
						&nbsp;&nbsp;
 				<!-- 검색조건 -->
					<form id="searchForm" action="/qna/list" method="get">
					<select name="type" id="optionSel" style="margin-left: 40px; height: 35px; font-size: 20px; text-align: center; width: 15%; display: inline" class="form-control form-control-sm">
					  <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
					  <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                      <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                      <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                      <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 or 내용</option>
                      <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 or 작성자</option>
                      <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':'' }"/>>제목 or 내용 or 작성자</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }" style="vertical-align: top; width: 15%; height: 35px; display: inline;" class="form-control"> <!--  id="searchValue" -->
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<button type="button" id="reviewSearchBtn" style="vertical-align: top; height:35px; width: 10%;">검색</button>
				  </form>
				<sec:authorize access="isAuthenticated()">
					<button type="button" class="float-r" style="margin-right: 40px; height:35px;" id="createReviewBtn" data-toggle="modal" data-target="#createQnaModal">문의작성</button>
				</sec:authorize>
					<br><br>
						<div style="margin-left:40px; margin-right: 40px;">
						<table style="font-size: 1.9em; font-family: a드림고딕4;">
							<colgroup>
								<col width="10%" style="text-align: center;">
								<col width="50%" >
								<col width="10%" style="text-align: center;">
								<col width="20%" style="text-align: center;">
								<col width="10%" style="text-align: center;">
							</colgroup>
							<thead>
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">작성,수정일</th>
									<th style="text-align: center;">답변여부</th>
								</tr>
							</thead>
							<br>
							<tbody>
							<c:choose>
								<c:when test="${pageMaker.cri.pageNum eq 1 }">
									<c:set var="num" value="${totalCnt }" />
								</c:when>
								<c:otherwise>
									<c:set var="num" value="${totalCnt -(pageMaker.cri.pageNum-1)*10 }"/>
								</c:otherwise>
							</c:choose>
							<c:forEach items="${list }" var="review" varStatus="status">
								<tr class="move" style="cursor:pointer;" onclick="location.href='detail?article_num=${review.article_num }'" onMouseOver="bgColor='#beeee9'" onMouseOut="bgColor='#ffffff' ">
								  <td style="text-align: center;">${num }</td>
								  <c:set var="num" value="${num-1 }"/>
								  <td>${review.title}</td>
								  <td style="text-align: center;">${review.userid }</td>
								  <td style="text-align: center;">${review.regdate }</td>
								<c:set var="replycnt" value="${review.replycnt }"/>
		                        <fmt:formatNumber value="${review.replycnt }" type="number" var="replycnt" />
		                        <c:if test="${replycnt eq 0 }">
								  <td style="text-align: center;">답변처리중</td>
								</c:if>
								<c:if test="${replycnt gt 0 }">
								   <td style="text-align: center;">답변완료(${replycnt })</td>
								</c:if>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						</div>
						<br>
						<div style="text-align: center;">
						<!-- pagination -->
						<ul class="pagination" style="display: inline-block;">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button">
								<a href="${pageMaker.startPage -1 }">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
								<a href="${num }">${num }</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="paginate_button">
								<a href="${pageMaker.endPage +1 }">Next</a>
								</li>
							</c:if>
						</ul><!-- end pagination -->
						</div>
					<!-- page a태그 원래동작 방지 -->
					<form id="actionForm" action="/qna/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<!-- 검색에서도 페이징처리 -->
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					</form>
					</div>
				</div>
		</div>
	</section>
  <!-- footer include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/footer.jsp"/>
  <!-- footer include 종료 -->


      <!-- Modal HTML -->
      <div id="createQnaModal" class="modal fade" style="font-family: a드림고딕4;">
		<div class="modal-dialog modal-login">
		  <div class="modal-content">
			<div class="modal-header">        
			  <h4 class="modal-title"><img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">서비스 이용 문의</h4>
			</div>
			<div class="modal-body">
			  <form action="/qna/register" method="get" id="registerForm" >
				<div class="form-group">
				  <input type="text" name="title" class="form-control " placeholder="제목 입력" required="required" style="padding-left:10px;">
				</div>
				
				<div class="form-group">
				  <input type="password" name="article_pw" class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
				</div>
				
				<div class="form-group">
					<textarea name="content" rows="10" cols="50" class="form-control" placeholder="서비스 이용에 궁금한 점을 자유롭게 작성해주세요" required="required" style="font-size: 20px; padding-left:10px;"></textarea>
				</div>
				
				<input type="hidden" name="bno" value="3">
				<input type="hidden" name="userid" value="<sec:authentication property="principal.member.userid"/>">
						  
				<div class="form-group" style="display: flex; align-items: center; justify-content: center;">
				  <input type="submit" class="" value="등록">&nbsp;
				  <button type="button" class="" value="취소"  data-dismiss="modal">취소</button>
				</div>
			  </form>       
			</div>
		  </div>
		</div>
	  </div>  

<!--===============================================================================================-->
<!-- 검색처리관련 javascript by sw -->
<script type="text/javascript">
$(document).ready(function() {
	//모달처리를 위한 javascript
	var result = '<c:out value="${result}"/>';
	checkModal(result);
	
	// history back, 모달띄울필요X
	history.replaceState({}, null, null);
	
	function checkModal(result) {
		// 결과값이 없거나, history back인경우 모달X
		if(result === '' || history.state){
			return;
		}
		if(parseInt(result)>0){
			// 처리완료모달 만들어야함..
			$('.modal-body').html("게시글" + parseInt(result) + "번이 등록되었습니다.");
		}
		// 처리완료모달의 아이디값 들어가야함
		$('#').modal("sohw");
	}
	
	// page이동
	var actionForm = $('#actionForm');
	
	$('.paginate_button a').on("click", function(e) {
		e.preventDefault(); //원래 a태그 동작 방지
		
		
		//form태그 내, pageNum은 href속성으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// 변경후 form제출
		actionForm.submit();
	});
	
	// 검색
	var searchForm = $('#searchForm');
	
	$("#reviewSearchBtn").on("click", function(e) {
		

		if(!$('#optionSel option:selected').val()){
			var target = $('#snackbar');
			target.text('검색종류를 선택해 주세요');
			toast();
			return false;
		}
		if(!$('#keyword').val()){
			var target = $('#snackbar');
			target.text('키워드를 입력하세요');
			toast();
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
	
	// 새 문의 등록시 toast
	var res = '${qnaRegiRes}';
	if(res === 'success'){
		var target = $('#snackbar');
		target.text('새 문의사항을 등록하였습니다 :D');
		toast();
	}
	
	// 문의 삭제시 toast
	var delRes = '${qnaDelRes}';
	if(delRes === 'success'){
		var target = $('#snackbar');
		target.text("문의사항을 성공적으로 삭제하였습니다.");
		toast();
	}

});
</script>
		
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ziehharmonika.js"></script>
<script>
$(document).ready(function() {
		$('.ziehharmonika').ziehharmonika({collapsible: true,	prefix: 'Q.'});
	});
</script>
<!-- 
<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-36251023-1']);
	_gaq.push(['_setDomainName', 'jqueryscript.net']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>
 <!-- toast msg영역 -->
<div id="snackbar"></div>
</body>
</html>
