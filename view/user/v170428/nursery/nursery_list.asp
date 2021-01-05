	<!-- #include file = "../inc/_head.asp" -->
    <body>
    
        <div class="wrap">

            <div class="header">
                <!-- #include file = "../inc/_top.asp" -->
                <!-- #include file = "../inc/_top_menu.asp" -->
			</div>

            <div class="container">


                <div class="list_area_center_box">

					<div class="nursery_searching_box" style="margin-top:0px;margin-bottom:0px">
						<form id="search_form" name="search_form" method="get" action="/nursery/list" >

						<div class="searching_box_title">
						어린이집&nbsp;찾기
						</div>

						<select name="search_citycode" id="search_citycode" >
							<option value="" >시 / 도</option>
							<%
								Do While not city_rs.Eof
							 %>
							 <option value="<%=Trim(city_rs("ARcode"))%>" <%If search_citycode = Trim(city_rs("ARcode")) Then %>selected="selected"<%End If %> ><%=Trim(city_rs("ARName"))%></option>	
							 <%
									city_rs.MoveNext()
								Loop 
							 %>
						</select>

						<select name="search_arcode" id="search_arcode" >
						  <option value="">구/군</option>
						</select>


						<div class="searching_group"> 
							<input class="nurserysearchingbox" type="text" name="search_keyword" value="<%=search_keyword%>" title="어린이집 검색" maxlength="180" placeholder="검색">
							<div class="nurserysearching_btn">
							   <img src="<%=wm.image_path%>/inc/searching_icon.jpg" alt="검색" style="cursor:pointer" onclick="document.search_form.submit()" >
							</div>
						</div>
						</form>
				
					</div>


					<div class="nursery_list_box">
						<div class="nursery_list_title_address">
						    <%=addr_text%>
						</div>
						
						<div class="nurseryschool_list_area" >
							<%
								Dim move_href
								Dim loop_cnt, list_class
								If Not( nursery_rs.Eof Or nursery_rs.Bof ) Then 
									loop_cnt = 0
									Do While not nursery_rs.Eof
										
										If loop_cnt = 0 Then
											list_class = "_first"
										Else 
											list_class = "_nth"
										End If 
										'move_href = "/nursery/view?idx="& nursery_rs("idx") &"&page="& page &"&"& get_val
										move_href = "/childcare/home?fid="& nursery_rs("STcode")
							%>
							
						    <div class="nurseryschool_list<%=list_class%>" >
								<div class="nurseryschool_list_thumb">
									<a href="<%=move_href%>" target="_blank" >
										<img src="<%=wm.image_path%>/inc/nursch_list_empty.jpg" alt="">
									</a>
								</div>

								<div class="nurseryschool_name">
									<a href="<%=move_href%>" target="_blank" >
										<%=nursery_rs("Crname")%>
									</a>
								</div>

								<div class="nurseryschool_info">
									<div class="info_icon">
										<img src="<%=wm.image_path%>/inc/spot_icon.jpg" alt="">
									</div>
									<div class="info_contents">
										(<%=nursery_rs("Zipcode")%>) <%=CutString(nursery_rs("CRaddr"), 40, "")%>
									</div>
								</div>
								
								<div class="nurseryschool_info">
									<div class="info_icon">
										<img src="<%=wm.image_path%>/inc/tel_icon.jpg" alt="">
									</div>
									<div class="info_contents">
										<%=nursery_rs("CRtelno")%>
									</div>
								</div>

								<div class="nurseryschool_info">
									<div class="info_icon">
										<img src="<%=wm.image_path%>/inc/limit_icon.jpg" alt="">
									</div>
									<div class="info_contents">
										<%=nursery_rs("CRcapat")%> / <%=nursery_rs("CRchcnt")%>명
									</div>
								</div>
							</div> <!-- // nurseryschool_list -->
							<%			
										loop_cnt = loop_cnt + 1
										nursery_rs.MoveNext()
									Loop
								Else 
							%>
								<div class="nurseryschool_list_first">

									<p>검색(등록)된 데이터가 없습니다.</p>

								</div>	
							<%
								End If 
							%>
						</div> <!-- // nurseryschool_list_area -->

                        <div class="page-box" >
							<%=paging( list_name )%>												
						</div>

				    </div>

			    </div>


				<!-- #include file = "../inc/side_area.asp" -->

            </div>


			<!-- #include file = "../inc/_footer.asp" -->

        </div><!--wrap //-->


		<script type="text/javascript">
		<!--
			
			var down_town_obj = <%=town_info%>;
			
			jQuery(document).ready(function(){

				setDowntownOption( jQuery("#search_citycode option:selected").val() );
				jQuery("#search_arcode").val("<%=search_arcode%>");	

			});

			jQuery(function(){
				jQuery("#search_citycode").change(function(){
			
					setDowntownOption( $(this).val() );
					
				});
			});
				
			function setDowntownOption( param_val ) {
				var downtown = "";

				downtown ={ downtown_list : down_town_obj[param_val] };

				jQuery("#search_arcode").html( jQuery("#tmplate_downtown_option").tmpl( downtown ) );

			}

		//-->
		</script>

		<script id="tmplate_downtown_option" type="text/x-jquery-tmpl">
			<option value="">구/군</option>
			{{each downtown_list}}
			<option value="${ARcode}" >${ARName}</option>
			{{/each}}
		</script>


    </body>
    
</html>