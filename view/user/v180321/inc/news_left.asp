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

<div style="margin-top:30px;margin-left:-10px">
	<!-- Dable 좌_EMPTY_120x600 위젯 시작/ 문의 support@dable.io -->
	<div id="dablewidget_2o2a0zXe" data-widget_id="2o2a0zXe">
	<script>
	(function(d,a,b,l,e,_) {
	if(d[b]&&d[b].q)return;d[b]=function(){(d[b].q=d[b].q||[]).push(arguments)};e=a.createElement(l);
	e.async=1;e.charset='utf-8';e.src='//static.dable.io/dist/plugin.min.js';
	_=a.getElementsByTagName(l)[0];_.parentNode.insertBefore(e,_);
	})(window,document,'dable','script');
	dable('setService', 'ikn.kr');
	dable('renderWidget', 'dablewidget_2o2a0zXe', {ignore_items: true});
	</script>
	</div>
	<!-- Dable 좌_EMPTY_120x600 위젯 종료/ 문의 support@dable.io -->
</div>
