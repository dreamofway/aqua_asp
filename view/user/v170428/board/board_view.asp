	<!-- #include file = "../inc/_head.asp" -->
	<style type="text/css">
		#area_contents img {display:none}
	</style>
    <body>
    
        <div class="wrap">
        
            
            <div class="header">
                <!-- #include file = "../inc/_top.asp" -->
                <!-- #include file = "../inc/_top_menu.asp" -->
			</div>

            <div class="container">


                <div class="list_area_center_box">
				
					<div class="nursery_list_box" style="margin-top:0px" >
						<div class="nursery_view_title">
						    <%=InfoTitle%>
						    <div class="date_writer_viewcount">
								
								<span class="view_date"><%=dateType( "T01",Regdate)%></span>
								<span class="view_writer"><%=WriterName%></span>
								<span class="view_count">조회수&nbsp;&nbsp;<%=FormatNumber(HitCount,0)%></span>
								
							</div>

						</div>
						<div class="nursery_view_contents" id="area_contents" >
							<%=HTMLDecode( InfoContent )%>
						</div>

						<div class="view_gtlist_btn">
                            <a href="/board/list?page=<%=page%>&<%=get_val%>"><img src="<%=wm.image_path%>/inc/list_gtlist.jpg" alt="" /></a>
						</div>


					</div>
			    </div>

				<!-- #include file = "../inc/side_area.asp" -->

            </div>

			<!-- #include file = "../inc/_footer.asp" -->

        </div><!--wrap //-->



		<script type="text/javascript">
		<!--
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
		//-->
		</script>

    </body>
    
</html>