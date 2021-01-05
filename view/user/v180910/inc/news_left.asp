<div class="area_left_title  newcolor"> <!--두칸 띄고!!!!-->
	<%=wm.getVal("top_menu_title")%>
</div>

<%

	If TypeName(wm.getVal("left_menu")) = "Dictionary" Then 
%>
<ul style="float:unset">
	<%
		Dim left_menu_loop, left_menu_selected

		For left_menu_loop = 0 To  Ubound( wm.getVal("left_menu").item("child_info") )
			
			If wm.getVal("left_menu").item("child_info")( left_menu_loop ).item("selected") = "on" Then 
				left_menu_selected = "class=""on"""
			Else 
				left_menu_selected = ""
			End If 
	%>
	<li <%=left_menu_selected%> >
		<span >
			<a href="/news/list?catr=<%=wm.getVal( "left_menu" ).item("child_info")( left_menu_loop ).item("CatrCode")%>">
				<%=wm.getVal("left_menu").item("child_info")( left_menu_loop ).item("CatrName")%>
			</a>
		</span>
	</li>
	<%
		Next 
	%>
</ul>
<%
	Else 
%>
<ul>
	<%

		For top_menu_loop = 0 To  Ubound( wm.getVal("top_menu") )
			
	%>
	<li>
		<span>
			<a href="/news/list?catr=<%=wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode")%>">
				<%=wm.getVal("top_menu")( top_menu_loop ).item("CatrName")%>
			</a>
		</span>
	</li>
	<%
		Next 
	%>
	
</ul>
<%
	End If 
%>


