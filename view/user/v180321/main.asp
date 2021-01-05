<!-- #include file = "./inc/_head.asp" -->
<%
	Dim main_news_arr
	Dim loop_cnt, text_loop 
	Dim article_id, catr_code, img_path, subject, contents
%>
    <body style="position:relative;" >
                
		<!-- #include file = "./inc/_top.asp" -->
		<!-- #include file = "./inc/_top_menu.asp" -->
                          
    <div class="container">
        <div class="main_news_combi" >
			
			<div style="width:1079px;margin-bottom:12px;" >
				<!-- Dable 상_가로1_EMPTY 위젯 시작/ 문의 support@dable.io -->
				<div id="dablewidget_3o5eZ6oj" data-widget_id="3o5eZ6oj">
				<script>
				(function(d,a,b,l,e,_) {
				if(d[b]&&d[b].q)return;d[b]=function(){(d[b].q=d[b].q||[]).push(arguments)};e=a.createElement(l);
				e.async=1;e.charset='utf-8';e.src='//static.dable.io/dist/plugin.min.js';
				_=a.getElementsByTagName(l)[0];_.parentNode.insertBefore(e,_);
				})(window,document,'dable','script');
				dable('setService', 'ikn.kr');
				dable('renderWidget', 'dablewidget_3o5eZ6oj', {ignore_items: true});
				</script>
				</div>
				<!-- Dable 상_가로1_EMPTY 위젯 종료/ 문의 support@dable.io -->
			</div>

            <div class="main_news_left ">
                <div class="main_news" style="margin-bottom:0px" >
                    <div class="main_area_center " style="border-left: 1px solid #d0d0d0;border-right: 1px solid #d0d0d0;border-bottom: 1px solid #d0d0d0;height: 772px; background: #fff; margin-bottom: 12px">
                        <div class="main_news_main ">
                            <div class="main_photo_main">
                                <a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
								<img src="<%=wm.getVal("hl_img_info_main")%>" alt="news_main" style="width: 100%; height: 100%" />
                                <div class="main_text_main " style="width:100%" >
                                    <a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
                                        <h2><%=CutString(wm.getVal("hl_Subject"), 24, "")%></h2>
                                        <p><%=CutString(removeContens( wm.getVal("hl_Contents") ), 106, "")%>  </p>
                                    </a>
                                </div>
								</a>
                            </div>
                        </div><!--  main_news_main //-->

						<%
							
							main_news_arr = wm.getVal("main_lately")

							If Ubound( main_news_arr ) > -1 Then 
								For loop_cnt = 0 To (ubound(main_news_arr) - 1)
									article_id = main_news_arr(loop_cnt)("img_news").item("ArticleID")
									catr_code = main_news_arr(loop_cnt)("img_news").item("CatrCode")
									img_path = main_news_arr(loop_cnt)("img_news").item("img_path")
									subject = main_news_arr(loop_cnt)("img_news").item("Subject")
									contents = main_news_arr(loop_cnt)("img_news").item("Contents")
						%>
                        <div class="main_news_list ">
                            <div class="news_list_thumb " style="height:80px;overflow:hidden; ">
                                <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<img src="<%=img_path%>" alt="구취" style="max-width:117px;" />
								</a>
                            </div>

                            <div class="main_news_list_title " style="margin-bottom: 3px;">
                                <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<%=subject%>
								</a>
                            </div>

                            <div class="main_news_list_text ">
                               <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<%=CutString(removeContens( contents ), 106, "")%>
								</a>
                            </div>
                        </div><!--  main_news_list //-->
						<%
									
									Response.Flush
								Next
									
								For text_loop = 0 To ( ubound( main_news_arr( 0 )("text_news") ) )
									article_id = main_news_arr( 0 )("text_news")(text_loop).item("ArticleID")
									catr_code = main_news_arr( 0 )("text_news")(text_loop).item("CatrCode")
									img_path = main_news_arr( 0 )("text_news")(text_loop).item("img_info_main")
									subject = main_news_arr( 0 )("text_news")(text_loop).item("Subject")
									contents = main_news_arr( 0 )("text_news")(text_loop).item("Contents")
						%>

                        <div class="main_news_list ">
                            <div class="main_news_list_title">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<%=subject%>
								</a>
							</div>
                        </div><!--  main_news_list //-->
						<%	
									Response.Flush
								Next 
							 
						End If 
						%>

						

                    </div><!--  main_area_center //-->

                </div>
                <!-- main_news //-->

            </div><!-- main_news_left //-->


            <div class="area_right ">
                <div class="line_right ">

                    <div class="area_right_mostviewed " style="height: 493px; margin-bottom: 15px;">
                        <div class="area_right_title ">
                            <span><a href="# ">많이 본 뉴스</a></span>
                        </div>

                        <div class="right_list_box ">
							<%
								main_news_arr = wm.getVal("result_popular_news")
								
								If Ubound( main_news_arr ) > -1 Then 
									For loop_cnt = 0 To Ubound( main_news_arr )
										
										article_id = main_news_arr(loop_cnt).item("ArticleID")
										catr_code = main_news_arr(loop_cnt).item("CatrCode")
										img_path = main_news_arr(loop_cnt).item("img_path")
										subject = main_news_arr(loop_cnt).item("Subject")
										contents = main_news_arr(loop_cnt).item("Contents")


							%>

							<%
								If loop_cnt < 3 Then 

							%>
                            <div class="area_right_list ">
								
                                <p class="list_n " style="background: #db7f6f"><%=( loop_cnt + 1)%></p>

                                <div class="list_thumb">
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<img src="<%=img_path%>" alt="<%=subject%>" style="width:116px; max-height:63px" />
									</a>
								</div>										

								<div class="list_title">												
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<%=CutString(subject, 44, "")%>
									</a>										
								</div>
                            </div>
							<%
								Else 
							%>

                            <div class="area_right_list ">
                                <p class="list_n "><%=( loop_cnt + 1)%></p>

                                <div class="list_title_long">												
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<%=CutString(subject, 30, "")%>
									</a>										
								</div>											
                            </div>
							<%
								End If 
							%>

							<%
										Response.Flush
									Next 
								End If 
							%>
                        </div><!-- right_list_box  // -->
                    </div>
                    <!-- area_right_mostviewed  많이본뉴스 // -->
					
					<div class="area_right_ad " style="height: 256px;  border: 1px solid #d0d0d0; overflow:hidden;padding-top:6px;padding-left:20px">
						<iframe src="http://adex.ednplus.com/xc/h/EDdygCDc " width="300 " height="250 " frameborder="0 " scrolling="no " topmargin="0 " leftmargin="0 " marginwidth="0 " marginheight="0 "></iframe>
                    </div>
					<!-- 랜덤광고 // -->
					
                </div><!-- line_right //-->
               
              
            </div> <!-- // news_combi_2rows 피플 -->
        </div> <!-- // news_combi_2rows 피플 -->

		<!----------------------       연령별 솔루션     --------------------->		
		<div class="main_news_combi_3rows " style="margin-bottom: 12px">  
            <div class="main_news_thumblist_fin">
                <article class="left" style="width:670px">
                    <div class="main_keyword" style="width:670px; border-right: 1px solid #d0d0d0">연령별 솔루션
                        <p class="main_more" style="padding-right:30px">
                            <a href="/news/list?catr=18"><img src="<%=wm.image_path%>/inc/more_con.jpg" alt=""></a>
                        </p>
                    </div>
                    <div class="area_center_thumblist2" style="height: 280px; padding: 12px 30px; box-sizing: border-box; ">
                        <div class="mdphoto_text">
                            <div id="desSlideshow" class="desSlideshow">
                                <ul class="nav">
                                    <li class="on"><span >1세</span></li>
                                    <li class=""><span >2세</span></li>
                                    <li class=""><span >3세</span></li>
                                    <li class=""><span >4,5세</span></li>
                                    <li class=""><span >6,7세</span></li>
                                </ul>
								
								<%					
									main_news_arr = wm.getVal("result_age_solution")
								%>
                                <div class="switchBigPic">
									
									<%
										Dim share_url, share_img, writer_name, conv_reg_date

										If Ubound( main_news_arr ) > -1 Then 
											For loop_cnt = 0 To ubound(main_news_arr)
												
												article_id = main_news_arr(loop_cnt).item("ArticleID")
												catr_code = main_news_arr(loop_cnt).item("CatrCode")
												img_path = main_news_arr(loop_cnt).item("img_path")
												img_info_main = main_news_arr(loop_cnt).item("img_info_main")
												subject = main_news_arr(loop_cnt).item("Subject")
												contents = main_news_arr(loop_cnt).item("Contents")
												writer_name = main_news_arr( loop_cnt ).item("WriterName")
												conv_reg_date = dateType( "T09", main_news_arr( loop_cnt ).item("conv_reg_date") ) 


												share_url = "http://news.ikn.kr/news/view?ArticleID=" & article_id & "&catr=" & catr_code
												
												If img_info_main = "" Then 
													share_img = wm.ogp_image
												Else 
													share_img = img_info_main
												End If 

									%>

                                    <div class="webtoon">
                                        <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<div class="webtoon_right">
											<img src="<%=img_info_main%>" alt="" style="border:1px solid #d0d0d0;">
											<div class="webtoon_txt">
												<h3><%=CutString(subject, 36, "")%></h3>
												<p><%=CutString(removeContens( contents ), 36, "")%></p>
											</div>
										</div>
										</a>
                                    </div>	<!-- webtoon //-->	
									<%
												Response.Flush
											Next 

										End If 
									%> 
					
                                </div>	<!-- switchBigPic //-->	
                            </div>	<!-- desSlideshow //-->	
                        </div>	<!-- mdphoto_text //-->	
                    </div>	<!-- area_center_thumblist2 //-->	
                </article>

                <article class="right" style="float: left; width: 409px">
					<%
			
						main_news_arr = wm.getVal("naver_post")
										
						If Ubound( main_news_arr ) > -1 Then 
					%>
                    <div class="main_keyword" style="width: 409px;">Post<span><a href="http://post.naver.com/my/series/detail.nhn?seriesNo=255319&memberNo=35540755" style="color: #8b8b8b">키즈헬스</a><span style="padding: 0 10px; color: #8b8b8b">|</span><a href="http://post.naver.com/my/series/detail.nhn?seriesNo=255416&memberNo=35540755" style="color: #8b8b8b">건강정보</a></span>
                        <img src="<%=wm.image_path%>/inc/post_con.png" alt="" style="float: right;padding: 5px 10px 4px 0px;"></div>
                    <div class="area_center_thumblist2" style="height: 280px; padding: 12px 13px; box-sizing: border-box;">
                        <div class="post_box_wrap">
							<%
								Dim img_info_main 		
								For loop_cnt = 0 To Ubound( main_news_arr )
									
									article_id = main_news_arr(loop_cnt).item("ArticleID")
									catr_code = main_news_arr(loop_cnt).item("CatrCode")
									img_path = main_news_arr(loop_cnt).item("img_path")
									img_info_main = main_news_arr(loop_cnt).item("img_info_main")
									subject = main_news_arr(loop_cnt).item("main_subject")
									contents = main_news_arr(loop_cnt).item("Contents")
									
									If img_info_main <> "" Then 
										img_path = img_info_main
									End If 

							%>
                            <div class="s_post">
								<a href="<%=main_news_arr(loop_cnt).item("MediaURL")%>" target="_blank" title="네이버 포스트 <%=subject%>로 이동 (새창)" >
									<img src="<%=img_path%>" style="width:190px; height:130px;"/>
									<p><%=subject%></p>
								</a>
                            </div>
							<%
									Response.Flush
								Next 
							%>
                        </div>	<!-- post_box_wrap //-->	
                    </div>	<!-- area_center_thumblist2 //-->	
					<%
						End If 
					%>
                </article>

            </div><!-- main_news_thumblist_fin //-->
        </div><!-- 연령별 솔루션 //-->


		<%'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
		<div class="main_news_combi ">
            <div class="main_news_left ">
                <div class="main_news" style="border-top:none">
                    
                    <!--  추천컨텐츠-->
                    <div class="main_news_keyword ">
						<%
							main_news_arr = wm.getVal("keyword_news")

							If Ubound( main_news_arr ) > -1 Then 
						%>
                        <div class="main_keyword ">Content<span><%=main_news_arr(0).item("CatrName")%></span>
                            <!--<p class="main_more">
                                <a href="#"><img src="<%=wm.image_path%>/inc/more_con.jpg" alt=""></a>
                            </p>-->
                        </div>
						

                        <div style="padding: 15px 28px; height: 220px;box-sizing: border-box;">
                            
							<div style="width: 100%; overflow: hidden">
								<%	
										For loop_cnt = 0 To ubound(main_news_arr)
											
											article_id = main_news_arr(loop_cnt).item("ArticleID")
											catr_code = main_news_arr(loop_cnt).item("CatrCode")
											img_path = main_news_arr(loop_cnt).item("img_info_main")
											subject = main_news_arr(loop_cnt).item("Subject")
											contents = main_news_arr(loop_cnt).item("Contents")

											If loop_cnt = 0 Then 
								%>
                                <div class="news_list_thumb" >
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<img src="<%=img_path%>" alt="<%=subject%>" style="width:130px;" />
									</a>
								</div>

								<div class="news_list_title">
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<%=CutString(subject, 30, "")%>
									</a>
								</div>

								<div class="news_list_text">
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<%=CutString(removeContens( contents ), 140, "")%>  
									</a>
								</div>
								<%
											Else 
								%>
									<div class="main_related_title"> 
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=wm.image_path%>/inc/related_icon.jpg"/><%=CutString(subject, 60, "")%>
										</a>
									</div>
								<%
											End If 

											Response.Flush
										Next 
									End If 
								%>
                            </div>
							

                            
                        </div>
                    </div> <!--//main_news_keyword 추천컨텐츠-->
					
                </div>
                <!-- main_news //-->

			
                <!-- main_news //-->
				
				<div class="main_news" style="padding-top:10px; padding-left:10px; padding-right:10px; border-top: 2px solid #000; border-left: 1px solid #d8d8d8;border-right: 1px solid #d8d8d8; border-bottom: 1px solid #d8d8d8;">
                
					<!-- Dable 하A_그리드6_EMPTY_02_02 위젯 시작/ 문의 support@dable.io -->
					<div id="dablewidget_2XLPezXO" data-widget_id="2XLPezXO">
					<script>
					(function(d,a){d[a]=d[a]||function(){(d[a].q=d[a].q||[]).push(arguments)};}(window,'dable'));
					dable('renderWidget', 'dablewidget_2XLPezXO');
					</script>
					</div>
					<!-- Dable 하A_그리드6_EMPTY_02_02 위젯 종료/ 문의 support@dable.io -->

                </div>


                <div class="main_news_thumb3 ">
                    <div class="main_keyword ">Policy<span>정책</span>
                        <p class="main_more">
                            <a href="/news/list?catr=12"><img src="<%=wm.image_path%>/inc/more_con.jpg" alt=""></a>
                        </p>
                    </div>
                    <div class="main_area_center ">
						<%
							main_news_arr = wm.getVal("result_policy")

							If Ubound( main_news_arr ) > -1 Then 
								For loop_cnt = 0 To ubound(main_news_arr)
									
									article_id = main_news_arr(loop_cnt).item("ArticleID")
									catr_code = main_news_arr(loop_cnt).item("CatrCode")
									img_path = main_news_arr(loop_cnt).item("img_path")
									subject = main_news_arr(loop_cnt).item("Subject")
									contents = main_news_arr(loop_cnt).item("Contents")
						%>

                        <div class="main_photo_list ">
                            <div class="main_photo_list_thumb">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<img src="<%=img_path%>" />
								</a>
							</div>
							
							<div class="main_photo_list_title">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<%=CutString(subject, 30, "")%><span><%=CutString(removeContens( contents ), 30, "")%></span>
								</a>
							</div>
                        </div>

						<%
									Response.Flush
								Next 
							End If 
						%>

                    </div><!-- main_area_center //-->

                </div><!-- main_news_thumb3 //-->

				 <div class="main_news_thumb3 ">
                    <div class="main_keyword ">Industry<span>산업</span>
                        <p class="main_more">
                            <a href="/news/list?catr=1202"><img src="<%=wm.image_path%>/inc/more_con.jpg" alt=""></a>
                        </p>
                    </div>
                    <div class="main_area_center ">
						<%
							main_news_arr = wm.getVal("result_industry")

							If Ubound( main_news_arr ) > -1 Then 
								For loop_cnt = 0 To ubound(main_news_arr)
									
									article_id = main_news_arr(loop_cnt).item("ArticleID")
									catr_code = main_news_arr(loop_cnt).item("CatrCode")
									img_path = main_news_arr(loop_cnt).item("img_path")
									subject = main_news_arr(loop_cnt).item("Subject")
									contents = main_news_arr(loop_cnt).item("Contents")
						%>

                        <div class="main_photo_list ">
                            <div class="main_photo_list_thumb">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<img src="<%=img_path%>" />
								</a>
							</div>
							
							<div class="main_photo_list_title">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<%=CutString(subject, 30, "")%><span><%=CutString(removeContens( contents ), 30, "")%></span>
								</a>
							</div>
                        </div>

						<%
									Response.Flush
								Next 
							End If 
						%>

                    </div><!-- main_area_center //-->

                </div><!-- main_news_thumb3 //-->


				
            </div><!-- main_news_left //-->


            <div class="area_right ">

                <div class="area_right_photobox " style="border-left: 1px solid #d0d0d0; border-right: 1px solid #d0d0d0; margin-bottom: 12px;border-top: 2px solid #000;">
                    <div class="area_right_title ">
                        <span><a href="news/list?catr=1701 ">카드뉴스</a></span>
                        <div class="dots " id="card_dot "></div>
                    </div>

                    <div class="bxslider_side_card ">
					<%
						main_news_arr = wm.getVal("card_news")

						If Ubound( main_news_arr ) > -1 Then 
							For loop_cnt = 0 To Ubound( main_news_arr )
								
								article_id = main_news_arr(loop_cnt).item("ArticleID")
								catr_code = main_news_arr(loop_cnt).item("CatrCode")
								img_path = main_news_arr(loop_cnt).item("img_path")
								subject = main_news_arr(loop_cnt).item("Subject")
								contents = main_news_arr(loop_cnt).item("Contents")


					%>
                        <div style="height: 220px; border-bottom: 1px solid #d0d0d0; ">
                            <div class="area_right_photo" style="height:160px;overflow:hidden">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<img src="<%=img_path%>" alt="<%=subject%>" style="width:300px;" />
								</a>
							</div>
							<div class="area_right_phototitle" style="margin-top:10px" >
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<%=subject%>
								</a>
							</div>
                        </div>
					<%
								Response.Flush
							Next 
						End If 
					%>
                    </div> <!-- bxslider_side_card //-->
                </div> <!-- area_right_photobox //-->
				

                <div class="area_right_baner " style="padding-top:0px;height:297px">
                  <!-- Dable 우_리스트5_EMPTY_02 위젯 시작/ 문의 support@dable.io -->
					<div id="dablewidget_x7yJ9jl6" data-widget_id="x7yJ9jl6">
					<script>
					(function(d,a){d[a]=d[a]||function(){(d[a].q=d[a].q||[]).push(arguments)};}(window,'dable'));
					dable('renderWidget', 'dablewidget_x7yJ9jl6');
					</script>
					</div>
					<!-- Dable 우_리스트5_EMPTY_02 위젯 종료/ 문의 support@dable.io -->
                </div>

				<div class="area_right_baner" style="margin-top:12px" >
                  <iframe src="http://adex.ednplus.com/xc/h/EDdygCDc " width="300 " height="250 " frameborder="0 " scrolling="no " topmargin="0 " leftmargin="0 " marginwidth="0 " marginheight="0 "></iframe>
                </div>

				<!-- 우리아이뉴스 메인 컨텐츠 하단 슬라이드 배너 -->
				<div class="area_right_baner" style="margin-top:12px" >
					<div class="bxslider_side_ad" >  
					<%
						Dim ad_obj, ad_info_arr
						Call getAdBannerList ("main", ad_obj)
						If ad_obj.Exists("180705Z1035") Then 
							ad_info_arr = ad_obj.item("180705Z1035")
							For loop_cnt = 1 To UBound(ad_info_arr)
					%>
							
						<div style="height: 270px; border-bottom: 1px solid #d0d0d0; " class="banner_ad">
							<a href="javascript:void(0)" data-ad-target="<%=ad_info_arr( loop_cnt ).item("AdTarget")%>" data-ad-id="<%=ad_info_arr( loop_cnt ).item("AdID")%>" data-zone-id="<%=ad_info_arr( loop_cnt ).item("ZoneID")%>" data-ad-link="<%=ad_info_arr( loop_cnt ).item("AdLink")%>"><img src="<%=ad_info_arr( loop_cnt ).item("AdSource") %>" alt="<%=ad_info_arr( loop_cnt ).item("AdName")%>" /></a>
						</div>
					<%
							Next 
						End If 	
					%>
					</div>
                </div>

            </div> <!-- // news_combi_2rows 피플 -->
        </div> <!-- // news_combi_2rows 피플 -->


		<%'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>

		<div class="main_news_combi_2rows ">
			<%
				Dim peple_img_id 
						
				main_news_arr = wm.getVal("result_peple")
			%>
            <div class="main_news_thumblist ">
                <div class="main_keyword ">Project<span>기획</span>
                    <div style="display: inline-block;float: right;font-size: 12px;color: #8b8b8b;">
						<!--
						<a href="/news/list?catr=1301">피플</a><span style="padding: 0 10px">|</span><a href="/news/list?catr=1302">인터뷰</a><span style="padding: 0 10px">|</span><a href="/news/list?catr=1303">칼럼</a>
						-->
                        <p class="main_more" style="padding: 8px 20px">
                            <a href="/news/list?catr=13"><img src="<%=wm.image_path%>/inc/more_con.jpg" alt=""></a>
                        </p>
                    </div>

                </div> <!-- main_keyword // -->
				
                <div class="main_area_center_thumblist ">

                    <article>
						<%
								
							If Ubound( main_news_arr ) > -1 Then 
								For loop_cnt = 0 To 2
									
									article_id = main_news_arr(loop_cnt).item("ArticleID")
									catr_code = main_news_arr(loop_cnt).item("CatrCode")
									img_path = main_news_arr(loop_cnt).item("img_path")
									subject = main_news_arr(loop_cnt).item("Subject")
									contents = main_news_arr(loop_cnt).item("Contents")
									img_info_main = main_news_arr(loop_cnt).item("img_info_main")
								

						%>
                        <div class="main_line_thumb ">
                            <div class="main_thumb_set ">
                                <div class="main_thumb">
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<img src="<%=img_info_main%>" style="width:194px;max-height:109px" />
									</a>
								</div>
								
								<div class="main_title_text">								
									<div class="main_title">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<%'=CutString(subject, 18, "")%>
											<%=subject%>
										</a>
									</div>
                                </div>
                            </div>
                        </div>
						<%
									Response.Flush
								Next 
						%> 

                    </article>

                    <div class="main_list ">
						<%
							For loop_cnt = 3 To 6
									
								article_id = main_news_arr(loop_cnt).item("ArticleID")
								catr_code = main_news_arr(loop_cnt).item("CatrCode")
								img_path = main_news_arr(loop_cnt).item("img_path")
								subject = main_news_arr(loop_cnt).item("Subject")
								contents = main_news_arr(loop_cnt).item("Contents")
						%> 
                        <div class="main_list_set ">
							
                            <div class="main_list_icon_title">
								<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									<img src="<%=wm.image_path%>/inc/related_icon.jpg"/><%=CutString(subject, 34, "")%>
								</a>
							</div>
                        </div>
						<%
								Response.Flush	
							Next 
						%>
                    </div> <!-- main_list // -->
                </div> <!-- main_area_center_thumblist // -->
            </div> <!-- main_news_thumblist // -->
			<%
				End If 
			%>
        </div> <!-- news_combi_2rows 건강인 // -->
		
	
		<!-- Dable 하A_그리드6_EMPTY_02 위젯 시작/ 문의 support@dable.io -->
		<div id="dablewidget_6o39ZQlZ" data-widget_id="6o39ZQlZ">
		<script>
		(function(d,a){d[a]=d[a]||function(){(d[a].q=d[a].q||[]).push(arguments)};}(window,'dable'));
		dable('renderWidget', 'dablewidget_6o39ZQlZ');
		</script>
		</div>
		<!-- Dable 하A_그리드6_EMPTY_02 위젯 종료/ 문의 support@dable.io -->

    </div><!-- container //-->

    <script type="text/javascript">
 
        <!--
        $('.bxslider_side_card').bxSlider({
            controls: false,
            auto: true,
            touchEnabled: false,
            autoHover: true,
            pagerSelector: "#card_dot "
        });

        $('.bxslider_side_interview').bxSlider({
            controls: false,
            auto: true,
            touchEnabled: false,
            autoHover: true,
            pagerSelector: "#interview_dot "
        });

		$('.bxslider_side_ad').bxSlider({
            controls: false,
            auto: true,
            touchEnabled: false,
            autoHover: true,
            pagerSelector: "#card_dot "
        });

        //-->
    </script>

    <script type="text/javascript">
        jQuery(function($) {
            if (checkFlatform()["flatform"] == "pc") {
                popupOpen();
            }			 
        });
        /* ------ SNS 탭 메뉴 ------ */
        $(".sns_content ").hide();
        $(".sns_content:first ").show();

        $("div.sns ul li ").click(function() {
            $("div.sns ul li ").removeClass("snsbtn_on ");
            $(this).addClass("snsbtn_on ");

            var btnOn = $(this).index();
            /*console.log(btnOn);*/

            if (btnOn == 0) {
                $(this).find('.sns_icon').attr("src ", "/healthlife_renew/_img/tab_insta_on.png ");
            } else if (btnOn == 1) {
                $(this).find(".sns_icon ").attr("src ", "/healthlife_renew/_img/tab_fb_on.png ");
            } else if (btnOn == 2) {
                $(this).find(".sns_icon ").attr("src ", "/healthlife_renew/_img/tab_blog_on.png ");
            } else {
                $(this).find(".sns_icon ").attr("src ", "/healthlife_renew/_img/tab_twitter_on.png ");
            }

            $(".sns_content ").hide();
            $(".sns_content ").eq(btnOn).show();
        });
		
		//--------------------- popup

			var popup_info = [
				{
					"popup_id" : "2017end"
					,"popup_top" : 240
					,"popup_left" : 1100
					,"popup_href" : ""
					,"popup_target" : ""
					,"popup_img" : "http://img.compa.kr/ikn/popup/1228_2018popup.jpg"
					,"popup_width" : 400
					,"popup_height" : 400
					,"use_flag" : false
				}
				,{
					"popup_id" : "popup_seol_2018"
					,"popup_top" : 240
					,"popup_left" : 1100
					,"popup_href" : ""
					,"popup_target" : ""
					,"popup_img" : "http://img.healthi.kr/img/popup/seol_2018_ikn.jpg"
					,"popup_width" : 400
					,"popup_height" : 400
					,"use_flag" : false
				}
				,{
					"popup_id" : "popup_zum"
					,"popup_top" : 610
					,"popup_left" : 10
					,"popup_href" : ""
					,"popup_target" : ""
					,"popup_img" : "//img.healthi.kr/img/popup/ikn_zum.jpg"
					,"popup_width" : 500
					,"popup_height" : 350
					,"use_flag" : true
				}
				,{
					"popup_id" : "popup_journal"
					,"popup_top" : 175
					,"popup_left" : 10
					,"popup_href" : "http://news.healthi.kr"
					,"popup_target" : "_blank"
					,"popup_img" : "http://img.healthi.kr/img/popup/journal_180726.jpg"
					,"popup_width" : 480
					,"popup_height" : 380
					,"use_flag" : true
				}
				,{
					"popup_id" : "popup_medical"
					,"popup_top" : 175
					,"popup_left" : 1400
					,"popup_href" : "http://kc.healthi.kr"
					,"popup_target" : "_blank"
					,"popup_img" : "http://img.healthi.kr/img/popup/medical_180726.jpg"
					,"popup_width" : 430
					,"popup_height" : 440
					,"use_flag" : true
				}
				,{
					"popup_id" : "popup_compamall"
					,"popup_top" : 175
					,"popup_left" : 950
					,"popup_href" : "http://mall.ikn.kr"
					,"popup_target" : "_blank"
					,"popup_img" : "http://img.healthi.kr/img/popup/compamall_180726.jpg"
					,"popup_width" : 430
					,"popup_height" : 440
					,"use_flag" : true
				}

			];

			function popupOpen() {

				jQuery.each(popup_info, function(idx, item){
					if(item.use_flag == true ) {
						if( getCookie( item.popup_id ) !== "closed" ) {
							jQuery(".wrap").append( jQuery("#tmplate_main_popup").tmpl( item ) );  
	
						}
					}
					
				});
			}

			function closePopup( popup_id, type ) {
    
				if( type == "not_more"  ) {    // 쿠키값 설정.
					var todayDate = new Date();
					todayDate.setDate( todayDate.getDate() +1 );
					document.cookie = popup_id + "=" + escape("closed") + "; path=/; expires=" + todayDate.toGMTString() + ";"
				}
				
				jQuery( "#_layer_popup_" + popup_id ).hide();
				
			}
			
			//--------------------- popup
    </script>
    <script id="tmplate_main_popup" type="text/x-jquery-tmpl">
		
			<div style="position: absolute;top:${popup_top}px;left:${popup_left}px;z-index:10;border:3px solid #ced2d7;" id="_layer_popup_${popup_id}" >
			   <div style="background-color: #fff;width:${popup_width}px;height:${popup_height}px">
					{{if popup_href == ""}}
					  <img src="${popup_img}" id="popup_img_${popup_id}" />
					{{else}}
					<a href="${popup_href}" target="${popup_target}" >
						<img src="${popup_img}" id="popup_img_${popup_id}" />
					</a>
					{{/if}}
			   </div>
				<div style="width:100%;height:35px;background-color: #ced2d7;" >
					<div style="float:left;margin:0px 0px 5px 10px; padding-top:10px; font-size:12px; ">
						<span style="color:#7f7f7f;cursor:pointer" onclick="closePopup( '${popup_id}', 'not_more' )" >
							오늘 하루 더 이상 보지 않기
						</span>
					</div>
					<div style="float:right;margin:0px 10px 5px 0; padding-top:10px; font-size:12px; ">
						<span style="color:#7f7f7f;cursor:pointer" onclick="closePopup( '${popup_id}', 'close' );">
							닫기
						</span>
					</div>
				</div>
			</div>
		</script>       
		<!-- #include file = "./inc/_footer.asp" -->
		
    </body>

	
    

</html>