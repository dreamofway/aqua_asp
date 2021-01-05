$(document).ready(function(){

    
    /* ------ 상단 배너 close ------- 

	$(".close_btn").click(function(){
		$(".top_bnr_inside").slideUp(500); 
	});
	*/
	
	/* ------ 메인 메뉴 호버이벤트 ------ */

	$(".gnb_slide_wrap").hide();

	$(".gnb_1dep").on("mouseover",function(e){	
		var dep1On = $(this).index();
		//console.log("gnb_1dep " + dep1On);
			
		$('.gnb_slide_wrap').show();
		$(".gnb_slide").hide();
		$(".gnb_slide").eq(dep1On).show();
		console.log(  );
		if (dep1On == ( $(".gnb_1dep").length) - 1 ){
			$(".gnb_slide").eq(0).show();
		}
	});

	$(".gnb_slide_wrap").mouseleave(function(){
		$('.gnb_slide_wrap').fadeOut(300);
		$(".gnb_slide").hide();
	});

	$(".slogun").mouseover(function(){
		$('.gnb_slide_wrap').fadeOut(300);
		$(".gnb_slide").hide();
	});

	$(".gnb_slide").mouseleave(function(){
		$(".slide_news_tit").removeClass("selected");
	});

	/* ----- 서브 메뉴 호버이벤트 ------ */
	$(".slide_news_tit").mouseover(function(){
			
		$(".slide_news_tit").removeClass("selected");
		$(this).addClass("selected");
	});

	$(".gnb_2dep").mouseleave(function(){
		$(".slide_news_tit").removeClass("selected");
	});


	/* ------ SNS 탭 메뉴 ------ */
	$(".sns_content").hide();
	$(".sns_content:first").show();

	$("div.sns ul li").click(function(){
		$("div.sns ul li").removeClass("snsbtn_on");
		$(this).addClass("snsbtn_on");

		var btnOn = $(this).index();
		/*console.log(btnOn);*/
		

		if(btnOn==0){
			$(this).find('.sns_icon').attr("src","/healthlife_renew/_img/tab_insta_on.png");
		}else if(btnOn==1){
			$(this).find(".sns_icon").attr("src","/healthlife_renew/_img/tab_fb_on.png");
		}else if(btnOn==2){
			$(this).find(".sns_icon").attr("src","/healthlife_renew/_img/tab_blog_on.png");
		}else{
			$(this).find(".sns_icon").attr("src","/healthlife_renew/_img/tab_twitter_on.png");
		}

		$(".sns_content").hide();
		$(".sns_content").eq(btnOn).show();

	});


	/* 메인 웹툰 탭메뉴 */
	$(".nav li").click(function(){
		var wi = $(this).index();
		$(".nav li").removeClass("on");
		$(this).addClass("on");
		$(".webtoon").fadeOut(500);
		$(".webtoon").eq(wi).fadeIn(300);
	});
	
	//광고 배너 뷰 카운트 증가
	$('.banner_ad a').each(function() {
		$.ajax({ 
			type: "POST", 
			url : "/news/bannerProc",
			dataType: 'json',
			data: {
				banner_id : $(this).data("ad-id"),
				zone_id : $(this).data("zone-id"),
				proc_type : 'view'
			},
			cache: false, 
			success: function(getResult, param_mode) {						
				
				if(getResult.state == "success") {
				//	console.log( getResult.response );	
				} else {
				//	console.log( getResult.response );	
				}
				
			},
			error:function(request,status,error) {  
				console.log("code = "+ request.status + "\n\nmessage = " + request.responseText + "\n\nerror = " + error); 
			} 
		});
	});

	//광고 배너 클릭 카운트 증가
	$('.banner_ad a').mousedown(function(e) {

		$.ajax({ 
			type: "POST", 
			url : "/news/bannerProc",
			dataType: 'json',
			data: {
				banner_id : $(this).data("ad-id"),
				zone_id : $(this).data("zone-id"),
				proc_type : 'click'
			},
			cache: false, 
			success: function(getResult, param_mode) {						
				
				if(getResult.state == "success") {
				//	console.log( getResult.response );	
				} else {
				//	console.log( getResult.response );	
				}
				
			},
			error:function(request,status,error) {  
				console.log("code = "+ request.status + "\n\nmessage = " + request.responseText + "\n\nerror = " + error); 
			} 
		});
		
		var $linkPath = $(this).data("ad-link");
		var $linkTaget = $(this).data("ad-target");

		//e.which -> 1: 좌클릭 2: 휠클릭 3: 우클릭
		//console.log(e.which)
		if (e.which == 1 && !e.metaKey && !e.shiftKey) {
			if ($linkTaget == "_blank") {
				window.open($(this).data("ad-link"));
			} else if ($linkTaget == "_self") {
				location.href = $(this).data("ad-link");
			}
		} else if (e.which == 2 && !e.metaKey && !e.shiftKey) {
			window.open($linkPath, '_blank').focus();
		} else {
			$(this).attr('href', $linkPath)
		}


	});
});    
    
    
function topSeachCheck(type) {

    var result = true;

    if (jQuery("#global_seach_input").val() == "") {
        jQueryDialog({
            type: "alert",
            text: "검색어를 입력해주세요.",
            callback_fn: function () {
                jQuery("#global_seach_input").focus();
            }
        });
        jQuery("#global_seach_input").focus();
        result = false;
    }

    if (type == "click") {
        jQuery("#global_search_form").submit();
    } else {
        return result;
    }
}
