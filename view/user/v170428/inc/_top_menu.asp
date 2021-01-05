<div class="sub_navi">
	<nav>
		<ul> 
			<li>
				<span <%If wm.getParam( "bid" ) = "pregnant" Then %>class="on"<%End If%> >
					<a href="/board/list?bid=pregnant">임신/출산</a>
				</span>
			</li>
			<li>
				<span <%If wm.getParam( "bid" ) = "childcare" Then %>class="on"<%End If%> >
					<a href="/board/list?bid=childcare">육아</a>
				</span>
			</li>
			<li>
				<%
					If TypeName(wm.current_path_arr) = "Variant()" Then 					
				%>
				<span <%If wm.current_path_arr( 1 ) = "nursery" Then %>class="on"<%End If%> >	
				<%
					Else 
				%>
				<span>
				<%
					End If 
				%>
					<a href="/nursery/list">어린이집</a>
				</span>
			</li>
			<!--
			<li><span><a href="/board/list?bid=36">소통 · 참여</a></span></li>		
			<li><span><a href="javascript:ingMsg()">상담실</a></span></li>
			-->
			<li>
				<span <%If wm.getParam( "bid" ) = "04" Then %>class="on"<%End If%> >
					<a href="/board/list?bid=04">아이들 추천도서</a>
				</span>
			</li>
			<li>
				<span <%If wm.getParam( "bid" ) = "41" Then %>class="on"<%End If%> >
					<a href="/board/list?bid=41">정책뉴스</a>
				</span>
			</li>
		</ul>
	</nav>
</div>