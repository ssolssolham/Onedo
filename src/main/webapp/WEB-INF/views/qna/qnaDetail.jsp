<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="en">
<head>
  <title>이용 문의</title>
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
  
  <section class="section-review">
		<div class= "container" style="max-width: 1500px;">

			<div class="card">
				<div class="card-body menu-title-div" >
						<img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">문의 상세</h3>
				</div>
			    <!-- 후기 게시판 상단 Nav 바 (새글 등록, 검색 기능) -->
				<div class="card-body m-lr-50" >
                    <table class="table" style="font-size: 1.9em;">
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
                        ${qna.title }
                        </td>
                        <td style="text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>작성자</b>
                        </td>
                        
                        <td>
                        ${qna.userid }
                        </td>
                      </tr>
                      
                      <tr>
                        <td style="text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>등록일</b>
                        </td>
                        <td>
                        ${qna.regdate }
                        </td>
                        
                        <td style="text-align: center; vertical-align: middle; color: #27b2a5;">
                          <b>답변여부</b>
                        </td>
                        <c:set var="replycnt" value="${qna.replycnt }"/>
                        <fmt:formatNumber value="${qna.replycnt }" type="number" var="replycnt" />
                        <c:if test="${replycnt eq 0 }">
						  <td>답변처리중</td>
						 </c:if>
						 <c:if test="${replycnt gt 0 }">
						   <td>답변완료</td>
						 </c:if>
                      </tr>
                      
                      <tr>
                        <td colspan="4">
                          <!-- 게시물 내용 동적으로 불러오는 부분 -->
                          <div id="reviewDetailContent" style="height: 300px;">
                          ${qna.content }
                          </div>
                        </td>
                      </tr>
                    </table>
					<br>
					
					
    		 <!-- /.panel -->
			<!-- 댓글영역 -->
		    <div class="panel panel-default">
		       <div class="panel-heading" style="color: #27b2a5; font-size:1.9em; font-weight: bold;">
		        <i class="fa fa-comments fa-fw"></i> 관리자 답변
		      </div> 
		      
		      <!-- /.panel-heading -->
		      <div class="panel-body">        
		        <ul class="chat">
		        </ul><!-- ./ end ul -->
		      </div><!-- /.panel .chat-panel -->
		
			</div> <!-- panel끝 -->
			
			<div class="float-r">
			<!-- 글쓴이와 보고있는사람 아이디 일치할경우 -->
                <button type="button" onclick="location.href='/qna/list'"
                   class="reviewDetailBtn btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">목록
                   </button><span class="float-r">&nbsp;&nbsp;</span>
			
			<sec:authentication var="loginId" property="principal.member.userid" /><!-- 로그인한사람 id값 변수로 저장 -->
			<c:set var="writer" value="${qna.userid }"/>
			<c:if test="${writer eq loginId }">
                <!-- 해당 아이디인 경우에만 확인할 수 있도록 작성 -->
                <button type="button" class="reviewDetailBtn btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton" id="updateQnaBtn" data-toggle="modal" data-target="#updateQnaModal">수정</button><span class="float-r">&nbsp;&nbsp;</span>
                <!-- <a class="reviewDetailBtn btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton"id="deleteQnaBtn" data-toggle="modal" data-target="#deleteQnaModal">삭제</a> -->
			</c:if>
			</div>
		</div> <!-- end of cardbody -->
		</div>
		</div>
</section>

<!-- 모달영역======================================================================== -->
  <!-- 문의 수정 Modal HTML -->
  <div id="updateQnaModal" class="modal fade">
		<div class="modal-dialog modal-login">
		  <div class="modal-content">
			<div class="modal-header">        
			  <h4 class="modal-title">문의 내용 수정</h4>
			</div>
			<div class="modal-body">
			  <form action="/qna/modify" method="get" id="qnaModForm">
				<div class="form-group">
				  <input type="text" name="title" value="${qna.title }"
				   class="form-control " required="required" style="padding-left:10px;">
				</div>
				
				<div class="form-group">
				  <input type="password" name="article_pw" id="inputPw" 
				  class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
				</div>
				
				<div class="form-group">
					<textarea name="content" rows="10" cols="50" class="form-control" 
					required="required" style="padding-left:10px; font-size: 20px;">${qna.content }</textarea>
				</div>
				
				<input type="hidden" name="article_num" value="${qna.article_num }">		  
				<input type="hidden" name="bno" value="3">
				<input type="hidden" name="${qna.userid }">		  
				<div class="form-group" style="display: flex; align-items: center; justify-content: center;">
				  <input type="submit" class="" value="수정">&nbsp;
				  <button type="button" class="" value="취소"  data-dismiss="modal">취소</button>
				</div>
			  </form> 
			</div>
		  </div>
		</div>
	  </div>
 
<%--       <!-- 문의 삭제 Modal HTML -->
  <div id="deleteQnaModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title"><img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;후기 삭제</h4>
      </div>
      <div class="modal-body">
        <form action="/qna/remove?article_num=${qna.article_num }" method="get" id="removeForm">
        <div class="fs-20 t-center">문의 등록 시, 입력했던 비밀번호를 입력하세요</div><br>
        <div class="fs-20 t-center" style="color: red; font-weight: bold;">&lt;주의&gt; 삭제 시, 복구할 수 없습니다!</div>
        <br>
        <br>
        <div class="form-group">
          <input type="hidden" name="article_num" value="${qna.article_num }">
          <input type="password" id="delInputPw" name="particle_pw" class="form-control " placeholder="비밀번호 입력" required="required" style="padding-left:10px;">         
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
 --%> 
    
  <!-- 댓글 Modal HTML -->
  <div id="replyModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
      
      <div class="modal-header">        
        <h4 class="modal-title"><img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;댓글</h4>
      </div>
      
      <div class="modal-body">
        
        <div class="form-group">
        	<label>댓글내용</label>
          	<input type="text" name="reply" class="form-control" placeholder="후기에 대한 댓글내용을 자유롭게 작성해주세요" 
          	required="required" style="padding-left:10px; font-size: 20px;"/>
        </div>
        <div class="form-group">
        	<label>작성자</label>
        	<input type="text" class="form-control" id="replyer" name="replyer" placeholder="${loginId }" readonly="readonly"
        	value="${loginId}" style="padding-left:10px; font-size: 20px;"/>
        </div>
        <div class="form-group">
        	<label>등록날짜</label>
        	<input class="form-control" name="replyDate" value=""
        	style="padding-left:10px; font-size: 20px;" />
        </div>
      </div><!-- end modal body -->
      <div class="modal-footer">
      <c:set var="replyer" value="" />
      <c:if test="${replyer eq loginId }">
      </c:if>	
      	<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
      	<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
      	<button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
      	<button id="modalCloseBtn" type="button" class="btn btn-default">닫기</button>
      </div>
      
      </div>
    </div>
   </div>

<!-- 댓글처리 관련 js파일 추가 by sw -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
	
		  var articleNumVal = '<c:out value="${qna.article_num}"/>';
		  var replyUL = $(".chat");
		  
		    showList(1);
		    
		function showList(page){
			
			console.log("show list " + page);
		    
		    replyService.getList({article_num:articleNumVal,page: page|| 1 }, function(replyCnt, list) {
		      
		    console.log("replyCnt: "+ replyCnt );
		    console.log("list: " + list);
		    console.log(list);
		    
		    if(page == -1){
		      pageNum = Math.ceil(replyCnt/10.0);
		      showList(pageNum);
		      return;
		    }
		      
		     var str="";
		     
		     if(list == null || list.length == 0){
		       return;
		     }

		     // 댓글리스트 크기만큼 li태그 추가(댓글 show)
		     for (var i = 0, len = list.length || 0; i < len; i++) {
		       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		       str +="  <div><div class='header'><strong style='color:#27b2a5; font-size:20px;' class='primary-font'>["
		    	   +(i+1)+"] 작성자 : "+list[i].replyer+"</strong>"; 
		       str +="    <small style='font-size:16px;' class='pull-right text-muted'>"
		           +replyService.displayTime(list[i].replyDate)+"</small></div>";
		       str +="<p style='font-size: 17px; color: black;'>"+list[i].reply+"</p></div></li>";
		     }
		     replyUL.html(str);
		     
		     showReplyPage(replyCnt);
		   });//end function
		 }//end showList
		    
		    var pageNum = 1;
		    var replyPageFooter = $(".panel-footer");
		    
		    function showReplyPage(replyCnt){
		      
		      var endNum = Math.ceil(pageNum / 10.0) * 10;  
		      var startNum = endNum - 9; 
		      
		      var prev = startNum != 1;
		      var next = false;
		      
		      if(endNum * 10 >= replyCnt){
		        endNum = Math.ceil(replyCnt/10.0);
		      }
		      
		      if(endNum * 10 < replyCnt){
		        next = true;
		      }

		      // 댓글영역 페이지네이션
		      var str = "<ul class='pagination pull-right'>";
		      if(prev){
		        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		      }
		      
		      for(var i = startNum ; i <= endNum; i++){
		        var active = pageNum == i? "active":"";
		        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		      }
		      
		      if(next){
		        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		      }
		      
		      str += "</ul></div>";
		      console.log(str);
		      replyPageFooter.html(str);
		    }
		     
		    // 페이지 클릭시 이벤트 추가
		    replyPageFooter.on("click","li a", function(e){
		       e.preventDefault();
		       console.log("page click");
		       
		       var targetPageNum = $(this).attr("href");
		       pageNum = targetPageNum;
		       showList(pageNum);
		     });     

		   
		    var modal = $("#replyModal");
		    var modalInputReply = modal.find("input[name='reply']");
		    var modalInputReplyer = modal.find("input[name='replyer']");
		    var modalInputReplyDate = modal.find("input[name='replyDate']");
		    
		    var modalModBtn = $("#modalModBtn");
		    var modalRemoveBtn = $("#modalRemoveBtn");
		    var modalRegisterBtn = $("#modalRegisterBtn");
		    
		    // 닫기버튼
		    $("#modalCloseBtn").on("click", function(e){
		    	modal.modal('hide');
		    });
		    
		    // 댓글추가버튼(new Reply)
		    $("#addReplyBtn").on("click", function(e){
		      modal.find("input").val("");
		      modalInputReplyDate.closest("div").hide();
		      modal.find("button[id !='modalCloseBtn']").hide();
		      modalRegisterBtn.show();
		      $("#replyModal").modal("show");
		    });
		

	// 문의글 수정
	$("#qnaModForm").submit(function() {
		var passwd = "${qna.article_pw}";
		var inputPw = $("input[name=article_pw]").val();
		
		if(passwd != inputPw){
			alert("비밀번호가 일치하지 않습니다:(");
			return false;
		}else{
			return true;
		}
	});

	var modRes = '${qnaModRes}';
	if(modRes === 'success'){
		var target = $("#snackbar");
		target.text("문의글을 수정하였습니다:D");
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
<!-- toast msg영역 -->
<div id="snackbar"></div>

</body>
</html>
