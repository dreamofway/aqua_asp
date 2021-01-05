$(function(){
		/*6각형 펼쳐지는 부분*/
		$(".btn1_text,.btn2_text,.btn3_text,.btn4_text,.btn5_text").css("display","none");
		$(".btn_purple img").click(function(){
		
		$(".btn_1").animate({opacity:"1"},600,"easeInOutElastic");
		setTimeout(function(){
		$(".btn_2").animate({
		opacity:"1"},1000,"easeInOutElastic");
		},1);
		setTimeout(function(){
		$(".btn_3").animate({
		opacity:"1"},2000,"easeInOutElastic");
		},1);
		setTimeout(function(){
		$(".btn_4").animate({
		opacity:"1"},2600,"easeInOutElastic");
		},1);
		setTimeout(function(){
		$(".btn_5").animate({opacity:"1"},3500,"easeInOutElastic");
		},1);
		
		});
		/*6각형 이미지 클릭시 텍스트 나오는 부분*/
		$(".btn_1 img").click(function(){
		$(".btn1_text").css("display","block");		
		$(".btn2_text,.btn3_text,.btn4_text,.btn5_text").css("display","none");
		
		});


		$(".btn_2 img").click(function(){
		$(".btn1_text,.btn3_text,.btn4_text,.btn5_text").css("display","none");
		$(".btn2_text").css("display","block");
				
		});

		$(".btn_3 img").click(function(){
		$(".btn1_text,.btn2_text,.btn4_text,.btn5_text").css("display","none");
		$(".btn3_text").css("display","block");
				
		});
		$(".btn_4 img").click(function(){
		$(".btn1_text,.btn2_text,.btn3_text,.btn5_text").css("display","none");
		$(".btn4_text").css("display","block");
				
		});
		
		$(".btn_5 img").click(function(){
		$(".btn1_text,.btn2_text,.btn3_text,.btn4_text").css("display","none");
		$(".btn5_text").css("display","block");
				
		});
		
		/*뇌심장 CI*/
		$(".radius_square4").click(function(){
			$(".ci1_text").css("display","block");		
			$(".ci2_text").css("display","none");
			$(".radius_square4").addClass("selected");
			$(".radius_square5").removeClass("selected");				
		});
		$(".radius_square5").click(function(){
			$(".ci2_text").css("display","block");		
			$(".ci1_text").css("display","none");
			$(".radius_square5").addClass("selected");
			$(".radius_square4").removeClass("selected");		
		});
		/*암결과 클릭시*/
		$(".radius_square6").click(function(){
			$(".cancer_text1").css("display","block");		
			$(".cancer_text2,.cancer_text3,.cancer_text4,.cancer_text5").css("display","none");
			$(".radius_square6").addClass("goodselected");
			$(".radius_square7,.radius_square8,.radius_square9,.radius_square10").removeClass("goodselected");	
			$(".radius_square7,.radius_square8,.radius_square9,.radius_square10").removeClass("normalselected");
			$(".radius_square7,.radius_square8,.radius_square9,.radius_square10").removeClass("badselected");	
		});
		$(".radius_square7").click(function(){
			$(".cancer_text2").css("display","block");		
			$(".cancer_text1,.cancer_text3,.cancer_text4,.cancer_text5").css("display","none");
			$(".radius_square7").addClass("normalselected");
			$(".radius_square6,.radius_square8,.radius_square9,.radius_square10").removeClass("normalselected");
			$(".radius_square6,.radius_square8,.radius_square9,.radius_square10").removeClass("goodselected");
			$(".radius_square6,.radius_square8,.radius_square9,.radius_square10").removeClass("badselected");
		});
		$(".radius_square8").click(function(){
			$(".cancer_text3").css("display","block");		
			$(".cancer_text1,.cancer_text2,.cancer_text4,.cancer_text5").css("display","none");
			$(".radius_square8").addClass("normalselected");
			$(".radius_square6,.radius_square7,.radius_square9,.radius_square10").removeClass("normalselected");	
			$(".radius_square6,.radius_square7,.radius_square9,.radius_square10").removeClass("goodselected");	
			$(".radius_square6,.radius_square7,.radius_square9,.radius_square10").removeClass("badselected");		

		});

		$(".radius_square9").click(function(){
			$(".cancer_text4").css("display","block");		
			$(".cancer_text1,.cancer_text2,.cancer_text3,.cancer_text5").css("display","none");
			$(".radius_square9").addClass("badselected");
			$(".radius_square6,.radius_square7,.radius_square8,.radius_square10").removeClass("normalselected");	
			$(".radius_square6,.radius_square7,.radius_square8,.radius_square10").removeClass("badselected");		
			$(".radius_square6,.radius_square7,.radius_square8,.radius_square10").removeClass("goodselected");		

		});
		$(".radius_square10").click(function(){
			$(".cancer_text4").css("display","block");		
			$(".cancer_text1,.cancer_text2,.cancer_text3,.cancer_text5").css("display","none");
			$(".radius_square10").addClass("badselected");
			$(".radius_square6,.radius_square7,.radius_square8,.radius_square9").removeClass("normalselected");	
			$(".radius_square6,.radius_square7,.radius_square8,.radius_square9").removeClass("badselected");		
			$(".radius_square6,.radius_square7,.radius_square8,.radius_square9").removeClass("goodselected");		

		});
		/*암문항 질병항목 원 클릭시*/
		$(".cn_circle1").click(function(){
		$(".cn_circle1").toggleClass("selected");		
		 
		/* if($(".cn_circle1").hasClass('selected')){
			$(".cn_circle1").removeClass('selected');	
		 }else{$(this).addClass('selected');}*/
		});
		$(".cn_circle2").click(function(){
		$(".cn_circle2").toggleClass("selected");		
		});
		$(".cn_circle3").click(function(){
		$(".cn_circle3").toggleClass("selected");		
		});
		$(".cn_circle4").click(function(){
		$(".cn_circle4").toggleClass("selected");		
		});
		$(".cn_circle5").click(function(){
		$(".cn_circle5").toggleClass("selected");		
		});
		$(".cn_circle6").click(function(){
		$(".cn_circle6").toggleClass("selected");		
		});
		$(".cn_circle7").click(function(){
		$(".cn_circle7").toggleClass("selected");		
		});
		$(".cn_circle8").click(function(){
		$(".cn_circle8").toggleClass("selected");		
		});
		$(".cn_circle9").click(function(){
		$(".cn_circle9").toggleClass("selected");		
		});
		$(".cn_circle10").click(function(){
		$(".cn_circle10").toggleClass("selected");		
		
		});
		

		
		/*치아 문진  라디오 버튼 클릭시 레이어 새창*/
		 $(".layerPopup").hide();
		 $(".a_chk6_1").click(function(){
			//$("#contents > a").blur();
			$(".layerPopup").show();			
			$(".layerPopup div.yes").focus(); 
			
			
		 });

		 $(".layerPopup button").click(function(){
			//$("#contents > a").focus();
			$(".layerPopup").hide();
		  });
		

		

		/******************************************************************/
		/*adhd에서 결과와 엄마교육 타이틀 클릭시*/
		/*$(".c_titsub a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit.png)");		
		location.replace("http://m.hotplan.ichc.co.kr/adhd_relax.html");
		});
		$(".c_titsub1 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit_ck.png)");		
		location.replace("http://m.hotplan.ichc.co.kr/adhd_mom.html");
		});*/




		/*키성장에서 타이틀 클릭시*/
		/*$(".c_titsub_1 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit1.png)");		
		location.replace("http://m.hotplan.ichc.co.kr/height_result.html");

		});
		$(".c_titsub_11 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit1_ck1.png)");				
		});
		$(".c_titsub_12 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit1_ck2.png)");
		location.replace("http://m.hotplan.ichc.co.kr/growth_result1.html");		
		});
		$(".c_titsub2 a").click(function(){
		location.replace("http://m.hotplan.ichc.co.kr/adhd_relax.html");		
		});*/
		/*치매 타이틀 메뉴 클릭*/
		/*$(".c_titsub2 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit.png)");
		location.replace("http://m.hotplan.ichc.co.kr/dementia_result.html");		
		});
		$(".c_titsub2_1 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit_ck.png)");
		location.replace("http://m.hotplan.ichc.co.kr/dementia_symptom.html");		
		});*/

		/*치아 타이틀 메뉴 클릭*/
		/*$(".c_titsub3 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit.png)");
		location.replace("http://m.hotplan.ichc.co.kr/teeth_result.html");		
		});
		$(".c_titsub3_1 a").click(function(){
		$(this).parent().parent().css("background-image","url(img/title/tit_bgtit_ck.png)");
		location.replace("http://m.hotplan.ichc.co.kr/teeth_dgup.html");		
		});*/
		
		/*치매증상 원 버튼*/
		$(".circle1").click(function(){
		$(".remember_obstacle").css("display","block");		
		$(".etc_obstacle").css("display","none");
		$(".everyday_obstacle").css("display","none");	
		$(".circle1").addClass("selected");
		$(".circle2,.circle3").removeClass("selected");

		});
		$(".circle2").click(function(){
		$(".etc_obstacle").css("display","block");		
		$(".remember_obstacle").css("display","none");		
		$(".everyday_obstacle").css("display","none");	
		$(".circle1,.circle3").removeClass("selected");
		$(".circle2").addClass("selected");
		});
		$(".circle3").click(function(){
		$(".everyday_obstacle").css("display","block");	
		$(".remember_obstacle").css("display","none");		
		$(".etc_obstacle").css("display","none");
		$(".circle1,.circle2").removeClass("selected");
		$(".circle3").addClass("selected");
		});

		/*사이드메뉴*/
		$(".header a").click(function(){
		$(".gnb").css("display","block");
		$(".glaylayer").css("display","block");
			$(".gnb").addClass("on");

		});
		$('p.m_close').click(function(){
		 $(".glaylayer").css("display","none");
		 $(".gnb").removeClass("on");
		
			/* side_show = !(side_show);
				 if(side_show){
				  $(".sidemenu").animate({
				   left:"0px"
				  },400);
				  $("#glayLayer").show();
				 }else{
				  $("#sidemenu").animate({
				   left:"-192px"
				  },400);
				  $("#glayLayer").hide();
				 }
				 return false;		*/
		});
		/*$(".navi_sec").css("display","none");*/

		$("ul.s_menu li a").click(function(){
		/*$(this).next().css("display","block");		*/
		});

	 });