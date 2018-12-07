<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>이용문의</title>
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
  
  <!-- asideMenu include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/asideMenu.jsp"/>
  <!-- asideMenu include 종료 -->
  <section class="section-review">
    <div class= "container" style="max-width:1500px;">
				<div class="card">
					<div class="card-body menu-title-div" >
							<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">이용문의</h3>
					</div>
				<!-- 후기 게시판 상단 Nav 바 (새글 등록, 검색 기능) -->
					<div class="card-body">
							<span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">자주 묻는 질문(FAQ)</span>
						<br>
						<br>
						<div class="container" style="max-width:1387px;">
							<div class="ziehharmonika">
								<h3>1. 대상은 누구인가요?</h3>
								<div>
									<p>하나금융그룹의 고객이라면 누구나 이용 가능합니다.</p>
								</div>
								<h3>2. 무엇을 하는 사이트 인가요?</h3>
								<div>
									<p>서울시 상권분석을 통해 최적의 입지를 선정하고, 나아가 하나금융그룹의 대출 상품을 추천해주는 사이트 입니다.</p>
								</div>
								<h3>3. 무료인가요?</h3>
								<div>
									<p>하나금융그룹의 고객이라면 누구나 무료로 이용 가능합니다.</p>
								</div>
								<h3>4. 무료인가요?</h3>
								<div>
									<p>하나금융그룹의 고객이라면 누구나 무료로 이용 가능합니다.</p>
								</div>
								<h3>5. 무료인가요?</h3>
								<div>
									<p>하나금융그룹의 고객이라면 누구나 무료로 이용 가능합니다.</p>
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
					<select name="type" id="optionSel" style="height: 35px; font-size: 20px; text-align: center; width: 15%; display: inline" class="form-control form-control-sm">
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
					<button type="button" class="float-r" style="height:35px;" id="createReviewBtn" data-toggle="modal" data-target="#createQnaModal">문의작성</button>
				</sec:authorize>
					<br><br>
						
						<table style="font-size: 1.0em;">
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
							<c:forEach items="${list }" var="review" varStatus="status">
								<tr>
								  <td>${status.index +1 }</td>
								  <td><a class="move" href="detail?article_num=${review.article_num }">${review.title }</a></td>
								  <td>${review.userid }</td>
								  <td>${review.regdate }</td>
								  <c:set var="replycnt" value="${qna.replycnt }"/>
			                      <fmt:formatNumber value="${review.replycnt }" type="number" var="replycnt" />
			                      <c:if test="${replycnt eq 0 }">
								  	<td>답변처리중</td>
								  </c:if>
								  <c:if test="${replycnt gt 0 }">
								    <td>답변완료</td>
								  </c:if>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<br>
						<div class="table-nav-bar">
						<!-- pagination -->
						<ul class="pagination">
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

      <!-- Modal HTML -->
      <div id="createQnaModal" class="modal fade">
		<div class="modal-dialog modal-login">
		  <div class="modal-content">
			<div class="modal-header">        
			  <h4 class="modal-title">서비스 이용 문의</h4>
			</div>
			<div class="modal-body">
			  <form action="/qna/register" method="get" id="registerForm">
				<div class="form-group">
				  <input type="text" name="title" class="form-control " placeholder="제목 입력" required="required" style="padding-left:10px;">
				</div>
				
				<div class="form-group">
				  <input type="password" name="article_pw" class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
				</div>
				
				<div class="form-group">
					<textarea name="content" rows="10" cols="50" class="form-control" placeholder="서비스 이용에 궁금한 점을 자유롭게 작성해주세요" required="required" style="padding-left:10px;"></textarea>
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
	console.log("result값"+result);
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
		
		console.log('페이지눌림!!!');
		
		//form태그 내, pageNum은 href속성으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// 변경후 form제출
		actionForm.submit();
	});
	
	// 검색
	var searchForm = $('#searchForm');
	
	$("#reviewSearchBtn").on("click", function(e) {
		
		console.log("선택옵션: " + $('#optionSel option:selected').val());
		console.log("입력키워드: " + $('#keyword').val());

		if(!$('#optionSel option:selected').val()){
			alert("검색종류를 선택해 주세요");
			return false;
		}
		if(!$('#keyword').val()){
			alert("키워드를 입력하세요");
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
		$('.ziehharmonika').ziehharmonika({collapsible: true,	prefix: '★'});
	});
</script>
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
