<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html lang="en">
<head>
  <title>이용 후기</title>
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

  <section class="section-review">
		<div class= "container" style="max-width: 1500px;">

			<div class="card">
				<div class="card-body menu-title-div" >
						<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">이용후기</h3>
				</div>
			<!-- 후기 게시판 상단 Nav 바 (새글 등록, 검색 기능) -->
				<div class="card-body">
						<span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">OneDo 서비스를 이용하신 고객님들의 창업 성공 후기를 만나보세요!</span><br><br>
						<span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">OneDo 서비스를 이용하시고, 창업 성공까지 이어진 생생한 후기를 직접 적어주세요!</span>
					<br>
					<br>
					&nbsp;&nbsp;
					<form id="searchForm" action="/review/list" method="get"></form>
					<select name="type" style="height: 35px; font-size: 20px; text-align: center; width: 15%; display: inline" class="form-control form-control-sm">
					  <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
					  <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                      <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                      <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                      <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 or 내용</option>
                      <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 or 작성자</option>
                      <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':'' }"/>>제목 or 내용 or 작성자</option>
					</select>
					<input type="text" name="keyword" style="vertical-align: top; width: 15%; height: 35px; display: inline;" class="form-control" id="searchValue" name="keyword">
					<button type="button" style="vertical-align: top; height:35px; width: 10%;" class="" id="reviewSearchBtn" >검색</button>
				
				<sec:authorize access="isAuthenticated()">
					<button type="button" class="float-r" style="height:35px;" id="createReviewBtn" data-toggle="modal" data-target="#createReviewModal">후기작성</button>
				</sec:authorize>
					<br>
					<table>
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
								<th style="text-align: center;">조회수</th>
							</tr>
						</thead>
						<br>
						<tbody>
						<c:forEach items="${list }" var="review" varStatus="status">
							<tr>
							  <td>${status.index +1 }</td>
							  <td><a href="/review/detail?article_num=${review.article_num }">${review.title }</a></td>
							  <td>${review.userid }</td>
							  <td><fmt:formatDate pattern="yyyy-mm-dd" value="${review.regdate }"/></td>
							  <td>${review.enabled }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<br>
					<div class="table-nav-bar">
						<!-- pagination -->
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button"><a href="#">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button"><a href="#">${num }</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="paginate_button"><a href="#">Next</a>
								</li>
							</c:if>
						</ul><!-- end pagination -->
					</div>
				</div><!-- end card body -->
			</div>
	</div>
</section>

  <!-- 후기 작성 Modal HTML -->
  <div id="createReviewModal" class="modal fade">
		<div class="modal-dialog modal-login">
		  <div class="modal-content">
			<div class="modal-header">        
			  <h4 class="modal-title">서비스 이용 후기</h4>
			</div>
			<div class="modal-body">
			  <form action="/review/register" method="post">
				<div class="form-group">
				  <input type="text" name="title" class="form-control " placeholder="제목 입력" required="required" style="padding-left:10px;">
				</div>
				
				<div class="form-group">
				  <input type="password" name="article_pw" class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
				</div>
				
				<div class="form-group">
					<textarea name="content" rows="10" cols="50" class="form-control" placeholder="후기의 내용을 자유롭게 작성해주세요" required="required" style="padding-left:10px; font-size: 20px;"></textarea>
				</div>
				
				<input type="hidden" name="bno" value="2">
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
