<!doctype html>
<html lang="kr">
	<head>
		
		<meta name="Author" content="compa">
		<meta name="Publisher" content="compa">
		<meta http-equiv="Content-type" content="text/html; charset=euc-kr">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">	
		<meta http-equiv="cache-control" content="no-cache, must-revalidate">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)"  />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)"  />

		<meta name="subject"        content="<%=wm.ogp_title%>" /> 
		<meta name="keywords"       content="<%=wm.meta_keywords%>" /> 
		<meta name="description"    content="<%=wm.meta_description%>" />

		<meta property="og:title" content="<%=wm.ogp_title%>" />
		<meta property="og:stitle_name" content="<%=wm.ogp_stitle_name%>" />
		<meta property="og:type" content="website" /> 
		<meta property="og:url" content="<%=wm.ogp_url%>" />
		<meta property="og:image" content="<%=wm.ogp_image%>" />
		<meta property="og:description"  content="<%=wm.ogp_description%>" />
		
		<title><%=wm.meta_title%></title>
		
		<link rel="shortcut icon" href="<%=wm.image_domain%>/ikn/favicon.ico" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/css/init.css?ver=<%=verMake()%>" type="text/css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/printElement/printElement.css?ver=<%=verMake()%>" type="text/css" />

		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.structure.min.css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.theme.min.css" />

		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery.blockUI.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery.easing.1.3.js"></script>
		
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/common.js?ver=<%=verMake()%>"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/template/jquery.tmpl.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/template/jquery.tmplPlus.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/printElement/jquery.printElement.js"></script>

	</head>

	
    <body onload="window.print()">
    
        <div class="wrap" id="print_area">
        
            <div class="container">
                
                <div class="news_combi">

					<div class="area_title">
						<div class="area_title_title">
							<%=Subject%>
						</div>
						<div class="area_title_sub">
							<%=SubTitle%>
						</div>
						<div class="area_title_time">
						기사입력 : <%=reg_date%>  |  기사수정 : <%=mod_date%>
						</div>

						<div class="area_title_bttn">
							
						</div>

						<div class="area_title_reporter">
							<%=writer_info%>
						</div>

					</div>
                    
					<div class="news">
						
						<div class="area_center">

							<div class="newsview">

								<div class="contents" id="area_contents">
								   <%=news_contents%>
								</div>
								
								<p class="right">
									
									&#64; &nbsp우리아이뉴스의 모든 콘텐츠는 저작권법의 보호를 받습니다. 무단 전재 및 재배포 금지 
									<br>- 우리아이뉴스는 인터넷신문윤리강령 및 시행세칙을 준수합니다.
								</p>
								
		
							</div>
						</div>
					</div>

                </div>
        </div>


		<input type="hidden" name="view_path" id="view_path" value="<%=wm.user_view_path%>" />
		<input type="hidden" name="view_url" id="view_url" value="<%=wm.ogp_url%>" />
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/news_view.js"></script>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    
    </body>
    
</html>