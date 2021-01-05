<!-- #include file = "./inc/_head.asp" -->
    <body>
    
        <div class="wrap">
        
            
            <div class="header">
                
				<!-- #include file = "./inc/_top.asp" -->
                <!-- #include file = "./inc/_top_menu.asp" -->

            </div>

            <div class="container">
                
                <div class="news_combi">


                    
							<div class="news">
									
									<div class="area_left">
										<div class="newslist_line">
											<!-- #include file = "./inc/news_left.asp" -->
										</div>
									</div>

									<div class="area_center">

											<div class="newslist_title">
												<div class="newslist_title_path">
													<%=wm.getVal( "top_menu_title" )%> 
													<img src="//park.compa.kr/iknnews/image/right_icon.jpg" title="우리아이"/>
													<span><%=wm.getVal( "sub_menu_title" )%></span>
												</div>
												
												<ul>
													<!--
													<li class="on"><a href="#"><span>최신기사</span></a></li>
													<li><a href="#"><span>날짜순</span></a></li>
													-->
												</ul>
												
												<div class="newslist_title_date">
												<%=year(date)%>년 <%=month(date)%>월 <%=day(date)%>일 <%=WeekStr(now())%>요일
												</div>
											</div>

											<%
												Dim ArticleID, Subject, SubTitle, Contents, img_path, WriterName, RegDate, conv_mod_date
												Dim conv_reg_date, article_relation_cnt, article_relation_row, article_relation_loop
												Dim list_loop, title_len, contents_len

												If Ubound( news_row ) > -1 Then 
													For list_loop = 0 To Ubound( news_row )
														
														ArticleID = news_row( list_loop ).item("ArticleID")
														Subject = news_row( list_loop ).item("Subject")
														SubTitle = news_row( list_loop ).item("SubTitle")
														Contents = news_row( list_loop ).item("Contents")
														img_path = news_row( list_loop ).item("img_path")
														WriterName = news_row( list_loop ).item("WriterName")
														RegDate = news_row( list_loop ).item("RegDate")
														article_relation_cnt = news_row( list_loop ).item("article_relation_cnt")
														conv_reg_date = dateType( "T09", news_row( list_loop ).item("conv_reg_date") ) 
														conv_mod_date = dateType( "T09", news_row( list_loop ).item("conv_mod_date") ) 

														If conv_mod_date = "" Then 
															conv_mod_date = conv_reg_date
														End If 

											%>
											<div class="newslist_list">
												<%
													If img_path <> "" Then
														title_len = 40
														contents_len = 150
												%>
												<div class="newslist_list_thumb">
													<a href="/news/view?ArticleID=<%=ArticleID%>&catr=<%=catr%>&page=<%=page%>&size=<%=size%>" title="<%=Subject%> 본문보기" >
														<img src="<%=img_path%>" alt="기사 <%=Subject%> 의 이미지" style="width:100%" />
													</a>
												</div>
												<%
													Else 
														title_len = 80
														contents_len = 200
													End If 
												%>
												<div class="newslist_list_title">
													<a href="/news/view?ArticleID=<%=ArticleID%>&catr=<%=catr%>&page=<%=page%>&size=<%=size%>" title="<%=Subject%> 본문보기" >
														<%=Subject%>
													</a>
												</div>

												<div class="newslist_list_sub">
													<a href="/news/view?ArticleID=<%=ArticleID%>&catr=<%=catr%>&page=<%=page%>&size=<%=size%>" title="<%=Subject%> 본문보기" >
														<%=CutString(removeContens( Contents ), 40, "")%>
													</a>
												</div>
												<div class="newslist_list_time">
													기사입력 : <%=conv_reg_date%> &nbsp&nbsp | &nbsp&nbsp 기사수정 : <%=conv_mod_date%>
												</div>

											</div>
											<%
													Next
											%>
											<div class="page-box">
												<%=paging( "news_list" )%>				
											</div>
											<%
												Else 
											%>
											<div class="alert_msg" style="text-align:center;margin-top:50px">

											 <p class="alertmsg_firstp"><img src="<%=wm.image_domain%>/img/inc/ico_notFound.png" alt="알림 느낌표"></p>

											 <p class="alertmsg_secondp">검색결과가 없습니다.</p>

											 <p class="alertmsg_thirdp">검색어를 다시 입력해 주세요</p>

											</div>
											<%
												End If 
											%>


							        </div>

					</div>
					<!-- #include file = "./inc/news_right.asp" -->
                </div>
            </div>
			
		<!-- #include file = "./inc/_footer.asp" -->	
 
    
    </body>
    
</html>