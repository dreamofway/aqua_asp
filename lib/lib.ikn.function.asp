<%
'***********************************************
' 우리아이뉴스 카테고리 정보를 가져온다.
'***********************************************
Function getCategory()
	
	Dim query 
	Dim rs
	Dim while_loop
	Dim return_val
	Dim db_obj

	Set db_obj = db_conn.connection("kids")

	query = "	SELECT * " &_
			"			, (SELECT TOP 1 CatrCode FROM ArticleCategory WHERE CatrCode LIKE '%'+ std.CatrCode +'%' AND CatrLevel = 2 ) AS first_child_code " &_
			"	FROM ArticleCategory AS std " &_
			"	WHERE ( IsPublish = 1 )  " &_
			"	ORDER BY CatrOrder ASC, catrnum  ASC, CatrLevel ASC  "
	
	Set rs = db_obj.Execute( query  )
	
	Set return_val = Server.CreateObject("Scripting.Dictionary")
	
	while_loop = 0

	If Not( rs.Eof Or rs.Bof ) Then 
			
		Dim row_data
		Dim child_arr
		Set return_val = Server.CreateObject("Scripting.Dictionary")
		Do While not rs.eof	

			If rs("CatrLevel") = "1" Then 

				Set row_data = Server.CreateObject("Scripting.Dictionary")
				Call row_data.add( "CatrName" , Cstr( rs("CatrName") ) ) 

				Call row_data.add( "child_info" , array() ) 


				Call return_val.add( Cstr( rs("CatrCode") ) , row_data ) 	

				Set row_data = Nothing 
			Else 
				If return_val.Exists( Trim(rs("pCatrCode")) ) = True  Then 
					
					child_arr = return_val.Item( Trim(rs("pCatrCode")) ).Item( "child_info" ) 

					ReDim Preserve child_arr( UBound(child_arr) + 1 )

					Set child_arr( UBound(child_arr) ) = Server.CreateObject("Scripting.Dictionary")

					Call child_arr( UBound(child_arr) ).add( "CatrCode" , Cstr( rs("CatrCode") ) ) 
					Call child_arr( UBound(child_arr) ).add( "CatrName" , Cstr( rs("CatrName") ) ) 

					return_val.Item( Trim(rs("pCatrCode")) ).Item( "child_info" ) = child_arr

				End If 

			End If ' // If rs("CatrLevel") = "1" Then 

			while_loop = while_loop + 1
			
			rs.MoveNext()
		Loop
		
		rs.close
		Set rs = Nothing

	End If ' // If rs.Eof Or rs.Bof Then 

	'--------------------------------------------------------------------
	' DB 연결 종료
	'--------------------------------------------------------------------
	db_obj.close
	Set db_obj = Nothing
	
	Set getCategory = return_val

End Function 

'***********************************************
' 우리아이뉴스 카테고리 정보를 가공하여 top 메뉴와 left 메뉴로 사용가능하게 한다.
'***********************************************
Sub initCategory()

	Dim obj_category, categroy_key, categroy_item, categroy_loop
	Dim top_selected, get_cate_param, current_top_catr
	Dim top_menu_array(), sub_menu, child_loop 
	Dim top_menu_title, sub_menu_title
	
	ReDim Preserve top_menu_array( 0 )
	current_top_catr = ""

	If wm.getParam( "catr" ) <> "" Then 
		get_cate_param = CInt( wm.getParam( "catr" ) )
	End If 

	If get_cate_param <> "" Then 

		If Len( get_cate_param ) > 2 Then 
			current_top_catr = CStr(Left( get_cate_param, 2 ))
		Else 
			current_top_catr = CStr( get_cate_param )
		End If 

	End If ' // If catr <> "" Then 
	
	' 메뉴를 호출한다.
	Set obj_category = getCategory()
	
	' top 메뉴 정보를 가공한다.
	categroy_key = obj_category.keys
	categroy_item = obj_category.items

	If obj_category.count > 0 Then 
		
		ReDim Preserve top_menu_array( Ubound( categroy_key ) )

		Set sub_menu = Server.CreateObject("Scripting.Dictionary")
		Set sub_menu_title = Server.CreateObject("Scripting.Dictionary")

		For categroy_loop = 0 To Ubound( categroy_key )

			If categroy_key( categroy_loop ) = current_top_catr Then 
				Call categroy_item( categroy_loop ).add("selected", "on" )
				
			Else 
				Call categroy_item( categroy_loop ).add("selected", "off" )
			End If 

			Set top_menu_array( categroy_loop ) = Server.CreateObject("Scripting.Dictionary")
			
			Call top_menu_array( categroy_loop ).add( "CatrCode" , Cstr( categroy_key( categroy_loop ) ) ) 
			Call top_menu_array( categroy_loop ).add( "CatrName" , Cstr( categroy_item( categroy_loop ).item("CatrName") ) ) 
			Call top_menu_array( categroy_loop ).add( "selected" , Cstr( categroy_item( categroy_loop ).item("selected") ) ) 
			
			For child_loop = 0 To Ubound( categroy_item( categroy_loop ).item("child_info") )

				If Len( get_cate_param ) = 2 Then 
					If child_loop = 0 Then 
						
						Call categroy_item( categroy_loop ).item("child_info")( child_loop ).add("selected", "on" )
						Call sub_menu_title.add( categroy_key( categroy_loop ), categroy_item( categroy_loop ).item("child_info")( child_loop ).item("CatrName") )						
					End If 
				Else 
					If CStr( get_cate_param ) = categroy_item( categroy_loop ).item("child_info")( child_loop ).item("CatrCode") Then 
						
						Call categroy_item( categroy_loop ).item("child_info")( child_loop ).add("selected", "on" )
						Call sub_menu_title.add( categroy_key( categroy_loop ), categroy_item( categroy_loop ).item("child_info")( child_loop ).item("CatrName") )
					Else 
						Call categroy_item( categroy_loop ).item("child_info")( child_loop ).add("selected", "off" )
					End If 

				End If 
				
			Next 

			Call sub_menu.add( categroy_key( categroy_loop ), Server.CreateObject("Scripting.Dictionary") )
			Call sub_menu.item( categroy_key( categroy_loop ) ).add( "CatrName" , categroy_item( categroy_loop ).item("CatrName") )
			Call sub_menu.item( categroy_key( categroy_loop ) ).add( "child_info" , categroy_item( categroy_loop ).item("child_info") ) 
			
		Next

	End If

	
	Call wm.setVal( "top_menu", top_menu_array )
	Call wm.setVal( "left_menu_all", sub_menu )



	If current_top_catr = "" Then 
		
		If wm.getParam( "search_keyword" ) = "" Then 
			Call wm.setVal( "top_menu_title", "뉴스" )
			Call wm.setVal( "top_menu_title", "전체" )
		Else
			If wm.getParam( "search_type" ) = "reporter" Then 
				Call wm.setVal( "top_menu_title", "뉴스" )
				Call wm.setVal( "sub_menu_title", "" & wm.getParam( "search_keyword" ) & " 기자 글 모아보기" )
			Else 
				Call wm.setVal( "top_menu_title", "뉴스" )
				Call wm.setVal( "sub_menu_title", "검색어 <span style=""color:#ed65a5"">'" & wm.getParam( "search_keyword" ) & "'</span> 의 결과" )
			End If 
		End If 
	Else  
		Call wm.setVal( "left_menu", sub_menu.item( current_top_catr ) )
		Call wm.setVal( "top_menu_title", Cstr( obj_category( current_top_catr ).item("CatrName") ) )
		Call wm.setVal( "sub_menu_title", Cstr( sub_menu_title.item(current_top_catr) ) )
	End If 
	
	
'	echoBr( wm.getVal( "top_menu_title" ) )
'	echoBr( wm.getVal( "sub_menu_title" ) )
'	echoBr( sub_menu.item( current_top_catr ) )
'	echoBr( obj_category )
End Sub ' // initCategory


'***********************************************
' 아이뉴스 기사 목록을 호출한다.
' headline_deduplication : ArticleHeadLine 테이블의 데이터와 중복되는 기사를 제거 할 것인지 여부 ( true / false )
' use_cate_target :  true - vw_ArticleData 테이블 카테고리 기준 조회 / false - vw_ArticleData_News 테이블 기준 조회
' class_code :  ArticleClass 컬럼의 값 (0 기획, 1 단신 , 2 인터뷰,3 컬럼 4 보도자료, 5속보, 6 취재+보도 , 7취재) 
' page : 현재 페이지
' size : 한 페이지에 보여질 레코드 수
' order_type : lately - 최신순 / popular - 인기순 
' search_cate_code : 호출 카테고리
' search_keyword : 검색어
'***********************************************
Function getNewsPage( _
	ByVal use_page_key _
	, ByVal use_db _
	, ByVal headline_deduplication _
	, ByVal use_cate_target _
	, ByVal class_code _
	, ByVal page _
	, ByVal size _
	, ByVal order_type _
	, ByVal search_cate_code _
	, ByVal search_type _
	, ByVal search_keyword _
)
	
	Dim query_select, query_from, query_where ,query_orderby, add_query, rs, stat
	Dim result_row(), while_loop, std_table
	
	Dim img_info
	Dim thum_img_path_310 ' 560x310
	Dim thum_img_path_220 ' 320x220
	Dim thum_img_path_195 ' 280x195
	Dim thum_img_path_180 ' 260x180
	Dim thum_img_path_150 ' 220x150
	Dim thum_img_path_140 ' 200x140
	Dim thum_img_path_120 ' 175x120
	Dim thum_img_path_97 ' 147x97
	Dim thum_img_path_50 ' 75x50
	Dim img_info_main
	Dim get_catr_arr, extr_catr_loop, extr_catr

	If page = "" Then 
		page = 1
	End If 

	If size = "" Then 
		size = 10
	End If 

	add_query = ""
	
	If use_cate_target = True Then 
		std_table = " ( " &_ 
					"		SELECT "&_
					"				t_std.ArticleID "&_
					"				,t_std.ArticleClass  "&_
					"				,t_std.Source "&_
					"				,t_std.IsPublish "&_
					"				,t_std.IsHeadLine "&_
					"				,t_std.Subject "&_
					"				,IsNULL(t_std.SubTitle, '') AS SubTitle "&_
					"				,IsNULL(t_std.SubMTitle, '') AS SubMTitle "&_
					"				,IsNULL(t_std.ConsultNo, '') AS ConsultNo "&_			
					"				,IsNULL(t_std.GreetingFlag, '') AS GreetingFlag "&_		
					"				,t_std.Contents "&_
					"				,t_std.ViewCnt "&_
					"				,t_std.EPCnt "&_
					"				,t_std.RegDate "&_
					"				,t_std.LastModDate "&_
					"				,t_std.WriterID "&_
					"				,t_std.WriterName "&_
					"				,t_std.CatrCode "&_
					"		FROM ArticleData AS t_std WHERE ArticleID IN ( select DISTINCT ArticleID from vw_ArticleData where CatrCode LIKE '"& search_cate_code &"%' ) ) "
	Else 
		'std_table = " vw_ArticleData_News "
		If search_cate_code = "" Then
			std_table = " vw_ArticleData_News "
		Else 
			

			If Len( search_cate_code ) > 2 Then 
				std_table = " ( select * from vw_ArticleData where CatrCode = '"& search_cate_code &"' ) "
			Else 
				std_table = " ( " &_ 
					"		SELECT "&_
					"				t_std.ArticleID "&_
					"				,t_std.ArticleClass  "&_
					"				,t_std.Source "&_
					"				,t_std.IsPublish "&_
					"				,t_std.IsHeadLine "&_
					"				,t_std.Subject "&_
					"				,IsNULL(t_std.SubTitle, '') AS SubTitle "&_
					"				,IsNULL(t_std.SubMTitle, '') AS SubMTitle "&_
					"				,IsNULL(t_std.ConsultNo, '') AS ConsultNo "&_			
					"				,IsNULL(t_std.GreetingFlag, '') AS GreetingFlag "&_		
					"				,t_std.Contents "&_
					"				,t_std.ViewCnt "&_
					"				,t_std.EPCnt "&_
					"				,t_std.RegDate "&_
					"				,t_std.LastModDate "&_
					"				,t_std.WriterID "&_
					"				,t_std.WriterName "&_
					"				,t_std.CatrCode "&_
					"		FROM ArticleData AS t_std WHERE ArticleID IN ( select DISTINCT ArticleID from vw_ArticleData where CatrCode LIKE '"& search_cate_code &"%' ) ) "
			End If 

		End If 	
	End If 

	Select Case order_type
		Case "lately" : query_orderby = " t_std.RegDate DESC "
		Case "popular" 
			query_orderby = " t_std.ViewCnt DESC "
			add_query = add_query & " AND ( t_std.RegDate >= '"& Left( dateAdd("w", -30, now() ), 10 ) & " 00:00:00" &"'  ) "
		Case "notWriterOnline" 
			query_orderby = " t_std.RegDate DESC "
			add_query = add_query & " AND ( t_std.WriterName NOT LIKE '%온라인뉴스팀%' ) "
		Case "exist_img" 
			add_query = add_query & " AND ( t_img.ImagePath IS NOT NULL ) "
			query_orderby = " t_std.RegDate DESC "
		Case Else : query_orderby = " t_std.RegDate DESC "
	End Select
	
	If search_keyword <> "" Then 
		add_query = add_query & " AND ( ( t_std.Subject LIKE '%"& search_keyword &"%' ) OR ( t_std.Contents LIKE '%"& search_keyword &"%' )  OR ( t_std.WriterName LIKE '%"& search_keyword &"%' ) ) "
	End If 
	
	If search_type = "" Then 

		If search_keyword <> "" Then 
			add_query = add_query & " AND ( ( t_std.Subject LIKE '%"& search_keyword &"%' ) OR ( t_std.Contents LIKE '%"& search_keyword &"%' )  OR ( t_std.WriterName LIKE '%"& search_keyword &"%' ) ) "
		End If 

	Else 
		
		Select Case search_type
			Case "reporter"
				If search_keyword <> "" Then 
					add_query = add_query & " AND ( t_std.WriterName LIKE '%"& search_keyword &"%'  ) "
				End If 				
		End Select
		
	End If 

	If headline_deduplication = True Then 

		add_query = add_query & " AND ( "&_
								"			t_std.ArticleID NOT IN ( " &_
								"				SELECT ArticleID FROM MainHeadLine WHERE IsPublish = 1 AND ArticleID IS NOT NULL " &_
								"			)"&_
								" ) "
	End If 

	query_select = " t_std.* " & _
				", IsNULL( (" & _
				"		SELECT TOP 1" & _
				"			 ImagePath + '/' + ImageName  " & _
				"		FROM ActicleImage " & _
				"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
				"		ORDER BY SEQ DESC " & _
				"	) , '' ) AS img_path " & _
				"	,IsNULL( (" & _
				"		SELECT TOP 1" & _
				"			 ImagePath + '/' + ImageName  " & _
				"		FROM ActicleImage " & _
				"		WHERE ArticleID = t_std.ArticleID AND align='img_info_main' " & _
				"		ORDER BY SEQ DESC " & _
				"	) , '' ) AS img_info_main " & _
				", ( " & _
				"		SELECT	COUNT(SEQ) " & _
				"		FROM	ArticleRelation " & _
				"		WHERE	ArticleID = t_std.ArticleID AND ( (oArticleID IS NOT NULL ) AND (oArticleID <> '') ) " & _
				"  ) AS article_relation_cnt " & _
				", IsNULL( ( SELECT TOP 1 CatrCode FROM ArticleClass WHERE ArticleID = t_std.ArticleID AND CatrCode > 0 ORDER BY RegDate ASC ), '' ) AS symbol_catr_code " &_
				", ( convert(varchar(16), t_std.RegDate, 120) ) AS conv_reg_date " &_
				", ( convert(varchar(16), t_std.LastModDate, 120) ) AS conv_mod_date "
	query_from =	" "& std_table &" AS t_std " & _
					" LEFT OUTER JOIN (select DISTINCT ArticleID,ImageName,ImagePath,align,DelFlag from  ActicleImage) AS t_img " & _
					" ON t_std.ArticleID = t_img.ArticleID " & _
					" AND t_img.align='news_list_thum' "
	query_where =	" ( t_std.IsPublish = 1 ) AND ( t_std.ArticleID IS NOT NULL ) AND ( t_std.ArticleClass NOT IN (10) )  " & add_query
	

	'--------------------------------------------------------------------
	' 페이징 초기화
	'--------------------------------------------------------------------
	Call wm.setPagingData( use_page_key, "use_db", use_db )
	Call wm.setPagingData( use_page_key, "query_select", query_select )
	Call wm.setPagingData( use_page_key, "query_from", query_from )
	Call wm.setPagingData( use_page_key, "query_where", query_where )
	Call wm.setPagingData( use_page_key, "query_orderby", query_orderby )
	Call wm.setPagingData( use_page_key, "page_param", wm.getVal( "get_value" ) )
	Call wm.setPagingData( use_page_key, "page_per_block", size )
	Call wm.setPagingData( use_page_key, "page", page )
	Call wm.setPagingData( use_page_key, "size", size )
	Set rs = wm.sqlExecuteList( use_db, use_page_key )	
	Response.Flush

	If rs.Eof Or rs.Bof Then 

		ReDim Preserve result_row( -1 )
		' Set result_row(while_loop) = Server.CreateObject("Scripting.Dictionary")

	Else 
		while_loop = 0
		Do While not rs.eof	

			If rs("img_path") = "" Then	
				img_info = ""
				thum_img_path_310 = ""
				thum_img_path_220 = ""
				thum_img_path_195 = ""
				thum_img_path_180 = ""
				thum_img_path_150 = ""
				thum_img_path_140 = ""
				thum_img_path_120 = ""
				thum_img_path_97 = ""
				thum_img_path_50 = ""
				img_info_main = ""

			Else 
				
				img_info = wm.image_domain & rs("img_path")


				If rs("img_info_main") = "" Then	
					img_info_main = ""
				Else 
					img_info_main = wm.image_domain & rs("img_info_main")
				End If

			End If 

			ReDim Preserve result_row( while_loop )

			Set result_row(while_loop) = Server.CreateObject("Scripting.Dictionary")

			

			If InStr( rs("CatrCode"), "," ) > 0 Then 

				get_catr_arr = Split( rs("CatrCode") , "," )

				For extr_catr_loop = 0 To Ubound( get_catr_arr ) 
					If ( Len( get_catr_arr(extr_catr_loop) ) > 3 ) Then 
						extr_catr = get_catr_arr(extr_catr_loop)
						Exit For 
					End If 
				Next 
			Else 
				extr_catr = rs("CatrCode")
			End If 



			Call result_row( while_loop ).add("ArticleID", Cstr( nullToSpace( rs("ArticleID") ) ) )
			Call result_row( while_loop ).add("Subject", Cstr( subjectReplace( nullToSpace( rs("subject") ) ) ) )
			Call result_row( while_loop ).add("SubTitle", Cstr( Trim( nullToSpace( rs("SubTitle")) ) ) )
			Call result_row( while_loop ).add("Contents", Cstr( nullToSpace( rs("Contents") ) ) )
			Call result_row( while_loop ).add("WriterName", Cstr( nullToSpace( rs("WriterName") ) ) )
			Call result_row( while_loop ).add("RegDate", Cstr( nullToSpace( rs("RegDate") ) ) )
			Call result_row( while_loop ).add("conv_reg_date", Cstr( nullToSpace( rs("conv_reg_date") ) ) )
			Call result_row( while_loop ).add("conv_mod_date", Cstr( nullToSpace( rs("conv_mod_date") ) ) )
			Call result_row( while_loop ).add("article_relation_cnt", Cstr( nullToSpace( rs("article_relation_cnt") ) ) )
			Call result_row( while_loop ).add("img_path", Cstr( img_info) ) 
			Call result_row( while_loop ).add("CatrCode", Cstr( nullToSpace( extr_catr ) ) )
			Call result_row( while_loop ).add("GreetingFlag", Cstr( nullToSpace( rs("GreetingFlag") ) ) )
			Call result_row( while_loop ).add("thum_img_path_310", Cstr( thum_img_path_310) ) 
			Call result_row( while_loop ).add("thum_img_path_220", Cstr( thum_img_path_220) ) 
			Call result_row( while_loop ).add("thum_img_path_195", Cstr( thum_img_path_195) ) 
			Call result_row( while_loop ).add("thum_img_path_180", Cstr( thum_img_path_180) ) 
			Call result_row( while_loop ).add("thum_img_path_150", Cstr( thum_img_path_150) ) 
			Call result_row( while_loop ).add("thum_img_path_140", Cstr( thum_img_path_140) ) 
			Call result_row( while_loop ).add("thum_img_path_120", Cstr( thum_img_path_120) ) 
			Call result_row( while_loop ).add("thum_img_path_97", Cstr( thum_img_path_97) ) 
			Call result_row( while_loop ).add("thum_img_path_50", Cstr( thum_img_path_50) ) 
			Call result_row( while_loop ).add("img_info_main", Cstr( img_info_main) ) 

			while_loop = while_loop + 1
			
			rs.MoveNext()

		Loop
		
	End If 
	
	rs.close
	Set rs = Nothing

	getNewsPage = result_row		
	Response.Clear 
End Function ' // getNewsPage

'***********************************************
' 메인 기사 데이터를 불러온다.
'***********************************************
Function getMainNews( ByVal param_pcode )
	
	Dim add_query_where
	Dim while_loop
	Dim area_code
	Dim thum_size
	Dim img_info
	Dim img_info_main
	Dim thum_img_path_310 ' 560x310
	Dim thum_img_path_220 ' 320x220
	Dim thum_img_path_195 ' 280x195
	Dim thum_img_path_180 ' 260x180
	Dim thum_img_path_150 ' 220x150
	Dim thum_img_path_140 ' 200x140
	Dim thum_img_path_120 ' 175x120
	Dim thum_img_path_97 ' 147x97
	Dim thum_img_path_50 ' 75x50
	Dim db_obj, query, rs, result_row()
	
	Set db_obj = db_conn.connection("kids")
	

	add_query_where = " AND ( t_std.pCatrCode = '"& param_pcode &"' ) "

	query = "SELECT t_news.* " & _
				"	, IsNULL( ( SELECT TOP 1 CatrCode FROM ArticleClass WHERE ArticleID = t_std.ArticleID AND CatrCode > 0 ORDER BY ArticleClass DESC, RegDate ASC ), '' ) AS CatrCode " &_
				"	,IsNULL( t_std.CatrName, '') AS CatrName " & _
				"	,IsNULL( t_std.MediaURL, '') AS MediaURL " & _
				"	,IsNULL( t_news.GreetingFlag, '') AS GreetingFlag " & _
				"	,IsNULL( (" & _
				"		SELECT TOP 1" & _
				"			 ImagePath + '/' + ImageName  " & _
				"		FROM ActicleImage " & _
				"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
				"		ORDER BY SEQ DESC " & _
				"	) , '' ) AS img_path " & _
				
				"	,IsNULL( (" & _
				"		SELECT TOP 1" & _
				"			 ImagePath + '/' + ImageName  " & _
				"		FROM ActicleImage " & _
				"		WHERE ArticleID = t_std.ArticleID AND align='img_info_main' " & _
				"		ORDER BY SEQ DESC " & _
				"	) , '' ) AS img_info_main " & _
				", ISNULL( t_std.Subject , '') AS main_subject  " &_
				", ( SELECT COUNT( SEQ ) FROM ArticleData WHERE ArticleID = t_std.ArticleID  ) AS img_cnt   " &_
				", ( convert(varchar(16), t_news.RegDate, 120) ) AS conv_reg_date " & _			
				", t_std.Subject AS main_subject " & _			
				" FROM MainHeadLine AS t_std " & _
				" INNER JOIN ArticleData AS t_news " & _
				" ON t_std.ArticleID = t_news.ArticleID " & _
				" WHERE ( t_std.IsPublish = '1' ) AND ( t_std.CatrLevel = '2' ) " &  add_query_where &_
				" ORDER BY LEN(t_std.CatrIndex) ASC, t_std.CatrIndex ASC "
	
	Set rs = db_obj.Execute( query  )

'	If( param_pcode = 17 ) Then 
'		echoBr( query )
'	End If 

	If rs.Eof Or rs.Bof Then 

		ReDim Preserve result_row( -1 )
		' Set result_row(while_loop) = Server.CreateObject("Scripting.Dictionary")

	Else 
		while_loop = 0
		Do While not rs.eof	

			ReDim Preserve result_row( while_loop )

			Set result_row(while_loop) = Server.CreateObject("Scripting.Dictionary")


			If rs("img_cnt") = 0 Then	
				img_info = ""
				img_info_main = ""
				thum_img_path_310 = ""
				thum_img_path_220 = ""
				thum_img_path_195 = ""
				thum_img_path_180 = ""
				thum_img_path_150 = ""
				thum_img_path_140 = ""
				thum_img_path_120 = ""
				thum_img_path_97 = ""
				thum_img_path_50 = ""
			Else 
				If rs("img_path") = "" Then 
					img_info = wm.image_domain & "/ikn/ikn_default_ogp.png"
				Else 
					img_info = wm.image_domain & rs("img_path")
				End If 
				

				

				If rs("img_info_main") = "" Then	
					img_info_main = img_info
				Else 
					img_info_main = wm.image_domain & rs("img_info_main")
				End If


			End If 

			Call result_row( while_loop ).add("ArticleID", Cstr( rs("ArticleID") ) )
			Call result_row( while_loop ).add("CatrName", Cstr( rs("CatrName") ) )
			Call result_row( while_loop ).add("Subject", Cstr( subjectReplace( rs("main_subject") ) ) )
			Call result_row( while_loop ).add("main_subject", Cstr( subjectReplace( rs("main_subject") ) ) )
			Call result_row( while_loop ).add("Contents", Cstr( rs("Contents") ) )
			Call result_row( while_loop ).add("RegDate", Cstr( rs("RegDate") ) )
			Call result_row( while_loop ).add("conv_reg_date", Cstr( rs("conv_reg_date") ) )
			Call result_row( while_loop ).add("MediaURL", Cstr( rs("MediaURL") ) )
			Call result_row( while_loop ).add("GreetingFlag", Cstr( rs("GreetingFlag") ) )
			Call result_row( while_loop ).add("CatrCode", Cstr( rs("CatrCode") ) )
			Call result_row( while_loop ).add("WriterName", Cstr( mixWriteName( getWriterInfo( rs("WriterID"), "AdminDepartment" ), rs("WriterName") ) ) )
			Call result_row( while_loop ).add("img_path", Cstr( img_info) ) 
			
			Call result_row( while_loop ).add("img_info_main", Cstr( img_info_main) ) 

			while_loop = while_loop + 1

			rs.MoveNext()
		Loop 
		rs.close
		Set rs = Nothing 
	End If 
	
	getMainNews = result_row 

End Function ' // getMainNews 

'***********************************************
' 설명 : 이미지 1개 + 텍스트 기사 형식의 뉴스를 호출한다.
' limit : 전체 게시물 수
' bundle_cnt : 영역 수
' list_cnt : 텍스트 기사 수
' tail_use : 남은 기사 텍스트 기사로의 사용여부
' get_catr : 카테고리 코드
'***********************************************
Function makeOneImgeTypeList( ByVal limit, ByVal bundle_cnt,  ByVal list_cnt, ByVal tail_use, ByVal get_catr )

	Dim list_arr, child_arr
	Dim list_loop, ArticleID, Subject, Contents, img_path, WriterName, RegDate, CatrCode
	Dim result_row()
	
	' 목록 함수 호출
	list_arr = getNewsPage( _
		"main_lately_list" _
		, "kids" _
		, true _
		, true _
		, "" _
		, 1 _
		, limit _
		, "lately" _ 
		, get_catr _
		, "" _
		, "" _
	)
	
	If list_arr(0).Count > 0 Then
		Dim current_bundle_state, current_bundle_idx, current_bundle_child_idx 
		
		current_bundle_idx = 0
		current_bundle_child_idx = 0
		current_bundle_state = False
		
		Dim img_arr(), text_arr()
		Dim img_idx, text_idx
		
		img_idx = 0
		text_idx = 0
		ReDim Preserve img_arr( 0 )
		ReDim Preserve text_arr( 0 )


		For list_loop = 0 To Ubound( list_arr )
			
			ArticleID = list_arr( list_loop ).item("ArticleID")
			Subject =   list_arr( list_loop ).item("Subject") 
			Contents = list_arr( list_loop ).item("Contents")
			img_path = list_arr( list_loop ).item("img_path")
			WriterName = list_arr( list_loop ).item("WriterName")
			CatrCode = list_arr( list_loop ).item("CatrCode")
			RegDate = dateType( "T09", list_arr( list_loop ).item("conv_reg_date") ) 
			
			'echoBr( " :: " & Subject & " : " & img_path )

			If ( img_path <> "" ) And ( UBound(img_arr) < bundle_cnt ) Then 

				Set img_arr( UBound(img_arr) ) = Server.CreateObject("Scripting.Dictionary")
				
				Call img_arr( UBound(img_arr) ).add("ArticleID", ArticleID )
				Call img_arr( UBound(img_arr) ).add("Subject", Subject )
				Call img_arr( UBound(img_arr) ).add("Contents", Contents )
				Call img_arr( UBound(img_arr) ).add("img_path", img_path )
				Call img_arr( UBound(img_arr) ).add("WriterName", WriterName )
				Call img_arr( UBound(img_arr) ).add("CatrCode", CatrCode )
				Call img_arr( UBound(img_arr) ).add("RegDate", RegDate )
				Call img_arr( UBound(img_arr) ).add("sort", list_loop )
				
				ReDim Preserve img_arr( UBound(img_arr) + 1 )
				
'					echoBr( " img => " & Subject & " : " & img_path )


			Else 

				Set text_arr( UBound(text_arr) ) = Server.CreateObject("Scripting.Dictionary")
				
				Call text_arr( UBound(text_arr) ).add("ArticleID", ArticleID )
				Call text_arr( UBound(text_arr) ).add("Subject", Subject )
				Call text_arr( UBound(text_arr) ).add("Contents", Contents )
				Call text_arr( UBound(text_arr) ).add("img_path", img_path )
				Call text_arr( UBound(text_arr) ).add("WriterName", WriterName )
				Call text_arr( UBound(text_arr) ).add("CatrCode", CatrCode )
				Call text_arr( UBound(text_arr) ).add("RegDate", RegDate )
				
			'	echoBr( " in  | "& UBound(text_arr) & " | " & text_arr( UBound(text_arr) ).item("Subject") )

				ReDim Preserve text_arr( UBound(text_arr) + 1 )

	'			echoBr( " list => " & Subject & " : " & img_path )

			End If 
		Next 
		
'			echoBr("img_arr : " & UBound(img_arr)  )
'			echoBr("text_arr : " & UBound(text_arr)  )

		Dim loop_cnt
		Dim result_arr()
		ReDim Preserve result_arr(bundle_cnt)
		Dim text_arr_loop
		Dim text_arr_idx
		Dim text_arr_tmp
		
		text_arr_idx = 0

		For loop_cnt = 0 To ( UBound(img_arr) - 1) 

			Set result_arr( loop_cnt ) = Server.CreateObject("Scripting.Dictionary")
			Call result_arr( loop_cnt ).add("img_news", Server.CreateObject("Scripting.Dictionary") )
			Call result_arr( loop_cnt ).add("text_news", array() )
			text_arr_tmp = result_arr( loop_cnt ).Item( "text_news" ) 

			Call result_arr( loop_cnt ).item("img_news").add("ArticleID", img_arr(loop_cnt).item("ArticleID") )
			Call result_arr( loop_cnt ).item("img_news").add("Subject", img_arr(loop_cnt).item("Subject") )
			Call result_arr( loop_cnt ).item("img_news").add("Contents", img_arr(loop_cnt).item("Contents") )
			Call result_arr( loop_cnt ).item("img_news").add("img_path", img_arr(loop_cnt).item("img_path") )
			Call result_arr( loop_cnt ).item("img_news").add("WriterName", img_arr(loop_cnt).item("WriterName") )
			Call result_arr( loop_cnt ).item("img_news").add("CatrCode", img_arr(loop_cnt).item("CatrCode") )
			Call result_arr( loop_cnt ).item("img_news").add("RegDate", img_arr(loop_cnt).item("RegDate") )
			

			For text_arr_loop = 0 To (list_cnt - 1)

				ReDim Preserve text_arr_tmp( UBound(text_arr_tmp) + 1 )

				Set text_arr_tmp( text_arr_loop ) = Server.CreateObject("Scripting.Dictionary")
				Call text_arr_tmp( text_arr_loop ).add("ArticleID", text_arr(text_arr_idx).item("ArticleID") )
				Call text_arr_tmp( text_arr_loop ).add("Subject", text_arr(text_arr_idx).item("Subject") )
				Call text_arr_tmp( text_arr_loop ).add("Contents", text_arr(text_arr_idx).item("Contents") )
				Call text_arr_tmp( text_arr_loop ).add("WriterName", text_arr(text_arr_idx).item("WriterName") )
				Call text_arr_tmp( text_arr_loop ).add("CatrCode", text_arr(text_arr_idx).item("CatrCode") )
				Call text_arr_tmp( text_arr_loop ).add("RegDate", text_arr(text_arr_idx).item("RegDate") )
				
				'echoBr( " out  | "& text_arr_idx & " | " & text_arr( text_arr_idx ).item("Subject") )

				text_arr_idx = text_arr_idx + 1
				

			Next 
			

			If (loop_cnt = ( UBound(img_arr) - 1 ) ) And ( tail_use = True ) Then 

				Dim tail_loop
				For tail_loop = text_arr_idx To ( Ubound( text_arr ) - 1) 
					
					ReDim Preserve text_arr_tmp( UBound(text_arr_tmp) + 1 )
				'	echoBr("tail_loop : " & tail_loop)
				'	echoBr("UBound(text_arr_tmp) : " & UBound(text_arr_tmp))
					
					Set text_arr_tmp( UBound(text_arr_tmp) ) = Server.CreateObject("Scripting.Dictionary")
					Call text_arr_tmp( UBound(text_arr_tmp) ).add("ArticleID", text_arr(tail_loop).item("ArticleID") )
					Call text_arr_tmp( UBound(text_arr_tmp) ).add("Subject", text_arr(tail_loop).item("Subject") )
					Call text_arr_tmp( UBound(text_arr_tmp) ).add("Contents", text_arr(tail_loop).item("Contents") )
					Call text_arr_tmp( UBound(text_arr_tmp) ).add("WriterName", text_arr(tail_loop).item("WriterName") )
					Call text_arr_tmp( UBound(text_arr_tmp) ).add("CatrCode", text_arr(tail_loop).item("CatrCode") )
					Call text_arr_tmp( UBound(text_arr_tmp) ).add("RegDate", text_arr(tail_loop).item("RegDate") )
					
				'	echoBr( " add  | "& text_arr_idx & " | " & text_arr( text_arr_idx ).item("Subject") )

				Next 
			End If 

			result_arr( loop_cnt ).Item( "text_news" ) = text_arr_tmp
			ReDim Preserve text_arr_tmp( 0 )



		Next 

	End If 
	
	makeOneImgeTypeList = result_arr

End Function ' // makeOneImgeTypeList

'***********************************************
' 날씨정보를 가져온다.
'***********************************************
Function getWather()

	Dim db_obj, query, rs
	
	Set db_obj = db_conn.connection("health")

	query = " SELECT * FROM ActicleWeather ORDER BY SEQ ASC "

	Set getWather = db_obj.Execute( query  )

End Function 

'***********************************************
' 주요뉴스 3개를 가져온다.
'***********************************************
Function getTopHeadlines()

	Dim db_obj, query, rs
	
	Set db_obj = db_conn.connection("kids")

	query = " SELECT Top 3 *, IsNULL( ( SELECT TOP 1 CatrCode FROM ArticleClass WHERE ArticleID = ArticleID AND CatrCode > 0 ORDER BY RegDate ASC ), '' ) AS CatrCode FROM vw_ArticleData_News ORDER BY RegDate DESC "

	Set getTopHeadlines = db_obj.Execute( query  )

End Function 


'***********************************************
' 기사 작성자 아이디를 기준으로 정보를 세팅한다.
'***********************************************
Sub setWriterInfo()
	
	Dim query 
	Dim rs
	Dim while_loop
	Dim return_val
	Dim db_obj
	
	Set db_obj = db_conn.connection("health")

	query = "	SELECT * " &_
			"	FROM AdminInfo " 
	'		"	WHERE ( DelFlag = 0 )  " 
	
	Set rs = db_obj.Execute( query  )
	
	Set return_val = Server.CreateObject("Scripting.Dictionary")
	
	while_loop = 0

	If Not( rs.Eof Or rs.Bof ) Then 
		Dim admin_id 
		Do While not rs.eof	
			
			admin_id = Trim( rs("AdminID") ) 
			 
			If return_val.Exists( admin_id ) = False Then
				Call return_val.add( admin_id , Server.CreateObject("Scripting.Dictionary") ) 
			End If 

			Call return_val.item( admin_id ).add( "AdminName" , Cstr( nullToSpace( rs("AdminName") ) ) ) 
			Call return_val.item( admin_id ).add( "AdminLevel" , Cstr( nullToSpace( rs("AdminLevel") ) ) ) 
			Call return_val.item( admin_id ).add( "AdminTel" , Cstr( nullToSpace( rs("AdminTel") ) ) ) 
			Call return_val.item( admin_id ).add( "AdminDepartment" , Cstr( nullToSpace( rs("AdminDepartment") ) ) ) 
			Call return_val.item( admin_id ).add( "AdminMail" , Cstr( nullToSpace( rs("AdminMail") ) ) ) 

			rs.MoveNext()
		Loop
		
		rs.close
		Set rs = Nothing

	End If 

	Call wm.setVal( "write_info", return_val )

End Sub ' // setWriterInfo

'***********************************************
' 기사 작성자 아이디를 기준으로 정보를 반환한다.
'***********************************************
Function getWriterInfo( ByVal param_id, ByVal param_val  )
	
	Dim result 
	If param_id <> "" Then 
		
		If wm.getVal( "write_info" ).Exists( Trim( param_id ) ) = True Then
			result = wm.getVal( "write_info" ).item( Trim( param_id ) ).item( Trim( param_val ) ) 
		Else 
			result = ""
		End If 

	Else 
		result = ""
	End If 

	getWriterInfo = result
	
End Function ' // getWriterInfo

'***********************************************
' 헬스앤라이프 기사 제목의 특정 문자열 제거
'***********************************************
Function subjectReplace( ByVal param_subject ) 

	Dim result_subject
	result_subject = replace( param_subject , "[보도자료][식약처][식품위해정보]", "" )
	
	subjectReplace = result_subject

End Function 

'***********************************************
' 설명 : 기자명을 조합한다.
'***********************************************
Function mixWriteName( ByVal AdminDepartment,  ByVal WriterName )

	Dim result

	If Trim( AdminDepartment ) = "" Then 
		result = WriterName
	Else 
'		result = Trim( AdminDepartment ) & " " & WriterName & " 기자"
		result = WriterName & " 기자"
	End If 

	mixWriteName = result

End Function

'***********************************************
' 정규식 패턴으로 내용 삭제 ( 테스트 좀 더 필요)
'***********************************************
Function removeContens( ByVal param_str ) 
	Dim result_str 
	Dim pattern
	Dim content
	
	content = HTMLDecode( param_str )

	content = replace( content , "[사진 = 유토이미지]", "" )
	content = replace( content , "[사진 = 아이클릭아트]", "" )
	content = replace( content , "[헬스앤라이프]", "" )
	content = replace( content , Chr(10), "" )
	content = replace( content , Chr(13), "" )

	pattern = "<figcaption[^>]*>.*?</figcaption>":'ck editor 캡션내용
	content = eregi_replace(pattern, "", content):
	pattern = "<(no)?script[^>]*>.*?</(no)?script>":'SCRIPTS
	content = eregi_replace(pattern, "", content):
	pattern = "<style[^>]*>.*</style>":'STYLE
	content = eregi_replace(pattern, "", content):
	pattern = "<(\""[^\""]*\""|\'[^\']*\'|[^\'\"">])*>":'TAGS
	content = eregi_replace(pattern, "", content):
	pattern = "<\\w+\\s+[^<]*\\s*>":'nTAGS
	content = eregi_replace(pattern, "", content):
	pattern = "&[^;]+;":'ENTITY_REFS
	content = eregi_replace(pattern, "", content):
	pattern = "\\s\\s+":'WHITESPACE
	content = eregi_replace(pattern, "", content):
	pattern = "\\n\\n+":'WHITESPACE
	content = eregi_replace(pattern, "", content):

	'content = replace( content , chr(32), "" )

	removeContens = content
End Function 

'***********************************************
' 메인의 왼쪽 메뉴를 생성한다.
'***********************************************
Sub makeMainLeft( ByVal param_code ) 	
	
	Dim child_info, child_info_loop

	child_info = wm.getVal("left_menu_all").item(param_code).item("child_info")

%>
<div class="area_left_title">
	<a href="/news/list?catr=<%=param_code%>">
		<%=wm.getVal("left_menu_all").item(param_code).item("CatrName")%>
	</a>
</div>

<ul>
	<%
		For child_info_loop = 0 To Ubound( child_info )
	%>
	<li >
		<a href="/news/list?catr=<%=child_info( child_info_loop ).item("CatrCode")%>">
			<span>
				<%=child_info( child_info_loop ).item("CatrName")%>
			</span>
		</a>
	</li>
	<%
		Next 
	%>
</ul>
<%
End Sub 

Function getChildAreaCode( ByVal param_step, ByVal param_result_type )
	
	Dim db_obj, query, rs, downtown_rs, parent_code, city_arr(), loop_cnt
	Dim json_result_arr, downtown_arr()
	
	Set db_obj = db_conn.connection( "kids" )

	Select Case param_result_type
		Case "rs"

			query = "SELECT	* FROM ChildAreaCode WHERE ARStep = '"& param_step &"' ORDER BY ARName ASC "
			Set getChildAreaCode = db_obj.Execute( query )

		Case "json"
			
			ReDim Preserve city_arr( -1 )
			
			query = "SELECT	* FROM ChildAreaCode WHERE DelFlag = 0 AND ARStep = '1' ORDER BY ARName ASC "
			Set rs = db_obj.Execute( query )
			
			Set json_result_arr = jsObject()

			If Not( rs.Eof Or rs.Bof ) Then 

				Do While not rs.Eof

					ReDim Preserve city_arr( Ubound( city_arr ) + 1 )

					city_arr( Ubound( city_arr ) ) =  Trim( rs("ARcode") ) 



					rs.MoveNext()
				Loop 

				For loop_cnt = 0 To Ubound( city_arr )

					query = "SELECT	* FROM ChildAreaCode WHERE DelFlag = 0 AND ARStep = '2' AND ARcode LIKE '"& Left( city_arr( loop_cnt ), 2 ) &"%' ORDER BY ARName ASC "

					Set downtown_rs = db_obj.Execute( query )
					
					Dim downtown_cnt
					downtown_cnt = 0

					ReDim downtown_arr(-1)

					Do While not downtown_rs.Eof

						ReDim Preserve downtown_arr( Ubound( downtown_arr ) + 1 )

						Set downtown_arr( downtown_cnt ) = jsObject()
						downtown_arr( downtown_cnt )("ARcode") = Trim( downtown_rs("ARcode") )
						downtown_arr( downtown_cnt )("ARName") = Trim( downtown_rs("ARName") )
						downtown_cnt = downtown_cnt + 1
						downtown_rs.MoveNext()
					Loop 
					
					json_result_arr( city_arr( loop_cnt ) ) = downtown_arr

					
				Next 
				
			End If 
			
			getChildAreaCode = toJSON( json_result_arr )

	End Select 

End Function 



Function paging( ByVal arg_page_id )

	Dim npageCount
	Dim nPREV
	Dim nCUR
	Dim nNEXT
	Dim retVal
	Dim i
	Dim pageKubun
	Dim total_num_of_page, total_num_of_block, current_block, start_page, end_page, is_next, is_prev, strLink, current_page, page_per_block
	Dim go_next_page, go_prev_page
	Dim loop_cnt
	Dim page_param


	page_per_block = CInt( wm.getPagingData( arg_page_id, "page_per_block" ) )

	' 전체레코드,  페이지당 레코드수(10) , 블럭당페이지수(10), 현재페이지
	current_page			= wm.getPagingData( arg_page_id, "page" )
	total_num_of_page       = Ceil( ( wm.getPagingData( arg_page_id, "total_count" ) ) / wm.getPagingData( arg_page_id, "size" ) )
	total_num_of_block      = Ceil( total_num_of_page / page_per_block )
	current_block           = Ceil(current_page /  page_per_block )
	start_page              = (current_block - 1) * page_per_block + 1
	end_page                = start_page + page_per_block - 1

	If wm.getPagingData( arg_page_id, "page_param" ) = "" Then 
		page_param = ""
	Else 
		page_param = "&" & wm.getPagingData( arg_page_id, "page_param" )
	End If 
	

	if end_page > total_num_of_page Then 
		end_page = total_num_of_page
	End If 
		

	' NEXT,PREV 존재 여부
	is_next = FALSE
	is_prev = FALSE

	if current_block < total_num_of_block Then 
		is_next = TRUE
	End If 	

	if current_block > 1 Then 
		is_prev = TRUE
	End If 

	if total_num_of_block = 1 Then 
		is_next = FALSE
		is_prev = FALSE
	End If 



	retVal = "  <ul class=""pagination"" >"

	' [처음페이지] 페이지 조합
	If current_page > 10 Then
		strLink = "?page=1"& page_param

	'	retVal = retVal & chr(13)&chr(10)&"<li class=""selected"" ><a href=""" & strLink & """ ><img src=""/mobile/img/paging/prev.png"" alt=""처음""></a></li>"&chr(13)&chr(10)
	
	End If


	' [이전] 페이지 조합
	If is_prev = TRUE Then
		go_prev_page = start_page - page_per_block
		strLink = "?page=" & go_prev_page &  page_param
		retVal = retVal & chr(13)&chr(10)&"<a href=""" & strLink & """ ><li class=""page_prev"" >&lt;</li></a>"&chr(13)&chr(10)
	Else 
		retVal = retVal & chr(13)&chr(10)&"<li class=""page_prev"" >&lt;</li>"&chr(13)&chr(10)
	End If

	For loop_cnt = start_page To end_page step 1
		
		If CInt(current_page) = CInt(loop_cnt) Then
		 retVal = retVal & "<li class=""active""  >" & loop_cnt & "</li>" & pageKubun
		Else
		 strLink = "?page=" & loop_cnt &  page_param
		 retVal = retVal & "<a href=""" & strLink & """ ><li>" & loop_cnt & "</li></a>" & pageKubun
		End If

	Next 

	' [다음] 페이지 조합 
	If is_next = TRUE Then
		go_next_page = start_page + page_per_block
		strLink = "?page=" & go_next_page & page_param
		retVal = retVal & chr(13)&chr(10)&"<a href=""" & strLink & """ ><li class=""page_next"" >&gt;</li></a>"&chr(13)&chr(10)
	Else 
		retVal = retVal & chr(13)&chr(10)&"<li class=""page_next"" >&gt;</li>"&chr(13)&chr(10)
	End If


	' [마지막페이지] 페이지 조합
	If current_block < total_num_of_block Then
		strLink = "?page=" & total_num_of_page & page_param
	'	retVal = retVal & chr(13)&chr(10)&"<li class=""selected"" ><a href=""" & strLink & """ ><img src=""/mobile/img/paging/next.png"" alt=""끝""></a></li>"&chr(13)&chr(10)
	End If
	
	retVal = retVal & "</ul>"
	

	paging = retVal

End Function

'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
' 설명 : 카테고리 문자열을 전달받아 가장 첫번째 카테고리 정보를 반환한다.
'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
Function cutCatrCode( ByVal arg_code )

	Dim get_catr_arr, extr_catr_loop, depth1_code, depth2_code

	depth1_code = ""

	If InStr( arg_code, "," ) > 0 Then 

		get_catr_arr = Split( arg_code , "," )

		For extr_catr_loop = 0 To Ubound( get_catr_arr ) 
			If ( Len( get_catr_arr(extr_catr_loop) ) > 3 ) Then 
				depth2_code = Trim( get_catr_arr(extr_catr_loop) )
				Exit For
			Else 
				If depth1_code = "" Then 
					depth1_code = Trim( get_catr_arr(extr_catr_loop) )
				End If 
			End If 
		Next 
		
		If depth2_code = "" Then 
			cutCatrCode = depth1_code
		Else 
			cutCatrCode = depth2_code
		End If 

	Else 
		cutCatrCode = Trim( arg_code )
	End If 

End Function 



'***********************************************
' 작성자 : 백승환
' 저널 광고 목록을 호출한다.
' ad_obj : 정보를 담을 객체
'***********************************************

Function getAdBannerList (ByVal page_name, ByRef ad_obj)

	Dim QueryTable, QueryCol, QueryWhere, QueryOrder, record_len, i, rs_ad, SQL_ad, ad_info_arr(), zone_id, zone_flag, db_obj

	Select Case page_name
		Case "main" : zone_flag = "1"
		Case "sub" : zone_flag = "2"
		Case "view" : zone_flag = "3"
		Case Else : zone_flag = "0"	'광고 미포함 페이지
	End Select 

	Set db_obj = db_conn.connection("health")
	i = 1

	'ZoneCode -> 1: 헬라, 2: 저널
	SQL_ad = "SELECT SEQ, ZoneID " &_
			" FROM HealthLife.dbo.AdZone " &_
			" WHERE SEQ IS NOT NULL AND Active ='1' AND ZoneCode = '3' " &_ 
			" AND ZoneFlag = '"& zone_flag &"' " &_ 
			" ORDER BY ZoneFlag ASC, ZoneIndex ASC "
'ZoneCode -> 1: 헬라, 2: 저널, 3:우리아이뉴스
	Set rs_ad = db_obj.Execute( SQL_ad  )
	
	If Not rs_ad.EOF Then 
		Set ad_obj = Server.CreateObject("Scripting.Dictionary")
		Do While Not rs_ad.EOF
			zone_id = rs_ad("ZoneID")
			Call getAdBannerInfo (zone_id, ad_info_arr)
			If UBound(ad_info_arr) > 0 Then 
				Call ad_obj.add(zone_id, ad_info_arr )
			End If 
			i = i + 1
			rs_ad.MoveNext()
		Loop
	End If 

	'Dim arr
	'arr = ad_obj.item("180626Z1024")
	'Response.write (vartype(ad_obj.item("180626Z1024")))
	'Response.write (arr(1).item("SEQ"))

	rs_ad.Close
	Set rs_ad = Nothing

	db_obj.close
	Set db_obj = Nothing
	
End Function ' // getAdBannerList

'***********************************************
' 작성자 : 백승환
' 저널 광고 정보를 호출한다.
' zone_id : 광고 키
' ad_info_arr : 정보를 담을 배열
'***********************************************

Function getAdBannerInfo (ByVal zone_id, ByRef ad_info_arr)

	Dim QueryTable, QueryCol, QueryWhere, QueryOrder, i, ad_len, rs_ad_info, SQL_ad_info, rs_count, db_obj
	
	Set db_obj = db_conn.connection("health")
	i = 1

	SQL_ad_info = "SELECT SEQ, AdID, ZoneID, AdName, AdLink, AdTarget, AdSource " &_
				" FROM HealthLife.dbo.AdInfo " &_
				" WHERE SEQ IS NOT NULL AND Active = '1' AND ( sDate <= getdate() AND eDate >= getdate() ) AND ( ( AdImpression < MaxImpression ) AND ( AdClick < MaxClick ) ) "&_
				" AND ZoneID = '"& zone_id &"' "&_
				" ORDER BY RegDate DESC "


	Set rs_ad_info = Server.CreateObject("ADODB.RecordSet")
	rs_ad_info.CursorLocation = 3
	rs_ad_info.Open SQL_ad_info, db_obj, 0, 1, 1

	ReDim Preserve ad_info_arr(rs_ad_info.recordcount)

	If Not rs_ad_info.Eof Then 
		Do While not rs_ad_info.eof	
			Set ad_info_arr(i) = Server.CreateObject("Scripting.Dictionary")
			Call ad_info_arr(i).add("SEQ", Trim( rs_ad_info("SEQ") ) )	
			Call ad_info_arr(i).add("AdID", Trim( rs_ad_info("AdID") ) )	
			Call ad_info_arr(i).add("ZoneID", Trim( rs_ad_info("ZoneID") ) )	
			Call ad_info_arr(i).add("AdName", Trim( rs_ad_info("AdName") ) )	
			Call ad_info_arr(i).add("AdLink", Trim( rs_ad_info("AdLink") ) )	
			Call ad_info_arr(i).add("AdTarget", Trim( rs_ad_info("AdTarget") ) )	
			Call ad_info_arr(i).add("AdSource", "http://img.healthi.kr" & Trim( rs_ad_info("AdSource") ) )	

			i = i + 1
			rs_ad_info.MoveNext()
		Loop
	End If 

	rs_ad_info.Close
	Set rs_ad_info = Nothing

End Function ' // getAdBannerInfo
'***********************************************
'	팝업 DB 호출
'***********************************************
Function getPopupInfo (ByVal zone_id)

	Dim i
	Dim rs_popup, SQL_popup
	Dim json_popup_arr(), make_tmp_json, db_obj

	i = 0
	db_obj = db_conn.connection("health")

	SQL_popup = " SELECT SEQ, AdID, AdType, AdName, AdMemo, AdLink, AdTarget, AdSource, AdWidth, AdHeight "&_
				" FROM AdInfo "&_
				" WHERE SEQ IS NOT NULL AND Active = '1' AND ( sDate <= getdate() AND eDate > getdate() ) AND ZoneID = '"& zone_id &"' "
	
	Set rs_popup = Server.CreateObject("ADODB.RecordSet")
	rs_popup.CursorLocation = 3
	
	rs_popup.Open SQL_popup, db_obj, 0, 1, 1

	ReDim Preserve json_popup_arr(rs_popup.recordcount)
	If Not rs_popup.Eof Then 
		Do While not rs_popup.eof	
			Set make_tmp_json = jsObject()

			make_tmp_json("popupID") = "P"&Trim( rs_popup("AdID") )
			make_tmp_json("linkPath") = Split(Trim( rs_popup("AdLink") ), ", ")
			make_tmp_json("linkTarget") = Split(Trim( rs_popup("AdTarget") ), ", ")
			make_tmp_json("imgSrc") = Split(Trim( rs_popup("AdSource") ), ", ")
			make_tmp_json("popupPosition") = Trim( rs_popup("AdHeight") ) & "_" & Trim( rs_popup("AdWidth") )
			make_tmp_json("popupImgScale") = Trim( rs_popup("AdMemo") )
			If Trim( rs_popup("AdType") ) = 0 Then
				make_tmp_json("useModalMode") = False
			Else 
				make_tmp_json("useModalMode") = True
			End If 
			
			Set json_popup_arr(i) = make_tmp_json

			i = i + 1
			rs_popup.MoveNext()
		Loop
	End If 

	getPopupInfo = toJSON( json_popup_arr )

	rs_popup.Close
	Set rs_popup = Nothing

	Set db_obj = Nothing

End Function ' // getPopupInfo

%>
