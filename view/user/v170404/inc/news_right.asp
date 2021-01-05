<div class="area_right">
	   
		<div class="newsline_right">
				
				<div class="area_right_photobox" style="border-bottom:none">
					<iframe src="http://adex.ednplus.com/xc/h/EDdygCDc" width="300" height="250" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0"></iframe>
				</div>
				
				<%
					If Not ( right_card_news.Bof Or right_card_news.Eof ) Then 
				%>
				<div class="area_right_photobox">

					<div class="area_right_title">
						<span><a href="news/list?catr=1701">카드뉴스</a></span>
						<div class="dots" id="card_dot" ></div>
					</div>

					<div class="bxslider_side_card" >
					<%
						Do While Not right_card_news.Eof 
					%>
						<div>
							<div class="area_right_photo" style="height:160px;overflow:hidden" >
								<a href="/news/view?ArticleID=<%=right_card_news("ArticleID")%>&catr=<%=right_card_news("CatrCode")%>">
									<img src="<%=wm.image_domain & right_card_news("img_path")%>" alt="<%=right_card_news("Subject")%>" style="width:300px;" />
								</a>
							</div>
							<div class="area_right_phototitle" style="margin-top:15px" >
								<a href="/news/view?ArticleID=<%=right_card_news("ArticleID")%>&catr=<%=right_card_news("CatrCode")%>">
									<%=right_card_news("Subject")%>
								</a>
							</div>
						</div>
					<%
							right_card_news.MoveNext()
						Loop 
					%>
					</div>
				</div>
				<%
					End If 
				%>

				<%
					If Not ( right_interview.Bof Or right_interview.Eof ) Then 
				%>
				<div class="area_right_photobox">

					<div class="area_right_title">
						<span><a href="news/list?catr=1302">인터뷰</a></span>
						<div class="dots" id="interview_dot" ></div> 
					</div>

					<div class="bxslider_side_interview" >
					<%
						Do While Not right_interview.Eof 
					%>
						<div>
							<div class="area_right_photo" style="height:160px;overflow:hidden" >
								<a href="/news/view?ArticleID=<%=right_interview("ArticleID")%>&catr=1302">
									<img src="<%=wm.image_domain & right_interview("img_path")%>" alt="<%=right_interview("Subject")%>" style="width:300px;" />
								</a>
							</div>
							<div class="area_right_phototitle" style="margin-top:15px" >
								<a href="/news/view?ArticleID=<%=right_interview("ArticleID")%>&catr=1302">
									<%=right_interview("Subject")%>
								</a>
							</div>
						</div>
					<%
							right_interview.MoveNext()
						Loop 
					%>
					</div>
				</div>
				<%
					End If 
				%>


				<div class="area_right_photobox" style="padding-bottom:15px">
					<div class="area_right_title">
						<span><a href="#">많이 본 뉴스</a></span>
					</div>

					<div class="right_list_box">
					
						<%	
							Dim loop_cnt, side_article_id, side_catr_code, side_img_path, side_subject, side_contents

							If Ubound( right_popular_news ) > -1 Then 
								For loop_cnt = 0 To Ubound( right_popular_news )
									
									side_article_id = right_popular_news(loop_cnt).item("ArticleID")
									side_catr_code = right_popular_news(loop_cnt).item("CatrCode")
									side_img_path = right_popular_news(loop_cnt).item("img_path")
									side_subject = right_popular_news(loop_cnt).item("Subject")
									side_contents = right_popular_news(loop_cnt).item("Contents")


						%>
						<div class="area_right_list">
							<div class="list_n">												
								<img src="<%=wm.image_path%>/inc/rightlist_<%=( loop_cnt + 1)%>.jpg" alt="" />	
							</div>
							
							<%
								If loop_cnt < 3 Then 

							%>
							<div class="list_thumb">
								<a href="/news/view?ArticleID=<%=side_article_id%>&catr=<%=side_catr_code%>">
									<img src="<%=side_img_path%>" alt="<%=side_subject%>" style="width:100px;max-height:53px" />
								</a>
							</div>										

							<div class="list_title">												
								<a href="/news/view?ArticleID=<%=side_article_id%>&catr=<%=side_catr_code%>">
									<%=CutString(side_subject, 44, "")%>
								</a>										
							</div>
							<%
								Else 
							%>
							<div class="list_title_long">												
								<a href="/news/view?ArticleID=<%=side_article_id%>&catr=<%=side_catr_code%>">
									<%=CutString(side_subject, 30, "")%>
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
					<a href="http://www.chamdahan.com/goods/goods_list.html" target="_blank" >
						<img src="<%=wm.image_path%>/inc/right_banner.jpg" alt="참다한 홍삼" />	
					</a>
				</div>
		</div>
	</div>