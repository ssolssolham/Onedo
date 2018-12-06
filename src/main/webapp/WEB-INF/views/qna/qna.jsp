<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
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
						<select style="height: 35px; text-align: center; width: 10%; display: inline" class="form-control form-control-sm">
							<option default>전체</option>
							<option>최신순</option>
							<option>조회순</option>
						</select>
						<input type="text" style="vertical-align: top; width: 15%; height: 35px; display: inline;" class="form-control" id="searchValue" name="searchValue">
						<button type="button" style="vertical-align: top; height:35px; width: 10%;" class="" id="reviewSearchBtn" >검색</button>
                        <button type="button" class="float-r" style="height: 35px;"id="createQnaBtn" data-toggle="modal" data-target="#createQnaModal">문의작성</button>
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
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
								<tr>
									<td style="text-align:center;">1</td>
									<td style="text-align:left; padding-left: 7px;">테스트</td>
									<td style="text-align:center;">bangry</td>
									<td style="text-align:center;">2018.11.25</td>
									<td style="text-align:center;">1</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="table-nav-bar">
							
						</div>
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
			  <form action="" method="post">
				<div class="form-group">
				  <input type="text" class="form-control " placeholder="제목 입력" required="required" style="padding-left:10px;">
				</div>
				
				<div class="form-group">
				  <input type="password" class="form-control " placeholder="비밀번호 입력(수정, 삭제 시 이용)" required="required" style="padding-left:10px;">         
				</div>
				
				<div class="form-group">
					<textarea rows="10" cols="50" class="form-control" placeholder="후기의 내용을 자유롭게 작성해주세요" required="required" style="padding-left:10px;"></textarea>
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
</body>
</html>
