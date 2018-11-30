<%@ page contentType="text/html; charset=utf-8"%>
<header>
  <!-- 헤더 태그 설정 -->
  <div class="wrap-menu-header trans-0-4" style="background-color: white;">
    <div class="container h-full" style="max-width: 1500px;">
      <div class="wrap_header trans-0-3">
        <!-- 로고 들어가는 곳 -->
        <div class="logo">
          <a href="/"> <img
            src="${pageContext.request.contextPath}/resources/images/icons/logo.png" alt="IMG-LOGO" data-logofixed="${pageContext.request.contextPath}/resources/images/icons/logo.png">
          </a>
        </div>
        
        <!-- 상단 Nav 바 Menu -->
        <div class="wrap_menu p-l-45 p-l-0-xl">
          <nav class="menu">
            <ul class="main_menu">
              <li><a href="/">Home</a></li>
              <li><a href="">티아이 소개</a></li>
              <li><a href="/analysis/">분석하기</a></li>
              <li><a href="/qna/">이용 문의</a></li>
              <li><a href="/review/">이용 후기</a></li>
              <li><a href="/reserve/">상담 예약</a></li>
              <li><a href="/member/loginForm">로그인</a></li>
              <li><a href="/member/registForm">회원가입</a></li>
            </ul>
          </nav>
        </div>

        <!-- My 메뉴 보기 버튼 -->
        <div class="social flex-w flex-l-m p-r-20">
          <button class="btn-show-sidebar m-l-33 trans-0-4"
            style="background-color: none; color: black;">
            <img
              src="${pageContext.request.contextPath}/resources/images/icons/btn-all-menu.png"
              alt="ALL-MENU">
          </button>
        </div>
      </div>
    </div>
  </div>
</header>