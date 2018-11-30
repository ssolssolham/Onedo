<%@ page contentType="text/html; charset=utf-8"%>
<!-- Login Modal HTML -->
  <div id="loginModal" class="modal fade">
    <div class="modal-dialog modal-login">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">로그인</h4>
          <p>${error}</p>
          <p>${logout}</p>
          <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
        </div>

        <div class="modal-body">
          <form id="loginForm" action="/login" method="post">
            <div class="form-group">
              <i class="fa fa-user"></i> <input type="text"
                class="form-control"
                placeholder="ID 입력(12자 이내의 영문, 숫자 조합)"
                required="required" name="username">
            </div>
            <div class="form-group">
              <i class="fa fa-lock"></i> <input type="password"
                class="form-control"
                placeholder="PW입력(12자 이내의 영문, 숫자 조합)"
                required="required" name="password">
            </div>
            <div class="form-group">
              <div class="switch" data-name="human" data-checked="true"
                data-value="true">
                <div class="helper"></div>
              </div>
              &nbsp;&nbsp;
              <div class="display-i fsize-16 vertical-align-s">아이디
                기억하기</div>
              <input name="remember-me" type="checkbox">
            </div>

            <div class="form-group">
              <input type="hidden" name="${_csrf.parameterName}"
                value="${_csrf.token}" /> <input type="submit"
                class="btn btn-primary btn-block btn-lg" value="로그인">
            </div>
          </form>

        </div>
        <div class="modal-footer">
          <a href="#">ID, PW를 잊으셨나요?</a>
        </div>
      </div>
    </div>
  </div>