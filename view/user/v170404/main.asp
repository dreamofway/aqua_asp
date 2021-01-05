<!-- #include file = "./inc/_head.asp" -->
    <body>
    
        <div class="wrap">

            <div class="header">
                
                <!-- #include file = "./inc/_top.asp" -->
                <!-- #include file = "./inc/_top_menu.asp" -->
                          
            </div>

            <div class="container">
                
                <div class="news_combi">

				    <div class="news_left">
                    
						<div class="news">
						
							<div class="area_left">

								<div class="line">										
									<% 
										' 뉴스
										Call makeMainLeft("11")
									%>
								</div>

							</div>

							<div class="area_center">

								<div class="news_main">
									<div class="title_main">
										<a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
											<%=CutString(wm.getVal("hl_Subject"), 32, "")%>
										</a>
									</div>

									<div class="title_sub">
										<a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
											<%=CutString(wm.getVal("hl_SubTitle") , 50, "")%>
										</a>
									</div>

									<%
										If wm.getVal("hl_img_info_main") <> "" Then 
									%>
									<div class="photo_main" style="height:212px;overflow:hidden;margin-bottom:5px">
										<a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
											<img src="<%=wm.getVal("hl_img_info_main")%>" alt="news_main" style="max-width:520px;" />
										</a>
									</div>
									<%
										Else 
											If wm.getVal("hl_img_path") <> "" Then 
									%>
									<div class="photo_main" style="height:212px;overflow:hidden;margin-bottom:5px">
										<a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
											<img src="<%=wm.getVal("hl_img_path")%>" alt="news_main" />
										</a>
									</div>
									<%		End If 
										End If 
									%>
									<div class="text_main">
										<a href="/news/view?ArticleID=<%=wm.getVal("hl_ArticleID")%>&catr=<%=wm.getVal("hl_CatrCode")%>">
											<%=CutString(removeContens( wm.getVal("hl_Contents") ), 106, "")%>  
										</a>
									</div>
								</div>
										
								<%
									Dim main_news_arr
									Dim loop_cnt, text_loop 
									Dim article_id, catr_code, img_path, subject, contents
									main_news_arr = wm.getVal("main_lately")

									If Ubound( main_news_arr ) > -1 Then 
										For loop_cnt = 0 To (ubound(main_news_arr) - 1)
											article_id = main_news_arr(loop_cnt)("img_news").item("ArticleID")
											catr_code = main_news_arr(loop_cnt)("img_news").item("CatrCode")
											img_path = main_news_arr(loop_cnt)("img_news").item("img_path")
											subject = main_news_arr(loop_cnt)("img_news").item("Subject")
											contents = main_news_arr(loop_cnt)("img_news").item("Contents")
								%>
								<div class="news_list">

									<div class="news_list_thumb" style="height:80px;overflow:hidden;" >
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=img_path%>" alt="구취" style="max-width:117px;" />
										</a>
									</div>

									<div class="news_list_title">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<%=subject%>
										</a>
									</div>

									<div class="news_list_text">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<%=CutString(removeContens( contents ), 106, "")%>
										</a>
									</div>

								</div>
								<%
											For text_loop = 0 To ( ubound( main_news_arr(loop_cnt)("text_news") ) )
												article_id = main_news_arr(loop_cnt)("text_news")(text_loop).item("ArticleID")
												catr_code = main_news_arr(loop_cnt)("text_news")(text_loop).item("CatrCode")
												img_path = main_news_arr(loop_cnt)("text_news")(text_loop).item("img_info_main")
												subject = main_news_arr(loop_cnt)("text_news")(text_loop).item("Subject")
												contents = main_news_arr(loop_cnt)("text_news")(text_loop).item("Contents")
								%>
								<div class="news_list">                               
									<div class="news_list_title">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<%=subject%>
										</a>
									</div>
								</div>
								<%	
												Response.Flush
											Next 
										Next 
									End If 
								%>

                                <div class="news_vs">

                                    <div class="news_half_left">
										<div class="news_half_title_left">Men's Opinion</div>
										<%
											main_news_arr = wm.getVal("mans_opinion")

											If Ubound( main_news_arr ) > -1 Then 
												For loop_cnt = 0 To ubound(main_news_arr)
													
													article_id = main_news_arr(loop_cnt).item("ArticleID")
													catr_code = main_news_arr(loop_cnt).item("CatrCode")
													img_path = main_news_arr(loop_cnt).item("img_info_main")
													subject = main_news_arr(loop_cnt).item("Subject")
													contents = main_news_arr(loop_cnt).item("Contents")

													If loop_cnt = 0 Then 
										%>
										<div class="half_list_thumb" style="height:68px;oveflow:hidden;margin-bottom:5px">
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<img src="<%=img_path%>" alt="먹거리" style="max-width:100px;" />
											</a>
										</div>

										<div class="half_list_title">
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<%=subject%>
											</a>
										</div>
										<%
													Else 	
										%>
										<div class="related_half">
											<div class="related_icon"> 
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<img src="//park.compa.kr/iknnews/image/related_icon.png"/>
												</a>
											</div>

											<div class="related_half_title"> 
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<%=subject%>
												</a>
											</div>
										</div>
										<%
													End If 
												Next 
											End If 
										%>

									</div>

									<div class="news_half_right">
										<div class="news_half_title_right">Women's Opinion</div>
										
										<%
											main_news_arr = wm.getVal("womans_opinion")

											If Ubound( main_news_arr ) > -1 Then 
												For loop_cnt = 0 To ubound(main_news_arr)
													
													article_id = main_news_arr(loop_cnt).item("ArticleID")
													catr_code = main_news_arr(loop_cnt).item("CatrCode")
													img_path = main_news_arr(loop_cnt).item("img_info_main")
													subject = main_news_arr(loop_cnt).item("Subject")
													contents = main_news_arr(loop_cnt).item("Contents")

													If loop_cnt = 0 Then 
										%>
										<div class="half_list_title">
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<%=subject%>
											</a>
										</div>
										<div class="half_list_thumb_right" style="height:68px;oveflow:hidden;margin-bottom:5px">
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<img src="<%=img_path%>" alt="<%=subject%>" style="max-width:100px;" />
											</a>
										</div>
										<%
													Else 	
										%>
										<div class="related_half">
											<div class="related_icon"> 
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<img src="//park.compa.kr/iknnews/image/related_icon.png"/>
												</a>
											</div>

											<div class="related_half_title"> 
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<%=subject%>
												</a>
											</div>
										</div>
										<%
													End If 
													Response.Flush
												Next 
											End If 
										%>


									</div>

								</div>	
										
										
								<div class="news_keyword">
									<%
										main_news_arr = wm.getVal("keyword_news")

										If Ubound( main_news_arr ) > -1 Then 
									%>
									<div class="keyword"><%=main_news_arr(0).item("CatrName")%></div>
									
									<%	
											For loop_cnt = 0 To ubound(main_news_arr)
												
												article_id = main_news_arr(loop_cnt).item("ArticleID")
												catr_code = main_news_arr(loop_cnt).item("CatrCode")
												img_path = main_news_arr(loop_cnt).item("img_info_main")
												subject = main_news_arr(loop_cnt).item("Subject")
												contents = main_news_arr(loop_cnt).item("Contents")

												If loop_cnt = 0 Then 
									%>
									<div class="news_list_thumb" style="height:80px;overflow:hidden">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=img_path%>" alt="<%=subject%>" style="max-width:117px;" />
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

									<div class="related_news">
										<div class="related_icon"> 
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<img src="//park.compa.kr/iknnews/image/related_icon.jpg"/>
											</a>
										</div>

										<div class="related_title"> 
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<%=CutString(subject, 60, "")%>
											</a>
										</div>

									</div>
									<%
												End If 
											Next 
										End If 
									%>


								</div>
											
							</div>
                        </div> <!-- // news -->
                        
				        <div class="news_thumb3">
						
							<div class="area_left">

								<div class="line_thumb3">

									<%
										' 정책/산업
										Call makeMainLeft("12")
									%>

								</div>

							</div>
							
							<div class="area_center">
							
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
								<div class="photo_list">
									<div class="photo_list_thumb">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=img_path%>" style="max-width:180px;max-height:124px"/>
										</a>
									</div>
									
									<div class="photo_list_title">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<%=CutString(subject, 30, "")%>
										</a>
									</div>

								</div> 

								<%
											Response.Flush
										Next 
									End If 
								%>

								
							</div>
						
						</div>
							
                   </div>	
				

				   <div class="area_right">
                       
					    <div class="line_right">

                                <div class="area_right_photobox">

									<div class="sns"><!-- sns -->
										<ul>
											<li class="sns_tab snsbtn_on"><a href="#"></a></li>
											<li class="sns_tab"><a href="#"></a></li>
										</ul>
										<div class="scroll_hide">
											<div class="scroll">
												<div id="instagram" class="sns_content">
													<!-- SnapWidget -->
													<iframe src="https://snapwidget.com/embed/347472" class="snapwidget-widget" allowTransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden; width:273px; height:290px"></iframe>
												</div>
												
												<div id="fb-root" class="sns_content">
													<script>(function(d, s, id) {
													  var js, fjs = d.getElementsByTagName(s)[0];
													  if (d.getElementById(id)) return;
													  js = d.createElement(s); js.id = id;
													  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
													  fjs.parentNode.insertBefore(js, fjs);
													}(document, 'script', 'facebook-jssdk'));</script>
													<div class="fb-page" data-href="https://www.facebook.com/healthikr" data-tabs="timeline" data-width="300" data-height="300" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="true"><blockquote cite="https://www.facebook.com/healthikr" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/healthikr"></a></blockquote></div>
												</div>
											</div>
										</div>
									</div><!-- sns //-->
								</div>

								<div class="area_right_photobox">							
                                    <div class="area_right_title"  >
                                        <span><a href="news/list?catr=1701">카드뉴스</a></span>
										
										<!--
										<div class="dots">
											<div class="dot">
												<a href="#"><img src="//park.compa.kr/iknnews/image/dot.jpg" alt="" /></a>
											</div>
											<div class="dot">
												<a href="#"><img src="//park.compa.kr/iknnews/image/dot_blank.jpg" alt="" /></a>
											</div>
											<div class="dot">
												<a href="#"><img src="//park.compa.kr/iknnews/image/dot_blank.jpg" alt="" /></a>
											</div>
										</div>
										-->
                                        
                                    </div>


									<%
										main_news_arr = wm.getVal("card_news")

										If Ubound( main_news_arr ) > -1 Then 
											For loop_cnt = 0 To 0
												
												article_id = main_news_arr(loop_cnt).item("ArticleID")
												catr_code = main_news_arr(loop_cnt).item("CatrCode")
												img_path = main_news_arr(loop_cnt).item("img_path")
												subject = main_news_arr(loop_cnt).item("Subject")
												contents = main_news_arr(loop_cnt).item("Contents")


									%>
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
									
									<%
												Response.Flush
											Next 
										End If 
									%>
								</div>


								<div class="area_right_photobox">
                                    <div class="area_right_title">
                                        <span><a href="news/list?catr=1302">인터뷰</a></span>
										<!--
										<div class="dots">
											<div class="dot">
												<a href="#"><img src="//park.compa.kr/iknnews/image/dot.jpg" alt="" /></a>
											</div>
											<div class="dot">
												<a href="#"><img src="//park.compa.kr/iknnews/image/dot_blank.jpg" alt="" /></a>
											</div>
											<div class="dot">
												<a href="#"><img src="//park.compa.kr/iknnews/image/dot_blank.jpg" alt="" /></a>
											</div>
										</div>
										-->    
                                    </div>
									

                                    <%
										main_news_arr = wm.getVal("interview")

										If Ubound( main_news_arr ) > -1 Then 
											For loop_cnt = 0 To 0
												
												article_id = main_news_arr(loop_cnt).item("ArticleID")
												catr_code = main_news_arr(loop_cnt).item("CatrCode")
												img_path = main_news_arr(loop_cnt).item("img_path")
												subject = main_news_arr(loop_cnt).item("Subject")
												contents = main_news_arr(loop_cnt).item("Contents")


									%>
                                    <div class="area_right_photo" style="height:160px;overflow:hidden">
                                        <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=img_path%>" alt="<%=subject%>" style="width:300px;" />
										</a>
                                    </div>
                                    <div class="area_right_phototitle" style="margin-top:15px" >
                                        <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<%=subject%>
										</a>
                                    </div>
									
									<%
												Response.Flush
											Next 
										End If 
									%>

								</div>


                                <div class="area_right_mostviewed">
                                    <div class="area_right_title">
                                        <span><a href="#">많이 본 뉴스</a></span>
                                    </div>

                                    <div class="right_list_box">
										
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
										<div class="area_right_list">
											<div class="list_n">												
												<img src="//park.compa.kr/iknnews/image/rightlist_<%=( loop_cnt + 1)%>.jpg" alt="" />	
											</div>
											
											<%
												If loop_cnt < 3 Then 

											%>
											<div class="list_thumb">
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<img src="<%=img_path%>" alt="<%=subject%>" style="width:100px;max-height:53px" />
												</a>
											</div>										

											<div class="list_title">												
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<%=CutString(subject, 44, "")%>
												</a>										
											</div>
											<%
												Else 
											%>
											<div class="list_title_long">												
												<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
													<%=CutString(subject, 30, "")%>
												</a>										
											</div>	
											<%
												End If 
											%>
										</div>
										<%
													Response.Flush
												Next 
											End If 
										%>

                                    </div>



								</div>
						        




								<div class="area_right_baner">
								   	<iframe src="http://adex.ednplus.com/xc/h/EDdygCDc" width="300" height="250" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0"></iframe>

								</div>


						</div>
                    
                    </div>
                 
                </div>

                <div class="news_combi_2rows">
					
					<%
						main_news_arr = wm.getVal("result_photo")

						If Ubound( main_news_arr ) > -1 Then 
					%>
                    <div class="news_thumblist">
                          
                        <div class="area_left">

                            <div class="line_thumb4" >

                                <%
									' 포토
									Call makeMainLeft("14")
								%>

                            </div>

                        </div>

							<%
								
									For loop_cnt = 0 To ubound(main_news_arr)
										
										article_id = main_news_arr(loop_cnt).item("ArticleID")
										catr_code = main_news_arr(loop_cnt).item("CatrCode")
										img_path = main_news_arr(loop_cnt).item("img_path")
										subject = main_news_arr(loop_cnt).item("Subject")
										contents = main_news_arr(loop_cnt).item("Contents")


							%>
						    <div class="line_thumb_r">  
								<div class="thumb_set4">
									<div class="thumb4" >
										 <a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=img_path%>" style="max-width:196px;max-height:110px" />
										</a>
									</div>
																   
									<div class="title_text4" >
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
									
											<div class="title" >
												<%=subject%>
											</div>
										</a>
									</div>
								

								</div>
							</div>
							<%
										Response.Flush
									Next 
								
							%>


                    </div>
					<%
						End If 
					%>
					
					<%
						Dim peple_img_id 
								
						main_news_arr = wm.getVal("result_peple")
					%>
                    <div class="news_thumblist">
                          
                        <div class="area_left">

                            <div class="line_thumblist">
                                <%
									' 피플
									Call makeMainLeft("13")
								%>
                            </div>

                        </div>
                        
                        <div class="area_center_thumblist">
							
							<%
								
								If Ubound( main_news_arr ) > -1 Then 
									For loop_cnt = 0 To ubound(main_news_arr)
										
										article_id = main_news_arr(loop_cnt).item("ArticleID")
										catr_code = main_news_arr(loop_cnt).item("CatrCode")
										img_path = main_news_arr(loop_cnt).item("img_path")
										subject = main_news_arr(loop_cnt).item("Subject")
										contents = main_news_arr(loop_cnt).item("Contents")
										
										If ( peple_img_id =  "" ) Then 
											peple_img_id = article_id
										Else 
											peple_img_id = peple_img_id & "," & article_id
										End If 

							%>
						    <div class="line_thumb">
                        
								<div class="thumb_set">
									 
								
									<div class="thumb">
										<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
											<img src="<%=img_path%>" style="width:194px;max-height:109px" />
										</a>
									</div>
									
																   
									<div class="title_text">
									
										<div class="title">
											<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
												<%'=CutString(subject, 18, "")%>
												<%=subject%>
											</a>
										</div>
										<!--
										<div class="text">
											<a href="#">[서울백병원] 염호기 교수</a>
										</div>
										-->
										
									</div>
								

								</div>
							</div>
							<%
									Next 

								End If 
							%>                         
                            <div class="list">
								<%
									Dim db_obj, peple_rs, peple_query

									Set db_obj = db_conn.connection( "kids" )
									
									peple_query = " select * from vw_ArticleData where CatrCode = '1303' AND ArticleID NOT IN ("& peple_img_id &") "
									Set peple_rs = db_obj.Execute( peple_query )
									
									
									If Not ( peple_rs.Eof Or peple_rs.Bof ) Then 
										Do While not peple_rs.Eof
								%> 
                                <div class="list_set">
									<!--
                                    <div class="list_icon">                                        
                                        <img src="//park.compa.kr/iknnews/image/contributing_icon.jpg"/>
                                    </div>
									-->
                                    <div class="list_icon_title">
                                        <a href="/news/view?ArticleID=<%=peple_rs("ArticleID")%>&catr=<%=peple_rs("CatrCode")%>">
											<%=CutString(peple_rs("Subject"), 34, "")%>
										</a>
                                    </div>
                                </div>
								<%
											peple_rs.MoveNext()
										Loop 
									
								%>
                               
                            </div>
                            
                        </div>
                        
                        
                    </div>

					<%
						End If 
					%>

					<%
						main_news_arr = wm.getVal("result_moms_news")

						If Ubound( main_news_arr ) > -1 Then 
					%>
                    <div class="news_thumblist">
                          
                        <div class="area_left">

                            <div class="line_thumb4" >

                                <%
									' 엄마기자단
									Call makeMainLeft("15")
								%>

                            </div>

                        </div>


						<%
							
							
								For loop_cnt = 0 To ubound(main_news_arr)
									
									article_id = main_news_arr(loop_cnt).item("ArticleID")
									catr_code = main_news_arr(loop_cnt).item("CatrCode")
									img_path = main_news_arr(loop_cnt).item("img_path")
									subject = main_news_arr(loop_cnt).item("Subject")
									contents = main_news_arr(loop_cnt).item("Contents")
		

						%>
						<div class="line_thumb_r">  

					
							<div class="thumb_set4">
								 
							
								<div class="thumb4" style="width:196;">
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<img src="<%=img_path%>" style="width:194px;max-height:109px" />
									</a>
								</div>
								
															   
								<div class="title_text4" >
									<a href="/news/view?ArticleID=<%=article_id%>&catr=<%=catr_code%>">
										<div class="title" >
											<%=subject%>
										</div>
									</a>
								</div>

							</div>
						</div>
						<%
								Next 

							
						%>  
                        
                    </div>

                </div>

				<%
					End If 
				%>
            </div>
        </div>
           
		<!-- #include file = "./inc/_footer.asp" -->
		<%
			
			main_news_arr = wm.getVal("naver_post")
							
			If Ubound( main_news_arr ) > -1 Then 
		%>
        <!-- 포스트 영역 시작 -->    
		<div class="floating" id="naver_post_area" >
			<!--
			<div class="floating_arr_l">
				<img src="//park.compa.kr/iknnews/image/arr_l.png"/>
			</div>
			-->

			<div class="floating_contents_area">

				<div class="floating_left">

				   <a href="http://post.naver.com/my.nhn?memberNo=35540755&navigationType=push" target="_blank" title="헬스앤라이프 네이버 포스트로 이동 (새창)" ><p>포스트</p></a>
				
					<ul>
						<li><a href="http://post.naver.com/my/series/detail.nhn?seriesNo=255319&memberNo=35540755" target="_blank" title="네이버 포스트 키즈헬스로 이동 (새창)" ><span>키즈헬스</span></a></li>
						<li><a href="http://post.naver.com/my/series/detail.nhn?seriesNo=255416&memberNo=35540755" target="_blank" title="네이버 포스트 건강정보로 이동 (새창)" ><span>건강정보</span></a></li>

					</ul>
				</div>

				<div class="floating_boxes">

					<%
							
						For loop_cnt = 0 To Ubound( main_news_arr )
							
							article_id = main_news_arr(loop_cnt).item("ArticleID")
							catr_code = main_news_arr(loop_cnt).item("CatrCode")
							img_path = main_news_arr(loop_cnt).item("img_path")
							subject = main_news_arr(loop_cnt).item("Subject")
							contents = main_news_arr(loop_cnt).item("Contents")


					%>
					<div class="floating_box">
						
						<div class="floating_photo">
							<a href="<%=main_news_arr(loop_cnt).item("MediaURL")%>" target="_blank" title="네이버 포스트 <%=subject%>로 이동 (새창)" >
								<img src="<%=img_path%>" style="width:210px;height:145px"/>
								<div class="floating_textbox">
									<%=subject%>								
								</div>
							</a>
						</div>

					</div>
					<%
						Next 
					%>



				</div>
			</div>
			
			<!--
			<div class="floating_arr_r">
				<img src="//park.compa.kr/iknnews/image/arr_r.png"/>
			</div>
			-->
						
		</div>
		<!-- // 포스트 영역 종료 -->
		<%
			End If 
		%>
		<script type="text/javascript">
		<!--
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

			jQuery(window).scroll(function(){
				var now_window_bottom = ( jQuery(window).height() + jQuery(window).scrollTop() );
				var window_top = jQuery(window).scrollTop();
				
				var absolute_limit = 0;
				var new_top_value = 0;
				 
				if( jQuery("#footer").offset().top <= ( now_window_bottom  )  ) {
					jQuery("#naver_post_area").fadeOut("slow");

				} else {
					jQuery("#naver_post_area").fadeIn("slow");					
				}
				
			});

		//-->
		</script>
    </body>
    
</html>