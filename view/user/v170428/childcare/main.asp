<!-- #include file = "./_inc/header.asp" -->
	</head>


    <body>
    
        <div class="wrap"><!--배경색-->
            <div class="container"><!--중앙정렬-->
				
				<!-- #include file = "./_inc/top.asp" -->
                
				<!-- #include file = "./_inc/left.asp" -->

                <div class="center"><!--width=770px-->
                    <div class="icon_box"><!--박스 크기-->
                        <ul>
							<a href="#">
								<li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_edu.png" title="교육과정"/></li>
							</a>
                            <li><aside class="tabbar_kinder"></aside></li>
                            <a href="/childcare/operate?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1103">
								<li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_oper.png" title="운영 방침"/></li>
							</a>
                            <li><aside class="tabbar_kinder"></aside></li>
                            <a href="/childcare/facility_info?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1105">
								<li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_faci.png" title="시설 안내"/></li>
							</a>
                            <li><aside class="tabbar_kinder"></aside></li>
                            <a href="/childcare/entrance_info?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1104">
								<li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_enter.png" title="입학 안내" width="190px;"/></li>
							</a>
						</ul>
                    </div>
                    
                    <div class="album">
                        <div class="album_left">
                            <div class="album_left_top">
                                <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main01.jpg" title="교육과정"/></a>   
                            </div>
                            <div class="album_left_top_right">
							    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main02.jpg" title="교육과정"/></a>  
                            </div>
                        </div>
                        <div class="album_right">
                            <div class="album_right_top">
                                <div class="album_right_top_left">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main03.jpg" title="교육과정"/></a>  
                                </div>
                                <div class="album_right_top_right">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main05.jpg" title="교육과정"/></a>  
                                </div>
                            </div>
                            <div class="album_right_top">
                                <div class="album_right_top_left">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main04.jpg" title="교육과정"/></a>  
                                </div>
                                <div class="album_right_top_right">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main06.jpg" title="교육과정"/></a>  
                                </div>
                            </div>
                        </div>
                        <div class="album_bottom">
                            <div class="album_bottom_left">
                                <div class="album_bottom_left_1">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main07.jpg" title="교육과정"/></a>  
                                </div>
                                <div class="album_bottom_left_2">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main08.jpg" title="교육과정"/></a>  
                                </div>
                            </div>
						    <div class="album_bottom_right">
                                <div class="album_bottom_right_1">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main09.jpg" title="교육과정"/></a>  
                                </div>
                                <div class="album_bottom_right_2">
								    <a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main10.jpg" title="교육과정"/></a>  
                                </div>
                            </div>

						    
                        </div>
                        
                    
                    </div>
                    
                    
                    <div class="half_box">
					    <div class="half_box_title">
                        <div class="half_box_icon_title">
                            <img src="<%=wm.image_domain%>/ikc/mini_hompage/main_notice.png" title="공지사항"/>
                        </div>
                        <div class="more">
                            <a href="/childcare/notice_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
								<img src="<%=wm.image_domain%>/ikc/mini_hompage/main_more.png" title="더 보기"/>
							</a>
                        </div>
						</div>
                        <div class="box_contents">
                            <ul>
								<li>
									<a href="/childcare/notice_view?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
										행복한 우리 원과 친구에 대해 알아봅니다.
									</a>
								</li>
								<li>
									<a href="/childcare/notice_view?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
										봄/동식물과 자연에 대한 관찰 체험학습 일정 안내 공지문
									</a>
								</li>
								<li>
									<a href="/childcare/notice_view?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
										나와 가족에 대한 아이들의 생각을 자유롭게 적어보는 시간
									</a>
								</li>
								<li>
									<a href="/childcare/notice_view?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
										우리 동네에 대한 생각을 해 보는 체험학습 시간을 가집니다
									</a>
								</li>
								<li>
									<a href="/childcare/notice_view?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
										건강과 안전 - 여름철 건강관리 주의 사항
									</a>
								</li>
						    </ul>
                        </div>
                    </div>
                    
                    <div class="half_box_right">
					    <div class="half_box_title">
                        <div class="half_box_icon_title">
                            <img src="<%=wm.image_domain%>/ikc/mini_hompage/main_prop.png" title="건의사항"/>
                        </div>
                        <div class="more">
                            <a href="/childcare/proposal_list?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main_more.png" title="더 보기"/></a>
                        </div>
						</div>
                        <div class="box_contents">
                            <ul>
                            <li><a href="/childcare/proposal_view?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403">행복한 우리 원과 친구에 대해 알아봅니다.</a></li>
                            <li><a href="/childcare/proposal_view?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403">봄/동식물과 자연에 대한 관찰 체험학습 일정 안내 공지문</a></li>
                            <li><a href="/childcare/proposal_view?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403">나와 가족에 대한 아이들의 생각을 자유롭게 적어보는 시간</a></li>
                            <li><a href="/childcare/proposal_view?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403">우리 동네에 대한 생각을 해 보는 체험학습 시간을 가집니다</a></li>
                            <li><a href="/childcare/proposal_view?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403">건강과 안전 - 여름철 건강관리 주의 사항</a></li>
						    </ul>
                        </div>
                    </div> 
                    
                    <div class="full_box">
					    <div class="full_box_title">
                        <div class="half_box_icon_title">
                            <img src="<%=wm.image_domain%>/ikc/mini_hompage/main_class.png" title="반소개"/>
                        </div>
                        <div class="more">
                            <a href="/childcare/class_info_main?fid=<%=wm.getVal( "fid" )%>&top_code=class&left_code=13"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main_more.png" title="더 보기"/></a>
                        </div>
						</div>
                        <div class="slide_contents">
                            <ul>
                            <li class="arrow" style="height:290px; line-height:290px;"><a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/left_arrow.png" title="왼쪽으로 더보기" style="width:25px; height:25px;"/></a></li>
                            <li><a href="/childcare/class_info?fid=<%=wm.getVal( "fid" )%>&top_code=class&left_code=13"><div class="class_card">
							                    <div class="class_photo">
												    <img src="<%=wm.image_domain%>/ikc/mini_hompage/class01.jpg" title="반소개"/>
												</div>
												<div class="teacher_prof">
												    <img src="<%=wm.image_domain%>/ikc/mini_hompage/class_profile1.png" title="반소개"/>
												</div>
												<div class="class_text">
													<div class="class_name">새싹반</div>
                                                    <div class="class_contents">파릇파릇 꿈을 키우는 새싹반은 몸도 건강 마음도 건강</div>
												</div>
										    </div></a></li>
                            <li><a href="/childcare/class_info?fid=<%=wm.getVal( "fid" )%>&top_code=class&left_code=13"><div class="class_card" style="margin-left:20px;">
							                    <div class="class_photo">
												    <img src="<%=wm.image_domain%>/ikc/mini_hompage/class02.jpg" title="반소개"/>
												</div>
												<div class="teacher_prof">
												    <img src="<%=wm.image_domain%>/ikc/mini_hompage/class_profile1.png" title="반소개"/>
												</div>
												<div class="class_text">
													<div class="class_name">새싹반</div>
                                                    <div class="class_contents">파릇파릇 꿈을 키우는 새싹반은 몸도 건강 마음도 건강</div>

												</div>
											</div></a></li>
                            <li><a href="/childcare/class_info?fid=<%=wm.getVal( "fid" )%>&top_code=class&left_code=13"><div class="class_card" style="margin-left:20px;">
							                    <div class="class_photo">
												    <img src="<%=wm.image_domain%>/ikc/mini_hompage/class03.jpg" title="반소개"/>
												</div>
												<div class="teacher_prof">
												    <img src="<%=wm.image_domain%>/ikc/mini_hompage/class_profile1.png" title="반소개"/>
												</div>
												<div class="class_text">
													<div class="class_name">새싹반</div>
                                                    <div class="class_contents">파릇파릇 꿈을 키우는 새싹반은 몸도 건강 마음도 건강</div>

												</div>
											</div></a></li>
                            <li class="arrow" style="height:290px; line-height:290px;"><a href="#"><img src="<%=wm.image_domain%>/ikc/mini_hompage/right_arrow.png" title="오른쪽으로 더보기" style="width:25px; height:25px;"/></a></li>

						    </ul>
                        
                        </div>
                    </div> 
                    
                    
                    
                    <div class="icon_box" style="margin-top:10px;"><!--박스 크기-->
                        <ul>
							<a href="/childcare/newsletter_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1202"><li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_homenews.png" title="가정통신문"/></li></a>
                            <li><aside class="tabbar_kinder"></aside></li>
                            <a href="/childcare/event_plan?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1204"><li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_event.png" title="행사"/></li></a>
                            <li><aside class="tabbar_kinder"></aside></li>
                            <a href="/childcare/carte?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1205"><li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_meal.png" title="식단표"/></li></a>
                            <li><aside class="tabbar_kinder"></aside></li>
                            <a href="/childcare/schedule?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1206"><li><img src="<%=wm.image_domain%>/ikc/mini_hompage/mainicon_schedule.png" title="일정표" width="190px;"/></li></a>
						</ul>
                    </div>
                    
                    <div class="full_box_bottom">
                        <div class="half_box_icon_title">
                            <img src="<%=wm.image_domain%>/ikc/mini_hompage/main_cctv.png" title="cctv"/>
                        </div>
                        <div class="more">
                            <a href="/childcare/cctv_state?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><img src="<%=wm.image_domain%>/ikc/mini_hompage/main_more.png" title="더 보기"/></a>
                        </div>
                        <div class="slide_contents_cam">
                            <div class="cam_box">
                            <a href="/childcare/cctv_view?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><img src="<%=wm.image_domain%>/ikc/mini_hompage/cctv_sample1.jpg" title="camera1"/></a>
                            <a href="/childcare/cctv_view?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><strong>camera01</strong></a>
							</div>
                            <div class="cam_box"style="padding-left:10px;">
                            <a href="/childcare/cctv_view?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><img src="<%=wm.image_domain%>/ikc/mini_hompage/cctv_sample2.jpg" title="camera1"/></a>
                            <a href="/childcare/cctv_view?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><strong>camera02</strong></a>
							</div>
							<div class="cam_box"style="padding-left:10px;">
                            <a href="/childcare/cctv_view?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><img src="<%=wm.image_domain%>/ikc/mini_hompage/cctv_sample3.jpg" title="camera1"/></a>
                            <a href="/childcare/cctv_view?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601"><strong>camera03</strong></a>
							</div>
                        
                        </div>
                    </div> 
                    
                
                
             
            
            </div>

			<!-- #include file = "./_inc/right_quick.asp" -->
        
		</div>

	</body>
</html>