<div class="sub_navi">
	<nav>
		<ul>
			<%
				Dim top_menu_loop, top_menu_selected

				For top_menu_loop = 0 To  Ubound( wm.getVal("top_menu") )
					
					If wm.getVal("top_menu")( top_menu_loop ).item("selected") = "on" Then 
						top_menu_selected = "class=""on"""
					Else 
						top_menu_selected = ""
					End If 
			%>
			<li>
				<span <%=top_menu_selected%> >
					<a href="/news/list?catr=<%=wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode")%>">
						<%=wm.getVal("top_menu")( top_menu_loop ).item("CatrName")%>
					</a>
				</span>
			</li>
			<%
				Next 
			%>
			
		</ul>
	</nav>
</div>