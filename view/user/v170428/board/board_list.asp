	<!-- #include file = "../inc/_head.asp" -->
    <body>
    
        <div class="wrap">
			
            <div class="header">
                <!-- #include file = "../inc/_top.asp" -->
                <!-- #include file = "../inc/_top_menu.asp" -->
			</div>

            <div class="container">


                <div class="list_area_center_box">
				
					<div class="nursery_list_box" style="margin-top:0px" >
						<div class="nursery_list_title">
							<%=board_name%>
						</div>

						
						<div class="list_searching_area">
							<form id="search_form" name="search_form" method="get" >
								<input type="hidden" name="bid" value="<%=bid%>">
							<input class="nursery_list_searching_box" type="text" name="search_keyword"  value="<%=search_keyword%>" title="검색어 입력" maxlength="180" placeholder="검색">
							<div class="nurserylistsearching_btn">
							   <img src="<%=wm.image_path%>/inc/listsearching_icon.jpg" alt="검색" style="cursor:pointer" onclick="document.search_form.submit()" >
							</div>
							</form>
						</div>

						<div class="basic_list_area">
						    
							<%
								Dim move_href
								Dim loop_cnt, list_class
								If Not( list_rs.Eof Or list_rs.Bof ) Then 
									loop_cnt = 0
									Do While not list_rs.Eof
										
										If loop_cnt = 0 Then
											list_class = "_first"
										Else 
											list_class = "_nth"
										End If 
										move_href = "/board/view?idx="& list_rs("idx") &"&page="& page &"&"& get_val
							%>
							<div class="list<%=list_class%>">
							   <div class="list_no">
									<%=list_rs("row_num")%>
							   </div>
							   <div class="list_title">
								<a href="<%=move_href%>">
									<div class="list_title_title"><%=list_rs("InfoTitle")%></div>
								</a>
							   </div>
							   <div class="list_writer">
								<%=list_rs("WriterName")%>
							   </div>
							   <div class="list_date">
								<%=dateType( "T01",list_rs("conv_reg_date"))%>
							   </div>
							   <div class="list_viewcount">
							   <%=FormatNumber(list_rs("HitCount"),0)%>
							   </div>
							</div>
							<%			
										loop_cnt = loop_cnt + 1
										list_rs.MoveNext()
									Loop
								Else 
							%>
								<div class="list_first">

									<p>검색(등록)된 데이터가 없습니다.</p>

								</div>	
							<%
								End If 
							%>

						</div>


                        <div class="page-box">								
							<%=paging( list_name )%>					
						</div>



					</div>

			    </div>
				
				<!-- #include file = "../inc/side_area.asp" -->

            </div>
				
			<!-- #include file = "../inc/_footer.asp" -->

        </div><!--wrap //-->





    </body>
    
</html>