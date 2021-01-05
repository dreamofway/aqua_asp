<!-- #include file = "../_inc/header.asp" -->
	</head>


    <body>
    
        <div class="wrap"><!--배경색-->
            <div class="container"><!--중앙정렬-->
				
				<!-- #include file = "../_inc/top.asp" -->                
				<!-- #include file = "../_inc/left.asp" -->

                <div class="center"><!--width=770px-->
					<!-- #include file = "../_inc/cctv_menu.asp" -->
					
					<div class="sub_body">
                        <div class="sub_body_title_6">
						    CCTV 보기
						</div>
                        <div class="sub_body_contents">
						    <table class="CCTV">
							    <tr>
								    <th class="view_title">Camera01</th>
								</tr>
								<tr>
								    <td class="view_cont">
									    <img src="<%=wm.image_domain%>/ikc/mini_hompage/CCTV_view.jpg" title="camera01"/>
									</td>
								</tr>

							</table>

                            <div class="play_btn">
							    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/play_btn.png" title="재생"/><a/>
							</div>

							<div class="CCTV_btn">
                                <a href="/childcare/cctv_state?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601">
									<img src="<%=wm.image_domain%>/ikc/mini_hompage/CCTV_btn.png" title="목록으로 가기"/>
								</a>
							</div>



						</div>

					</div>
		
                </div>  <!-- //  center -->
			</div>  <!-- //  container -->

			<!-- #include file = "../_inc/right_quick.asp" -->

		</div> <!-- //  wrap -->

	</body>
</html>