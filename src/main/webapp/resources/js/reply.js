console.log("Reply Module........");

var replyService = (function() {

	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");

	function add(reply, callback, error) {
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			beforeSend : function(xhr){   
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다..spring security에서 post방식 사용할때 필요*/
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json; charset=utf-8",
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
		})
	}

	// 댓글목록 get
	function getList(param, callback, error) {

	    var article_num = param.article_num;
	    var page = param.page || 1;
	    
	    $.getJSON("/replies/pages/" + article_num + "/" + page + ".json",
	        function(data) {
	    	console.log("데이터");
	    	console.log(data);
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	            callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }

	
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
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

	function update(reply, callback, error) {

		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
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

	function get(rno, callback, error) {

		$.get("/replies/" + rno + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function displayTime(timeValue) {

		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	;

	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	};

})();