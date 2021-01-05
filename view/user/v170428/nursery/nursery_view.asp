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
							<input class="nurserysearchingbox" type="text" name="search_keyword" id="global_seach_input" value="" title="어린이집 검색" maxlength="180" placeholder="검색">
							<div class="nurserysearching_btn">
							   <img src="<%=wm.image_path%>/inc/searching_icon.jpg" alt="검색" style="cursor:pointer" onclick="document.search_form.submit()" >
							</div>
						</div>
						</form>
				
					</div>


					<div class="nursery_list_box">
						<div class="nurschool_view_title">
						    <%=Crname%>
						</div>

                        <table>
						    <tr>
								<td colspan="4" width="680px" height="2px" style= "background-color:#848383"></td>
							</tr>
							<tr>
								<td class="<%=getNursryViewTdClass( CRtypename )%>" width="140" height="70px" style= "background-color:#f9f9f8">어린이집 유형</td>
							    <td class="tdcontents" width="200" height="70px" style= "background-color:#fff"><%=CRtypename%></td>
								<td class="<%=getNursryViewTdClass( CRstatusname )%>" width="140" height="70px" style= "background-color:#f9f9f8">운영 현황</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRstatusname%></td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">상세 주소</td>
							    <td class="tdcontents"colspan="3" width="540px" height="70px" style= "background-color:#fff">
									(<%=Zipcode%>)<%=CRaddr%>
								</td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">전화번호</td>
							    <td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRtelno%></td>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">팩스</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRfaxno%></td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">보육실 수</td>
							    <td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=Nrtrroomcnt%></td>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">보육실 면적</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=Nrtrroomsize%> m&sup2;</td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">놀이터 수</td>
							    <td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=Plgrdco%></td>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">보육 교직원 수</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=Chcrtescnt%></td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="classifying" width="140" height="70px" style= "background-color:#f9f9f8">현원 / 정원</td>
							    <td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRcapat%> / <%=CRchcnt%></td>
								<td class="<%=getNursryViewTdClass( CRcargbname )%>" width="140" height="70px" style= "background-color:#f9f9f8">통학차량 운영여부</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRcargbname%></td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="<%=getNursryViewTdClass( CRcnfmdt )%>" width="140" height="70px" style= "background-color:#f9f9f8">인가 일자</td>
							    <td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRcnfmdt%></td>
								<td class="<%=getNursryViewTdClass( CRpausebegindt )%>" width="140" height="70px" style= "background-color:#f9f9f8">휴지 시작 일자</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRpausebegindt%></td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="<%=getNursryViewTdClass( CRpauseenddt )%>" width="140" height="70px" style= "background-color:#f9f9f8">휴지 종료 일자</td>
							    <td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRpauseenddt%></td>
								<td class="<%=getNursryViewTdClass( CRabldt )%>" width="140" height="70px" style= "background-color:#f9f9f8">폐지 일자</td>
								<td class="tdcontents"width="200" height="70px" style= "background-color:#fff"><%=CRabldt%></td>
							</tr>
							<tr>
								<td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td>
							</tr>
							<tr>
								<td class="<%=getNursryViewTdClass( CRspec )%>" width="140" height="70px" style= "background-color:#f9f9f8">제공 서비스</td>
							    <td class="tdcontents"colspan="3" width="540px" height="70px" style= "background-color:#fff"><%=CRspec%></td>
							</tr>
							<tr><td class="tdcontents"colspan="4" width="680px" height="1px" style= "background-color:#e1e1e1"></td></tr>
							<tr><td class="tdcontents"colspan="4" width="680px" height="2px" style= "background-color:#848383"></td></tr>
						</table>

                        <!-- 지도 들어갈 부분-->

						<div class="view_gtlist_btn">
                            <a href="/nursery/list?page=<%=page%>&<%=get_val%>"><img src="<%=wm.image_path%>/inc/list_gtlist.jpg" alt=""></a>
						</div>




				    </div>

			    </div>

				<!-- #include file = "../inc/side_area.asp" -->

            </div>
			
			<!-- #include file = "../inc/_footer.asp" -->

        </div><!--wrap //-->





    </body>
    
</html>