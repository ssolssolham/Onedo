<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Elegant Modal Login Modal Form with Icons</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
  font-family: 'Varela Round', sans-serif;
}

.modal-login {
  color: #636363;
  width: 400px;
}

.modal-login .modal-content {
  padding: 20px;
  border-radius: 5px;
  border: none;
}

.modal-login .modal-header {
  border-bottom: none;
  position: relative;
  justify-content: center;
}

.modal-login h4 {
  text-align: center;
  font-size: 26px;
}

.modal-login  .form-group {
  position: relative;
}

.modal-login i {
  position: absolute;
  left: 13px;
  top: 11px;
  font-size: 18px;
}

.modal-login .form-control {
  padding-left: 40px;
}

.modal-login .form-control:focus {
  border-color: #00ce81;
}

.modal-login .form-control, .modal-login .btn {
  min-height: 40px;
}

.modal-login .hint-text {
  text-align: center;
  padding-top: 10px;
}

.modal-login .close {
  position: absolute;
  top: -5px;
  right: -5px;
}

.modal-login .btn {
  background-color: #27B3A6;
  border: none;
  line-height: normal;
}

.modal-login .btn:hover, .modal-login .btn:focus {
  background-color: #93D9D2;
  color: white;
}

.modal-login .modal-footer {
  background: #ecf0f1;
  border-color: #dee4e7;
  text-align: center;
  margin: 0 -20px -20px;
  border-radius: 5px;
  font-size: 13px;
  justify-content: center;
}

.modal-login .modal-footer a {
  color: #999;
}

.triggerButton {
  display: inline-block;
  margin: 100px auto;
}


<!-- -->
.switch {
  display: inline-block;
  box-sizing: border-box;
  width: 64px;
  height: 28px;
  border-radius: 999px;
  background-color: #d8d9db;
  -webkit-transition: background-color cubic-bezier(.25, .46, .45, .94) .2s;
  -moz-transition: background-color cubic-bezier(.25, .46, .45, .94) .2s;
  transition: background-color cubic-bezier(.25, .46, .45, .94) .2s
}

.switch .helper {
  margin-top: 2px;
  margin-left: 2px;
  border-radius: 100%;
  width: 30px;
  height: 24px;
  display: inline-block;
  background-color: #fff;
  -webkit-transition-property: -webkit-transform;
  -moz-transition-property: -moz-transform;
  transition-property: transform;
  -webkit-transition-duration: .2s;
  -moz-transition-duration: .2s;
  transition-duration: .2s;
  -webkit-transition-timing-function: cubic-bezier(.25, .46, .45, .94);
  -moz-transition-timing-function: cubic-bezier(.25, .46, .45, .94);
  transition-timing-function: cubic-bezier(.25, .46, .45, .94);
}

.switch.ui-checked {
  border-color: #27B3A6;
  background-color: #27B3A6;
}
.switch.ui-checked .helper {
  -webkit-transform: translateX(30px);
  -moz-transform: translateX(30px);
  -ms-transform: translateX(30px);
  -o-transform: translateX(30px);
  transform: translateX(30px);
}

.display-i {
  display: inline; 
}

.fsize-16 {
  font-size: 18px;
}

.vertical-align-s {
  vertical-align: super;
}
</style>
<body>
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
    <button type="button" class="triggerButton" data-toggle="modal" data-target="#loginModal">로그인</button>
</div>

<!-- Modal HTML -->
<div id="loginModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">로그인</h4>
                 <p>${error}</p>
                 <p>${logout}</p>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/doo/login" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i>
						<input type="text" name="username" class="form-control" placeholder="ID 입력(12자 이내의 영문, 숫자 조합)" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i>
						<input type="password" class="form-control" placeholder="PW 입력(12자 이내의 영문, 숫자 조합)" required="required" name="password">					
					</div>
                    <div class="form-group">
                        <div class="switch" data-name="human" data-checked="true" data-value="true">
                          <div class="helper">
                          </div>
                        </div>&nbsp;&nbsp;
                        <div class="display-i fsize-16 vertical-align-s">아이디 기억하기</div>
                        <input name="remember-me" type="checkbox">
                        <!-- <input name="remember-me" type="hidden"> -->
                    </div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="로그인">
					</div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>				
			</div>
			<div class="modal-footer">
				<a href="#">ID, PW를 잊으셨나요?</a>
			</div>
		</div>
	</div>
</div>     
</body>
<script type="text/javascript">
var modal = document.getElementById('myModal');

var btn = document.getElementById('loginButton');

var span = document.getElementsByClassName('close')[0];                                          

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = 'block';
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = 'none';
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}

</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
<script src="resources/jquery/jquery.checkable.js"></script> 
<script>
  
  $(".btn-lg").on("click", function(e){
    e.preventDefault();
    $("form").submit();
  });
  
</script>
<script>
$(".switch").checkable()
$("[data-name=human]").checkable("check", false)
$("[data-name=alien]").checkable("check", true)
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
</html>