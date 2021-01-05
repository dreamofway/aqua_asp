<!-- #include file = "./inc/_head.asp" -->
	<style type="text/css">
		
		.like_btn {
			width: 55px;
			height: 55px;
			margin-right: 2px;
			display: inline-block;
			padding: 0 13px 2px 13px;
			border: 1px solid #c9c9c9;
			color: #333;
			letter-spacing: -1px;
			text-align: center;
			vertical-align: top;
			cursor: pointer;
			border-radius: 50px;
		}

		.like_btn:hover {background-color: #f5f5f5;}

		.writer_all_view_btn {
			width: 180px;
			height: 55px;
			margin-right: 2px;
			display: inline-block;
			padding: 0 13px 2px 13px;
			border: 1px solid #c9c9c9;
			color: #c2c2c2;
			font-weight:900;
			letter-spacing: -1px;
			text-align: center;
			vertical-align: top;
			cursor: pointer;
			border-radius: 50px;
		}

		.writer_all_view_btn:hover {background-color: #f5f5f5;}


		button:active {
			outline: none;
		}

		button:focus {outline:0}

		#area_contents img {display:none}
	</style>
    <body>
    
        <div class="wrap">
        
            
            <div class="header">
                
				<!-- #include file = "./inc/_top.asp" -->
                <!-- #include file = "./inc/_top_menu.asp" -->

            </div>

            <div class="container">
                
                <div class="news_combi">
					

					<div class="area_title">
						<div class="area_title_title">
							<%=Subject%>
						</div>
						<div class="area_title_sub">
							<%=SubTitle%>
						</div>
						<div class="area_title_time">
						기사입력 : <%=reg_date%>  |  기사수정 : <%=mod_date%>
						</div>

						<div class="area_title_bttn">
							<ul>
								<li><a href="mailto:news1@compa.kr"><img src="//park.compa.kr/iknnews/image/mail_icon.jpg" alt="메일 보내기" /></a></li>
								<li><img src="//park.compa.kr/iknnews/image/print_icon.jpg" alt="구취" style="cursor:pointer" onclick="popupOpen('/news/viewPrint?ArticleID=<%=ArticleID%>', 'print', 500, '600' )" /></li>
							</ul>
						</div>

						<div class="area_title_reporter">
							<%=writer_info%>
						</div>

					</div>


                    
					<div class="news">
						
						<div class="area_left">
							<div class="newsview_line">
								<!-- #include file = "./inc/news_left.asp" -->

								<div class="view_sns">
									<ul>
										<li onclick="share_sns('naver_web', '<%=subject%>', '')" >
											<img src="<%=wm.image_domain%>/img/inc/share/22x22/icon_01_on.png" alt="네이버 아이콘" width="22" height="22"  style="cursor:pointer" alt="네이버 아이콘" >
										</li>
										<li>
											<img src="<%=wm.image_domain%>/img/inc/share/22x22/icon_02_on.png" onclick="share_sns('facebook', '', '')" style="cursor:pointer" alt="페이스북 아이콘" />
										</li>
										<li>
											<img src="<%=wm.image_domain%>/img/inc/share/22x22/icon_07_on.png" onclick="share_sns('kakao_story', '<%=addSlahes(subject)%>', '')" style="cursor:pointer" alt="카카오스토리 아이콘" />
										</li>
										<li>
											<img src="<%=wm.image_domain%>/img/inc/share/22x22/icon_05_on.png" onclick="share_sns('twitter', '', '')" style="cursor:pointer"  alt="트위터 아이콘" />
										</li>
										<li>
											<img src="<%=wm.image_domain%>/img/inc/share/22x22/icon_06_on.png" onclick="share_sns('pinterest', '', '<%=wm.ogp_image%>')" style="cursor:pointer" alt="핀터 아이콘" />
										</li>
										<!--
										<li><span><a href="#"><img src="//park.compa.kr/iknnews/image/etc_icon.jpg"/></a></span></li>
										-->

									</ul>
								</div>

							</div>
						</div>
						
						<div class="area_center">

							<div class="newsview">

								<div class="contents" id="area_contents">
								   <%=news_contents%>
								</div>
								
								<p class="right">
									
									&#64; &nbsp헬스앤라이프의 모든 콘텐츠는 저작권법의 보호를 받습니다. 무단 전재 및 재배포 금지 
									<br>- 헬스앤라이프는 인터넷신문윤리강령 및 시행세칙을 준수합니다.
								</p>
								
								<!--
								<div class="view_bnn_low">
									<img src="//park.compa.kr/iknnews/image/view_bnn1.jpg" width="560"/>
								</div>
								-->


								<div class="view_bnn_btn">
									<div class="view_bnn_btn_left">
										<a href="/news/list?page=<%=page%>&<%=get_value%>">
											<img src="//park.compa.kr/iknnews/image/gotolist_bttn.jpg"/>
										</a>
									</div>
									<div class="view_bnn_btn_left">
										<div class="like" onclick="newsLike('<%=ArticleID%>')" >
											<button type="button" class="like_btn" >
												<img src="<%=wm.image_domain%>/img/sub/like_heart.png" alt="좋아요" style="vertical-align:middle" >
												<span style="font-size:12px; color:#202020; font-weight:bold;" id="like_count"  >
													<%=FormatNumber(EPCnt, 0)%>
												</span>
											</button>
										</div>

									</div>

									<%
										If Trim( consult_no ) <> "" Then 
									%>
									<div class="view_bnn_btn_right">
										<div class="like"  >
											<a href="/news/list?catr=13&cno=<%=consult_no%>" >
												<button type="button" class="writer_all_view_btn" >
													<%=writer_name%> 글 모아보기
												</button>
											</a>
										</div>
									</div>
									<%
								
										Else 
									%>
									<div class="view_bnn_btn_right">										
										<div class="like"  >
											<a href="/news/list?search_type=reporter&search_keyword=<%=writer_name%>" >
												<button type="button" class="writer_all_view_btn" >
													<%=writer_name%> 기자의 기사 모아보기
												</button>
											</a>
										</div>
									</div>
									<%		
										End If ' // If Trim( consult_no ) <> "" Then  
									%>
								
								</div>
								<div class="view_bnn_low">
									

									<a href="https://play.google.com/store/apps/details?id=com.compa.healthi" target="_blank">
										<img src="//park.compa.kr/iknnews/image/view_bnn_app.jpg" width="560"/>
									</a>

								</div>
								<div class="view_bnn_low">
									<img src="//park.compa.kr/iknnews/image/view_likable.jpg" width="560"/>
								</div>
								<div class="view_bnn_low">
									<img src="//park.compa.kr/iknnews/image/view_comments.jpg" width="560"/>
								</div>

							</div>
						</div>
					</div>

					<!-- #include file = "./inc/news_right.asp" -->
                </div>
        </div>



		<!-- #include file = "./inc/_footer.asp" -->	
		<input type="hidden" name="view_path" id="view_path" value="<%=wm.user_view_path%>" />
		<input type="hidden" name="view_url" id="view_url" value="<%=wm.ogp_url%>" />
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/news_view.js"></script>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    
    </body>
    
</html>