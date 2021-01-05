<div class="sub_title_box_2">
	<div class="sub_title_icon">
		<img src="<%=wm.image_domain%>/ikc/mini_hompage/sub_icon_2.jpg" title="알림마당"/>
	</div>

	<div class="sub_title_set">
		<div class="sub_title">
			알림마당
		</div>
		<div class="sub_title_navi">
			
			<ul>
				<a href="/childcare/notice_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1201">
					<li <%if wm.getVal( "left_code" ) = "1201" then%>class="sub_on"<%end if%> >공지사항</li>
				</a>
				<a href="/childcare/newsletter_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1202">
					<li <%if wm.getVal( "left_code" ) = "1202" then%>class="sub_on"<%end if%> >가정통신문</li>
				</a>
				<a href="/childcare/job_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1203">
					<li <%if wm.getVal( "left_code" ) = "1203" then%>class="sub_on"<%end if%> >구인구직</li>
				</a>
				<a href="/childcare/event_plan?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1204">
					<li <%if wm.getVal( "left_code" ) = "1204" then%>class="sub_on"<%end if%> >이 달의 행사</li>
				</a>
				<a href="/childcare/carte?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1205">
					<li <%if wm.getVal( "left_code" ) = "1205" then%>class="sub_on"<%end if%> >식단표</li>
				</a>
				<a href="/childcare/schedule?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1206">
					<li <%if wm.getVal( "left_code" ) = "1206" then%>class="sub_on"<%end if%> >일정표</li>
				</a>
				<a href="/childcare/books_list?fid=<%=wm.getVal( "fid" )%>&top_code=board&left_code=1207">
					<li <%if wm.getVal( "left_code" ) = "1207" then%>class="sub_on"<%end if%> >추천도서</li>
				</a>
			</ul>
			
		</div>
	</div>
	
</div>