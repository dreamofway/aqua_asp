<!doctype html>
<html lang="kr">
	<head>
		
		<meta name="Author" content="compa">
		<meta name="Publisher" content="compa">
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
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
		<link rel="stylesheet" href="<%=wm.user_view_path%>/css/iknnursery.css?ver=<%=verMake()%>" type="text/css" />
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
		
		<script type="text/javascript">
		<!--
			function topSeachCheck( type ) {
				
				var result = true;

				if(jQuery("#global_seach_input").val() == "") {
					jQueryDialog({type : "alert", text : "검색어를 입력해주세요.", callback_fn : function(){ jQuery("#global_seach_input").focus(); }}); 
					jQuery("#global_seach_input").focus();
					result =  false;
				}
				
				if( type == "click" ) {
					jQuery("#global_search_form").submit();
				} else {
					return result;
				}			
			}
			
			function ingMsg(){
				jQueryDialog({type : "alert", text : "준비중입니다.", callback_fn : ""}); 
			}
			

			function iconBoxNurseryFee(){
				jQueryDialog({
					type : "confirm"
					, text : "결제를 위해 아이사랑 사이트로 이동합니다<br/> 이동하시겠습니까?"
					, callback_yes : function(){ 
						//location.href = "http://www.childcare.go.kr/cpis2gi/icard/CardSettle01PrearngeSlL.jsp?programId=P0001PG00001338"; 

						window.open("http://www.childcare.go.kr/cpis2gi/icard/CardSettle01PrearngeSlL.jsp?programId=P0001PG00001338");
					}
				}); 
			}

		//-->
		</script>


	</head>
    