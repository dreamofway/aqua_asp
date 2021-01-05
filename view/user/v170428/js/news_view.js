jQuery(document).ready(function(){
	resizeContentsImg();
});

function resizeContentsImg() {

	var limit_width = jQuery("#area_contents").width();
	var resize_width = limit_width * 0.98;
	var style_str, p_style_str
	jQuery.each(jQuery("#area_contents").find("img"), function(idx, val){
		
		style_str = jQuery(this).attr("style");
		p_style_str = jQuery(this).parent().attr("style");

		if(jQuery(this).width() > limit_width ) {
			jQuery(this).attr("style", "width:"+resize_width+"px;height:auto");
			jQuery(this).parent().attr("style", "margin:0px");

		} else {
			

			if( style_str != undefined) {

				if( style_str.indexOf("left") > -1 ) {
					jQuery(this).css("margin-right","15px");
				} else if( style_str.indexOf("right") > -1 ) {
					jQuery(this).css("margin-left","15px");
				}
			}
			
			if( p_style_str != undefined) {

				if( jQuery(this).parent().attr("style").indexOf("left") > -1 ) {
					jQuery(this).parent().css("margin-right","15px");
				} 
				
				if( jQuery(this).parent().attr("style").indexOf("right") > -1 ) {
					jQuery(this).parent().css("margin-left","15px");
				}
			}
		
		}
		
		jQuery(this).load(function(){
			
			if(jQuery(this).width() > limit_width ) {
				jQuery(this).attr("style", "width:"+resize_width+"px;height:auto");
			} else {
				
				style_str = jQuery(this).attr("style");
				p_style_str = jQuery(this).parent().attr("style");

				if( style_str != undefined) {

					if( style_str.indexOf("left") > -1 ) {
						jQuery(this).css("margin-right","15px");
					} else if( style_str.indexOf("right") > -1 ) {
						jQuery(this).css("margin-left","15px");
					}
				}
				
				if( p_style_str != undefined) {

					if( jQuery(this).parent().attr("style").indexOf("left") > -1 ) {
						jQuery(this).parent().css("margin-right","15px");
					} 
					
					if( jQuery(this).parent().attr("style").indexOf("right") > -1 ) {
						jQuery(this).parent().css("margin-left","15px");
					}
				}
			}
			
		});

		jQuery(this).show("fade");
		
	});
}

function newsLike( article_id ) {
	var like_count = jQuery("#like_count").html().replace(",", "");

	jqueryAjaxCall({
		type : "post",
		url : "/news/likeProc",
		dataType : "json",
		paramData : {
			article_id : article_id
		},
		callBack : function(getResult, param_mode) {						
			
			if(getResult.state == "success") {
				var like_count = Number( jQuery("#like_count").html().replace(",", "") );
				like_count += 1;

				jQuery("#like_count").html( numMoneyType( like_count ) );
			} else {
				console.log( getResult.response );	
			}

			
		},
		callBackData : ""
	});
}
