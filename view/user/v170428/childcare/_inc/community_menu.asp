<div class="sub_title_box_4">
	<div class="sub_title_icon">
		<img src="<%=wm.image_domain%>/ikc/mini_hompage/sub_icon_4.jpg" title="커뮤니티"/>
	</div>

	<div class="sub_title_set">
		<div class="sub_title">
			커뮤니티
		</div>
		<div class="sub_title_navi">
			
			<ul>
				<a href="/childcare/free_list?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1401">
					<li <%if wm.getVal( "left_code" ) = "1401" then%>class="sub_on"<%end if%> >자유게시판</li>
				</a>
				<a href="/childcare/qna_list?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1402">
					<li <%if wm.getVal( "left_code" ) = "1402" then%>class="sub_on"<%end if%> >Q&A</li>
				</a>
				<a href="/childcare/proposal_list?fid=<%=wm.getVal( "fid" )%>&top_code=community&left_code=1403">
					<li <%if wm.getVal( "left_code" ) = "1403" then%>class="sub_on"<%end if%> >건의사항</li>
				</a>
			</ul>
			
		</div>
	</div>
	
</div>