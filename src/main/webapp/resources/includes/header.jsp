<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
        <div class="wrap_menu p-l-0-xl" style="padding-left:355px;">
          <nav class="menu">
            <ul class="main_menu">
              <li><a href="/">Home</a></li>
              <li><a href="/analysis/">분석하기</a></li>
              <li><a href="/qna/">이용 문의</a></li>
              <li><a href="/review/list">이용 후기</a></li>
            <!-- 로그인 안했을 경우 -->
            <sec:authorize access="isAnonymous()">
              <li><a href="/member/loginForm">로그인</a></li>
              <li><a href="/member/registForm">회원가입</a></li>
            </sec:authorize>
            <!-- 로그인한경우 -->
            <sec:authorize access="isAuthenticated()">
              <li><a onclick="logoutFormSubmit()" id="logoutLink">로그아웃</a></li>
              <form action="/logout" method="post" id="logoutForm">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form>
            </sec:authorize>
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