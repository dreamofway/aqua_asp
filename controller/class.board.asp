<%
Class board

	Private Sub Class_Initialize() 

	END Sub
	
	Private Sub Class_Terminate() 
	END Sub

	Public Sub list()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val
		Dim db_obj, rs, query
		Dim query_select, query_from, query_where, query_orderby, add_where, bid_query
		Dim side_first_rs, side_second_rs

		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )


		If (page = "" ) Then 
			page = 1
		End If 

		If (size = "" ) Then 
			size = 10
		End If 
		
		list_name = "ChildcareInfo"

		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size
		
		add_where = ""

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )

		' 어린이집 목록을 조회한다.
		If ( search_type <> "" ) And ( search_keyword <> "" ) Then 
			add_where = add_where & " AND ( "& search_type &" LIKE '%"& search_keyword &"%' ) "
		Else 
			If search_keyword <> "" Then 
				add_where = add_where & " AND ( ( InfoTitle LIKE '%"& search_keyword &"%' ) or ( InfoContent LIKE '%"& search_keyword &"%') ) "
			End If 
		End If 
		
		If bid = "" Then 
			Call wm.moveHandler("back", "잘못된 접근입니다.", "" )
		Else 
			If bid = "pregnant" Then
				bid_query = " AND ( ChildInfoType LIKE '5%' ) "
			ElseIf bid = "childcare" Then
				bid_query = " AND ( ChildInfoType LIKE '6%' ) "
			Else 
				bid_query = " AND ( ChildInfoType='"& bid &"' ) " 
			End If 
			
		End If 
		
		
		query_select =	" *, ( convert(varchar(16), RegDate, 120) ) AS conv_reg_date "
		query_from = " ChildcareInfo "
		query_where = " ( DelFlag = 0 )  " & bid_query & add_where
		query_orderby = " RegDate DESC "
		
		'--------------------------------------------------------------------
		' 페이징 초기화
		'--------------------------------------------------------------------
		Call wm.setPagingData( list_name, "use_db", "kids" )
		Call wm.setPagingData( list_name, "query_select", query_select )
		Call wm.setPagingData( list_name, "query_from", query_from )
		Call wm.setPagingData( list_name, "query_where", query_where )
		Call wm.setPagingData( list_name, "query_orderby", query_orderby )
		Call wm.setPagingData( list_name, "page_param", get_val )
		Call wm.setPagingData( list_name, "page_per_block", size )
		Call wm.setPagingData( list_name, "page", page )
		Call wm.setPagingData( list_name, "size", size )

		Call wm.setViewVal( "list_class", list_class )
		Call wm.setViewVal( "bid", bid )
		Call wm.setViewVal( "search_type", search_type )
		Call wm.setViewVal( "search_keyword", search_keyword )
		Call wm.setViewVal( "page", page )
		Call wm.setViewVal( "size", size )
		Call wm.setViewVal( "get_val", get_val )
		Call wm.setViewVal( "cUserID", cUserID )
		Call wm.setViewVal( "side_first_rs", side_first_rs )
		Call wm.setViewVal( "side_second_rs", side_second_rs )

		Call wm.setViewVal( "list_name", list_name )
		Call wm.setViewVal( "board_name", getBoardName( bid ) )
		Call wm.setViewVal( "list_rs", wm.sqlExecuteList( "kids", list_name ) )
		Call wm.setViewVal( "total_count", wm.getPagingData( list_name, "total_count" ) )
		

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/board_list.asp"
		Call wm.display( "boardList",  inc_file_path )

	End Sub '// list
	

	Public Sub view()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs


		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )

		' 정보를 호출
		query = "SELECT * ,( convert(varchar(16), RegDate, 120) ) AS conv_reg_date FROM ChildcareInfo WHERE IDX='"& idx &"' "
		Set rs = db_obj.Execute( query )

		If rs.Eof Or rs.Bof Then 
			Call wm.moveHandler("replace", "존재하지 않는 게시물입니다.", "/board/list?page="& page & "&" & get_val )
		Else 

			' viewCnt update
			update_query =	" UPDATE ChildcareInfo SET  " & _
							"						HitCount = HitCount + 1 " & _
							" WHERE IDX = '"& idx &"' "
			

			db_obj.Execute( update_query )

			InfoTitle = nullToSpace( rs("InfoTitle") )
			InfoContent = nullToSpace( rs("InfoContent") )
			HitCount = nullToSpace( rs("HitCount") )
			WriterID = nullToSpace( rs("WriterID") )
			WriterName = nullToSpace( rs("WriterName") )
			Regdate = nullToSpace( rs("conv_reg_date") )
			
		End If 
		
		Call wm.setViewVal( "InfoTitle", InfoTitle )
		Call wm.setViewVal( "InfoContent", InfoContent )
		Call wm.setViewVal( "HitCount", HitCount ) 
		Call wm.setViewVal( "Regdate", Regdate )		
		Call wm.setViewVal( "WriterID", WriterID )		
		Call wm.setViewVal( "WriterName", WriterName )		
		Call wm.setViewVal( "board_name", getBoardName( bid ) )
		
		Call wm.setViewVal( "mode", mode )
		Call wm.setViewVal( "idx", idx )
		Call wm.setViewVal( "list_class", list_class )
		Call wm.setViewVal( "bid", bid )
		Call wm.setViewVal( "search_type", search_type )
		Call wm.setViewVal( "search_keyword", search_keyword )
		Call wm.setViewVal( "page", page )
		Call wm.setViewVal( "size", size )
		Call wm.setViewVal( "get_val", get_val )

		Call wm.setViewVal( "side_first_rs", side_first_rs )
		Call wm.setViewVal( "side_second_rs", side_second_rs )


		Call wm.setViewVal( "cUserID", wm.getVal( "cUserID" ) )
		Call wm.setViewVal( "cUserNick", wm.getVal( "cUserNick" ) )
		
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/board_view.asp"
		Call wm.display( "boardWrite",  inc_file_path )

	End Sub ' // view

	Public Sub wfe()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs


		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/wfe_view.asp"
		Call wm.display( "waitingForEntranceView",  inc_file_path )

	End Sub ' // wfe

	Public Sub voucher()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs


		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/voucher_view.asp"
		Call wm.display( "voucherView",  inc_file_path )

	End Sub ' // voucher

	Public Sub kidscard()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs


		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/kidcard_view.asp"
		Call wm.display( "kidcardView",  inc_file_path )

	End Sub ' // kidscard

	Public Sub inconven_report()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs


		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/report_view.asp"
		Call wm.display( "reportView",  inc_file_path )

	End Sub ' // inconven_report

	Public Sub parttime()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs


		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		bid = wm.getParam( "bid" )
		search_type = wm.getParam( "search_type" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&bid=" & bid &_
					"&search_type=" & search_type &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/time_view.asp"
		Call wm.display( "timeView",  inc_file_path )

	End Sub ' // parttime
	
	Public Sub disclosure_summary()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/disclosure_summary.asp"
		Call wm.display( "disclosureSummary",  inc_file_path )

	End Sub ' // disclosure_summary

	Public Sub disclosure_item()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, bid, search_type, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query, update_query
		
		Dim InfoTitle, InfoContent, HitCount, Regdate, WriterID, WriterName

		Dim side_first_rs, side_second_rs

		Set db_obj = db_conn.connection( "kids" )
		
		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )
		
		Call wm.setViewVal( "side_first_rs", side_first_rs )

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/board/disclosure_item.asp"
		Call wm.display( "disclosureItem",  inc_file_path )

	End Sub ' // disclosure_item


	
	

	Private Function getBoardName( ByVal arg_code )

		Dim board_name

		Select Case arg_code	
			Case "pregnant"
				board_name = "임신/출산"
			Case "childcare"
				board_name = "육아"
			Case "01"
				board_name = "서울형어린이집"
			Case "02"
				board_name = "보육뉴스"
			Case "03"
				board_name = "보육자료실"
			Case "04"
				board_name = "아이들 추천도서"
			Case "05"
				board_name = "나들이장소"
			Case "06"
				board_name = "건강상식"
			Case "07"
				board_name = "정책뉴스"
			Case "31"
				board_name = "아이행복카드"
			Case "32"
				board_name = "긴급 보육바우처"
			Case "33"
				board_name = "시간제 보육사업"
			Case "34"
				board_name = "어린이집 이용 불편 신고센터"
			Case "36"
				board_name = "소통 · 참여"
			Case "41"
				board_name = "정책뉴스"
			Case "42"
				board_name = "건강정보"
			Case "44"
				board_name = "통합공시개요"
			Case "45"
				board_name = "관련법령"
			Case "46"
				board_name = "공시항목"
			Case "47"
				board_name = "육아상식"
			Case "48"
				board_name = "홍보 · 알림"
			Case "49"
				board_name = "내아이 예방접종  ·  건강검진"
			Case "52"
				board_name = "아이건강"
			Case "61"
				board_name = "보육지원"
		End Select 

		getBoardName = board_name

	End Function 
End Class 
%>