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
        <!-- 필터랑 다음 지도 있는 부분 -->
        <div class="card-body">
          <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">원하는 조건을 입력하신 후, 상권 분석을 진행하세요!</span>
          <br>
          <br>
          <div class="row">
            <div class="col-sm-4" >
              <div class="card" style="width: 100%; min-height: 670px; margin-left:22px;">
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
                      <option>중랑구</option>
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
                  </div>
                  <div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
                  <br>
                  <div class="form-group">
                    <button type="button" style="width: 49%; float: left;" id="analysisStartBtn">분석하기</button>
                    <button type="button" style="width: 49%; float: right;" id="resetFilterBtn">초기화</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- 다음 지도 올 곳임 -->
            <div class="col-sm-8">
            <div id="map_wrap">
              <div style="width: 99%; height: 670px; border:1px solid black; background-color: white;" id="map" class="card-body"></div>
              	<div class="category">
	       			 <ul id="category">
				        <li id="CE7" data-order="4"> 
				            <span class="category_bg cafe"></span>
				            카페
				        </li>  
				    </ul>
   				</div>
           </div>
        </div>
        </div>
        <!-- 분석 결과 비동기로 출력 해주는 부분 -->
        <div class="card-body dis-none" id="analysisResult">
          <div class="card-body menu-title-div" >
            <img src="${pageContext.request.contextPath}/resources/images/icons/KEBLogo.png" style="width: 35px;">&nbsp;&nbsp;<h3 style="font: bold 30px a드림고딕4; vertical-align: middle; display: inline;">분석 결과 확인</h3>
          </div>
          <br>
          <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">조건에 맞는 상권 추천과 해당 상권에 대한 분석 정보입니다!</span><br>
          <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">내용을 확인하시고, 대출 연계 서비스 까지 진행해보세요!</span>
          <br>
          <br>
          <br>
          <div style="text-align:center;" id="analysisResultBtnList"> <!-- 분석 결과로 나오는 버튼 3개 -->
            <button style="width:25%;" class="resultBtn" type="button" id="firstBtn"></button>
            <button style="width:25%;" class="resultBtn m-lr-20" type="button" id="secondBtn"></button>
            <button style="width:25%;" class="resultBtn" type="button" id="thirdBtn"></button>
          </div>
          <br>
          <br>
          <section class="section-analysis dis-none" id="analysisReport">
            
            <div class="card-body" style="padding-bottom: 0px;"> <!-- 결과 분석 후 나온 상권3개 버튼 클릭 시, 나타나는 탭 메뉴 시작 부분 -->
              <div id="Navigation" >
                <ul id="primary">
                  <li><a href="#Navigation" class="active">상권 종합 분석</a></li>
                  <li><a href="#Navigation" class="">상권 상세 분석</a></li>
                  <li><a href="#Navigation" class="">부동산 매물 확인</a></li>
                </ul>
              </div>
            <div class="tab-bottom-bar"></div>
            
            
            <!-- 분석 후 동적으로 나타나는 3개의 탭 저장하는 Container -->
            <div id="Container">
              <div id="Content">
                  <!-- 상권 종합 분석 결과 tab --> 
                  <div id="totalAnalysis" class="card-body bg1-pattern">
                    <br>
                    <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">종합 분석 결과</span><br><br><br>
                    <!-- 종합 분석 결과 수치 데이터 들어가는 곳 -->                        
                    <div class="" style="font-family: a드림고딕4; padding: 20px;  background-color: white; max-width: 1400px; height: 500px; margin-right: 20px; margin-left: 20px; border-radius: 5px;"> 
                      <div class ="t-center" style="font-size: 3.0em;">분석일자 : <span style="color: #27b2a5;">2018.12.12</span></div><br>
                      <div class="t-center" style="font-size: 3.0em;"><b> ※ 예상 매출액은 해당 상권의 카페업종들에 대한 Data를 기반으로 분석하였습니다.</b></div><br>
                      <div class="t-center" style="font-size: 3.0em;">
                        <span style="color: #27b2a5;" id="resultDistrict"></span> 
                        <span style="color: #27b2a5;" id="resultVillage"></span> 
                        <span style="color: #27b2a5;" id="resultAlleyBiz"></span> 골목상권 카페 업종
                      </div>
                      <br><br>
                      <div class="col-sm-6 t-center" > <!-- 종합 분석 결과 수치데이터 Column 1 -->
                        <div style="font-size: 4.0em;"><b>&lt;카페 컨셉 추천&gt;</b></div><br><br>
                        <div style="font-size: 3.0em;"><span style="color: #27b2a5;">강남</span>구 주택가 지역 카페는<br>
                        <span style="color: #27b2a5;">20</span>대 유동인구가 많고, <br>
                        특히 00의 소득 매출이 높아<br>
                        <span style="color: #27b2a5;">00, 00, 00</span> 등의 컨셉을 추천합니다.</div>
                      </div>
                      
                      <div class="col-sm-6 t-center"> <!-- 종합 분석 결과 수치데이터 Column 2 -->
                        <div style="font-size: 4.0em;">&lt;예상 매출액&gt;<br><br>
                            <span style="color: #27b2a5;" id="expectedSalesAccount"></span> 만원
                        </div>
                      </div>
                    </div>
                    <br>
                    <br>
                    <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">해당 상권의 지도</span><br><br><br>
                    <!-- 지도 API 들어가는 곳 -->
                    <div style="background-color: white; height: 500px; border-radius: 5px;  max-width: 1400px; margin-right: 20px; margin-left: 20px;" id="staticMap">
                    </div>
                    <br>
                    <!-- 종합 분석 결과 5대 지표 확인 -->
                      <br>
                      <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">창업 5대 지표 사항 분석</span><br><br><br>
                      <!-- 첫번째 행 도넛 형 차트 -->
                      <div class="" style="font-family: a드림고딕4; padding: 20px; background-color: white; max-width: 1400px; margin-right: 20px; margin-left: 20px; border-radius: 5px;">
                        <div class="row" style="margin-top: 20px; margin-bottom: 20px;">
                          <!-- 창업 안전도 차트 -->
                          <div class="col-sm-4">
                              <canvas id="safeChart" width="100%;"></canvas>
                          </div>
                          
                          <!-- 성장 가능성 차트 -->
                          <div class="col-sm-4">
                              <canvas id="potentialChart" width="100%;"></canvas>
                          </div>
                          
                          <!-- 종합 평가 점수 -->
                          <div class="col-sm-4 t-center" style="font-family: a드림고딕4">
                            <div style=" font-size: 4.0em;">&lt;종합 평가 점수&gt;<br>
                            <span style="color: #27b2a5;" id="expectedTotalEstimateScore"></span> 점
                            </div>
                          </div>
                        </div>
                        
                        <!-- 두번째 행 도넛 형 차트 -->
                        <div class="row">
                          <!-- 활성도 차트 -->
                          <div class="col-sm-4">
                              <canvas id="activationChart" width="100%;"></canvas>
                          </div>
                          
                          <!-- 창업위험지수 차트 -->
                          <div class="col-sm-4">
                              <canvas id="dangerChart" width="100%;"></canvas>
                          </div>
                          
                          <!-- 과밀지수 차트 -->
                          <div class="col-sm-4">
                              <canvas id="densityChart" width="100%;"></canvas>
                          </div>
                        </div>
                      </div>
                    <br>
                    <br>
                    <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">창업 시 5개의 지표 분석</span><br><br><br>
                    <!-- 메인 방사형, 서브 방사형 지표 -->
                    <div class="" style="background-color: white; font-family: a드림고딕4; padding: 20px; color: white; max-width: 1400px; margin-right: 20px; margin-left: 20px; border-radius: 5px;">
                      <div class="container" style="margin-top: 20px; padding-top: 20px; border-radius: 5px; padding-bottom: 20px;">
                        <div class="col-sm-12">
                          <canvas id="mainRadarChart" width="100%;"></canvas>
                        </div>
                      </div>
                      </div>
                    <br>
                    <br>
                    <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">분석 결과 도출된 상권의 예상 매출액 분석</span><br><br><br>
                    <!--  막대 그래프 -->
                    <div class="" style="background-color: white; font-family: a드림고딕4; padding: 20px; color: white; max-width: 1400px; margin-right: 20px; margin-left: 20px; border-radius: 5px;">
                      <div class="row" style="margin-top: 20px;">
                          <!-- 3개 상권의 예상 매출액 막대형 그래프 -->
                          <div class="col-sm-12">
                              <canvas id="salesAmountChart" width="100%;"></canvas>
                          </div>
                      </div>
                    </div>
                  </div>
                  
                  <!-- 상권 상세 분석 결과 tab -->
                  <div id="detailAnalysis" class="card-body bg1-pattern" style="display: none;">
                    <div class="container">
                    <!-- 3개 상권 비교분석 결과 테이블 -->
                    <div class="row">
                    <br>
                    <br>
                    <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">해당 상권의 부대시설 갯수</span>
                    <br>
                    <br>
                      <table class="table table-bordered" style="text-align: center;">
                        <tbody>
                          <tr>
                              <th>아파트단지 수</th>
                              <th>집객시설 수</th>
                              <th>관공서 수</th>
                              <th>은행 수</th>
                              <th>종합병원 수</th>
                              <th>일반병원 수</th>
                              <th>약국 수</th>
                          </tr>
                          <tr>
                              <td>5000</td>
                              <td>4000</td>
                              <td>5000</td>
                              <td>2000</td>
                              <td>2000</td>
                              <td>2000</td>
                              <td>2000</td>
                          </tr>
                          <tr>
                              <th>유처원 수</th>
                              <th>초등학교 수</th>
                              <th>중학교 수</th>
                              <th>고등학교 수</th>
                              <th>대학교 수</th>
                              <th>백화점 수</th>
                              <th>슈퍼마켓 수</th>
                          </tr>
                          <tr>
                              <td>5000</td>
                              <td>4000</td>
                              <td>5000</td>
                              <td>2000</td>
                              <td>2000</td>
                              <td>2000</td>
                              <td>2000</td>
                          </tr>
                          <tr>
                              <th>극장 수</th>
                              <th>숙박 시설 수</th>
                              <th>공항 수</th>
                              <th>철도역 수</th>
                              <th>버스 터미널 수</th>
                              <th></th>
                              <th></th>
                          </tr>
                          <tr>
                              <td>5000</td>
                              <td>4000</td>
                              <td>5000</td>
                              <td>2000</td>
                              <td>2000</td>
                              <td></td>
                              <td></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <br>
                    <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">유동 인구 지표</span>

                      <!-- 유동인구 지표 -->
                      '<div class="row">
                        <!-- 성별 유동인구 -->
                        <div class="col-sm-6">
                          <canvas width="100%" id="populationChart"></canvas>
                        </div>
                        <!-- 요일별 유동인구 -->
                        <div class="col-sm-6">
                          <canvas width="100%" id="dayChart"></canvas>
                        </div>
                      </div>
                      
                      <div class="row">
                        <!-- 시간대별 유동인구 -->
                        <div class="col">
                          <canvas width="100%" id="timeChart"></canvas>
                        </div>
                      </div>
                      
                      <div class="row">
                        <!--  연령대별 유동인구 -->
                        <div class="col">
                          <canvas width="100%" id="ageChart"></canvas>
                        </div>
                      </div>
                      <!-- 유동인구 지표 끝 -->
                      <br>

                      <!--  상주인구 지표 -->
                      <br>
                      <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">상주인구 지표</span>
                      <div class="row">
                        <div class="col">
                          <canvas width="100%" id="liveChart"></canvas>
                        </div>
                      </div>
                      <br>
                      <!-- 직장인구 지표 -->                      
                      <br>
                      <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">직장인구 지표</span>
                      <div class="row">
                        <div class="col">
                          <canvas width="100%" id="jobChart"></canvas>
                        </div>
                      </div>
                      <br>
                      <!-- 지출 지표 -->
                      <br>
                      <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">지출 지표</span>
                      <div class="row">
                        <div class="col">
                          <canvas width="100%" id="lossChart"></canvas>
                        </div>
                      </div>
                      <br>
                      <br>
                      <div class="row">
                        <!-- 해당 상권 평균 영업 개월 수 Chart -->
                        <div class="col-sm-6">
                         <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">해당 상권 평균 영업 개월 수</span>
                            <canvas id="martRunningTimeChart"></canvas>
                        </div>
                        <!-- 2018년 상권 집계 점포 Chart -->
                        <div class="col-sm-6">
                          <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">2018년 상권 집계 점포</span>
                            <canvas id="sumMartChart"></canvas>
                        </div>
                      </div>
                      <br>
                      <br>
                      <!-- 해당 월 점포 개, 폐업 수 Chart -->
                      <div class="row" style="margin-top: 20px;">
                        <div class="col">
                          <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">해당 월 점포 개･폐업 수</span>
                          <canvas id="openCloseChart"></canvas>
                        </div>
                      </div>
                    </div>
                  </div><!-- 상세 분석 결과 끝 Tag -->
                  
                  <!-- 부동산 매물 결과 tab -->
                  <div id="landAnalysis" class="card-body bg1-pattern" style="display: none;">
                        <div class="row" >
                          <div class="col-sm-6">
                            <br>                      
                              <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">해당 상권의 지도</span>
                          </div>
                      
                          <div class="col-sm-6">
                            <br>
                              <span style="font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">부동산 매물 리스트</span>
                          </div>
                        </div>
                        <br>
						<br>
                      <div class="" style="background-color: white; font-family: a드림고딕4; padding: 20px; color: black; max-width: 1400px; margin-right: 20px; margin-left: 20px; border-radius: 5px;">
                        
                        <div class="row">
                          <div class="col-sm-6" style="border: 1px solid grey; height: 600px;">
                            지도지도
                          </div>
                      
                          <div class="col-sm-6" style="border: 1px solid grey; height: 600px; padding: 20px;">
                            <table>
                              <colgroup>
                                <col width="25%">
                                <col width="75%">
                              </colgroup>
                              <thead>
                                <tr>
                                  <td colspan="2">
                                    <br>
                                    <div class="t-center" style="font-family: a드림고딕4; font-size: 20px;">
                                      OOO 공인중개사의 매물정보
                                    </div>
                                    <br>
                                  </td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr style="height: 80px;" onclick="location.href=''" onMouseOver="bgColor='#beeee9'" onMouseOut="bgColor='#ffffff'"> 
                                  <td>image1</td>
                                  <td>
                                    <div>매물번호 : <span class="fs-18">12350</span></div>
                                    <div>상가형태 : <span class="fs-18">빌딩, 고층, 역세권</span></div>
                                    <div><img alt="보증금" src="${pageContext.request.contextPath}/resources/images/icons/bo.png" style="height:32px;">&nbsp;&nbsp;:&nbsp;&nbsp;<span class="fs-20">3000 / 50</span>
                                    </div>
                                  </td>
                                </tr>
                                <tr style="height: 80px;" onclick="location.href=''" onMouseOver="bgColor='#beeee9'" onMouseOut="bgColor='#ffffff'">
                                  <td>image1</td>
                                  <td>
                                    <div>매물번호 : <span class="fs-18">12350</span></div>
                                    <div>상가형태 : <span class="fs-18">빌딩, 고층, 역세권</span></div>
                                    <div><img alt="보증금" src="${pageContext.request.contextPath}/resources/images/icons/bo.png" style="height:32px;">&nbsp;&nbsp;:&nbsp;&nbsp;<span class="fs-20">3000 / 50</span>
                                    </div>
                                  </td>
                                </tr>
                                <tr style="height: 80px;" onclick="location.href=''" onMouseOver="bgColor='#beeee9'" onMouseOut="bgColor='#ffffff'">
                                  <td>image1</td>
                                  <td>
                                    <div>매물번호 : <span class="fs-18">12350</span></div>
                                    <div>상가형태 : <span class="fs-18">빌딩, 고층, 역세권</span></div>
                                    <div><img alt="보증금" src="${pageContext.request.contextPath}/resources/images/icons/bo.png" style="height:32px;">&nbsp;&nbsp;:&nbsp;&nbsp;<span class="fs-20">3000 / 50</span>
                                    </div>
                                  </td>
                                </tr>
                                <tr style="height: 80px;" onclick="location.href=''" onMouseOver="bgColor='#beeee9'" onMouseOut="bgColor='#ffffff'">
                                  <td>image1</td>
                                  <td>
                                    <div>매물번호 : <span class="fs-18">12350</span></div>
                                    <div>상가형태 : <span class="fs-18">빌딩, 고층, 역세권</span></div>
                                    <div><img alt="보증금" src="${pageContext.request.contextPath}/resources/images/icons/bo.png" style="height:32px;">&nbsp;&nbsp;:&nbsp;&nbsp;<span class="fs-20">3000 / 50</span>
                                    </div>
                                  </td>
                                </tr>
                                <tr style="height: 80px;" onclick="location.href=''" onMouseOver="bgColor='#beeee9'" onMouseOut="bgColor='#ffffff'">
                                  <td>image1</td>
                                  <td>
                                    <div>매물번호 : <span class="fs-18">12350</span></div>
                                    <div>상가형태 : <span class="fs-18">빌딩, 고층, 역세권</span></div>
                                    <div><img alt="보증금" src="${pageContext.request.contextPath}/resources/images/icons/bo.png" style="height:32px;">&nbsp;&nbsp;:&nbsp;&nbsp;<span class="fs-20">3000 / 50</span>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                      <br>
                      <br>
                      <span style="margin-left: 20px; font: bold 20px a드림고딕4; color: #27b2a5;">●</span>&nbsp;&nbsp;<span style=" font: bold 20px a드림고딕4; font-size: 18px;">선택하신 매물의 상세 정보</span><br><br>
                      <div class="" style="font-family: a드림고딕4; padding: 20px; color: black; max-width: 1400px; margin-right: 20px; margin-left: 20px; border-radius: 5px;">
                        
                        <div class="row" id="rowHeight">
                          <div class="col-sm-5">
                              <div class="col-sm-12">
                                <div class="card">
                                  <div class="card-body">
                                    <!-- 클릭한 매물의 상세정보 출력하는 영역 -->
                                    <table>
                                      <colgroup>
                                        <col width="35%">
                                        <col width="65%">
                                      </colgroup>
                                      <thead>
                                        <tr>
                                          <td colspan="2">
                                            <br>
                                            <div class="t-center" style="font-family: a드림고딕4; font-size: 24px;">
                                              OOOOO 상세정보
                                            </div>
                                            <br>
                                            <br>
                                            <br>
                                          </td>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">매물번호</td>
                                          <td>
                                            <div><span class="fs-20">163805</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">상가 형태</td>
                                          <td>
                                            <div><span class="fs-20">근린 상가</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">보증금/월세</td>
                                          <td>
                                            <div><span class="fs-20">1500/75만원</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">주차</td>
                                          <td>
                                            <div><span class="fs-20">불가능</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">화장실</td>
                                          <td>
                                            <div><span class="fs-20">내부/남녀구분</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">인테리어(시설)</td>
                                          <td>
                                            <div><span class="fs-20">있음</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">입주가능일</td>
                                          <td>
                                            <div><span class="fs-20">협의가능</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">준공년도</td>
                                          <td>
                                            <div><span class="fs-20">1983년 (2017년 리모델링)</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">옵션</td>
                                          <td>
                                            <div><span class="fs-20">#에어컨 #창고 #전속매물</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">난방종류</td>
                                          <td>
                                            <div><span class="fs-20">개별난방</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">엘리베이터</td>
                                          <td>
                                            <div><span class="fs-20">없음</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">권리금</td>
                                          <td>
                                            <div><span class="fs-20">3500만원</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">해당층/건물층</td>
                                          <td>
                                            <div><span class="fs-20">1층 / 3층</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">계약면적/전용면적</td>
                                          <td>
                                            <div><span class="fs-20">49.4m^2 / 49.4m^2</span></div>
                                        </tr>
                                        <tr style="font-family: a드림고딕4;" > 
                                          <td style="color: #27b2a5;" class="fs-18">추천업종</td>
                                          <td>
                                            <div><span class="fs-20">중식</span></div>
                                        </tr>
                                      </tbody>                                            
                                    </table>
                                    <div class="t-center">
                                      <br>
                                      <br>
                                      <button type="button" style="width:60%;" id="inputInfoBtn">대출 관련 정보 입력</button>
                                      <br>
                                      <br>  
                                    </div>
                                  </div>
                                </div>
                              </div>
                          </div>
                        
                      
                      
                      
                    <!--  대출연계를 위한 창 -->
                          <div class="col-sm-7 dis-none" id="inputInfoArea" style="font-family: a드림고딕4;">
                              <div class="col-sm-12">
                                <div class="card">
                                  <div class="card-body">
                                    <div id="innerWrapper">
                                      <div id="innerNavigation">
                                        <ul id="innerPrimary">
                                          <li><a href="#creditLoan" class="active">신용 대출</a></li>
                                          <li><a href="#guaranteeLoan" class="">담보 대출</a></li>
                                        </ul>
                                      </div>
                                    
                                      <div id="innerContainer">
                                        <div id="innerContent">
                                         <!-- 신용대출 부분 -->
                                          <div id="creditLoan" class="card-body" style="">
                                          
                                                                                      <!-- 대출 금액 입력 받는 부분 -->
                                            <div style="font-size: 0.8em; color: darkgray;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>필요하신 대출금액은 얼마인가요?</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <div class="form-group" style="width: 100%; font-size: 1.2em;">
                                              <input style="border: 0; font-size: 25px; width: 88%; text-align: right; display: inline-block;" type="number" id="inputBorrowMoney1"/> 
                                              <span style="font-size: 25px; width: 10%;">만원</span>
                                            </div>
                                            <div class="inputBorrowMoney1" id="BorrowMoney1">
                                              <button class="analysisBtn1" value="300">300만</button>
                                              <button class="analysisBtn1" value="500">500만</button>
                                              <button class="analysisBtn1" value="1000">1000만</button>
                                              <button class="analysisBtn1" value="3000">3000만</button>
                                              <button class="analysisBtn1" value="5000">5000만</button>
                                              <button class="analysisBtn1" value="10000">1억</button>
                                            </div>
                                            <br>
                                          
                                          
                                            <!-- 신용등급 입력 받는 부분 -->
                                            <div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>신용등급을 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <select class="form-control" style="height: 40px; display: inline-block;" id="creditRankSelect1">
                                              <option value="1">1등급</option>
                                              <option value="2">2등급</option>
                                              <option value="3">3등급</option>
                                              <option value="4">4등급</option>
                                              <option value="5">5등급</option>
                                              <option value="6">6등급</option>
                                              <option value="7">7등급</option>
                                              <option value="8">8등급</option>
                                              <option value="9">9등급</option>
                                              <option value="10">10등급</option>
                                            </select>
                                            <br>
                                            <br>
                                            <!-- 직업 선택 Select -->
                                            <div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>현재 직업을 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <select class="form-control" style="height: 40px; display: inline-block;" id="creditJobSelect1">
                                              <option value="1">일반 회사원</option>
                                              <option value="2">자영업자/프리랜서</option>
                                              <option value="3">군인/군무원/임관(예정)자</option>
                                              <option value="4">경찰/소속공무원/임관(예정)자</option>
                                              <option value="5">공무원</option>
                                              <option value="6">의료계 직종</option>
                                              <option value="7">교직원</option>
                                              <option value="8">무직</option>
                                              <option value="9">기타(연금 수령자 등)</option>
                                              <option value="10">전문직</option>
                                            </select>
                                            <br>
                                            <br>
                                            <div id="creditWorkingPeriod1" class="dis-none" style="display:none">
                                              <div class="fs-20"><b>재직(사업영위)기간을 입력하세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                              <input style="border: 0; font-size: 25px; width: 88%; text-align: right; display: inline-block;" type="number" /> 
                                              <span style="font-size: 25px; width: 10%;">개월</span> 
                                            </div>
                                            <br>

                                            <!-- 연소득 입력 -->
                                            <div style="font-size: 0.8em; color: darkgray;">한도산출을 위한 질문</div>
                                            <div class="fs-20"><b>연 소득은 얼마인가요?</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <div class="form-group" style="width: 100%; font-size: 1.2em;">
                                              <input style="border: 0; font-size: 25px; width: 88%; text-align: right; display: inline-block;" type="number" id="inputYearMoney1"/> <span style="font-size: 25px; width: 10%;">만원</span>
                                            </div>
                                            <div class="inputYearMoney1">
                                              <button class="analysisBtn2" value="300">300만</button>
                                              <button class="analysisBtn2" value="500">500만</button>
                                              <button class="analysisBtn2" value="1000">1000만</button>
                                              <button class="analysisBtn2" value="3000">3000만</button>
                                              <button class="analysisBtn2" value="5000">5000만</button>
                                              <button class="analysisBtn2" value="10000">1억</button>
                                            </div>
                                            
                                          <form id="selectCreditLoanForm" action="/loan/list" method="get">
                                            <div class="card-body" style="padding-top: 10px; padding-bottom: 10px; margin-left: 20px; margin-right: 20px;">
                                              <div style="width: 100%; height: 3px; background-color: #27b2a5">&nbsp;</div>
                                              
                                              <input type="hidden" name="loanCategory" value="신용"/>
                                              
                                              <div><b>대출 희망 금액</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeBorrowMoney1"></b><b>만원</b></div>
                                              <input type="hidden" name="requiredMoney" value='<c:out value="${param.requiredMoney}"/>'>
                                              
                                              <div><b>직업</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeJob1"></b></div>
                                              <input type="hidden" name="targetNum" value='<c:out value="${param.targetNum}"/>'>
                                              
                                             <div><b>연 소득</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeYearMoney1"></b><b>만원</b></div>
                                              <input type="hidden" name="">
                                             </div>
                                              
                                              <div><b>예상 이율</b></div>
                                              <div style="color: #27b2a5; font-size: 20px; font-weight: bold; text-align: right;"><b id="takeRate1"></b><b>%</b></div>
                                              <input type="hidden" name="resultRate" value='<c:out value="${param.resultRate}"/>'>
                                              
<!--                                               <div><b>예상 한도</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeCreditLine1"></b><b>만원</b></div> -->
                                              
                                             <div class="t-center">
                                              <br>
                                              <input type="submit" style="width:60%;" value="대출연계하기" class="loanSubmitBtn">  
                                             </div>
                                          </form>
                                          </div>
                                          
                                          
                                          <!-- 담보대출 부분 -->
                                        <div id="guaranteeLoan" class="card-body" style="display: none;">
                                     <!-- 대출 금액 입력 받는 부분 -->
                                            <div style="font-size: 0.8em; color: darkgray;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>필요하신 대출금액은 얼마인가요?</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <div class="form-group" style="width: 100%; font-size: 1.2em;">
                                              <input style="border: 0; font-size: 25px; width: 88%; text-align: right; display: inline-block;" type="text" id="inputBorrowMoney2"/> <span style="font-size: 25px; width: 10%;">만원</span>
                                            </div>
                                            <div class="inputBorrowMoney">
                                              <button class="analysisBtn1" value="300">300만</button>
                                              <button class="analysisBtn1" value="500">500만</button>
                                              <button class="analysisBtn1" value="1000">1000만</button>
                                              <button class="analysisBtn1" value="3000">3000만</button>
                                              <button class="analysisBtn1" value="5000">5000만</button>
                                              <button class="analysisBtn1" value="10000">1억</button>
                                            </div>
                                            <br>
                                            
                                         <!-- 신용등급 입력 받는 부분 -->
                                            <div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>신용등급을 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <select class="form-control" style="height: 40px; display: inline-block;" id="creditRankSelect2">
                                              <option value="1">1등급</option>
                                              <option value="2">2등급</option>
                                              <option value="3">3등급</option>
                                              <option value="4">4등급</option>
                                              <option value="5">5등급</option>
                                              <option value="6">6등급</option>
                                              <option value="7">7등급</option>
                                              <option value="8">8등급</option>
                                              <option value="9">9등급</option>
                                              <option value="10">10등급</option>
                                            </select>
                                            <br>
                                            <br>
                                        
                                            <!-- 직업 선택 Select -->
                                            <div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>현재 직업을 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <select class="form-control" style="height: 40px; display: inline-block;" id="guaranteeJobSelect">
                                              <option value="1">일반 회사원</option>
                                              <option value="2">자영업자/프리랜서</option>
                                              <option value="3">군인/군무원/임관(예정)자</option>
                                              <option value="4">경찰/소속공무원/임관(예정)자</option>
                                              <option value="5">공무원</option>
                                              <option value="6">의료계 직종</option>
                                              <option value="7">교직원</option>
                                              <option value="8">무직</option>
                                              <option value="9">기타(연금 수령자 등)</option>
                                              <option value="10">전문직</option>
                                            </select>
                                            <br>
                                            <br>
                                            <div id="guaranteeWorkingPeriod2" class="dis-none">
                                              <div class="fs-20"><b>재직(사업영위)기간을 입력하세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                              <input style="border: 0; font-size: 25px; width: 88%; text-align: right; display: inline-block;" type="text" /> <span style="font-size: 25px; width: 10%;">개월</span> 
                                            </div>
                                            <br>
                                            
                                             <!-- 담보 종류 입력 받는 부분 -->
                                            <div style="font-size: 0.8em; color: darkgray; clear: both;">금리산출을 위한 질문</div>
                                            <div class="fs-20"><b>담보 종류를 선택해주세요</b><span style="color: orangered;">&nbsp;*</span></div>
                                            <select class="form-control" style="height: 40px; display: inline-block;" id="guaranteeSelect">
                                              <option value="전체">전체</option>
                                              <option value="부동산">부동산</option>
                                              <option value="주택">주택</option>
                                              <option value="기타">기타</option>
                                            </select>
                                            <br>
                                            <br>
                                            
                                      <form id="selectSecurityLoanForm" action="/loan/list" method="get">
                                            <div class="card-body" style="padding-top: 10px; padding-bottom: 10px; margin-left: 20px; margin-right: 20px;">
                                              <div style="width: 100%; height: 3px; background-color: #27b2a5">&nbsp;</div>
                                              
                                              <input type="hidden" name="loanCategory" value="담보">
                                              
                                               <div><b>제공 담보</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeSecurity"></b></div>
                                              <input type="hidden" name="securityType" value='<c:out value="${param.securityType}"/>'>
                                              
                                              <div><b>대출 희망 금액</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeBorrowMoney2"></b><b>만원</b></div>
                                              <input type="hidden" name="requiredMoney" value='<c:out value="${param.requiredMoney}"/>'>
                                              
                                              <div><b>직업</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeJob2"></b></div>
                                              <input type="hidden" name="targetNum" value='<c:out value="${param.targetNum}"/>'>

                                              <div><b>예상 이율</b></div>
                                              <div style="color: #27b2a5; font-size: 20px; font-weight: bold; text-align: right;"><b id="takeRate2">3</b><b>%</b></div>
                                              <input type="hidden" name="resultRate" value='<c:out value="${param.resultRate}"/>'>
                                              
<!--                                               <div><b>예상 한도</b></div>
                                              <div style="font-size: 16px; font-weight: bold; text-align: right;"><b id="takeCreditLine2"></b><b>만원</b></div> -->
                                              
                                             </div>
                                             <div class="t-center">
                                              <br>
                                              <input type="submit" style="width:60%;" value="대출연계하기" id="loanSubmitBtn2">  
                                             </div>
                                          </form>
                                            
                                          </div>
                                        </div> <!-- innerContent 끝나는 부분 -->
                                      </div>
                                      <!-- 신용대출 / 담보대출 관련해서 입력 시, 필터 결과 부분 -->
                                  </div> <!-- innerWrapper 끝 -->
   
                                </div>
                              </div>
                            </div>
                          </div><!--  대출연계 div 끝 -->
                        </div> <!-- row 끝 태그 -->
                      </div> <!-- div 끝 태그 -->
                    </div> <!--  부동산 매물 검색 탭 div 끝 -->
                  </div> <!--  Contain div 태그 끝 -->
                </div> <!-- Container 태그 끝 -->
              </div>
            </section>
          </div>
        </div> <!-- card 태그 끝 -->
      </div> <!-- container 태그 끝 -->
    </section>
<script type="text/javascript">
/*
 * 호준 : Reflection API와 비슷하게 만든 동적 접근 메서드
 * 지우지 마세요!!
 */

  function getPropStep(topData,subData){
  	/*
  		동적 Property 접근을 위한 메서드
  	*/
  	return topData[subData];
  }
  
  function getPropStep2(topData,subData,subData2){
  	/*
  		동적 Property 접근을 위한 메서드
  	*/
  	
  	console.log(topData,subData,subData2);
  	return topData[subData][subData2];
  }
  
  /*
  		동적으로 데이터 배열 생성
  */
  
  function makeDataArr(topDataList,wishList){
	  var resultArr = new Array();
	  
	  for(var i = 0; i < topDataList.length; i++){
		  /* 차트에 사용할 배열 만들기 */
		  var result = new Array();
		  
		  if(getPropStep(topDataList,wishList[0]) == null){
			  for(var j = 1; j < wishList.length; j++){
				  /* 결과값이 없으면 0을 넣어줍니다.*/
				  result.push(0);
			  }
		  }else{
    		  /* 기초데이터를 이용 */
    		  for(var j = 1; j < wishList.length; j++){
    			  /* 원하는 데이터를 넣기 */
    			  result.push(getPropStep2(topDataList[i],wishList[0],wishList[j]));
    		  }
		  
		  }
		  /* 배열 내 배열 구조 */
		  resultArr.push(result);
		  
	  }
	  
	  return resultArr;
  }
  
  /* 
  	 배열의 0번째는 프로퍼티, 1번째부터는 프로퍼티 내 프로퍼티입니다.
  	 차트를 위한 배열 
  */
  
  var popWishList = ['flowPerAlleybiz','total_flow','male_flow','female_flow'];
  var dayWishList = ['flowPerAlleybiz','flow_sun', 'flow_mon','flow_tue','flow_wed','flow_thr','flow_fri','flow_sat'];
  var timeWishList = ['flowPerAlleybiz','flowTime1','flowTime2','flowTime3','flowTime4','flowTime5','flowTime6'];
  var ageWishList = ['flowPerAlleybiz','flow10','flow20','flow30','flow40','flow50','flow60'];
  var liveWishList = ['livingPerAlleybiz','totalLiving','maleLiving','femaleLiving','living10','living20','living30','living40','living50','living60'];
  var jobWishList = ['workerPerAlleybiz','total_work','male_work','female_work','work10','work20','work30','work40','work50','work60'];
  var lossWishList = ['outPerAlleybiz','food_out','cure_out','living_out','traffic_out','leisure_out','culture_out','edu_out','enjoy_out'];
  var survivalWishList = ['survival1','survival1_2','survival2_3','survival3_5','survival5'];
  
  /*
   * 차트 색깔 변수
   */
   
   var chartbackcolor1 = '#2b90d9';
   var chartbackcolor2 = '#ef5285';
   var chartbackcolor3 = '#60c5ba';
   
  
</script>            

<!--===============================================================================================-->
<!-- 다음 지도 API Script -->
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85fa2226a5b3318b6ed8f59fb0e16f4e&libraries=services,clusterer,drawing"></script>
<!--===============================================================================================-->	
<script type="text/javascript">
// 분석 관련 필터 입력 시, 동적으로 보이는 지도(분석 첫페이지 지도)
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});
	 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	
	var coords;
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
        
   	var village;		
 	$('#districtSelect').change(function() {
 		// 이벤트를 연결
 		
 		var target = document.getElementById('districtSelect');
 		var selectedDistrict = target.options[target.selectedIndex].text;
 		// 구가 변하면 필터 초기화 하기 위함
 		
 		// 구 값이 바뀌면, 해당 구 중심 좌표로 이동
 		geocoder.addressSearch(selectedDistrict, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
 		});
 		
 		$.ajax({
 	         type : 'GET',
 	         url : "/analysis/getvillagelist/" + selectedDistrict,
 	         dataType : "json",
 	         success : function(data) {
 	        	 village = data.area;
 	        	 village = village.split(',');
 	        	 
 	        	 for(var i = 1; i <=4; i++) {
 	        			$('#filterColumn' + i).empty();
 	        		}
 	        		
	   				for(var i = 0; i < village.length; i++) {
	   					if((i % 4) == 0) {
	   						$('#filterColumn1').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ village[i] + '</button>');
	   					} else if ((i % 4) == 1) {
	   						$('#filterColumn2').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ village[i] + '</button>');
	   					} else if ((i % 4) == 2) {
	   						$('#filterColumn3').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ village[i] + '</button>');
	   					} else {
	   						$('#filterColumn4').append('<button style="width: 100%;" class="m-b-10 villageBtn">'+ village[i] + '</button>');
	   					}
	    				
	        		}
	   				$('#map').css('height', $('.col-sm-4').height());
 	        	 
 	        	 var target = document.getElementById('snackbar');
	        	  	 target.innerHTML = selectedDistrict + '에 속한 동을 성공적으로 불러왔습니다.';
	        	  	 toast(); 
	        	  	 
        	  	// 동 생성 완료 후 
     			$('#vilFilter').find('button').click(function(){
     				// 클릭을 했는데 active 되어 있지 않으면 -> 활성화
     				if(!($(this).hasClass('active'))) {
     			  		$(this).addClass('active');
     			  		var infoHeaderText = $(this).text();
     			  		var marker;
     			  		var infowindow;
     			  		geocoder.addressSearch($(this).text(), function(result, status) {
     						
     					    // 정상적으로 검색이 완료됐으면 
     					     if (status === daum.maps.services.Status.OK) {

     					        coords = new daum.maps.LatLng(result[0].y, result[0].x);
     							console.log(coords);
     					        // 결과값으로 받은 위치를 마커로 표시합니다
     					        marker = new daum.maps.Marker({
     					            map: map,
     					            position: coords
     					        });
     					        var content = '<div style="width:150px;text-align:center;padding:6px 0;">'+ infoHeaderText +'</div>';
     					        // 인포윈도우로 장소에 대한 설명을 표시합니다
     					        infowindow = new daum.maps.InfoWindow({
     					            content: content
     					        });
     					        infowindow.open(map, marker);
     					    }
     					    
     					  // 지도에 표시할 원을 생성
     						 	var circle = new daum.maps.Circle({
     						 	    center : new daum.maps.LatLng(coords.jb, coords.ib),  // 원의 중심좌표 입니다 
     						 	    radius: 700, // 미터 단위의 원의 반지름입니다 
     						 	    strokeWeight: 3, // 선의 두께입니다 
     						 	    strokeColor: '#27b2a5', // 선의 색깔입니다
     						 	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
     						 	    strokeStyle: 'solid', // 선의 스타일 입니다
     						 	    fillColor: '#27b2a5', // 채우기 색깔입니다
     						 	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
     						 	});
     						 	
     						 	// 지도에 원을 표시합니다 
     						 	circle.setMap(map);
     					}) // geoCoder 끝나는 부분
     				} // if 문 끝나는 부분
     				// 클릭을 했는데 활성화가 되어있으면,
     				else { 
     			   		$(this).removeClass('active');
     			  	}
     			}) 	 
 	         },
 	         error : function(error) {
 	        	var target = document.getElementById('snackbar');
       	  	 		target.innerHTML = 'DB에서 동을 불러올 수 없습니다 다시 시도하세요!';
       	  	 		toast();
 	         }
 	      })
			
 	});
        		
        		
        		
	$('#regionFilter').find('button').click(function(){
		 if(!($(this).hasClass('active'))) { // 클릭을 했는데 active 되어 있지 않으면 -> 활성화
			 if($(this).text() === '주택가') {
				 var target = document.getElementById('snackbar');
    	  	 		target.innerHTML = '거주인구가 많은 지역을 우선으로 추천합니다';
    	  	 		toast();
			 } else if($(this).text() === '대학가') {
				 var target = document.getElementById('snackbar');
 	  	 			 target.innerHTML = '대학가 근처 및 20대가 많은 지역을 우선으로 추천합니다';
 	  	 			 toast();
			 } else if($(this).text() === '유흥가') {
				 var target = document.getElementById('snackbar');
	  	 			 target.innerHTML = '유흥 지출이 많은 지역을 우선으로 추천합니다';
	  	 			 toast();
			 } else if($(this).text() === '역세권') {
				 var target = document.getElementById('snackbar');
  	 			 target.innerHTML = '교통 지출이 많은 지역을 우선으로 추천합니다';
  	 			 toast();
			 } else if($(this).text() === '오피스') {
				 var target = document.getElementById('snackbar');
  	 			 target.innerHTML = '직장인이 많은 지역, 회사 밀집 지역을 우선으로 추천합니다';
  	 			 toast();
			 }
			 $('#regionFilter').children().removeClass('active');
	     $(this).addClass('active');
	} else { // 클릭을 했는데 활성화가 되어있으면,
			 $(this).removeClass('active');
		}
	});
        </script>
<!--===============================================================================================-->        
    <script type="text/javascript">
    // 초기화 버튼 클릭 시, 발생하는 이벤트
    // 필터에서 active 되어 있던 버튼들 모두 초기화
    $('#resetFilterBtn').click(function() {
    	for(var i = 1; i <= 4; i++) {
    		$('#filterColumn' + i).children().removeClass('active');
    	}
    	
    	$('#regionFilter').children().removeClass('active');
    })
    
    // 분석 후 도출되는 3개의 상권 리스트 담는 변수
    var topThreeList = [];
    
    // 분석하기 버튼 클릭 시, 발생하는 이벤트(필터에서 검색한 변수들을 Ajax 통신을 위해 변수로 저장)
    $('#analysisStartBtn').click(function() {
    	// 분석 결과 동적으로 출력
    	$('#analysisResult').removeClass('dis-none');
    	$('#analysisResult').addClass('dis-block');
    
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
    	

    	var target = document.getElementById('snackbar');
			 target.innerHTML = '필터에 입력하신 값을 바탕으로 지도에 표시된 영역 골목 상권 분석을 진행합니다';
			 toast();
		// 상권 분석 결과를 가져오기 위한 Ajax 통신
		 $.ajax({
	         type : 'GET',
	         url : '/analysis/analysisstart/' ,
	         dataType : 'json',
	         data : {
	        	'villageList' : activeVillageList,
	        	'regionType' : activeRegionType
	         },
	         success : function(data) {
	        	 topThreeList = [];
	        	 for (var i = 0; i < 3; i++) {
	        	 	topThreeList.push(data[i]);
	        	 }
	        	 var target = document.getElementById('snackbar');
				 target.innerHTML = '분석을 완료했습니다. 콘솔창에서 Data를 확인하세요';
				 toast();
	        	 console.log('상위 3개 상권' + topThreeList);

	        	 /* 유효성 검증 추가 : 호준 */
	        	 if(topThreeList[0] != undefined){
	        	 $('#analysisResultBtnList #firstBtn').text(topThreeList[0].areaCode.administrativeDistrictCodeName + ' ' + topThreeList[0].areaCode.areaCode_Name + ' ' +  topThreeList[0].alleyBiz.alleybizCode_Name);
	        	 }
	        	 if(topThreeList[1] != undefined){
	        	 $('#analysisResultBtnList #secondBtn').text(topThreeList[1].areaCode.administrativeDistrictCodeName + ' ' + topThreeList[1].areaCode.areaCode_Name + ' ' +  topThreeList[1].alleyBiz.alleybizCode_Name);
	        	 }
	        	 
	        	 if(topThreeList[2] != undefined){
	        	 $('#analysisResultBtnList #thirdBtn').text(topThreeList[2].areaCode.administrativeDistrictCodeName + ' ' + topThreeList[2].areaCode.areaCode_Name + ' ' +  topThreeList[2].alleyBiz.alleybizCode_Name);
	        	 }
	        	 
	        	 /* 차트 만들기 */
	        	 
				 makeAllChart();
	        	 
	         },
	         error : function(error) {
	        	 
	         }
	      });
    })
    
    
    // 분석 결과로 나온 버튼 클릭 시, 분석 결과 리포트 부분 활성화
    $('.resultBtn').click(function() {
    	if($('#analysisReport').hasClass('dis-none')) { // 보이지 않는 경우면
    		$('#analysisReport').removeClass('dis-none');
    		$('#analysisReport').addClass('dis-block');
    	} else {
    		$('#analysisReport').removeClass('dis-block');
    		$('#analysisReport').addClass('dis-none');
    	}
    	
    	// 클릭한 골목상권 테이블에 뿌리기 위해 파싱 
    	var alleyBizFullName = $(this).text().split(' ');
    	$('#resultDistrict').text(alleyBizFullName[0]); 
    	$('#resultVillage').text(alleyBizFullName[1]);
    	$('#resultAlleyBiz').text(alleyBizFullName[2]);
    	
    	for(var i =0; i < topThreeList.length; i++) {
    		if(topThreeList[i].alleyBiz.alleybizCode_Name == alleyBizFullName[2]) {
    			// 상위 3개의 상권 리스트 배열에서 도로명이 일치하는 배열의 요소를 불러와 해당하는 예상 매출액을 태그의 text로 추가
    			$('#expectedSalesAccount').text(topThreeList[i].mlresult.estmt_SALES);
    			var marker;
		  		var infowindow;
		  		var geocoder = new daum.maps.services.Geocoder();
			  		geocoder.addressSearch(alleyBizFullName[2], function(result, status) {
						
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {

					        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					        
					        var mapContainer = document.getElementById('staticMap'), // 지도를 표시할 div 
				  		    mapOption = {
				  		        center: new daum.maps.LatLng(coords.jb, coords.ib), // 지도의 중심좌표
				  		        level: 1 // 지도의 확대 레벨
				  		    };  

					  		// 지도를 생성합니다    
					  		var map = new daum.maps.Map(mapContainer, mapOption);
					  		
					  		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					  		var mapTypeControl = new daum.maps.MapTypeControl();
	
					  		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					  		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					  		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	
					  		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					  		var zoomControl = new daum.maps.ZoomControl();
					  		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				  		
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        marker = new daum.maps.Marker({
					            map: map,
					            position: coords
					        });
					        
					        var content = '<div style="width:150px;text-align:center;padding:6px 0;">'+ alleyBizFullName[2] +'</div>';
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        infowindow = new daum.maps.InfoWindow({
					            content: content
					        });
					        infowindow.open(map, marker);
					    }
					    
					}) // geoCoder 끝나는 부분
    		
	    		// 클릭 시, 동 이름을 가지고, 창업 관련 5대 지표 불러옴
	    		// 0 ~ 25 : 매우위험, 26 ~ 50 : 위험, 51 ~ 75 : 보통, 76 ~ 100 : 좋음
	            // 백그라운드 컬러 배열
	            var backCol = new Array();
	            // 백그라운드 컬러 배열 모은 배열
	            var backColArr = new Array();
	            // 창업위험지수, 과밀지수, 활성도, 성장가능성, 안전도 순서로 각 번째에 맞게 무조건 데이터 삽입
	            var dataArr = new Array();
	            
	            var dataArrSub = new Array();
	            
	            var expected
	            // 등급 배열 >> 이것 또한 창업위험, 과밀, 활성, 성장, 안전도 순서로 배열에 등급이 들어감
	            var gradeArr = new Array();
	            dataArr = [topThreeList[i].mlresult.estmt_ROF_VALUE, 
	            		   topThreeList[i].mlresult.estmt_OI_VALUE, 
	            		   topThreeList[i].mlresult.estmt_AI_VALUE,
	            		   topThreeList[i].mlresult.estmt_GI_VALUE,
	            		   topThreeList[i].mlresult.estmt_SI_VALUE];
	            /*
	            	workerPerAlleybiz.total_work 없는 경우를 판단하여 다르게 저장
	            */
	            if(topThreeList[i] != undefined && topThreeList[i].workerPerAlleybiz.total_work != null){
	            dataArrSub = [topThreeList[i].livingPerAlleybiz.totalLiving, 
           		 			  topThreeList[i].flowPerAlleybiz.total_flow, 
           					  topThreeList[i].workerPerAlleybiz.total_work, 
           		 		      topThreeList[i].storePerAlleybiz.open_percent,
           		 			  topThreeList[i].storePerAlleybiz.store_count];
	            }else if(topThreeList[i].workerPerAlleybiz.total_work == null){
	            	dataArrSub = [topThreeList[i].livingPerAlleybiz.totalLiving, 
     		 			  topThreeList[i].flowPerAlleybiz.total_flow, 
     		 		      topThreeList[i].storePerAlleybiz.open_percent,
     		 			  topThreeList[i].storePerAlleybiz.store_count];
	            }else{
	            	
	            }
	            
	            dataEstimatedArr = [topThreeList[i].mlresult.estmt_SALES,
	            					topThreeList[0].mlresult.estmt_SALES,
	            					topThreeList[1].mlresult.estmt_SALES,
	            					topThreeList[2].mlresult.estmt_SALES]
	            					
	            // 종합 평가 점수 구하는 함수
	            var totalEstimatedScore = 0;
	            for (var i = 0; i < dataArr.length; i++) {
	            	totalEstimatedScore += dataArr[i];
	            }
	            
	           	var avgEstimatedScore = totalEstimatedScore / dataArr.length;
	            $('#expectedTotalEstimateScore').text(avgEstimatedScore);
	            for (var i = 0; i < 5; i++) {
	                backCol = ['rgba(255, 255, 255, 0)', 'rgba(255, 255, 255, 0)', 'rgba(255, 255, 255, 0)', 'rgba(255, 255, 255, 0)'];
	                if (0 <= dataArr[i] && dataArr[i] <= 25) {
	                    backCol[0] = 'rgba(255, 99, 132)';
	                    gradeArr.push("매우위험");
	                }
	                if (26 <= dataArr[i] && dataArr[i] <= 50) {
	                    backCol[1] = 'rgba(255,166,80)';
	                    gradeArr.push("위험");
	                }
	                if (51 <= dataArr[i] && dataArr[i] <= 75) {
	                    backCol[2] = 'rgba(86,232,164)';
	                    gradeArr.push("보통");
	                }
	                if (76 <= dataArr[i] && dataArr[i] <= 100) {
	                    backCol[3] = 'rgba(43,143,239)';
	                    gradeArr.push("좋음");
	                }
	                backColArr.push(backCol);
	            }
	            // 창업위험지수 그래프 >> 배열의 0번째
	            var dangerChart = document.getElementById("dangerChart").getContext('2d');
	            var dangerChartA = new Chart(dangerChart, {
	                type: 'doughnut'
	                , data: {
	                    labels: ["매우위험", "위험", "보통", "좋음"]
	                    , datasets: [{
	                        data: [25, 25, 25, 25]
	                        , backgroundColor: backColArr[0]
	                    	, borderColor : '#000000'
	                }]
	                }
	                , options: {
	                    tooltips: {enabled: false},
	                    legend: {
	                        display: false
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: '창업위험지수' + ': ' + gradeArr[0]
	                        , position: 'bottom'
	                        , fontColor: '#000000'
	                    }
	                }
	            });
	            // 과밀지수 그래프 >> 배열의 1번째
	            var densityChart = document.getElementById("densityChart").getContext('2d');
	            var densityChartA = new Chart(densityChart, {
	                type: 'doughnut'
	                , data: {
	                    labels: ["매우위험", "위험", "보통", "좋음"]
	                    , datasets: [{
	                        data: [25, 25, 25, 25]
	                        , backgroundColor: backColArr[1]
	                    	, borderColor : '#000000'
	                }]
	                }
	                , options: {
	                    tooltips: {enabled: false},
	                    legend: {
	                        display: false
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: '과밀지수' + ': ' + gradeArr[1]
	                        , position: 'bottom'
	                        , fontColor: '#000000'
	                    }
	                }
	            });
	            // 활성도 그래프 >> 배열의 2번째
	            var activationChart = document.getElementById("activationChart").getContext('2d');
	            var activationChartA = new Chart(activationChart, {
	                type: 'doughnut'
	                , data: {
	                    labels: ["매우위험", "위험", "보통", "좋음"]
	                    , datasets: [{
	                        data: [25, 25, 25, 25]
	                        , backgroundColor: backColArr[2]
	                    	, borderColor : '#000000'
	                }]
	                }
	                , options: {
	                    tooltips: {enabled: false},
	                    legend: {
	                        display: false
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: '활성도' + ': ' + gradeArr[2]
	                        , position: 'bottom'
	                        , fontColor: '#000000'
	                    }
	                }
	            });
	            
	            // 성장가능성 그래프 >> 배열의 3번째
	            var potentialChart = document.getElementById("potentialChart").getContext('2d');
	            var potentialChartA = new Chart(potentialChart, {
	                type: 'doughnut'
	                , data: {
	                    labels: ["매우위험", "위험", "보통", "좋음"]
	                    , datasets: [{
	                        data: [25, 25, 25, 25]
	                        , backgroundColor: backColArr[3]
	                    	, borderColor : '#000000'
	                }]
	                }
	                , options: {
	                    tooltips: {enabled: false},
	                    legend: {
	                        display: false
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: '성장가능성' + ': ' + gradeArr[3]
	                        , position: 'bottom'
	                        , fontColor: '#000000'
	                    }
	                }
	            });
	            // 안전도 그래프 >> 배열의 4번째
	            var safeChart = document.getElementById("safeChart").getContext('2d');
	            var safeChartA = new Chart(safeChart, {
	                type: 'doughnut'
	                , data: {
	                    labels: ["매우위험", "위험", "보통", "좋음"]
	                    , datasets: [{
	                        data: [25, 25, 25, 25]
	                        , backgroundColor: backColArr[4]
	                    	, borderColor : '#000000'
	                }]
	                }
	                , options: {
	                    tooltips: {enabled: false},
	                    legend: {
	                        display: false
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: '안전도' + ': ' + gradeArr[4]
	                        , position: 'bottom'
	                        , fontColor: '#000000'
	                    }
	                }
	            });
	         	
	         // 메인 레이더 차트
	            var mainRadarChart = document.getElementById("mainRadarChart").getContext('2d');
	            var mainRadarChartA = new Chart(mainRadarChart, {
	                type: 'radar'
	                , data: {
	                    labels: ['창업위험지수', '과밀지수', '활성도', '성장가능성', '안전도']
	                    , datasets: [{
	                        label: '현재 상권'
	                        , data : dataArr
	                        , backgroundColor: 'rgba(165, 223, 249, 0.3)'
	                        , borderColor: 'rgba(165, 223, 249)'
	                }, {
	                        label: topThreeList[0].alleyBiz.alleybizCode_Name
	                        , data: [topThreeList[0].mlresult.estmt_ROF_VALUE, 
	 	            		   		 topThreeList[0].mlresult.estmt_OI_VALUE, 
				            		 topThreeList[0].mlresult.estmt_AI_VALUE,
				            		 topThreeList[0].mlresult.estmt_GI_VALUE,
				            		 topThreeList[0].mlresult.estmt_SI_VALUE]
	                        , backgroundColor: 'rgba(239, 82, 133, 0.3)'
	                        , borderColor: 'rgba(239, 82, 133)'
	                }, {
	                        label: topThreeList[1].alleyBiz.alleybizCode_Name
	                        , data: [topThreeList[1].mlresult.estmt_ROF_VALUE, 
		            		   		 topThreeList[1].mlresult.estmt_OI_VALUE, 
				            		 topThreeList[1].mlresult.estmt_AI_VALUE,
				            		 topThreeList[1].mlresult.estmt_GI_VALUE,
				            		 topThreeList[1].mlresult.estmt_SI_VALUE]
	                        , backgroundColor: 'rgba(96, 197, 186, 0.3)'
	                        , borderColor: 'rgba(96, 197, 186)'
	                }, {
	                        label: topThreeList[2].alleyBiz.alleybizCode_Name
	                        , data: [topThreeList[2].mlresult.estmt_ROF_VALUE, 
	            		   		 	 topThreeList[2].mlresult.estmt_OI_VALUE, 
			            		 	 topThreeList[2].mlresult.estmt_AI_VALUE,
			            		 	 topThreeList[2].mlresult.estmt_GI_VALUE,
			            		 	 topThreeList[2].mlresult.estmt_SI_VALUE]
	                        , backgroundColor: 'rgba(254, 238, 125, 0.3)'
	                        , borderColor: 'rgba(254, 238, 125)'
	                }]
	                }
	                , options: {
	                    legend: {
	                        display: true
	                        , position: 'left'
	                        , labels: {
	                            fontColor: '#000000'
	                        }
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: 'MAIN CHART'
	                        , position: 'top'
	                        , fontColor: '#000000'
	                    }
	                }
	            });
	            
	            // 매출액 차트
	            var salesAmount = document.getElementById("salesAmountChart").getContext('2d');
	            var salesAmountChart = new Chart(salesAmount, {
	                type: 'bar'
	                , data: {
	                    labels: ["현재 상권", 
	                    		 topThreeList[0].alleyBiz.alleybizCode_Name, 
           						 topThreeList[1].alleyBiz.alleybizCode_Name, 
           						 topThreeList[2].alleyBiz.alleybizCode_Name]
	                    , datasets: [{
	                        label: '매출액'
	                        , data: dataEstimatedArr
	                        , backgroundColor: ['rgba(165, 223, 249, 0.3)'
	                        					, 'rgba(239, 82, 133, 0.3)'
	                        					, 'rgba(96, 197, 186, 0.3)'
	                        					, 'rgba(254, 238, 125, 0.3)']
	                        , borderColor: ['rgba(165, 223, 249)'
	                        				, 'rgba(239, 82, 133)'
	                        				, 'rgba(96, 197, 186)'
	                        				, 'rgba(254, 238, 125)']
	                        , borderWidth: 1
	                }]
	                }
	                , options: {
	                    legend: {
	                        display: false
	                    }
	                    , circumference: 1 * Math.PI
	                    , rotation: 1 * Math.PI
	                    , title: {
	                        display: true
	                        , text: '매출액'
	                        , position: 'top'
	                    }
	                }
	            });
	            
    		}
   		}
    })
    
    </script>
<!--===============================================================================================-->    
    <script type="text/javascript">
    // 분석 결과 리포트 탭 메뉴 클릭 시, 활성화 구현
        $('#primary a').click(function(){
            $('#primary a').removeClass('active');
            $(this).addClass('active');
            $('#Content #totalAnalysis').css('display', 'none');
            $('#Content #detailAnalysis').css('display', 'none');
            $('#Content #landAnalysis').css('display', 'none');
            var tabname = $(this).text();
            var value;
            if(tabname === '상권 종합 분석') {
              value = 'totalAnalysis';
            } else if (tabname === '상권 상세 분석') {
              value = 'detailAnalysis';
            } else {
              value = 'landAnalysis';
            }
            $('#'+value).css('display', 'block');
        });
    
    // 대출 관련 정보 입력 버튼 클릭 시, 생기는 필터 부분(신용대출, 담보대출) 탭 구현
      $('#innerPrimary a').click(function() {
    	  $('#innerPrimary a').removeClass('active');
          $(this).addClass('active');
          $('#innerContent #creditLoan').css('display', 'none');
          $('#innerContent #guaranteeLoan').css('display', 'none');
          var tabname = $(this).text();
          var value;
          if(tabname === '신용 대출') {
            value = 'creditLoan';
          } else {
            value = 'guaranteeLoan';
          }
          $('#'+value).css('display', 'block');
      });
      </script>
<!--===============================================================================================-->      
    <script type="text/javascript">
    /*
    *	
    */
    function makePopChart(topThreeList,popWishList){
    	 // 상권 상세 분석에 들어가는 chart 종류
        var curMarketArr = makeDataArr(topThreeList,popWishList);
        
        var populationChartData = {
            labels: ['총 유동인구 수', '남성 유동인구 수', '여성 유동인구 수']
            , datasets: [{
                type: 'bar'
                , label: topThreeList[0].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor1
                , borderWidth: 2
                , fill: false
                , data: curMarketArr[0]
			}, {
                type: 'bar'
                , label: topThreeList[1].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor2
                , data: curMarketArr[1]
                , borderColor: 'white'
                , borderWidth: 2
			},{
                type: 'bar'
                    , label: topThreeList[2].alleyBiz.alleybizCode_Name
                    , backgroundColor: chartbackcolor3
                    , data: curMarketArr[2]
                    , borderColor: 'white'
                    , borderWidth: 2
    		  }
			]
        };
        
        var population = document.getElementById('populationChart').getContext('2d');
        var populationChart = new Chart(population, {
            type: 'bar'
            , data: populationChartData
            , options: {
                responsive: true
                , tooltips: {
                    mode: 'index'
                    , intersect: true
                }, title: {
                    display: true
                    , text: '성별 유동인구 '
                }
            }
        });
    }
   	
    function makedayChart(topThreeList,dayWishList){
    	var dayCurDataArr = makeDataArr(topThreeList,dayWishList);
        
        var dayChartData = {
            labels: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
            , datasets: [{
                type: 'bar'
                , label: topThreeList[0].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor1
                , borderWidth: 2
                , fill: false
                , data: dayCurDataArr[0]
			}, {
                type: 'bar'
                , label: topThreeList[1].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor2
                , data: dayCurDataArr[1]
                , borderColor: 'white'
                , borderWidth: 2
			},{
                type: 'bar'
                    , label: topThreeList[2].alleyBiz.alleybizCode_Name
                    , backgroundColor: chartbackcolor3
                    , data: dayCurDataArr[2]
                    , borderColor: 'white'
                    , borderWidth: 2
    			}
			]
        };
        var day = document.getElementById('dayChart').getContext('2d');
        var dayChart = new Chart(day, {
            type: 'bar'
            , data: dayChartData
            , options: {
                responsive: true
                , tooltips: {
                    mode: 'index'
                    , intersect: true
                }, title: {
                    display: true
                    , text: '요일별 유동인구 수'
                }
            }
        });
    }
    
    function makeTimeChart(topThreeList,timeWishList){
    	 var timeCurDataArr = makeDataArr(topThreeList,timeWishList);
         
         var timeChartData = {
             labels: ['00시 ~ 06시', '06시 ~ 11시', '11시 ~ 14시', '14시 ~ 17시', '17시 ~ 21시', '21시 ~ 24시']
             , datasets: [{
                 type: 'bar'
                 , label: topThreeList[0].alleyBiz.alleybizCode_Name
                 , backgroundColor: chartbackcolor1
                 , borderWidth: 2
                 , fill: false
                 , data: timeCurDataArr[0]
 			}, {
                 type: 'bar'
                 , label: topThreeList[1].alleyBiz.alleybizCode_Name
                 , backgroundColor: chartbackcolor2
                 , data: timeCurDataArr[1]
                 , borderColor: 'white'
                 , borderWidth: 2
 			},{
                type: 'bar'
                    , label: topThreeList[2].alleyBiz.alleybizCode_Name
                    , backgroundColor: chartbackcolor3
                    , data: timeCurDataArr[2]
                    , borderColor: 'white'
                    , borderWidth: 2
    			}]
         };
         
         var time = document.getElementById('timeChart').getContext('2d');
         var timeChart = new Chart(time, {
             type: 'bar'
             , data: timeChartData
             , options: {
                 responsive: true
                 , tooltips: {
                     mode: 'index'
                     , intersect: true
                 }, title: {
                     display: true
                     , text: '시간대별 유동인구'
                 }
             }
         });
    }
        
    function makeAgeChart(topThreeList,ageWishList){
    	var ageCurDataArr = makeDataArr(topThreeList,ageWishList);

    	var ageChartData = {
            labels: ['10대', '20대', '30대', '40대', '50대', '60대']
            , datasets: [{
                type: 'bar'
                , label: topThreeList[0].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor1
                , borderWidth: 2
                , fill: false
                , data: ageCurDataArr[0]
			}, {
                type: 'bar'
                , label: topThreeList[1].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor2
                , data: ageCurDataArr[1]
                , borderColor: 'white'
                , borderWidth: 2
			}, {
                type: 'bar'
                    , label: topThreeList[0].alleyBiz.alleybizCode_Name
                    , backgroundColor: chartbackcolor3
                    , data: ageCurDataArr[2]
                    , borderColor: 'white'
                    , borderWidth: 2
    			}]
        };
        var age = document.getElementById('ageChart').getContext('2d');
        var ageChart = new Chart(age, {
            type: 'bar'
            , data: ageChartData
            , options: {
                responsive: true
                , tooltips: {
                    mode: 'index'
                    , intersect: true
                }, title: {
                    display: true
                    , text: '연령별 유동인구 수'
                }
            }
        });
    }
    
    function makeLiveChart(topThreeList,liveWishList){
    	var liveCurDataArr = makeDataArr(topThreeList,liveWishList);
        
        var liveChartData = {
            labels: ['총 상주인구', '남성 상주인구 수', '여성 상주인구 수', '10대 상주인구 수', '20대 상주인구 수', '30대 상주인구 수', '40대 상주인구 수', '50대 상주인구 수', '60대 상주인구 수']
            , datasets: [{
                type: 'bar'
                , label: topThreeList[0].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor1
                , borderWidth: 2
                , fill: false
                , data: liveCurDataArr[0]
			}, {
                type: 'bar'
                , label: topThreeList[1].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor2
                , data: liveCurDataArr[1]
                , borderColor: 'white'
                , borderWidth: 2
			}, {
                type: 'bar'
                , label: topThreeList[2].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor3
                , data: liveCurDataArr[2]
                , borderColor: 'white'
                , borderWidth: 2
			}]
        };
        var live = document.getElementById('liveChart').getContext('2d');
        var liveChart = new Chart(live, {
            type: 'bar'
            , data: liveChartData
            , options: {
                responsive: true
                , tooltips: {
                    mode: 'index'
                    , intersect: true
                }
            }
        });
    }
       

    
    function makeJobChart(topThreeList,jobWishList){
    	 var jobCurDataArr = makeDataArr(topThreeList,jobWishList);
    	 
         var jobChartData = {
             labels: ['총 직장인구', '남성 직장인구 수', '여성 직장인구 수', '10대 직장인구 수', '20대 직장인구 수', '30대 직장인구 수', '40대 직장인구 수', '50대 직장인구 수', '60대 직장인구 수']
             , datasets: [{
                 type: 'bar'
                 , label: topThreeList[0].alleyBiz.alleybizCode_Name
                 , backgroundColor: chartbackcolor1
                 , borderWidth: 2
                 , fill: false
                 , data: jobCurDataArr[0]
 			}, {
                 type: 'bar'
                 , label: topThreeList[1].alleyBiz.alleybizCode_Name
                 , backgroundColor: chartbackcolor2
                 , data: jobCurDataArr[1]
                 , borderColor: 'white'
                 , borderWidth: 2
 			}, {
                 type: 'bar'
                 , label: topThreeList[2].alleyBiz.alleybizCode_Name
                 , backgroundColor: chartbackcolor3
                 , data: jobCurDataArr[2]
                 , borderColor: 'white'
                 , borderWidth: 2
 			}]
         };
         var job = document.getElementById('jobChart').getContext('2d');
         var jobChart = new Chart(job, {
             type: 'bar'
             , data: jobChartData
             , options: {
                 responsive: true
                 , tooltips: {
                     mode: 'index'
                     , intersect: true
                 }
             }
         });
    }    
        
    function makeLossChart(topThreeList,lossWishList){
    	var lossCurDataArr = makeDataArr(topThreeList,lossWishList);
        
        var lossChartData = {
            labels: ['지출 총 금액', '식료품 지출', '의료 지출', '생활용품 지출', '교통 지출', '여가 지출', '문화 지출', '교육 지출', '유흥 지출']
            , datasets: [{
                type: 'bar'
                , label: topThreeList[0].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor1
                , borderWidth: 2
                , fill: false
                , data: lossCurDataArr[0]
			}, {
                type: 'bar'
                , label: topThreeList[1].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor2
                , data: lossCurDataArr[1]
                , borderColor: 'white'
                , borderWidth: 2
			}, {
                type: 'bar'
                , label: topThreeList[2].alleyBiz.alleybizCode_Name
                , backgroundColor: chartbackcolor3
                , data: lossCurDataArr[2]
                , borderColor: 'white'
                , borderWidth: 2
			}]
        };
        var loss = document.getElementById('lossChart').getContext('2d');
        var lossChart = new Chart(loss, {
            type: 'bar'
            , data: lossChartData
            , options: {
                responsive: true
                , tooltips: {
                    mode: 'index'
                    , intersect: true
                }
                
            }
        });
    }  
    
    function makeMartChart(topThreeList,survivalWishList){
    	var martCurDataArr = makeDataArr(topThreeList,survivalWishList);
    	
   	 // 상권 상세 정보 분석 탭 두번째 Chart들
       var martRunningTime = document.getElementById('martRunningTimeChart').getContext('2d');
       var martRunningTimeChart = new Chart(martRunningTime, {
           // The type of chart we want to create
           type: 'line', // The data for our dataset
           data: {
               labels: ["2013", "2014", "2015", "2016", "2017", "2018"]
               , datasets: [{
                   label: topThreeList[0].alleyBiz.alleybizCode_Name
                   , backgroundColor: 'rgb(255, 99, 132)'
                   , borderColor: 'rgb(255, 99, 132)'
                   , data: martCurDataArr[0]
       },{
           label: topThreeList[1].alleyBiz.alleybizCode_Name
               , backgroundColor: 'rgb(255, 99, 132)'
               , borderColor: 'rgb(255, 99, 132)'
               , data: martCurDataArr[1]
   },{
       label: topThreeList[2].alleyBiz.alleybizCode_Name
           , backgroundColor: 'rgb(255, 99, 132)'
           , borderColor: 'rgb(255, 99, 132)'
           , data: martCurDataArr[2]
}]
           }, // Configuration options go here
           options: {}
       });
   }
  
   function makeSumMartChart(){
   	var sumMart = document.getElementById('sumMartChart').getContext('2d');
       var sumMartChart = new Chart(sumMart, {
           // The type of chart we want to create
           type: 'line', // The data for our dataset
           data: {
               labels: ["01", "02", "03", "04", "05", "06"]
               , datasets: [{
                   label: "월별 점포 수"
                   , backgroundColor: 'rgb(255, 99, 132)'
                   , borderColor: 'rgb(255, 99, 132)'
                   , data: [0, 10, 5, 2, 20, 30]
       }]
           }, // Configuration options go here
           options: {}
       });
   }     
    /* 차트 만드는 기능 : 호준 */
    
    function makeAllChart(){
    	         makePopChart(topThreeList,popWishList);
	        	 makedayChart(topThreeList,dayWishList);
	        	 makeTimeChart(topThreeList,timeWishList);
	        	 makeAgeChart(topThreeList,ageWishList);
	        	 makeLiveChart(topThreeList,liveWishList);
	        	 makeJobChart(topThreeList,jobWishList);
	        	 makeLossChart(topThreeList,lossWishList);
	        	 makeMartChart(topThreeList,survivalWishList);
    }
    </script>
    
    <script>
        var openMartCntDataArr = new Array();
        var closeMartCntDataArr = new Array();
        var opentCloseGapCntDataArr = new Array();
        openMartCntDataArr = [
          100
          , 200
          , 100
          , 200
          , 150
          , 100
          , 70
        ];
        closeMartCntDataArr = [
          40
          ,50
          , 70
          , 28
          , 88
          , 220
          , 11
        ]
        
        for(var i = 0; i < openMartCntDataArr.length; i++) {
            opentCloseGapCntDataArr[i] = openMartCntDataArr[i] - closeMartCntDataArr[i];
        }
        var openCloseChartData = {
            labels: ['01', '02', '03', '04', '05', '06', '07']
            , datasets: [{
                type: 'bar'
                , label: '개업 점포 수'
                , backgroundColor: '#2b90d9'
                , borderWidth: 2
                , fill: false
                , data: openMartCntDataArr
      }, {
                type: 'bar'
                , label: '폐업 점포 수'
                , backgroundColor: '#ef5285'
                , data: closeMartCntDataArr
                , borderColor: 'white'
                , borderWidth: 2
      }, {
                type: 'bar'
                , label: '해당월 개업 후 잔존 점포 수'
                , backgroundColor: '#60c5ba'
                , data: opentCloseGapCntDataArr
      }, {
                type: 'line'
                , label: '개업'
                , borderColor: '#a5dff9'
                , borderWidth: 2
                , fill: false
                , data: openMartCntDataArr
      }, {
                type: 'line'
                , label: '폐업'
                , borderColor: '#ef5285'
                , borderWidth: 2
                , fill: false
                , data: closeMartCntDataArr
      }]
        };
        var openClose = document.getElementById('openCloseChart').getContext('2d');
        var openCloseChart = new Chart(openClose, {
            type: 'bar'
            , data: openCloseChartData
            , options: {
                responsive: true
                , tooltips: {
                    mode: 'index'
                    , intersect: true
                }
            }
        });
    </script>
    
    <script type="text/javascript">
    /**
     * 
     */
     // 대출 관련 정보 입력하기 버튼 클릭 시, 활성화 되는 필터 입력창
        $('#inputInfoBtn').click(function(){
        	if($('#inputInfoArea').hasClass('dis-none')) {
    	    	$('#inputInfoArea').removeClass('dis-none');
        	} else {
    	    	$('#inputInfoArea').addClass('dis-none');
        	}
        })
        
        // 직업 선택 시, 재직 기간 입력 가능한 태그 생성 jQuery
        $('#creditJobSelect').change(function() {
        	if($(this).val() !== '무직') {
        		$('#creditWorkingPeriod1').removeClass('dis-none');
        		$('#creditWorkingPeriod1').addClass('dis-block');
        	} else {
        		$('#creditWorkingPeriod1').removeClass('dis-block');
        		$('#creditWorkingPeriod1').addClass('dis-none');
        		
        	}
        })
        
        $('#guaranteeJobSelect').change(function() {
        	if($(this).val() !== '무직') {
        		$('#guaranteeWorkingPeriod2').removeClass('dis-none');
        		$('#guaranteeWorkingPeriod2').addClass('dis-block');
        	} else {
        		$('#guaranteeWorkingPeriod2').removeClass('dis-block');
        		$('#guaranteeWorkingPeriod2').addClass('dis-none');
        		
        	}
        })
        
     // 신용대출용 ------------------------------------------------------------------------------------------------------------------------
        $(function(){
        $('#creditJobSelect1').on('change', function(){
        	var job = $('#creditJobSelect1 option:selected').val(); //input에 닮을 값
        	/* $('#creditWorkingPeriod1').show(); */ //재직기간 오픈
        	$('#takeJob1').text($('#creditJobSelect1 option:selected').text());
        	/* $('#selectCreditLoanForm') */
        	$("#selectCreditLoanForm input[name=targetNum]").val(job);
        	
        });
        
        $('#creditRankSelect1').on('change', function(){
        	var Rank = $('#creditRankSelect1 option:selected').val();
        	console.log(Rank);
       	 	$.ajax({
    	        url : '/loan/' + Rank,
    	        // 서버로 값을 성공적으로 넘기면 처리하는 코드부분 입니다.
    	        success : function(data) {
    	            // 변경된 태그 부분을 넘어온 index 값으로 찾은 뒤 on/off를 변경합니다.
    	           var rate = data.rateLoan;
    	            console.log(rate);
    	        	$('#takeRate1').text(rate); // 동적으로 받은 값 넣어줘야 함. 비동기
    	        	$("#selectCreditLoanForm input[name=resultRate]").val(rate);
    	        },
    	        error : function(data){
    	        	console.log("비동기 오류");
    	        }
    	    });
    /*     	var money = $("#inputYearMoney1").val();
        	var line = $('#takeCreditLine1')
        	switch (Rank) { 
                	case '1' : line.text(money * 2); break;
                	case '2' : line.text(money * 1.8); break;
                	case '3' : line.text(money * 1.5); break;		
                	case '4' : line.text(money * 1.5); break;
                	case '5':  line.text(money * 1.3); break;
                	case '6':  line.text(money * 1); break;
                	case '7':  line.text(money * 0.15); break;		
                	case '8':  line.text(money * 2); break;
                	case '9':  line.text(money * 0.08); break;
                	case '10': line.text(money * 0.08); break;
        	} */
        });
        
        
        //소득금액 컨트롤
            $("#inputYearMoney1").keyup(function() { 
        	var money = $("#inputYearMoney1").val();
        	console.log(money); 
        	$("#selectCreditLoanForm input[name=resultRate]").val(money);
        	$('#takeYearMoney1').text(money);
        	
        });
        
        $( ".analysisBtn2" ).each(function(index) {
            $(this).on("click", function(){
                var money = parseInt($(this).val());
                console.log(money);
            	$('#inputYearMoney1').val(money);
                //var resultMoney = parseInt($("#inputBorrowMoney1").val()) + money;
            	$("#takeYearMoney1").text(money);
            	$("#selectCreditLoanForm input[name=requiredMoney]").val(money+"0000");
            });
        });
        
        
        //대출희망금액 컨트롤
        $("#inputBorrowMoney1").keyup(function() { 
        	var money = $("#inputBorrowMoney1").val();
        	console.log(money); 
        	$('#selectCreditLoanForm input[name=resultRate]').val(money+"0000");
        	$('#takeBorrowMoney1').text(money);
        });
        
        
        $( ".analysisBtn1" ).each(function(index) {
            $(this).on("click", function(){
                var money = parseInt($(this).val());
                console.log(money);
                //var resultMoney = parseInt($("#inputBorrowMoney1").val()) + money;
            	$("#inputBorrowMoney1").val(money);
            	$('#takeBorrowMoney1').text(money);
            	$("#selectCreditLoanForm input[name=takeYearMoney1]").val(money + "0000");
            });
        });
        
        $("#loanSubmitBtn").on("click", function(e){
        	e.preventDefault();
        	$("#selectCreditLoanForm").submit();
        });
    });
        
     // 담보 대출용----------------------------------------------------------------------------------------------------------------------- 
        $(function(){
            //대출희망금액 컨트롤
            $("#inputBorrowMoney2").keyup(function() { 
              var money = $("#inputBorrowMoney2").val();
              console.log(money); 
              $('#selectSecurityLoanForm input[name=requiredMoney]').val(money+"0000");
              $('#takeBorrowMoney2').text(money);
            });
            
            $( ".analysisBtn1" ).each(function(index) {
                $(this).on("click", function(){
                    var money = parseInt($(this).val());
                    console.log(money);
                  $("#inputBorrowMoney2").val(money);
                  $('#takeBorrowMoney2').text(money);
                  $("#selectSecurityLoanForm input[name=requiredMoney]").val(money+"0000");
                });
            });
            
        	//신용등급별 이율 컨트롤
            $('#creditRankSelect2').on('change', function(){
              var Rank = $('#creditRankSelect2 option:selected').val();
              console.log(Rank);
         	 	$.ajax({
        	        url : '/loan/' + Rank,
        	        // 서버로 값을 성공적으로 넘기면 처리하는 코드부분 입니다.
        	        success : function(data) {
        	            // 변경된 태그 부분을 넘어온 index 값으로 찾은 뒤 on/off를 변경합니다.
        	           var rate = data.rateLoan;
        	            console.log(rate);
        	        	$('#takeRate2').text(rate); // 동적으로 받은 값 넣어줘야 함. 비동기
        	        	$("#selectSecurityLoanForm input[name=resultRate]").val(rate);
        	        },
        	        error : function(data){
        	        	console.log("비동기 오류");
        	        }
        	    });
            });
            
        	//직업 컨트롤
            $('#guaranteeJobSelect').on('change', function(){
              var job = $('#guaranteeJobSelect option:selected').val(); //input에 닮을 값
              $('#guaranteeWorkingPeriod2').show(); //재직(사업)기간 오픈
              
              $('#takeJob2').text($('#guaranteeJobSelect option:selected').text());
              $("#selectSecurityLoanForm input[name=targetNum]").val(job);
            });

            
        	//담보종류 컨트롤
            $('#guaranteeSelect').on('change', function(){
                var security = $('#guaranteeSelect option:selected').val();
                console.log(security);
                $('#takeSecurity').text(security);
                $("#selectSecurityLoanForm input[name=securityType]").val(security);
            });
        	
            //소득금액 컨트롤
                $("#inputYearMoney2").keyup(function() { 
              var money = $("#inputYearMoney2").val();
              console.log(money); 
              $("#selectSecurityLoanForm input[name=resultRate]").val(money);
              $('#takeYearMoney2').text(money);
              
            });
            
            $( ".analysisBtn2" ).each(function(index) {
                $(this).on("click", function(){
                    var money = parseInt($(this).val());
                    console.log(money);
                  $('#inputYearMoney2').val(money);
                    //var resultMoney = parseInt($("#inputBorrowMoney1").val()) + money;
                  $("#takeYearMoney2").text(money);
                  $("#selectSecurityLoanForm input[name=requiredMoney]").val(money+"0000");
                });
            });
            
            
            $("#loanSubmitBtn2").on("click", function(e){
              e.preventDefault();
              $("#selectSecurityLoanForm").submit();
            });
        });
    </script>
<!--===============================================================================================-->
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
	<script src="${pageContext.request.contextPath}/resources/js/toastMessage.js"></script>
<!-- 스낵바(토스트 메시지) -->
<div id="snackbar"></div>
</body>
</html>