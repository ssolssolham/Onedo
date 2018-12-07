<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<header>
  <!-- 헤더 태그 설정 -->
  <div class="wrap-menu-header trans-0-4" style="background-color: white;">
    <div class="container h-full" style="max-width: 1500px;">
      <div class="wrap_header trans-0-3">
        <!-- 로고 들어가는 곳 -->
        <div class="logo">
          <a href="/" style="display: inline;"> <img
            src="${pageContext.request.contextPath}/resources/images/icons/logo.png" alt="IMG-LOGO" data-logofixed="${pageContext.request.contextPath}/resources/images/icons/logo.png">
          </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
      <div class="welcome" style="margin-top: 6px;">
       <sec:authorize access="isAnonymous()">
     	<button type="button" style="height:40px; width:100px; border-radius: 16px;" onclick="location.href='/member/loginForm'">로그인</button>
     	<button type="button" style="height:40px; width:100px; border-radius: 16px;" onclick="location.href='/member/registForm'">회원가입</button>
       </sec:authorize>
       <sec:authentication property="principal" var="member"/>
       <sec:authorize access="isAuthenticated()">
           <h3 style="font-size: 22px; font-family: a드림고딕4; font-weight: bold; display: inline;"> <span style="color: #27b2a5;">${member.username}</span> 님, 환영합니다.</h3>&nbsp;&nbsp;
           <button type="button" style="height:40px; width:100px;  border-radius: 16px;" onclick="logoutFormSubmit()" id="logoutLink">로그아웃</button>
       </sec:authorize>
       
   	  </div>
        <!-- 상단 Nav 바 Menu -->
        <div class="wrap_menu p-l-0-xl" style="margin-top: 6px; width: 60%; text-align: right;">
          <nav class="menu" style="display: inline-flex;">
            <ul class="main_menu">
              <li><a href="/">Home</a></li>
              <li><a href="">이용 안내</a></li>
              <sec:authorize access="isAnonymous()">
                <li><a href="/member/loginForm">상권분석</a></li>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                  <li><a href="/analysis/">상권분석</a></li>
              </sec:authorize>
              <li><a href="/qna/">이용 문의</a></li>
              <li><a href="/review/list">이용 후기</a></li>
            <!-- 로그인 안했을 경우 -->
            <!-- 로그인한경우 -->
            <sec:authorize access="isAuthenticated()">
              <li><a href="/loan/reserveList?userId=${member.username}" id="loanHistory">대출 History</a></li>
              <form action="/logout" method="post" id="logoutForm">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form>
            </sec:authorize>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</header>