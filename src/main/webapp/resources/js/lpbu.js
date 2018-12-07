var lpbuService = (function() {

	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");

	function add(lpbu, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',
			url : '/lpbu/new',
			data : JSON.stringify(lpbu),
			beforeSend : function(xhr){   
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				alert("add..!"+result);
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				alert("비동기오류.."+er);
				if (error) {
					error(er);
				}
			}
		})
	}

	function remove(lpbuId, callback, error) {
		alert("remove서비스들어옴");
		$.ajax({
			type : 'delete',
			url : '/lpbu/' + lpbuId,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(lpbu, callback, error) {

		console.log("답변완료 : " + lpbu.lpbuId);

		$.ajax({
			type : 'put',
			url : '/lpbu/' + lpbu.lpbuId,
			data : JSON.stringify(lpbu),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){   
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
			},
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function get(lpbuId, callback, error) {

		$.get("/lpbu/" + lpbuId + ".json", function(result) {
			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	return {
		add : add,
		get : get,
		remove : remove,
		update : update
	};
})();