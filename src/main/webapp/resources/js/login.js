  $(document).ready(function() {
		$('#loginForm').ajaxForm({
			dataType : 'json',
			beforeSubmit : function(formData, $form, options) {
				for ( var i = 0; i < formData.length; i++) {
					if (!formData[i].value) {
						alert('Please enter a value for both ID and Password');
						return false;
					}
				}
			},
			
			success : function(json, statusText, xhr, $form) {
				if (json.success == true) {
					console.log(json.returnUrl);
					var url = json.returnUrl || './';
					document.location.href = url;
					console.log(url);
				} else {
					alert("아이디, 비밀번호를 확인하세요.");
				}
			},
			error : function(xhr) {
				alert("통신불가");
			}
		});
		$(':input[name=username]').focus();
	});