$(function(){//jQuery 시작
    $("div.navi_sub").hide();
	$("div#navi_bg").hide();

	$('.navi ul li.third a').click(function(){
		    $('.bar').hide();			
			$('.navi ul li a').removeClass('selected');
			$('.navi_sub ul li a').removeClass('selected');
			$(this).addClass('selected');
			//$(this).next('div.bar').show();	
			/*$("div#navi_bg").stop().slideDown("slow");					
			$("div.navi_sub").stop().slideUp("fast");
			$("div.navi_sub").eq(2).stop().slideDown("slow");*/
		});
		$('.navi ul li.second a').click(function(){
		    $('.bar').hide();			
			$('.navi ul li a').removeClass('selected');
			$(this).addClass('selected');
			//$(this).next('div.bar').show();
			/*$("div#navi_bg").stop().slideDown("slow");			
			$("div.navi_sub").stop().slideUp("fast");
			$("div.navi_sub").eq(1).stop().slideDown("slow");*/
		});
		$('.navi ul li.first a').click(function(){
		    $('.bar').hide(); 
			
			$('.navi ul li a').removeClass('selected');
			$(this).addClass('selected');
			//$(this).next('div.bar').show();
			/*$("div#navi_bg").stop().slideDown("slow");		
			$("div.navi_sub").stop().slideUp("fast");
			$("div.navi_sub").eq(0).stop().slideDown("slow");*/


		});

        $('.navi ul li.fourth a').click(function(){
		     $('.bar').hide();
			$('.navi ul li a').removeClass('selected');
			$(this).addClass('selected');
			//$(this).next('div.bar').show();
			/*$("div#navi_bg").stop().slideDown("slow");					
			$("div.navi_sub").stop().slideUp("fast");
			$("div.navi_sub").eq(3).stop().slideDown("slow");*/
		});

		$('.navi ul li.fifth a').click(function(){
		      $('.bar').hide();
			$('.navi ul li a').removeClass('selected');
			$(this).addClass('selected');
			//$(this).next('div.bar').show();
			/*$("div#navi_bg").stop().slideDown("slow");					
			$("div.navi_sub").stop().slideUp("fast");
			$("div.navi_sub").eq(4).stop().slideDown("slow");*/
		});

		$('.navi ul li.six a').click(function(){
		     $('.bar').hide();
			$('.navi ul li a').removeClass('selected');
			$(this).addClass('selected');
			//$(this).next('div.bar').show();
			/*$("div#navi_bg").stop().slideDown("slow");					
			$("div.navi_sub").stop().slideUp("fast");
			$("div.navi_sub").eq(5).stop().slideDown("slow");*/
		});

		

		$(".navi ul, #navi_bg").mouseenter(function(){
				$("div.navi_sub").stop().slideDown("slow");
				$("div#navi_bg").stop().slideDown("fast");
				 
		 }).mouseleave(function(){
				$("div.navi_sub").stop().slideUp("fast");	
				$("div#navi_bg").stop().slideUp("slow");
				 
		 });


		



 });//jquery 종결	