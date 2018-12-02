<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
						<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">후기 상세</h3>
				</div>
			    <!-- 후기 게시판 상단 Nav 바 (새글 등록, 검색 기능) -->
				<div class="card-body m-lr-50" >
                    <table class="table" style="font-size: 0.9em;">
                      <colgroup>
                        <col width="18%">
                        <col width="32%">
                        <col width="18%">
                        <col width="32%">
                      </colgroup>
                      <tr>
                        <td style=" text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>제목</b>
                        </td>
                        
                        <td>
                        ${review.title }
                        </td>
                        <td style="text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>작성자</b>
                        </td>
                        
                        <td>
                        ${review.userid }
                        </td>
                      </tr>
                      
                      <tr>
                        <td style="text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>최종수정일</b>
                        </td>
                        <td>
                        <fmt:formatDate pattern="yyyy-mm-dd" value="${review.regdate }"/>
                        </td>
                        
                        <td style="text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>조회수</b>
                        </td>
                        <td>
                        <!-- 조회수 동적으로 불러오는 부분 -->
                        </td>
                      </tr>
                      
                      <tr>
                        <td colspan="4">
                          <!-- 게시물 내용 동적으로 불러오는 부분 -->
                          <div id="reviewDetailContent" style="height: 300px;">
                          ${review.content }
                          </div>
                        </td>
                      </tr>
                    </table>
					<br>
					<div>
					<!-- 글쓴이와 보고있는사람 아이디 일치할경우 -->
					<sec:authentication var="loginId" property="principal.member.userid" /><!-- 로그인한사람 id값 변수로 저장 -->
					<c:set var="writer" value="${review.userid }"/>
					<c:if test="${writer eq loginId }">
					아이디같다고ㅡㅡ
                        <a class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton" href="/review/list">목록</a>
                        <!-- 해당 아이디인 경우에만 확인할 수 있도록 작성 -->
 						<button type="button" class="float-r" style="height:35px;" id="updateReviewBtn" data-toggle="modal" data-target="#updateReviewModal">수정</button><span class="float-r">&nbsp;&nbsp;</span>
						<button type="button" class="float-r" style="height:35px;" id="deleteReviewBtn" data-toggle="modal" data-target="#deleteReviewModal">삭제</button>
					</c:if>
					<!-- 글쓴이이외의 사람 -->
                        <a class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton" href="/review/list">목록dl</a>
					</div>
				</div>
			</div>
	</div>
</section>

  <!-- 후기 수정 Modal HTML -->
  <div id="updateReviewModal" class="modal fade">
		<div class="modal-dialog modal-login">
		  <div class="modal-content">
			<div class="modal-header">        
			  <h4 class="modal-title">후기 내용 수정</h4>
			</div>
			<div class="modal-body">
			  <form action="/review/modify" method="get">
				<div class="form-group">
				  <input type="text" name="title" class="form-control " required="required" style="padding-left:10px;" value="${review.title }">
				</div>
				
				<div class="form-group">
				  <input type="password" name="article_pw" class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
				</div>
				
				<div class="form-group">
					<textarea rows="10" cols="50" class="form-control" name="content" required="required" style="padding-left:10px; font-size: 20px;">${review.content }</textarea>
				</div>
				
				<input type="hidden" name="article_num" value="${review.article_num }">		  
				<input type="hidden" name="bno" value="2">
				<input type="hidden" name="${review.userid }">		  
				<div class="form-group" style="display: flex; align-items: center; justify-content: center;">
				  <input type="submit" class="" value="수정">&nbsp;
				  <button type="button" class="" value="취소"  data-dismiss="modal">취소</button>
				</div>
			  </form>       
			</div>
		  </div>
		</div>
	  </div>
    
  <!-- 후기 수정 Modal HTML -->
  <div id="updateReviewModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title"><img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;후기 수정</h4>
      </div>
      <div class="modal-body">
        <form action="/review/modify" method="post">
        <div class="form-group">
          <input type="text" class="form-control " required="required" style="padding-left:10px;" value="기존 제목 동적으로 불러옴">
        </div>
        
        <div class="form-group">
          <input type="password" class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
        </div>
        
        <div class="form-group">
          <textarea rows="10" cols="50" class="form-control" placeholder="후기의 내용을 자유롭게 작성해주세요" required="required" style="padding-left:10px; font-size: 20px;"></textarea>
        </div>
              
        <div class="form-group" style="display: flex; align-items: center; justify-content: center;">
          <input type="submit" class="" value="등록">&nbsp;
          <button type="button" class="" value="취소"  data-dismiss="modal">취소</button>
        </div>
        </form>       
      </div>
      </div>
    </div>
    </div>
    
     <!-- 후기 삭제 Modal HTML -->
  <div id="deleteReviewModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title"><img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;후기 삭제</h4>
      </div>
      <div class="modal-body">
        <form action="" method="post">
        <div class="fs-20 t-center">후기 등록 시, 입력했던 비밀번호를 입력하세요</div><br>
        <div class="fs-20 t-center" style="color: red; font-weight: bold;">&lt;주의&gt; 삭제 시, 복구할 수 없습니다!</div>
        <br>
        <br>
        <div class="form-group">
          <input type="password" class="form-control " placeholder="비밀번호 입력" required="required" style="padding-left:10px;">         
        </div>
        <br>
        <div class="form-group" style="display: flex; align-items: center; justify-content: center;">
          <input type="submit" class="" value="삭제">&nbsp;
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
