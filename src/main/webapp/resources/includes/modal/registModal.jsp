<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 회원가입모달 -->
  <!-- Modal HTML -->
  <div id="registModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">회원가입</h4>
          <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">

          <form action="/regist" method="post" onsubmit="beforeSubmit()">
            <!-- 유효성에 대한 메시지 띄워야함.. -->
            <c:forEach var="error" items="${errors.allErrors }">
              <span>${error.defaultMessage}</span>
            </c:forEach>
            <!-- --------------------- -->
            <div class="form-group">
              <input type="text" name="userid" id="userid"
                class="form-control width-60"
                placeholder="ID 입력 (12자 이내의 영문, 숫자 조합)"
                required="required"
                style="padding-left: 10px; display: inline;" /> <input
                type="button" value="중복확인" id="dupCheck"
                class="display-i btn btn-primary btn-lg width-37 height-40"
                style="display: inline;" /> 중복확인
            </div>

            <div class="form-group">
              <input type="password" name="userpw" id="userpw"
                class="form-control "
                placeholder="PW 입력 (12자 이내의 영문, 숫자 조합)"
                required="required" style="padding-left: 10px;" />
            </div>

            <div class="form-group">
              <input type="password" name="passConfirm"
                class="form-control " placeholder="PW 확인"
                required="required" style="padding-left: 10px;" />
            </div>

            <div class="form-group">
              <input type="text" name="userName" class="form-control "
                placeholder="이름 입력 (2~4 자리의 한글 이름)" required="required"
                style="padding-left: 10px;" />
            </div>

            <div class="form-group">
              <input type="text" name="memberBirth"
                class="display-i form-control width-50"
                placeholder="ex) 991123" required="required"
                style="padding-left: 10px;"> <span
                class="fsize-16 width-5">-</span> <input type="text"
                name="userGender"
                class="display-i form-control width-10"
                required="required" style="padding-left: 10px;">
              <span class="fsize-16 width-35">&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*</span>
            </div>


            <div class="form-group">
              <select
                class="display-i form-control vertical-align-t width-30"
                id="memberPhone1" style="padding-left: 10px;">
                <option selected>휴대폰번호</option>
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="012">012</option>
                <option value="013">013</option>
                <option value="014">014</option>
                <option value="015">015</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
              </select> <span class="fsize-16 width-5">-</span> <input
                type="text" id="memberPhone2"
                class="display-i form-control width-30"
                placeholder="앞 4자리" required="required"
                style="padding-left: 10px;"> <span
                class="fsize-16 width-5">-</span> <input type="text"
                id="memberPhone3"
                class="display-i form-control width-30"
                placeholder="뒤 4자리" required="required"
                style="padding-left: 10px;"> <input
                type="hidden" id="memberPhoneNum" name="memberPhoneNum">
            </div>

            <div class="form-group">
              <input type="text" id="email"
                class="display-i form-control width-50"
                placeholder="이메일을 입력하세요" required="required"
                style="padding-left: 10px;"> <span
                class="fsize-16 width-8">&nbsp;@&nbsp;</span> <select
                id="emailHost"
                class="display-i form-control vertical-align-t p-l-0 width-40"
                name="emailHost" id="emailHost"
                style="padding-left: 10px;">
                <option selected>이메일선택</option>
                <option>daum.net</option>
                <option>gmail.com</option>
                <option>naver.com</option>
                <option>nate.com</option>
                <!-- <option>직접입력</option> 이거선택시 input text만들어져야함..-->
              </select> <input type="hidden" id="memberEmail" name="memberEmail">
            </div>
            <div class="form-group">
              <!-- <input type="text" class="display-i form-control width-40" placeholder="직접입력" required="required" style="padding-left:10px;"> -->

              <input type="text" id="certifyCodeInput"
                class="display-i form-control width-60"
                placeholder="인증번호를 입력하세요" disabled="disabled"
                required="required" style="padding-left: 10px;">&nbsp;
              <button type="button" id="emailCertify"
                class="display-i btn btn-primary btn-block btn-lg width-37 height-40" />
              이메일인증
              </button>
            </div>


            <!-- 인증 결과 표시해주는 DIV 태그 -->
            <div class="form-group"></div>

            <div class="form-group">
              <input type="submit"
                class="btn btn-primary btn-block btn-lg" value="회 원 가 입">
            </div>


          </form>

        </div>
        <div class="modal-footer">
          <div>(주) 하나금융티아이</div>
        </div>
      </div>
    </div>
  </div>