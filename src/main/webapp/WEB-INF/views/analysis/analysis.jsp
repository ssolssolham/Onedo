<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>분석</title>
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
  
	<section id="analysis_section">
		<div class="container" style="max-width: 1500px;">
          <div class="card">
            <div class="card-body menu-title-div" >
              <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">상권 분석하기</h3>
            </div>
            <div class="card-body">
              <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">원하는 조건을 입력하신 후, 상권 분석을 진행하세요!</span>
              <br>
              <br>
    			<div class="row">
    				<div class="col-sm-4" style="max-width:25%;">
    					<div class="card" style="width: 100%; margin-left:22px;">
    						<div class="card-body">
    							<div class="form-group">
    								<h2 class="card-title fw-b">Step 1. 구 선택</h2>
    								<select class="form-control" id="districtSelect">
    									<option default>전체</option>
    									<option>강남구</option>
    									<option>강동구</option>
    									<option>강북구</option>
    									<option>강서구</option>
    									<option>관악구</option>
    									<option>광진구</option>
    									<option>구로구</option>
    									<option>금천구</option>
    									<option>노원구</option>
    									<option>도봉구</option>
    									<option>동대문구</option>
    									<option>동작구</option>
    									<option>마포구</option>
    									<option>서대문구</option>
    									<option>서초구</option>
    									<option>성동구</option>
    									<option>성북구</option>
    									<option>송파구</option>
    									<option>양천구</option>
    									<option>영등포구</option>
    									<option>용산구</option>
    									<option>은평구</option>
    									<option>종로구</option>
    									<option>중구</option>
    									<option>중량구</option>
    								</select>
    							</div>
    							<br>
    							<div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
    							<br>
    							<div class="form-group">
    								<h2 class="card-title fw-b">Step 2. 동 선택</h2>
                                    <!-- Filter -->
                                    <div class="panel-filter w-full p-t-10">
                                      <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-lr-15-sm" id="vilFilter">
                                        <div class="filter-col1" id="filterColumn1">
                                        </div>
                            
                                        <div class="filter-col2 m-lr-8" id="filterColumn2">
                                        </div>
                            
                                        <div class="filter-col3 m-r-8" id="filterColumn3">
                                        </div>
                            
                                        <div class="filter-col4 m-l-2" id="filterColumn4">
                                        </div>
                                      </div>
                                    </div>
    							</div>
    							<div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
    							<br>
    							<div class="form-group">
    								<h2 class="card-title fw-b">Step 3. 상권 유형 선택</h2><br>
    								<div id="regionFilter">
                                        <button style="width: 100%;" class="m-b-10 villageBtn">주택가</button>
                                        <button style="width: 100%;" class="m-b-10 villageBtn">대학가</button>
                                        <button style="width: 100%;" class="m-b-10 villageBtn">유흥가</button>
                                        <button style="width: 100%;" class="m-b-10 villageBtn">역세권</button>
                                        <button style="width: 100%;" class="m-b-10 villageBtn">오피스</button>
                                    </div>
                                    <div style="font-size: 18px; height: 50px;" id="regionDetail">
                                    </div>
    							</div>
    							<div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
                                <br>
    							<div class="form-group">
    								<h2 class="card-title fw-b">Step 4. 상권 검색 우선순위</h2>
    								<div id="priorityFilter">
                                      <button style="width: 100%;" class="m-b-10 villageBtn">예상매출액 우선</button>
                                      <button style="width: 100%;" class="m-b-10 villageBtn">창업안전도 우선</button>
                                    </div>
    							</div>
    							<div class="form-group">
    								<button type="button" style="float: left;" id="analysisStartBtn">분석하기</button>
                                    <button type="button" style="float: right;" id="resetFilterBtn">초기화</button>
    							</div>
    						</div>
    					</div>
    				</div>
    				<div class="col-sm-8">
    					<div style="width: 100%; height: 648.5px; border:1px solid black; background-color: white;" id="mapArea" class="card-body">다음지도 API</div>
    				</div>
    			</div>
            </div>
            <!-- 분석 결과 비동기로 출력 해주는 부분 -->
            <div class="card-body" id="analysisResult">
              <div class="card-body menu-title-div" >
                <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">분석 결과 확인</h3>
              </div>
              <br>
              <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">조건에 맞는 상권 추천과 해당 상권에 대한 분석 정보입니다!</span><br>
              <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">내용을 확인하시고, 대출 연계 서비스 까지 진행해보세요!</span>
              <br>
              <br>
              <div style="text-align:center;">
                <button style="width:18%;" type="button" id="result1Btn">강남구 역삼동 골목상권</button>
                <button style="width:18%;" class="m-lr-20" type="button" id="result2Btn">광진구 자양동 골목상권</button>
                <button style="width:18%;" type="button" id="result3Btn">금천구 가산동 골목상권</button>
              </div>
              
              <!-- 상권 종합 분석 탭 -->
              <div class="card-body m-lr-22">
               야레야레
              </div>
              
              <!-- 상권 상세 분석 탭 -->
              <div class="card-body m-lr-22">
                야레야레2
              </div>
              
              
              <!-- 부동산 매물 및 대출연계 탭 -->
              <div class="card-body">
                <div class="w-half">
                다음 지도여~~~~~~~
                </div>
                야레야레3
              </div>
              
            </div>
          </div>
		</div>
	</section>

	<section>
		<div class="container" style="margin-top: 40px;">
			<h4><b>강남구 역삼동</b></h4>
			<div class="row" style="margin-top: 25px;">
				<div class="col">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> </div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>  </div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> </div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 25px;">
				<div class="col">
					<canvas id="myBarChart" width="100%;" height="100%;"></canvas>
				</div>
				<div class="col">
					<canvas id="myLineChart" width="100%;" height="100%;"></canvas>
				</div>
			</div>
			<div class="row" style="margin-top: 25px;">
				<div class="col"></div>
				<div class="col"><button type="button" style="width: 100%;" class="" onclick="location.href='/inputInfo/'"">맞춤 대출 상품 확인</button></div>
				<div class="col"></div>
			</div>
		</div>
	</section>

	<script>
		var ctxBar = document.getElementById("myBarChart").getContext('2d');
		var myBarChart = new Chart(ctxBar, {
			type: 'bar'
			, data: {
				labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
				, datasets: [{
					label: '# of Votes'
					, data: [12, 19, 3, 5, 2, 3]
					, backgroundColor: [
				'rgba(255, 99, 132, 0.2)'
				, 'rgba(54, 162, 235, 0.2)'
				, 'rgba(255, 206, 86, 0.2)'
				, 'rgba(75, 192, 192, 0.2)'
				, 'rgba(153, 102, 255, 0.2)'
				, 'rgba(255, 159, 64, 0.2)'
			]
					, borderColor: [
				'rgba(255,99,132,1)'
				, 'rgba(54, 162, 235, 1)'
				, 'rgba(255, 206, 86, 1)'
				, 'rgba(75, 192, 192, 1)'
				, 'rgba(153, 102, 255, 1)'
				, 'rgba(255, 159, 64, 1)'
			]
					, borderWidth: 1
		}]
			}
			, options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
			}]
				}
			}
		});
		var ctxLine = document.getElementById("myLineChart").getContext('2d');
		var myLineChart = new Chart(ctxLine, {
			type: 'line'
			, data: {
				labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
				, datasets: [{
					label: '# of Votes'
					, data: [12, 19, 3, 5, 2, 3]
					, backgroundColor: [
				'rgba(255, 99, 132, 0.2)'
				, 'rgba(54, 162, 235, 0.2)'
				, 'rgba(255, 206, 86, 0.2)'
				, 'rgba(75, 192, 192, 0.2)'
				, 'rgba(153, 102, 255, 0.2)'
				, 'rgba(255, 159, 64, 0.2)'
			]
					, borderColor: [
				'rgba(255,99,132,1)'
				, 'rgba(54, 162, 235, 1)'
				, 'rgba(255, 206, 86, 1)'
				, 'rgba(75, 192, 192, 1)'
				, 'rgba(153, 102, 255, 1)'
				, 'rgba(255, 159, 64, 1)'
			]
					, borderWidth: 1
		}]
			}
			, options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
			}]
				}
			}
		});
	</script>
    
    <script type="text/javascript">
    // 동 필터 선택 시 보이는 효과
      $('.js-show-filter').on('click',function(){
          $(this).toggleClass('show-filter');
          $('.panel-filter').slideToggle(400);
  
          if($('.js-show-search').hasClass('show-search')) {
              $('.js-show-search').removeClass('show-search');
              $('.panel-search').slideUp(400);
          }    
      });
    
    	$('#districtSelect').change(function() {
    		// 이벤트를 연결
    		
    		var target = document.getElementById('districtSelect');
    		var selectedDistrict = target.options[target.selectedIndex].text;
    		// 구가 변하면 필터 초기화 하기 위함
    		for(var i = 1; i <=4; i++) {
    			$('#filterColumn' + i).empty();
    		}
    		
    		var strictArray = ['서초동', '역삼동', '선릉동', '삼성동', '청담동', '역삼1동'];
    		if(selectedDistrict === '강남구') {
				for(var i = 0; i < strictArray.length; i++) {
					if((i % 4) == 0) {
						$('#filterColumn1').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ strictArray[i] + '</button>');
					} else if ((i % 4) == 1) {
						$('#filterColumn2').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ strictArray[i] + '</button>');
					} else if ((i % 4) == 2) {
						$('#filterColumn3').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ strictArray[i] + '</button>');
					} else {
						$('#filterColumn4').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ strictArray[i] + '</button>');
					}
				}
				
				$('#mapArea').css('height', $('.col-sm-4').height());
    		}
    		
    		// 동 생성 완료 후 
    		$('#vilFilter').find('button').click(function(){
    			// 클릭을 했는데 active 되어 있지 않으면 -> 활성화
    			if(!($(this).hasClass('active'))) { 
    		  		$(this).addClass('active');
    		  	} 
    			// 클릭을 했는데 활성화가 되어있으면,
    			else { 
    		   		$(this).removeClass('active');
    		  	}
    		});
    		
    		$('#regionFilter').find('button').click(function(){
    			 if(!($(this).hasClass('active'))) { // 클릭을 했는데 active 되어 있지 않으면 -> 활성화
    				 $('#regionDetail').text('');
    				 if($(this).text() === '주택가') {
    					 $('#regionDetail').text('거주인구가 많은 지역을 추천');
    				 } else if($(this).text() === '대학가') {
    					 $('#regionDetail').text('대학가 및 20대가 많은 지역을 추천');
    				 } else if($(this).text() === '유흥가') {
    					 $('#regionDetail').text('유흥 지출이 많은 지역을 추천');
    				 } else if($(this).text() === '역세권') {
    					 $('#regionDetail').text('교통 지출이 많은 지역을 추천');
    				 } else if($(this).text() === '오피스') {
    					 $('#regionDetail').text('직장인이 많은 지역, 회사 밀집 지역을 우선으로 추천');
    				 }
    				 
    				 $('#regionFilter').children().removeClass('active');
  				     $(this).addClass('active');
  				     /* switch($(this).attr('id')) {
  				      case 'Wedding':   productTPO = 'wedding';  break;
  				      case 'Meeting':   productTPO = 'meeting';  break;
  				      case 'Interview': productTPO = 'interview'; break;
  				      case 'Date':      productTPO = 'date';   break;
  				      default :         productTPO = null;   break;
  				      }*/
			  	} else { // 클릭을 했는데 활성화가 되어있으면,
    				 $(this).removeClass('active');
			  	}
    		})
    		
    		$('#priorityFilter').find('button').click(function(){
    			 if(!($(this).hasClass('active'))) { // 클릭을 했는데 active 되어 있지 않으면 -> 활성화
    				 $('#priorityFilter').children().removeClass('active');
  				     $(this).addClass('active');
  				     /* switch($(this).attr('id')) {
  				      case 'Wedding':   productTPO = 'wedding';  break;
  				      case 'Meeting':   productTPO = 'meeting';  break;
  				      case 'Interview': productTPO = 'interview'; break;
  				      case 'Date':      productTPO = 'date';   break;
  				      default :         productTPO = null;   break;
  				      }*/
			  	} else { // 클릭을 했는데 활성화가 되어있으면,
    				 $(this).removeClass('active');
			  		
			  	}
    		})
    		
    		
    	})
    	
    	
    </script>
    
<script type="text/javascript">
// 초기화 버튼 클릭 시, 발생하는 이벤트
// 필터에서 active 되어 있던 버튼들 모두 초기화
$('#resetFilterBtn').click(function() {
	for(var i = 1; i <= 4; i++) {
		$('#filterColumn' + i).children().removeClass('active');
	}
	
	$('#regionFilter').children().removeClass('active');
	$('#priorityFilter').children().removeClass('active');
})

// 분석하기 버튼 클릭 시, 발생하는 이벤트(필터에서 검색한 변수들을 Ajax 통신을 위해 변수로 저장)
$('#analysisStartBtn').click(function() {
	// 동 버튼들을 모두 불러옴
	var vilList = $('#vilFilter').children().children();
	// 클릭된 동들을 변수로 가져오기 위해 Array 선언
	var activeVillageList = [];
	for (var i = 0; i < vilList.length; i++) {
		if(vilList[i].classList.contains('active') === true) {
			activeVillageList.push(vilList[i].textContent);
	    }
	}
	
	// 선택한 지역 유형 타입 변수로 저장
	var regionTypeList = $('#regionFilter').children();
	var activeRegionType;
	for(var i = 0; i < regionTypeList.length; i++) {
		if(regionTypeList[i].classList.contains('active') === true) {
			activeRegionType = regionTypeList[i].textContent;
		}
	}
	
	// 선택한 우선순위 변수로 저장
	var priorityList = $('#priorityFilter').children();
	var priority;
	for(var i = 0; i < priorityList.length; i++) {
		if(priorityList[i].classList.contains('active') === true) {
			priority = priorityList[i].textContent;
		}
	}
	
	console.log('클릭된 동 리스트 : ' + activeVillageList);
	console.log('클릭된 지역 유형 : ' + activeRegionType);
	console.log('클릭된 우선순위 : ' + priority);
})
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