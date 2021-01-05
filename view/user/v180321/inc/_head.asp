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
		
		<%
			If wm.view_page_flag = True Then 
		%>
		<!-- 아이템 ID (필수): 아이템을 식별하기 위해 사용하시는 유일한 키를 입력해 주셔야 하며, 문자 혹은 숫자를 입력하실 수 있으며, 동일한 아이템의 경우, PC와 모바일에서 동일한 아이템 ID 값을 가져야 합니다. -->
		<meta property="dable:item_id" content="<%=ArticleID%>">
		<!-- 아이템 URL (필수): 필요없는 파라미터들은 빼고 입력해주세요. -->
		<meta property="og:url" content="<%=wm.ogp_url%>">
		<!-- 아이템 작성자(기자명) (필수) -->
		<meta property="dable:author" content="<%=writer_name%>">
		<!-- 아이템 카테고리 -->
		<meta property="article:section" content="<%=top_menu_title%>"> <!-- 메인 카테고리 (필수) -->
		<meta property="article:section2" content="<%=sub_menu_title%>"> <!-- 2차 카테고리가 있는 경우 추가 -->
		<!-- 아이템 작성일(ISO 8601) (필수) -->
		<meta property="article:published_time" content="<%=meta_published_time%>"> <!-- 예(한국시간 오후 1:20) -->
		<%
			End If 
		%>
		<meta name="google-site-verification" content="AhG7ioa-KSzJJCfY3RZTx_O6ANhsYbiPLV_y_LiEko4" />

		<title><%=wm.meta_title%></title>
		
		<link rel="shortcut icon" href="<%=wm.image_domain%>/ikn/favicon.ico" />
<!--		<link rel="stylesheet" href="<%=wm.user_view_path%>/css/init.css?ver=<%=verMake()%>" type="text/css" />-->
		<link rel="stylesheet" href="<%=wm.user_view_path%>/css/iknnews.css?ver=<%=verMake()%>" type="text/css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/css/common.css" type="text/css" />
	    <link rel="stylesheet" href="<%=wm.user_view_path%>/css/index.css" type="text/css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.min.css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.structure.min.css" />
		<link rel="stylesheet" href="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.theme.min.css" />

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-112304857-1"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());
			gtag('config', 'UA-112304857-1');
		</script>

		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery.blockUI.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jquery.easing.1.3.js"></script>
		
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/common.js?ver=<%=verMake()%>"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/custom.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/template/jquery.tmpl.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/template/jquery.tmplPlus.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/printElement/jquery.printElement.js"></script>

		<script type="text/javascript" src="<%=wm.user_view_path%>/js/bxslider/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jssor/jssor.core.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jssor/jssor.slider.js"></script>
		<script type="text/javascript" src="<%=wm.user_view_path%>/js/jssor/jssor.utils.js"></script>
		

		<style type="text/css">
			.bx-pager {
			  text-align: center;
			  font-size: .85em;
			  font-family: Arial;
			  font-weight: bold;
			  color: #666;
			  margin-top: -30px;
			}

			.bx-pager.bx-default-pager a {
			  background: #666;
			  text-indent: -9999px;
			  display: block;
			  width: 10px;
			  height: 10px;
			  margin: 0 5px;
			  outline: 0;
			  -moz-border-radius: 5px;
			  -webkit-border-radius: 5px;
			  border-radius: 5px;
			}
			.bx-pager.bx-default-pager a:hover,
			.bx-pager.bx-default-pager a.active,
			.bx-pager.bx-default-pager a:focus {
			  background: #000;
			}

			.bx-pager-item,
			.bx-controls-auto .bx-controls-auto-item {
			  display: inline-block;
			  vertical-align: bottom;
			  *zoom: 1;
			  *display: inline;
			}
			.bx-pager-item {
			  font-size: 0;
			  line-height: 0;
			}

		</style>
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
			

			/* Dable 스크립트 시작 / 문의 support@dable.io */
			(function(d,a,b,l,e,_) {
			d[b]=d[b]||function(){(d[b].q=d[b].q||[]).push(arguments)};e=a.createElement(l);
			e.async=1;e.charset='utf-8';e.src='//static.dable.io/dist/plugin.min.js';
			_=a.getElementsByTagName(l)[0];_.parentNode.insertBefore(e,_);
			})(window,document,'dable','script');
			dable('setService', 'ikn.kr');
			dable('sendLog');
			/* Dable 스크립트 종료 / 문의 support@dable.io */

			
		//-->
		</script>

	</head>
    