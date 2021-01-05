<%
	Class rss
		
		'***********************************************
		' RSS 목록을 생성한다.
		'***********************************************
		Public Sub list() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query

			page = wm.getParam("page")
			size = wm.getParam("size")
			catr = wm.getParam("catr")
			search_type = wm.getParam("search_type")
			search_keyword = wm.getParam("search_keyword")
			cno = wm.getParam("cno")
			
			get_value = ""
			get_value = get_value &  "catr="&catr
			get_value = get_value &  "&size="&size
			get_value = get_value &  "&search_type="&search_type
			get_value = get_value &  "&search_keyword="&search_keyword
			get_value = get_value &  "&cno="&cno
			
			If catr = "" Then 
			'	Response.Redirect "/news/list?catr=11"
			End If 

			If page = "" Then 
				page = 1
			End If 

			If size = "" Then 
				size = 10
			End If
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()

			' 기자 정보를 가져온다.
			Call setWriterInfo()
			
			Set db_obj = db_conn.connection( "kids" )
			
			Call wm.setVal( "get_value", get_value )
			
			Response.ContentType = "text/xml"

			' 목록 함수 호출
			news_row = getNewsPage( _
				"news_list" _
				, "kids" _
				, false _
				, false _
				, "" _
				, page _
				, size _
				, "lately" _ 
				, wm.getParam( "catr" ) _
				, wm.getParam( "search_type" ) _
				, wm.getParam( "search_keyword" ) _
			)
			
			
			Call wm.setViewVal( "catr", catr )
			Call wm.setViewVal( "page", page )
			Call wm.setViewVal( "size", size )
			Call wm.setViewVal( "get_value", get_value )
			Call wm.setViewVal( "news_row", news_row )

			inc_file_path = wm.user_view_path & "/rss/list.asp"
			
			Call wm.display( "getRssList",  inc_file_path )

		END Sub  '// list
		
		
	End Class 
%>