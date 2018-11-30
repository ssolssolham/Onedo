<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- My 메뉴 Slide 바 -->
<aside class="sidebar trans-0-4">
  <!-- 숨기기 버튼 -->
  <button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>

  <!-- 두줄짜리 버튼 클릭 시 나타나는 side Bar의 콘텐츠(내 정보 관련) -->
  <ul class="menu-sidebar p-t-95 p-b-70">
    <li class="t-center m-b-13">
      <a href="/" class="txt19">Home</a>
    </li>

    <li class="t-center m-b-13">
      <a href="intro.html" class="txt19">티아이 소개</a>
    </li>

    <li class="t-center m-b-13">
      <a href="/analysis/" class="txt19">상권분석</a>
    </li>

    <li class="t-center m-b-13">
      <a href="qna.html" class="txt19">이용 문의</a>
    </li>

    <li class="t-center m-b-13">
      <a href="review.html" class="txt19">후기</a>
    </li>

    <li class="t-center m-b-13">
      <a href="reserve.html" class="txt19">상담예약</a>
    </li>
<!-- 로그인한 회원만 보이는 메뉴 -->
<sec:authorize access="isAuthenticated()">
    <li class="t-center m-b-33">
      <a href="mypage.html" class="txt19">마이페이지</a>
    </li>

<!-- 로그아웃처리 필요!!!! -->    
    <li class="t-center">
    <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!--    <a href="/customLogout" class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">로그아웃</a><br>
 -->    <input type="submit" class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" value="로그아웃">
    </form>	
    </li>
</sec:authorize>

<!-- 비 로그인시 보이는 메뉴 -->
<sec:authorize access="isAnonymous()">
    <li class="t-center">
      <!-- 슬라이드 바 로그인, 회원가입 버튼 --> 
      <a href="/member/loginForm/" class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton">로그인</a><br>
      <a href="/member/registForm" class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto" class="triggerButton">회원가입</a><br>
      <a href="" class="btn1 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">관리자페이지</a><br>
    </li>
</sec:authorize>
  </ul>
</aside>