<!-- #include file = "../inc/_head.asp" -->
<style type="text/css">
	.rss_title {
		margin-top:100px;
	    width: 140px;
		border-bottom: 4px solid #486e8a;
		color:#486e8a;
	}
	.rss_subcatr {
		margin-top: 50px;
	}
	
	button.default:hover {
		background:#f5f5f5;
	}

	button.red:hover {
		background:#c72929;
		color:#fff;
	}

	button.green:hover {
		background:#0db103;
		color:#fff;
	}
	
	.button {
		border: none;	
		padding: 8px 16px;
		border-radius:2px;
		color: rgba(0,0,0,.6);
		background:#fff;
		font-weight:500;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
		transition: box-shadow 100ms cubic-bezier(0.4, 0.0, 0.2, 1);
	}
	.button:focus {
		outline: none;
	}
	.button:hover {
		box-shadow:0 5px 11px 0 rgba(0,0,0,0.18),0 4px 15px 0 rgba(0,0,0,0.15);
	}

	.button:active {
		box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
	}

	.button-small {
		border: none;	
		padding: 6px 14px;
		border-radius:2px;
		color: rgba(0,0,0,.6);
		background:#fff;
		font-weight:500;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 11px;		
		box-shadow:0 5px 11px 0 rgba(0,0,0,0.18),0 4px 15px 0 rgba(0,0,0,0.15);
	}
	
	.button-small:focus {
		outline: none;
	}

	.button-small:hover {
		box-shadow:0 5px 11px 0 rgba(0,0,0,0.18),0 4px 15px 0 rgba(0,0,0,0.15);
	}

	.button-small:active {
		box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
	}
	
	.subcatr_itmes {
		margin-right:20px;
		display: inline-block;
	}

</style>
    <body>
    
        <div class="wrap">
        
            
            <div class="header">
                
				<!-- #include file = "../inc/_top.asp" -->
                <!-- #include file = "../inc/_top_menu.asp" -->

            </div>

			
			<div class="serv_container">
				<div class="serv_header">
					<h2>회원이용안내</h2>
					<!-- #include file = "../inc/service_top.asp" -->
				</div><!-- // serv_header -->
				
				<div class="serv_cont">
					<div class="serv_wrap">
						<h2 style="font-size: 40px;padding:70px 0 0 ">
							<span style="color: #6899b7; padding-bottom: 15px; font-weight: 700">RSS Service</span> 
						</h2>
						<%
							Dim sub_menu_obj, left_menu_loop

							For top_menu_loop = 0 To  Ubound( wm.getVal("top_menu") )
								If Not ( (wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode") = "14") Or (wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode") = "17") ) Then 
									

						%>
						<div class="rss_title" ><h2><%=wm.getVal("top_menu")( top_menu_loop ).item("CatrName")%></h2></div>
						<div class="rss_subcatr" >
							
							<%
								Set sub_menu_obj = wm.getVal("left_menu_all").item( wm.getVal( "top_menu" )( top_menu_loop ).item("CatrCode"))
								For left_menu_loop = 0 To  Ubound( sub_menu_obj.item("child_info") )
							%>
							<div class="subcatr_itmes" >
								<a href="/rss/list?catr=<%=sub_menu_obj.item("child_info")( left_menu_loop ).item("CatrCode")%>" title="RSS 페이지 이동" >
									<button type="button" class="button" ><%=sub_menu_obj.item("child_info")( left_menu_loop ).item("CatrName")%></button>
								</a>
							</div>
							<%
								Next 
							%>
							
						</div>
						<%
								End If 

							Next 
						%>

					</div>
					
				</div><!-- // serv_cont -->
			</div><!-- // serv_container -->

			
		<!-- #include file = "../inc/_footer.asp" -->	
 
    
    </body>
    
</html>