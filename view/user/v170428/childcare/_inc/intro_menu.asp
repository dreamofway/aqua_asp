<div class="sub_title_box">
	<div class="sub_title_icon">
		<img src="<%=wm.image_domain%>/ikc/mini_hompage/sub_icon_1.jpg" title="어린이집 소개"/>
	</div>
	<div class="sub_title_set">
		<div class="sub_title">
			어린이집 소개
		</div>
		<div class="sub_title_navi">
			<ul>
				<a href="/childcare/greeting?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1101">
					<li <%if wm.getVal( "left_code" ) = "1101" then%>class="sub_on"<%end if%> >원장 인사말</li>
				</a>
				<a href="/childcare/teacher?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1102">
					<li <%if wm.getVal( "left_code" ) = "1102" then%>class="sub_on"<%end if%> >교직원 소개</li>
				</a>
				<a href="/childcare/operate?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1103">
					<li <%if wm.getVal( "left_code" ) = "1103" then%>class="sub_on"<%end if%> >운영 및 방침</li>
				</a>
				<a href="/childcare/entrance_info?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1104">
					<li <%if wm.getVal( "left_code" ) = "1104" then%>class="sub_on"<%end if%> >입학 안내</li>
				</a>
				<a href="/childcare/facility_info?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1105">
					<li <%if wm.getVal( "left_code" ) = "1105" then%>class="sub_on"<%end if%> >시설 안내</li>
				</a>
				<a href="/childcare/childcare_map?fid=<%=wm.getVal( "fid" )%>&top_code=intro&left_code=1106">
					<li <%if wm.getVal( "left_code" ) = "1106" then%>class="sub_on"<%end if%> >오시는 길</li>
				</a>
			</ul>
		</div>
	</div>
</div>