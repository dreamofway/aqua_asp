<!-- #include file = "../_inc/header.asp" -->
	</head>


    <body>
    
        <div class="wrap"><!--배경색-->
            <div class="container"><!--중앙정렬-->
				
				<!-- #include file = "../_inc/top.asp" -->                
				<!-- #include file = "../_inc/left.asp" -->

                <div class="center"><!--width=770px-->
					<!-- #include file = "../_inc/class_menu.asp" -->
					
					<div class="sub_body">
                        
						    <div class="slide_contents_3_1">
							    <div class="sub_body_title_3">
								    새싹반
								</div>
								<div class="class_tab_box">
								     <a href="/childcare/class_info?fid=<%=wm.getVal( "fid" )%>&top_code=<%=wm.getVal( "top_code" )%>&left_code=<%=wm.getVal( "left_code" )%>">
                                    <div class="unselected_in">
									    소개
									</div>
									</a>

									<a href="/childcare/class_photo?fid=<%=wm.getVal( "fid" )%>&top_code=<%=wm.getVal( "top_code" )%>&left_code=<%=wm.getVal( "left_code" )%>">
									<div class="selected_al">
									    앨범
									</div>
									</a>

									<div class="class_body_cont">
									    <div class="album_title">
										블럭놀이 시간
										</div>

										<div class="album_cont">
										    <img src="<%=wm.image_domain%>/ikc/mini_hompage/album01.jpg" title="목록으로 가기"/>
											<img src="<%=wm.image_domain%>/ikc/mini_hompage/album02.jpg" title="목록으로 가기"/>
											<img src="<%=wm.image_domain%>/ikc/mini_hompage/album03.jpg" title="목록으로 가기"/>
											<img src="<%=wm.image_domain%>/ikc/mini_hompage/album04.jpg" title="목록으로 가기"/>
											<img src="<%=wm.image_domain%>/ikc/mini_hompage/album05.jpg" title="목록으로 가기"/>
											<img src="<%=wm.image_domain%>/ikc/mini_hompage/album06.jpg" title="목록으로 가기"/>
										
										</div>

										<div class="album_btn">
											<a href="/childcare/class_photo?fid=<%=wm.getVal( "fid" )%>&top_code=<%=wm.getVal( "top_code" )%>&left_code=<%=wm.getVal( "left_code" )%>">
												<img src="<%=wm.image_domain%>/ikc/mini_hompage/album_btn.png" title="목록으로 가기"/>
											</a>
										</div>

									</div>
								</div>


									



							</div>
							    
							
                        </div>	
						

					</div>
		
                </div>  <!-- //  center -->
			</div>  <!-- //  container -->

			<!-- #include file = "../_inc/right_quick.asp" -->

		</div> <!-- //  wrap -->

	</body>
</html>