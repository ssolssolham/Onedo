<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="en">
<head>
  <title>이용 후기</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 비동기통신 토큰값 저장...(reply.js의 add에서 사용) -->
  <sec:csrfMetaTags/>
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
                          <b>등록일</b>
                        </td>
                        <td>
                        <fmt:parseDate pattern="yyyy-mm-dd" value="${review.regdate }"/>
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
                    <a href="/review/list"
                       class="reviewDetailBtn btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">목록
                       </a><span class="float-r">&nbsp;&nbsp;</span>
					
					<sec:authentication var="loginId" property="principal.member.userid" /><!-- 로그인한사람 id값 변수로 저장 -->
					<c:set var="writer" value="${review.userid }"/>
					<c:if test="${writer eq loginId }">
                        <!-- 해당 아이디인 경우에만 확인할 수 있도록 작성 -->
                        <a class="reviewDetailBtn btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton" id="updateReviewBtn" data-toggle="modal" data-target="#updateReviewModal">수정</a><span class="float-r">&nbsp;&nbsp;</span>
                        <a class="reviewDetailBtn btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton"id="deleteReviewBtn" data-toggle="modal" data-target="#deleteReviewModal">삭제</a>
					</c:if>
					</div>
					<br><br>
     <!-- /.panel -->
<!-- 댓글영역 -->
    <div class="panel panel-default">
       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> 
      
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button><br>
      </div>      
      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">

        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

	<div class="panel-footer"></div>
 
 					
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
    
     <!-- 후기 삭제 Modal HTML -->
  <div id="deleteReviewModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title"><img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;후기 삭제</h4>
      </div>
      <div class="modal-body">
        <form action="/review/remove?article_num=${review.article_num }" method="get">
        <div class="fs-20 t-center">후기 등록 시, 입력했던 비밀번호를 입력하세요</div><br>
        <div class="fs-20 t-center" style="color: red; font-weight: bold;">&lt;주의&gt; 삭제 시, 복구할 수 없습니다!</div>
        <br>
        <br>
        <div class="form-group">
          <input type="hidden" name="article_num" value="${review.article_num }">
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




	


<!-- 댓글처리 관련 js파일 추가 by sw -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		  
		  var articleNumVal = '<c:out value="${review.article_num}"/>';
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
		     
		     for (var i = 0, len = list.length || 0; i < len; i++) {
		       str +="<li class='left clearfix' data-rno='"+(i+1)+"'>";
		       str +="  <div><div class='header'><strong class='primary-font'>["
		    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
		       str +="    <small class='pull-right text-muted'>"
		           +replyService.displayTime(list[i].replyDate)+"</small></div>";
		       str +="    <p>"+list[i].reply+"</p></div></li>";
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
		     
		    replyPageFooter.on("click","li a", function(e){
		       e.preventDefault();
		       console.log("page click");
		       
		       var targetPageNum = $(this).attr("href");
		       
		       console.log("targetPageNum: " + targetPageNum);
		       
		       pageNum = targetPageNum;
		       
		       showList(pageNum);
		     });     

		   
		    var modal = $(".modal");
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
		    
			// 댓글등록 이벤트
		    modalRegisterBtn.on("click",function(e){
		      alert("댓추가할거"+modalInputReply.val()+"작성자: "+$('#replyer').val()+"게시글번호: "+articleNumVal);
		      var reply = {
		            reply: modalInputReply.val(),
		            replyer:$('#replyer').attr('value'),
		            article_num:articleNumVal
		            //,_csrf.headerName:${_csrf.token}
		          };
		      replyService.add(reply, function(result){
		        
		        alert(result);
		        
		        modal.find("input").val("");
		        modal.modal("hide");
		        
		        //showList(1);
		        showList(1);
		        
		      });
		      
		    });


		  //댓글 조회 클릭 이벤트 처리 
		    $(".chat").on("click", "li", function(e){
		      
		      var rno = $(this).data("rno");
		      replyService.get(rno, function(reply){
		      	alert(reply.reply);
		        modalInputReply.val(reply.reply);
		        modalInputReplyer.val(reply.replyer);
		        modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
		        .attr("readonly","readonly");
		        modal.data("rno", reply.rno);
		        
		        modal.find("button[id !='modalCloseBtn']").hide();
		        // replyer와 loginId가 같으면 수정삭제버튼 show, 
		        var loginId = '${loginId}';
				alert("로그인아이디: "+loginId+"\n댓글작성자: "+reply.replyer);		        
		        if(reply.replyer == loginId){
		        	alert("댓작성자랑 로그인자랑 같아요");
		        	modalModBtn.show();
		        	$("#replyModal").modal("show");
		        	// modalRemoveBtn.show();
		        }else{
		        	modalInputReply.attr("readonly", "readonly");
		        }
		        ///////////////
		        $("#replyModal").modal("show");
		            
		      });
		    });
		 
			// 댓글수정버튼 클릭이벤트
		    modalModBtn.on("click", function(e){
		    	  
		   	  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		   	  //alert("댓..:"+reply.relyer);
		   	  replyService.update(reply, function(result){
		   	        
		   	    alert(result);
		   	    modal.modal("hide");
		   	    showList(pageNum);
		   	    
		   	  });
		   	  
		   	});

			// 삭제버튼클릭이벤트
		   	modalRemoveBtn.on("click", function (e){
		   	  var rno = modal.data("rno");
		   		alert("댓글을 정말로 삭제하시겠습니까?" + rno);
		   	  
		   	  
		   	  replyService.remove(rno, function(result){
		   	        
		   	      alert(result);
		   	      modal.modal("hide");
		   	      showList(pageNum);
		   	      
		   	  });
		   	  
		   	});

		 
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

</body>
</html>
