<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Elegant Modal Login Modal Form with Icons</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
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

.width-100 {
	width: 100%;
}

.width-60 {
	width: 60%;
}

.width-50 {
	width: 50%;
}

.width-40 {
	width: 40%;
}

.width-39 {
	width: 39%;
}

.width-38 {
	width: 38%;
}

.width-37 {
	width: 37%;
}

.width-36 {
	width: 36%;
}

.width-35 {
	width: 35%;
}

.width-34 {
	width: 34%;
}

.width-33 {
	width: 33%;
}

.width-32 {
	width: 32%;
}

.width-31 {
	width: 31%;
}

.width-30 {
	width: 30%;
}

.width-10 {
	width: 10%;
}

.width-8 {
	width: 8%;
}

.width-5 {
	width: 5%;
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

.vertical-align-t {
	vertical-align: top;
}

.p-l-0 {
	padding-left: 0;
}

.height-40 {
	height: 40px;
}
</style>
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

<!--
-->
.switch {
	display: inline-block;
	box-sizing: border-box;
	width: 64px;
	height: 28px;
	border-radius: 999px;
	background-color: #d8d9db;
	-webkit-transition: background-color cubic-bezier(.25, .46, .45, .94)
		.2s;
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/jquery/jquery.checkable.js"></script>

<script type="text/javascript">
	$(function() {
		var modal = document.getElementById('myModal');
		var btn = document.getElementById('loginButton');
		var span = document.getElementsByClassName('close')[0];
		// When the user clicks on the button, open the modal 

		/* btn.onclick = function() {
			modal.style.display = 'block';
		} */

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
	});
</script>


<script>
	$(function() {
		/*
		$(".btn-lg").on("click", function(e) {
			e.preventDefault();
			$("#loginForm").submit();
		});

		$(".switch").checkable()
		$("[data-name=human]").checkable("check", false)
		$("[data-name=alien]").checkable("check", true)

		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
		*/
	});
</script>


<!-- 회원ㄱ가입관련 javascript -->
<!-- 모달띄우고 form제출 -->
<script type="text/javascript">
	$(function() {
		var modal = document.getElementById('myModal');
		var btn = document.getElementById('registButton');
		var span = document.getElementsByClassName('close')[0];
		// When the user clicks on the button, open the modal 
		/* btn.onclick = function() {
			modal.style.display = 'block';
		}
		 */
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

	})

	// before submit, make phoneNum, email
	function beforeSubmit() {
		var memberPhoneNum = $('#memberPhone1').val()
				+ $('#memberPhone2').val() + $('#memberPhone3').val();
		$('#memberPhoneNum').val(memberPhoneNum);
		var memberEmail = $('#email').val() + '@' + $('#emailHost').val();
		$('#memberEmail').val(memberEmail);
	}
</script>

<!-- 아이디 중복확인 -->
<script type="text/javascript">
	$(function() {
		// id체크여부
		var idck = 0;
		
		// idDup버튼->비동기로 아이디 중복확인
		$('#dupCheck').on('click', function() {
			var userid = $('#userid').val();
			var userInfo = {
				"userid" : userid
			}

			$.ajax({
				type : 'POST',
				data : JSON.stringify(userInfo),
				url : "/member/idDupCheck",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					// 비동기통신 성공시
					if (data.cnt > 0) {
						console.log("---아이디 중복---data cnt값:" + data.cnt);
						// 안내메시지를 보여주거나 alert처리..alert처리시 폼이 닫혀버릴듯..
						// 모달 띄운 후 입력아이디값 지운 후 focus
						modal.style.display = 'block';
						$("#userid").val("");
						$("#userid").focus();
					} else {
						console.log("---아이디 사용 가능---data cnt값:" + data.cnt);
						// 메시지 등으로 안내..후, 모달다시띄우고 입력한 id값 세팅, 다음칸에
						modal.style.display = 'block';
						$("#userid").val(userid);
						$("#userpw").focus();
						// 아이디중복x
						idck = 1;
					}
				},
				error : function(error) {
					console.log("비동기오류");
				}
			});

		});
	});
</script>

<!-- 이메일인증 -->
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#emailCertify').on(
						"click",
						function() {
							var memberEmail = $('#email').val() + '@'
									+ $('#emailHost').val();
							$('#memberEmail').val(memberEmail);

							var url = "/kosta/prjModule/emailCertify?email="
									+ $('#email').val() + "&emailHost="
									+ $('#emailHost').val();
							$.ajax({
								url : url,
								type : 'get',
								data : {
									"email" : $('#email').val(),
									"emailHost" : $('#emailHost').val()
								},
								//dataType:'json',
								done : function(response) {
									//성공
									alert("성공..");
								},
								fail : function(error) {
									//실패
								}
							});

							alert("인증메일을 보냈습니다.\r\n인증번호를 입력해 주세요");
							$("#certifyCodeInput").attr("disabled", false)
									.attr("readonly", false);
							$("#emailCertify").html('인 증');

						})
			});
</script>
<body>
	<h1 style="margin-right: auto; margin-left: auto;">ONE, DOO, THREE
	</h1>
	<P style="margin-right: auto; margin-left: auto;">The time on the
		server is ${serverTime}.</P>
	<div class="text-center">
		<!-- Button HTML (to Trigger Modal) -->
		<button type="button" class="triggerButton" data-toggle="modal"
			data-target="#loginModal">로그인</button>
		<button type="button" class="triggerButton" data-toggle="modal"
			data-target="#registModal">회원가입</button>
	</div>


</body>

</html>
