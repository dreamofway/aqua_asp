<!doctype html>
<html lang="kr">
	<head>
		<meta charset="UTF-8">
		
		<script type="text/javascript" src="/view/admin/v170413/js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="/view/admin/v170413/js/jquery-ui/jquery-ui.js"></script>
		<script type="text/javascript" src="/view/admin/v170413/js/template/jquery.tmpl.min.js"></script>
		<script type="text/javascript" src="/view/admin/v170413/js/template/jquery.tmplPlus.min.js"></script>
		<script type="text/javascript" src="/view/admin/v170413/js/common.js?ver=" ></script>    
		
		<link rel="stylesheet" href="/view/admin/v170413/_css/smoothness/jquery-ui.css">
		<link rel="stylesheet" href="/view/admin/v170413/_css/base/jquery-ui.css" type="text/css" media="all" />

		<title>알림</title>

		<script>
     
			// 스크립트 기본 지원 alert / confirm 을 사이트 디자인으로 변경 가능함.
			jQuery(document).ready(function(){
				notification('<%=request("arg_type")%>', '<%=request("arg_message")%>', '<%=request("arg_move_path")%>', '');
			});
			
		</script>

	</head>
	<body>

	</body>
</html>
