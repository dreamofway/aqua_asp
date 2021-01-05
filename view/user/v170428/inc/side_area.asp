<div class="area_right">
	<div class= "right_contents_box" style="height:165px;">
		<!-- #include file = "../inc/side_icon_box.asp" -->
	</div>
	<div class= "right_contents_box" style="margin-top:10px" >
		<div class="right_contents_title_area">
			<div class="contents_title">보육뉴스</div>
			<div class="contents_plus" onclick="location.href='/board/list?bid=02'" style="cursor:pointer" > +더보기 </div>
		</div>
		<div class="contents_area">
			<ul>
				<%
					Do While not side_first_rs.Eof
				%>
				<li><span><a href="/board/view?bid=42&idx=<%=side_first_rs("idx")%>"><%=side_first_rs("InfoTitle")%></a></span></li>
				<%
						side_first_rs.MoveNext()
					Loop 
				%>
			</ul>
		</div>

	</div>
	<div class= "right_bnn_box">
		<img src="<%=wm.image_path%>/inc/nursery_right_bnn.jpg" alt="" />
	</div>
	


</div>