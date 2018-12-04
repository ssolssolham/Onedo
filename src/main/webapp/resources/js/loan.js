/**
 * 
 */
 // 대출 관련 정보 입력하기 버튼 클릭 시, 활성화 되는 필터 입력창
    $('#inputInfoBtn').click(function(){
    	if($('#inputInfoArea').hasClass('dis-none')) {
	    	$('#inputInfoArea').removeClass('dis-none');
    	} else {
	    	$('#inputInfoArea').addClass('dis-none');
    	}
    })
    
    // 직업 선택 시, 재직 기간 입력 가능한 태그 생성 jQuery
    $('#creditJobSelect').change(function() {
    	if($(this).val() !== '무직') {
    		$('#creditWorkingPeriod1').removeClass('dis-none');
    		$('#creditWorkingPeriod1').addClass('dis-block');
    	} else {
    		$('#creditWorkingPeriod1').removeClass('dis-block');
    		$('#creditWorkingPeriod1').addClass('dis-none');
    		
    	}
    })
    
    $('#guaranteeJobSelect').change(function() {
    	if($(this).val() !== '무직') {
    		$('#guaranteeWorkingPeriod2').removeClass('dis-none');
    		$('#guaranteeWorkingPeriod2').addClass('dis-block');
    	} else {
    		$('#guaranteeWorkingPeriod2').removeClass('dis-block');
    		$('#guaranteeWorkingPeriod2').addClass('dis-none');
    		
    	}
    })
    
 // 신용대출용 ------------------------------------------------------------------------------------------------------------------------
    $(function(){
    $('#creditJobSelect1').on('change', function(){
    	var job = $('#creditJobSelect1 option:selected').val(); //input에 닮을 값
    	/* $('#creditWorkingPeriod1').show(); */ //재직기간 오픈
    	$('#takeJob1').text($('#creditJobSelect1 option:selected').text());
    	/* $('#selectCreditLoanForm') */
    	$("#selectCreditLoanForm input[name=targetNum]").val(job);
    	
    });
    
    $('#creditRankSelect1').on('change', function(){
    	var Rank = $('#creditRankSelect1 option:selected').val();
    	console.log(Rank);
   	 	$.ajax({
	        url : '/loan/' + Rank,
	        // 서버로 값을 성공적으로 넘기면 처리하는 코드부분 입니다.
	        success : function(data) {
	            // 변경된 태그 부분을 넘어온 index 값으로 찾은 뒤 on/off를 변경합니다.
	           var rate = data.rateLoan;
	            console.log(rate);
	        	$('#takeRate1').text(rate); // 동적으로 받은 값 넣어줘야 함. 비동기
	        	$("#selectCreditLoanForm input[name=resultRate]").val(rate);
	        },
	        error : function(data){
	        	console.log("비동기 오류");
	        }
	    });
/*     	var money = $("#inputYearMoney1").val();
    	var line = $('#takeCreditLine1')
    	switch (Rank) { 
            	case '1' : line.text(money * 2); break;
            	case '2' : line.text(money * 1.8); break;
            	case '3' : line.text(money * 1.5); break;		
            	case '4' : line.text(money * 1.5); break;
            	case '5':  line.text(money * 1.3); break;
            	case '6':  line.text(money * 1); break;
            	case '7':  line.text(money * 0.15); break;		
            	case '8':  line.text(money * 2); break;
            	case '9':  line.text(money * 0.08); break;
            	case '10': line.text(money * 0.08); break;
    	} */
    });
    
    
    //소득금액 컨트롤
        $("#inputYearMoney1").keyup(function() { 
    	var money = $("#inputYearMoney1").val();
    	console.log(money); 
    	$("#selectCreditLoanForm input[name=resultRate]").val(money);
    	$('#takeYearMoney1').text(money);
    	
    });
    
    $( ".analysisBtn2" ).each(function(index) {
        $(this).on("click", function(){
            var money = parseInt($(this).val());
            console.log(money);
        	$('#inputYearMoney1').val(money);
            //var resultMoney = parseInt($("#inputBorrowMoney1").val()) + money;
        	$("#takeYearMoney1").text(money);
        	$("#selectCreditLoanForm input[name=requiredMoney]").val(money+"0000");
        });
    });
    
    
    //대출희망금액 컨트롤
    $("#inputBorrowMoney1").keyup(function() { 
    	var money = $("#inputBorrowMoney1").val();
    	console.log(money); 
    	$('#selectCreditLoanForm input[name=resultRate]').val(money+"0000");
    	$('#takeBorrowMoney1').text(money);
    });
    
    
    $( ".analysisBtn1" ).each(function(index) {
        $(this).on("click", function(){
            var money = parseInt($(this).val());
            console.log(money);
            //var resultMoney = parseInt($("#inputBorrowMoney1").val()) + money;
        	$("#inputBorrowMoney1").val(money);
        	$('#takeBorrowMoney1').text(money);
        	$("#selectCreditLoanForm input[name=takeYearMoney1]").val(money + "0000");
        });
    });
    
    $("#loanSubmitBtn").on("click", function(e){
    	e.preventDefault();
    	$("#selectCreditLoanForm").submit();
    });
});
    
 // 담보 대출용----------------------------------------------------------------------------------------------------------------------- 
    $(function(){
        //대출희망금액 컨트롤
        $("#inputBorrowMoney2").keyup(function() { 
          var money = $("#inputBorrowMoney2").val();
          console.log(money); 
          $('#selectSecurityLoanForm input[name=requiredMoney]').val(money+"0000");
          $('#takeBorrowMoney2').text(money);
        });
        
        $( ".analysisBtn1" ).each(function(index) {
            $(this).on("click", function(){
                var money = parseInt($(this).val());
                console.log(money);
              $("#inputBorrowMoney2").val(money);
              $('#takeBorrowMoney2').text(money);
              $("#selectSecurityLoanForm input[name=requiredMoney]").val(money+"0000");
            });
        });
        
    	//신용등급별 이율 컨트롤
        $('#creditRankSelect2').on('change', function(){
          var Rank = $('#creditRankSelect2 option:selected').val();
          console.log(Rank);
     	 	$.ajax({
    	        url : '/loan/' + Rank,
    	        // 서버로 값을 성공적으로 넘기면 처리하는 코드부분 입니다.
    	        success : function(data) {
    	            // 변경된 태그 부분을 넘어온 index 값으로 찾은 뒤 on/off를 변경합니다.
    	           var rate = data.rateLoan;
    	            console.log(rate);
    	        	$('#takeRate2').text(rate); // 동적으로 받은 값 넣어줘야 함. 비동기
    	        	$("#selectSecurityLoanForm input[name=resultRate]").val(rate);
    	        },
    	        error : function(data){
    	        	console.log("비동기 오류");
    	        }
    	    });
        });
        
    	//직업 컨트롤
        $('#guaranteeJobSelect').on('change', function(){
          var job = $('#guaranteeJobSelect option:selected').val(); //input에 닮을 값
          $('#guaranteeWorkingPeriod2').show(); //재직(사업)기간 오픈
          
          $('#takeJob2').text($('#guaranteeJobSelect option:selected').text());
          $("#selectSecurityLoanForm input[name=targetNum]").val(job);
        });

        
    	//담보종류 컨트롤
        $('#guaranteeSelect').on('change', function(){
            var security = $('#guaranteeSelect option:selected').val();
            console.log(security);
            $('#takeSecurity').text(security);
            $("#selectSecurityLoanForm input[name=securityType]").val(security);
        });
    	
        //소득금액 컨트롤
            $("#inputYearMoney2").keyup(function() { 
          var money = $("#inputYearMoney2").val();
          console.log(money); 
          $("#selectSecurityLoanForm input[name=resultRate]").val(money);
          $('#takeYearMoney2').text(money);
          
        });
        
        $( ".analysisBtn2" ).each(function(index) {
            $(this).on("click", function(){
                var money = parseInt($(this).val());
                console.log(money);
              $('#inputYearMoney2').val(money);
                //var resultMoney = parseInt($("#inputBorrowMoney1").val()) + money;
              $("#takeYearMoney2").text(money);
              $("#selectSecurityLoanForm input[name=requiredMoney]").val(money+"0000");
            });
        });
        
        
        $("#loanSubmitBtn2").on("click", function(e){
          e.preventDefault();
          $("#selectSecurityLoanForm").submit();
        });
    });