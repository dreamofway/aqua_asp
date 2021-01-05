<div class="left">
	<div class="left_navi"><!--width=300px-->
		<a href="/childcare/home?fid=<%=wm.getVal( "fid" )%>">
			<div class="kn_profile">
				<img src="<%=wm.image_domain%>/ikc/mini_hompage/kn_profile.jpg" title="어린이집프로필"/>    
			</div>
			<div class="kn_name">			
				<%=getChildcareName( wm.getVal( "fid" ) )%>			
			</div>
		</a>

		<div class="sub_navi">
			<nav>
			<ul>
				<a href="/childcare/greeting?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1101">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_1intro.png" title="어린이집 소개"/>
						<span <%If wm.getVal( "top_code" ) = "intro" Then %>class="on"<%End If%> >어린이집 소개</span>
					</li>
				</a>
				<a href="/childcare/notice_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_2inform.png" title="알림마당"/>
						<span <%If wm.getVal( "top_code" ) ="board" Then %>class="on"<%End If%> >알림마당</span>
					</li>
				</a>
				<a href="/childcare/class_info_main?fid=<%=wm.getVal( "fid" )%>&top_code=class&left_code=13">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_3class.png" title="반 소개"/>
						<span <%If wm.getVal( "top_code" ) = "class" Then %>class="on"<%End If%> >반 소개</span>
					</li>
				</a>
				<a href="/childcare/free_list?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1401">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_4comunity.png" title="커뮤니티"/>
						<span <%If wm.getVal( "top_code" ) = "community" Then %>class="on"<%End If%> >커뮤니티</span>
					</li>
				</a>
				<a href="/childcare/external_edu_list?fid=<%=wm.getVal( "fid" )%>&top_code=external&left_code=1501">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_5edu.png" title="외부교육"/>
						<span <%If wm.getVal( "top_code" ) = "external" Then %>class="on"<%End If%> >외부교육</span>
					</li>
				</a>
				<a href="/childcare/cctv_state?fid=<%=wm.getVal( "fid" )%>&top_code=cctv&left_code=1601">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_6cctv.png" title="CCTV"/>
						<span <%If wm.getVal( "top_code" ) = "cctv" Then %>class="on"<%End If%> >CCTV</span>
					</li>
				</a>
				<a href="/childcare/location?fid=<%=wm.getVal( "fid" )%>&top_code=location&left_code=1701">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_7loca.png" title="위치추적"/>
						<span <%If wm.getVal( "top_code" ) = "location" Then %>class="on"<%End If%> >위치추적</span>
					</li>
				</a>
				<a href="/childcare/photo_class?fid=<%=wm.getVal( "fid" )%>&top_code=photo&left_code=1801">
					<li>
						<img src="<%=wm.image_domain%>/ikc/mini_hompage/leftnavi_8album.png" title="앨범"/>
						<span <%If wm.getVal( "top_code" ) ="photo" Then %>class="on"<%End If%> >앨범</span>
					</li>
				</a>
			</ul>
			</nav>
		</div>          
	
	</div>
	<div class="footer">
		<a href="#"><p><strong>이용 약관</strong></p></a>
		<p> 서울시 마포구 만리재로47, 14F 공덕 코어 빌딩</p>
		<p> &#169;Compa Company healthi.kr All rights reserved</p>
	</div>
</div>