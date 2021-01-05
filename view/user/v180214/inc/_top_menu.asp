			<!--------- gnb 영역 --------->
			<div class="gnb_bg">
				<div class="gnb">
					<div class="slogun">
						<p><span>♥</span>육아뿐만 아니라, 주요 정책 및 생활 문화 콘텐츠를 한 눈에</p>
					</div>
					<ul>
						<%
							Dim top_menu_loop, top_menu_selected

							For top_menu_loop = 0 To  Ubound( wm.getVal("top_menu") )
								
								If wm.getVal("top_menu")( top_menu_loop ).item("selected") = "on" Then 
									top_menu_selected = "class=""on"""
								Else 
									top_menu_selected = ""
								End If 

								If Not ( wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode") = "14" ) Then 
									
								
						%>
						<li class="gnb_1dep" <%=top_menu_selected%>>
							<a href="/news/list?catr=<%=wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode")%>">
								<%=wm.getVal("top_menu")( top_menu_loop ).item("CatrName")%>
							</a>
						</li>
						<%
								End If 

							Next 
						%>



						<li class="gnb_1dep "><a href="#"><img src="<%=wm.image_path%>/inc/gnb_menu.png" alt="전체메뉴"></a></li>
					</ul>
				</div>        
			</div>
			<!--------- gnb 영역 //--------->
<%
'	echoBR( wm.getVal("top_menu") )
%>
			<!--    gnb_dropmenu -->
			<div class="gnb_slide_wrap">
				<div class="gnb_slided">

					<%
						' 상위 메뉴 반복
						Dim obj_key, child_arr
						Dim menu_db, menu_query, menu_rs
						
						Set menu_db = db_conn.connection("kids")

						For Each obj_key In wm.getVal("left_menu_all")
							
							child_arr = wm.getVal("left_menu_all").item( obj_key ).item("child_info")
							
							If obj_key <> "14" Then 
					%>
					 <div class="gnb_slide">
						<ul>
							<%
								' 하위메뉴 반복
								For top_menu_loop = 0 To  Ubound( child_arr )
							%>
							<li class="gnb_2dep">
								<div class="slide_news_tit"><a href="/news/list?catr=<%=child_arr(top_menu_loop).item("CatrCode")%>"><span>·</span><%=child_arr(top_menu_loop).item("CatrName")%></a></div>
								<%
									If top_menu_loop = 0 Then
										' 현재 상위 메뉴에 해당하는 최신기사 4개를 가져와 노출
										menu_query =	"SELECT TOP 4  * " &_
														", IsNULL( (" & _
														"		SELECT TOP 1" & _
														"			 ImagePath + '/' + ImageName  " & _
														"		FROM ActicleImage " & _
														"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
														"		ORDER BY SEQ DESC " & _
														"	) , '' ) AS img_path " & _
														", ( convert(varchar(16), t_std.RegDate, 120) ) AS conv_reg_date " &_
														", ( convert(varchar(16), t_std.LastModDate, 120) ) AS conv_mod_date " &_
														"FROM ( " &_
														"		SELECT * "&_
														"		FROM ArticleData "&_
														"		WHERE	ArticleID IN ( "&_
														"								SELECT	DISTINCT "&_
														"										ArticleID "&_
														"								FROM vw_ArticleData "&_
														"								WHERE CatrCode LIKE '"& obj_key &"%' )  " &_
														"				AND IsPublish='1' AND DelFlag='0' " &_
														") AS t_std "&_
														"ORDER BY t_std.RegDate DESC"

										Set menu_rs = menu_db.Execute( menu_query  )

										If Not( menu_rs.Eof Or menu_rs.Bof ) Then 
								%>
								<div class="slide_news_area">
									<ul>
										<%
											Do While not menu_rs.eof	
										%>
										<li class="gnb_3dep">
											<a href="/news/view?ArticleID=<%=menu_rs("ArticleID")%>&catr=<%=menu_rs("CatrCode")%>">
												<%
													If menu_rs("img_path") = "" Then 
												%>
												<img src="//img.healthi.kr<%=menu_rs("img_path")%>" alt="<%=menu_rs("Subject")%>">
												<%
													Else 
												%>
												<img src="//img.healthi.kr<%=menu_rs("img_path")%>" alt="<%=menu_rs("Subject")%>">
												<%
													End If 
												%>
												<p class='slide_tit'><%=menu_rs("Subject")%></p>
											</a>
										</li>
										<%
												menu_rs.MoveNext()
											Loop
										%>
									</ul>
								</div>
								<%
										End If ' // If Not( menu_rs.Eof Or menu_rs.Bof ) Then 
									End If ' // If top_menu_loop = 0 Then
								%>
							</li>
							<%
								Next 
								' // 하위메뉴 반복
							%>
						</ul>
					</div> <!-- 종료-->
					<%
							End If 
						Next 
						'// 상위 메뉴 반복
					%>
					
					
				</div>
			</div>
			<!--    gnb_dropmenu //-->
			<div class="rightgreen_div" style="top:64px;"></div>
		</div>
    </div>
	<!--    header // -->