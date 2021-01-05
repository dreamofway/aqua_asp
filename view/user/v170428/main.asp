	<!-- #include file = "./inc/_head.asp" -->
	<style type="text/css">
		.quick_city_layer {display:none}
	</style>
    <body>
    
        <div class="wrap">

            <div class="header">
				<!-- #include file = "./inc/_top.asp" -->
                <!-- #include file = "./inc/_top_menu.asp" -->
			</div>

            <div class="container">
                <div class="mainbg_box">
                    <img src="<%=wm.image_path%>/main/nursery_main_bg.jpg" alt="" />					
                <div class="main_btns">
                    <ul>
                         <li><a href="/board/disclosure_summary"><img src="<%=wm.image_path%>/main/main_btn_total.png" alt="" /></a></li>
                        <li><a href="/board/disclosure_item"><img src="<%=wm.image_path%>/main/main_btn_noticelist.png" alt="" /></a></li>
                        <li><a href="/board/list?bid=45"><img src="<%=wm.image_path%>/main/main_btn_relatedlaw.png" alt="" /></a></li>
                        <li><a href="/board/list?bid=47"><img src="<%=wm.image_path%>/main/main_btn_statistic.png" alt="" /></a></li>
                    </ul>
                </div>
                </div>


				<div class= "main_bnn_box">
					<a href="http://www.chamdahan.com/goods/goods_list.html" target="_blank" title="참다한 홈페이지로 이동 (새창)" >
					    <img src="<%=wm.image_path%>/main/nursery_main_bnn.jpg" alt="참다한 배너" />
					</a>
				</div>

				<div class= "area_center">

					<div class="nursery_searching_box">
						<form id="search_form" name="search_form" method="get" action="/nursery/list" >

						<div class="searching_box_title">
						어린이집&nbsp;찾기
						</div>

						<select name="search_citycode" id="search_citycode" >
							<option value="" >시 / 도</option>
							<%
								Do While not city_rs.Eof
							%>
							<option value="<%=Trim(city_rs("ARcode"))%>" ><%=Trim(city_rs("ARName"))%></option>	
							<%
									city_rs.MoveNext()
								Loop 
								city_rs.MoveFirst 
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


					<div class="menu_bar">
						<img src="<%=wm.image_path%>/main/hamburger_btn.jpg" alt="" style="cursor:pointer" onclick="quickLayer('open')" />
						<div class="menu_navi"  >
							<nav>
								<ul id="city_menu" >
									<%
										Dim city_on
										Dim city_num
										city_num = 0
										city_on = "on"
										Do While not city_rs.Eof
											
									%>
									<li onclick="changeCity('<%=Trim(city_rs("ARcode"))%>', '<%=city_num%>')" style="cursor:pointer" >
										<span class="slider_span <%=city_on%>" id="make_index_<%=city_num%>" >
											<%=Trim(city_rs("ARName"))%>
										</span>
									</li>
									<%
											city_on = ""
											city_num = city_num + 1 
											city_rs.MoveNext()
										Loop 
										city_rs.MoveFirst 
									%>
									
								</ul>
							</nav>
						</div>
						<img src="<%=wm.image_path%>/main/left_btn.jpg" alt="이전지역" onclick="slidePrevBtn()" style="cursor:pointer"  />
						<img class="right" src="<%=wm.image_path%>/main/right_btn.jpg" alt="다음지역" onclick="slideNextBtn()" style="cursor:pointer"  />
					</div>
                    
					<div class="x_btn quick_city_layer">
						<img src="<%=wm.image_path%>/main/x_btn.jpg" alt="" width="44px;" height="44px;" style="cursor:pointer" onclick="quickLayer('close')" />
					</div>
                    <div class="all_administr quick_city_layer " >
						<ul>
							<%
								city_num = 0
								Do While not city_rs.Eof
							%>
							<a href="javascript:changeCity('<%=Trim(city_rs("ARcode"))%>', '<%=city_num%>' )"  class="<%=wm.getVal( Trim(city_rs("ARcode")) )%>" ><li><%=Trim(city_rs("ARName"))%></li></a>
							<%
									city_num = city_num + 1
									city_rs.MoveNext()
								Loop 
							%>

						</ul>
					</div>



					<div class="main_nurseryschool_box">

						<div class="main_thumb">

							<img src="<%=wm.image_path%>/main/nurseryoftoday.jpg" alt="" />
							<div class="main_thumb_today">
								오늘의 어린이집
							</div>

							<div class="administr" id="ar_name_text">
								서울특별시
							</div>

						</div>
						<div class="main_nursery">
						<a href="#"><img src="<%=wm.image_path%>/main/nurseryspecial.jpg" alt="" /></a>
							
							<div class="main_thumb_title">

								<div class="main_name">
									나비 어린이집
								</div>

								<div class="main_adress">
									서울 동대문구 신당동
								</div>

							</div>

						</div>
						<div class="main_corner">

							<div class="corner_plus">
							<a href="http://news.ikn.kr">+더보기</a>
							</div>


							<div class="corner_title">
								우리아이뉴스
							</div>
							<!--
							<img src="<%=wm.image_path%>/main/communication.png" alt="" />
							-->


							<div class="corner_titlelist">
								<ul>
									<%
										Dim join_num

										join_num = 1 

										Do While not join_board_rs.Eof
									%>
									<li>
										<a href="http://news.ikn.kr/news/view?ArticleID=<%=join_board_rs("ArticleID")%>" >
										<img src="<%=wm.image_path%>/inc/numbering<%=join_num%>.png" style="padding-top:2px;" alt="" />
										<%=join_board_rs("Subject")%>
										</a>
									</li>
									<%
											join_num = join_num + 1
											join_board_rs.MoveNext()
										Loop 
									%>

								</ul>
							</div>

						</div>

						<div class="nurseries_below" id="city_11000">
						<%
							Dim current_city_code : current_city_code = ""
							Dim nursery_color(7), loop_cnt, city_count
							Dim nursery_link

							nursery_color(0) = "red"
							nursery_color(1) = "blue"
							nursery_color(2) = "lightviolet"
							nursery_color(3) = "dullviolet"
							nursery_color(4) = "green"
							nursery_color(5) = "yellow"
							nursery_color(6) = "deepgreen"
							nursery_color(7) = "navi"
							
							city_count = 0
							loop_cnt = 0						
							Do While not city_nursery_rs.Eof
								
								If current_city_code = "" Then 
									current_city_code = city_nursery_rs("Citycode")
								End If 
								
								'nursery_link =	"/nursery/view?idx="& city_nursery_rs("IDX") &_
								'				"&search_citycode=" & current_city_code 

								nursery_link = "/childcare/home?fid="& city_nursery_rs("STcode")

								If ( city_count > 0 ) And ( current_city_code <> city_nursery_rs("Citycode") ) Then 
									current_city_code = city_nursery_rs("Citycode")
						%>
						</div> <!-- // nurseries_below -->
						<div class="nurseries_below" id="city_<%=current_city_code%>" style="display:none">
						<%
								End If 
						%>
							<a href="<%=nursery_link%>" target="_blank" >
								<div class="nursery_name-<%=nursery_color(loop_cnt)%>"  style="cursor:pointer">
									<%=CutString(city_nursery_rs("Crname"), 10, "")%>
								</div>
							</a>
						<%
								city_count = city_count + 1
								loop_cnt = loop_cnt + 1

								If loop_cnt > 7 Then 
									loop_cnt = 0
								End If 
								city_nursery_rs.MoveNext()
							Loop 
						%>
						</div>

					</div>
				
				</div>


				<div class="area_right" style="margin-top:10px">
					
					<!-- #include file = "./inc/side_icon_box.asp" -->

					<div class= "right_bnn_box">
						<a href="http://www.chamdahan.com/goods/goods_list.html" target="_blank" title="참다한 홈페이지로 이동 (새창)" >
							<img src="<%=wm.image_path%>/inc/nursery_right_bnn.jpg" alt="참다한 배너" />
						</a>
				    </div>
					<div class= "right_contents_box">
                        <div class="right_contents_title_area">
                            <div class="contents_title">보육뉴스</div>
							<div class="contents_plus" onclick="location.href='/board/list?bid=42'" style="cursor:pointer" > +더보기 </div>
						</div>
                        <div class="contents_area">
							<ul>
								<%
									Do While not child_care_rs.Eof
								%>
								<li><span><a href="/board/view?bid=42&idx=<%=child_care_rs("idx")%>"><%=child_care_rs("InfoTitle")%></a></span></li>
								<%
										child_care_rs.MoveNext()
									Loop 
								%>
							</ul>
						</div>

				    </div>


				</div>

            </div>

			<!-- #include file = "./inc/_footer.asp" -->

        </div><!--wrap //-->
		
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/slick.min.js"></script>

		<script type="text/javascript">
		<!--
			var city_name_obj = {
				"11000" : "서울특별시" 
				,"26000" : "부산광역시" 
				,"27000" : "대구광역시" 
				,"28000" : "인천광역시" 
				,"29000" : "광주광역시" 
				,"30000" : "대전광역시" 
				,"31000" : "울산광역시" 
				,"36000" : "세종특별자치시" 
				,"41000" : "경기도" 
				,"42000" : "강원도" 
				,"43000" : "충청북도" 
				,"44000" : "충청남도" 
				,"45000" : "전라북도" 
				,"46000" : "전라남도" 
				,"47000" : "경상북도" 
				,"48000" : "경상남도" 
				,"50000" : "제주도" 
			};

			var down_town_obj = <%=town_info%>;

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

			function quickLayer( type ) {

				if( type == "open" ) {
					jQuery(".quick_city_layer").show();
				} else {
					jQuery(".quick_city_layer").hide();
				}

			}

			function changeCity( city_code, city_num ) {	
				jQuery(".nurseries_below").hide();
				jQuery("#city_" + city_code ).show();
				jQuery("#ar_name_text").html(city_name_obj[city_code]);
				quickLayer( "close" );
				$('#city_menu').slick('slickGoTo', city_num, false);

			}

			var slick_index = 0;
			$('#city_menu').slick({
				dots: false,
				infinite: true,
				arrows: false,
				speed: 300,
				slidesToShow: 7,
				slidesToScroll: 1,
				centerMode: false,
				variableWidth: true,	
				initialSlide: 0,
			});
			
			function slideNextBtn() {
				$('#city_menu').slick('slickNext');
			}

			function slidePrevBtn() {
				$('#city_menu').slick('slickPrev');
			}
			

			/*
			$('#city_menu').on('afterChange', function(event, slick, currentSlide){
				jQuery('.slider_span').removeClass("on");
				jQuery('#make_index_'+currentSlide).addClass("on");
				jQuery('#make_index_'+currentSlide).trigger("click");
			});
			*/

			$('#city_menu').on('beforeChange', function(event, slick, currentSlide, nextSlide ){
				jQuery('.slider_span').removeClass("on");
				jQuery('#make_index_'+nextSlide).addClass("on");
				jQuery('#make_index_'+nextSlide).trigger("click");
			});

			

		//-->
		</script>

		<script id="tmplate_downtown_option" type="text/x-jquery-tmpl">
			<option value="">구/군</option>
			{{each downtown_list}}
			<option value="${ARcode}" >${ARName}</option>
			{{/each}}
		</script>
		

		<script type="text/javascript">
		<!--

			
			$(document).ready(function(){
				if ( checkFlatform()["flatform"] == "pc"  ) {
					popupOpen();
				}
			});


			//--------------------- popup

			var popup_info = [
				{
					"popup_id" : "2017end"
					,"popup_top" : 160
					,"popup_left" : 1085
					,"popup_href" : ""
					,"popup_target" : ""
					,"popup_img" : "http://img.compa.kr/ikn/popup/1228_2018popup.jpg"
					,"popup_width" : 400
					,"popup_height" : 400
					,"use_flag" : false
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
					todayDate.setDate( todayDate.getDate() + 1 );
					document.cookie = popup_id + "=" + escape("closed") + "; path=/; expires=" + todayDate.toGMTString() + ";"
				}
				
				jQuery( "#_layer_popup_" + popup_id ).hide();
				
			}
			
			
			
			//--------------------- popup

		//-->
		</script>
		<script id="tmplate_main_popup" type="text/x-jquery-tmpl">
			<div style="position: absolute;top:${popup_top}px;left:${popup_left}px;z-index:100;border:3px solid #ced2d7;" id="_layer_popup_${popup_id}" >
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

    </body>
    
</html>