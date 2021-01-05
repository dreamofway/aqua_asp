<%
	Dim wather_rs, headline_rs
	'Dim top_headlines_arr()

	'--------------------------------------------------------------------
	' DB 종료
	'--------------------------------------------------------------------
'	Call DBConn("default")
	
	' 주요뉴스( 최신뉴스 ) 3개를 가져온다.
	Set headline_rs = getTopHeadlines()
	' 날시정보를 가져온다.
	Set wather_rs = getWather()

%>
<div class="wrap">
        <div class="header">
            <div class="header_navi_wrap">
                <div class="header_navi">
                    <a href="/"><img src="<%=wm.image_path%>/inc/main_top_logo.png" title="우리아이뉴스"/></a>
                </div>
            </div>

            <div class="header_js_wrap">
                <!-- 주요뉴스 및 날씨api -->
                <div class="news_top">
					<% If Not( headline_rs.Bof Or headline_rs.Eof) Then  %>
                    <span class="red" style="font-weight: bold; color: #d97071; background-color: #fff; border-radius: 5px; padding: 2px 5px"><b>주요뉴스</b></span>
                    <span id="jssor_slider_headline_form" style="position: relative; top: 0px; left: 5px; width: 610px; height: 20px; overflow: hidden; ">
						<!-- Slides Container -->
						<div u="slides" style="position: absolute; left:0px; top: 0px; width: 610px; height:30px; overflow: hidden;">
							<%
								Do While not headline_rs.eof	
							%>
							<div>
								<a href="/news/view?ArticleID=<%=headline_rs("ArticleID")%>&catr=<%=headline_rs("CatrCode")%>">
									<%=headline_rs("subject")%>
								</a>
							</div>
							<%
									Response.Flush
									headline_rs.MoveNext()
								Loop
							%>
						</div>
						<!-- Slides Container -->
					</span>
					<%End If%>
					<% If Not( wather_rs.Bof Or wather_rs.Eof) Then  %>
                    <span class="weather">
						<span class="day_txt" style="font-size: 13px;">Today | <%=dateType("T04", now())%>(<%=WeekStr( now() )%>)</span>
						<span class="weather_txt" id="jssor_slider_wather_form" style="position: relative; top: -7px; left: 0px; width: 300px; height: 30px; overflow: hidden;">
							<!-- Slides Container -->
							<div u="slides" style="position: absolute; left:0px; top: 0px; width: 248px; height:30px; overflow: hidden;line-height: 30px;">
								<%
									Dim w_img_name

									Do While not wather_rs.eof
										Select Case wather_rs( "WCondition" )
											Case "1" : w_img_name = "NB01.png" 
											Case "2" : w_img_name = "NB02.png" 
											Case "3" : w_img_name = "NB03.png" 
											Case "4" : w_img_name = "NB04.png" 
											Case "5" : w_img_name = "NB08.png"  
											Case "6" : w_img_name = "NB12.png" 
											Case "8" : w_img_name = "NB11.png" 
											Case Else : w_img_name = "NB01.png" 
										End Select 

								%>
								<div style="font-size:13px; color: #fff">
									<img src="//www.weather.go.kr/images/icon/NW/<%=w_img_name%>" width="28px;" alt="날씨상태" style="vertical-align:middle" >
									<%=wather_rs( "WCity" )%>&nbsp;<%=wather_rs( "WTemperature" )%>℃
									/ 미세먼지(PM10) <%=wather_rs( "pm_value" )%> ㎍/㎥		
								</div>
								<%
										Response.Flush
										wather_rs.MoveNext()
									Loop
								%>
							</div>
							<!-- Slides Container -->
						</span>
					</span>
					<%End If%>
				</div>
				<!--                news_top // -->
			</div>
			<!--                header_js_wrap // -->

<script type="text/javascript">
<!--
	var options = {
		$AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
		$AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
		$AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
		$PauseOnHover: 0,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

		$ArrowKeyNavigation: false,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
		$SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
		$MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
		//$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
		//$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
		$SlideSpacing: 5, 					                //[Optional] Space between each slide in pixels, default value is 0
		$DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
		$ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
		$UISearchMode: 0,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
		$PlayOrientation: 2,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
		$DragOrientation: 0,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)	   
	};

	var jssor_slider_wather = new $JssorSlider$("jssor_slider_wather_form", options);
	var jssor_slider_headline = new $JssorSlider$("jssor_slider_headline_form", options);
//-->
</script>
<%
	Response.Flush
%>