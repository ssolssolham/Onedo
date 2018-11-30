var text1 = "머신러닝 기반 빅데이터 상권 분석";
var text2 = "여러분에게 맞는 대출 상품을 추천해드립니다";
var text3 = "지금 바로 이용해 보세요";
var cnt = 0;
var speed = 150; //글자가 찍히는 속도
var timer1 = null;

function gogogo1() {
	document.getElementById('introText1').innerHTML = text1.substring(0, cnt) + "_";
	cnt++;
	timer1 = setTimeout('gogogo1()', speed);

	if (text1.length < cnt) {
		// 아래 주석으로 처리된 부분을 지우면 한번만 실행됩니다.
		clearTimeout(timer1);
		cnt = 0;
	}
}

function gogogo2() {
	document.getElementById('introText2').innerHTML = text2.substring(0, cnt) + "_";
	cnt++;
	timer1 = setTimeout('gogogo2()', speed);

	if (text2.length < cnt) {
		// 아래 주석으로 처리된 부분을 지우면 한번만 실행됩니다.
		clearTimeout(timer1);
		cnt = 0;
	}
}

function gogogo3() {
	document.getElementById('introText3').innerHTML = text3.substring(0, cnt) + "_";
	cnt++;
	timer1 = setTimeout('gogogo3()', speed);

	if (text3.length < cnt) {
		// 아래 주석으로 처리된 부분을 지우면 한번만 실행됩니다.
		clearTimeout(timer1);
		cnt = 0;
	}
}

gogogo1();
gogogo2();
gogogo3();