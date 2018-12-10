/**
 * @name		Shuffle Letters
 * @author		Martin Angelov
 * @version 	1.0
 * @url			http://tutorialzine.com/2011/09/shuffle-letters-effect-jquery/
 * @license		MIT License
 */




(function($){
	
	$.fn.shuffleLetters = function(prop){
		
		var options = $.extend({
			"step"		: 8,			// How many times should the letters be changed
			"fps"		: 15,			// Frames Per Second
			"text"		: "", 			// Use this text instead of the contents
			"callback"	: function(){}	// Run once the animation is complete
		},prop)
		
		return this.each(function(){
			
			var el = $(this),
				str = "";


			// Preventing parallel animations using a flag;

			if(el.data('animated')){
				return true;
			}
			
			el.data('animated',true);
			
			
			if(options.text) {
				str = options.text.split('');
			}
			else {
				str = el.text().split('');
			}
			
			// The types array holds the type for each character;
			// Letters holds the positions of non-space characters;
			
			var types = [],
				letters = [];

			// Looping through all the chars of the string
			
			for(var i=0;i<str.length;i++){
				
				var ch = str[i];
				
				if(ch == " "){
					types[i] = "space";
					continue;
				}
				else if(/[a-z]/.test(ch)){
					types[i] = "lowerLetter";
				}
				else if(/[A-Z]/.test(ch)){
					types[i] = "upperLetter";
				}
				else {
					types[i] = "symbol";
				}
				
				letters.push(i);
			}
			
			el.html("");			

			// Self executing named function expression:
			
			(function shuffle(start){
			
				// This code is run options.fps times per second
				// and updates the contents of the page element
					
				var i,
					len = letters.length, 
					strCopy = str.slice(0);	// Fresh copy of the string
					
				if(start>len){
					
					// The animation is complete. Updating the
					// flag and triggering the callback;
					
					el.data('animated',false);
					options.callback(el);
					return;
				}
				
				// All the work gets done here
				for(i=Math.max(start,0); i < len; i++){

					// The start argument and options.step limit
					// the characters we will be working on at once
					
					if( i < start+options.step){
						// Generate a random character at thsi position
						strCopy[letters[i]] = randomChar(types[letters[i]]);
					}
					else {
						strCopy[letters[i]] = "";
					}
				}
				
				el.text(strCopy.join(""));
				
				setTimeout(function(){
					
					shuffle(start+1);
					
				},1000/options.fps);
				
			})(-options.step);
			

		});
	};
	
	function randomChar(type){
		var pool = "";
		
		if (type == "lowerLetter"){
			pool = "";
		}
		else if (type == "upperLetter"){
			pool = "";
		}
		else if (type == "symbol"){
			pool = "";
		}
		
		var arr = pool.split('');
		return arr[Math.floor(Math.random()*arr.length)];
	}
	
	$(function(){
		
		// introText1 is the DOM element;
		// userText is the textbox
		var introText1 = $('#introText1');
		var introText2 = $('#introText2');
		var introText3 = $('#introText3');
		
		// Shuffle the contents of introText1
		introText1.shuffleLetters();
		introText2.shuffleLetters();
		introText3.shuffleLetters();
		// Leave a 4 second pause

		setInterval(function(){
			
			// Shuffle the introText1 with custom text
			introText1.shuffleLetters({
				"text": "서울시 공공 데이터를 활용한 골목상권 분석"
			});
		}, 4000);
		
		
		setInterval(function(){
			
			// Shuffle the introText1 with custom text
			introText2.shuffleLetters({
				"text": "상권 분석을 통해 카페 창업의 최적의 입지를 선정해 드립니다!"
			});
		}, 4000);
		
		setInterval(function(){
			
			// Shuffle the introText1 with custom text
			introText3.shuffleLetters({
				"text": "여러분의 창업 성공의 길에 저희 One Do 가 함께 하겠습니다! :)"
			});
		}, 4000);


		
	});

	
})(jQuery);




