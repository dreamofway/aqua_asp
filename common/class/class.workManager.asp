<%
'---------------------------------------------------------------------
' 설명 : 사이트 전반적인 데이터 저장 및 기본 메소드 제공
'---------------------------------------------------------------------
' 작성자 : IT사업부 과장 이정훈
' 작성일 : 2017.04.03
'---------------------------------------------------------------------
' 메소드 목록
'---------------------------------------------------------------------
' setVal() : 페이지에서 사용될 값을 설정한다.
' getVal() : 설정된 값을 반환 한다.
' dataAll() : 설정된 모든 값을 반환 한다.
' getHttpRequest() : http 요청에 대한 파라미터 체크를 수행하고 전역 변수 data에 할당한다.
'---------------------------------------------------------------------

Class workManager

	Private data ' 전역 적으로 사용할 Dictionary 객체 할당 변수
	Private request_parameter_key ' http request parameter 값을 저장할 key 값을 지정한다.

	Public admin_view_path ' 관리자 사이트 view 파일 경로
	Public user_view_path ' 사용자 사이트 view 파일 경로
	Public use_upload_obj ' ABC / SG
	Public upload_component ' 업로드 컴포넌트 인스턴스 객체
	Public image_domain ' 이미지 도메인
	Public image_path ' 이미지 경로
	Public image_upload_path ' 이미지 업로드 경로
	Public user_ip ' 접속자 아이피
	Public meta_title ' meta tag title
	Public meta_description ' meta tag description
	Public site_domain ' site domain
	Public site_referer ' 이전 페이지
	Public current_url ' 현재 파일 경로
	Public current_query_string ' 현재 파일 경로
	Public ogp_title ' SNS 공유 제목
	Public ogp_stitle_name ' SNS 공유 제목
	Public ogp_url ' SNS 공유 url
	Public ogp_description ' SNS 공유 설명
	Public ogp_image ' SNS 공유 이미지
	Public meta_keywords ' SNS 공유 키워드
	Public current_path_arr
	
	Private Sub Class_Initialize() 
		
		Set data = Server.CreateObject("Scripting.Dictionary")

		user_ip = getServerVal( "REMOTE_ADDR" )
		site_domain = getServerVal( "SERVER_NAME" )
		current_url = getServerVal( "URL" )
		current_query_string = getServerVal( "QUERY_STRING" )
		site_referer = getServerVal( "HTTP_REFERER" )

		request_parameter_key = "request_parameter"

		If data.Exists( "view_val" ) = False Then 			
			Call data.add( "view_val",  Server.CreateObject("Scripting.Dictionary") )
		End If 	
		
	END Sub  
	
	Private Sub Class_Terminate() 
		Set data = Nothing
	END Sub
	
	'-------------------------------------------------------
	' 변수처럼 사용할 데이터를 설정한다.
	'-------------------------------------------------------
	Public Sub setVal( ByVal arg_key, ByVal arg_value  ) 
		
		arg_key = LCase( Trim( arg_key ) )

		If data.Exists( arg_key ) = True Then 			
			data.Item( arg_key ) = arg_value
		Else			
			Call data.add( arg_key, arg_value )
		End If 
		
	End Sub ' setVal

	'-------------------------------------------------------
	' 설정된 데이터를 반환 한다.
	'-------------------------------------------------------
	Public Function getVal( ByVal arg_key ) 
		
		Dim result : result = ""
		
		arg_key = LCase( Trim( arg_key ) )
		
		If data.Exists( arg_key ) = True Then 
			
			If TypeName( data.item( arg_key ) ) = "Dictionary" Then 
				Set result = data.item( arg_key )
			Else 
				result = data.item( arg_key )
			End If 
			
		End If 

		If TypeName( data.item( arg_key ) ) = "Dictionary" Then 
			Set getVal = result
		Else 
			getVal = result
		End If 

	End Function ' getVal
	
	Public Function dataAll()
		Set dataAll = data
	End Function ' // dataAll
	
	'***********************************************
	' 페이지에서 사용할 변수를 선언한다.
	'***********************************************
	Public Sub setViewVal( ByVal arg_key, ByVal arg_value )
		
		arg_key = LCase( Trim( arg_key ) )

		
		If data.Item( "view_val" ).Exists( arg_key ) = True Then 	
		
			If TypeName( arg_value ) = "Recordset" Then 
				Set data.Item( "view_val" ).Item( arg_key ) = arg_value
			Else 
				data.Item( "view_val" ).Item( arg_key ) = arg_value
			End If 

		Else		
		
			If TypeName( arg_value ) = "Recordset" Then 
				Call data.Item( "view_val" ).add( arg_key, "" )
				Set data.Item( "view_val" ).Item( arg_key ) = arg_value
			Else 
				Call data.Item( "view_val" ).add( arg_key, arg_value )
			End If 
			
		End If 
		
	End Sub 

	'***********************************************
	' 페이지에서 사용할 변수를 반환한다.
	'***********************************************
	Public Function getViewVal()
		
		Set getViewVal = data.item("view_val")

	End Function 

	'***********************************************
	' http 전송 - post / get 으로 넘겨 받은 값을 체크하고 DIC 변수에 할당한다.
	' arg_key : 사용할 key 값
	' arg_value :  key 에 대입 될 값
	'***********************************************
	Public Sub setParam( ByVal arg_key, ByVal arg_value  ) 
		
		arg_key = Trim( arg_key )

		If data.Exists( request_parameter_key ) = false Then
			Call data.add( request_parameter_key, Server.CreateObject("Scripting.Dictionary") )
		End If 

		If data.Item( request_parameter_key ).Exists( arg_key ) = false Then
			Call data.Item( request_parameter_key ).add( arg_key , Server.CreateObject("Scripting.Dictionary") )
		End If 
		
		If data.Item( request_parameter_key ).Exists( arg_key ) = True Then 
			data.item( request_parameter_key ).item( arg_key ) = arg_value
		Else
			Call data.item( request_parameter_key ).add( arg_key, arg_value )
		End If 

	End Sub ' setParam

	'***********************************************
	' http 전송 - post / get 으로 넘겨 받아 DIC 변수에 할당된 값을 반환 한다.
	' arg_key : 사용할 key 값
	'***********************************************
	Public Function getParam( ByVal arg_key )
		
		Dim result : result = ""
	
		arg_key = Trim( arg_key )
		
		If data.Exists( request_parameter_key ) = True Then 
			If data.item( request_parameter_key ).Exists( arg_key ) = True Then 
				result = data.item( request_parameter_key ).item( arg_key )
			End If 
		End If 
		

		getParam = result

	End Function ' // getParam

	'***********************************************
	' http 요청에 대한 파라미터 체크를 수행하고 전역 변수 data에 할당한다.
	' arg_tesk_type : 작업처리 형식 - get = 각 파라미터 값을 할당 / show = 파라미터 값을 브라우저에 노출
	'***********************************************
	Public Sub getHttpRequest( ByVal arg_tesk_type )
		
		Dim injection_result 

		If Request.ServerVariables("REQUEST_METHOD") = "POST" Then 
			' post 전송 방식에 대한 처리
			If instr(1, Request.ServerVariables("HTTP_CONTENT_TYPE"), "multipart/form-data") = 0 Then
				' 일반 post 방식을 처리한다.

				injection_result = getHttpRequestPostHandler( arg_tesk_type )

			Else
				' 업로드 컴포넌트를 이용하여 데이터를 처리한다.	
				injection_result = getHttpRequestUploadComponentHandler( arg_tesk_type )
			end If

		Else 
			
			injection_result = getHttpRequestGetHandler( arg_tesk_type )

		End If 
		
		If injection_result = True Then 

			Response.write "<br /> injection 공격이 감지 되었습니다. <br />"
			Response.End 

		End If 

	End Sub ' // getHttpRequest

	'***********************************************
	' 업로드 컴포넌트를 전역변수 data에 할당하고 반환한다.
	'***********************************************
	Public Sub getUploadComponentObject()
		
		
		use_upload_obj = UCase( use_upload_obj )

		If use_upload_obj = "ABC" Then
			Set upload_component = Server.CreateObject("ABCUpload4.XForm")
			upload_component.CodePage = 65001 '949=한글
			upload_component.AbsolutePath = True
			upload_component.Overwrite = true
			'upload_component.MaxUploadSize = 1024000
		ElseIf use_upload_obj = "SG" Then 
			Set upload_component = Server.CreateObject("SiteGalaxyUpload.Form")
		Else 
			Response.write "<br /> 업로드 컴포넌트 설정이 필요합니다. <br />"
			Response.End 
		End If 

	End Sub '// getUploadComponentObject
	
	'***********************************************
	' GET 요청에 대한 체크를 수행하고 전역 변수 data에 할당한다.
	' arg_tesk_type : 작업처리 형식 - get = 각 파라미터 값을 할당 / show = 파라미터 값을 브라우저에 노출
	'***********************************************
	Private Function getHttpRequestGetHandler( ByVal arg_tesk_type )

		Dim param_key, param_idx, get_array(), get_array_idx, injection_state
		Dim show_text 

		injection_state = False 

		show_text = show_text & "<pre>"

		For each param_key in Request.QueryString
			
			If Request.QueryString( param_key ).Count > 1 Then
				
				show_text = show_text & param_key & " => Array ( <br />"

				ReDim Preserve get_array( 0 )

				For param_idx = 1 to Request.QueryString( param_key ).Count

					get_array_idx = (param_idx - 1 )
					
					show_text = show_text & param_key & " &#09;&#09; ["& get_array_idx &"] => "& Trim( Request.QueryString( param_key )( param_idx ) ) & "<br />"

					ReDim Preserve get_array( get_array_idx )

					get_array( get_array_idx ) = Trim( Request.QueryString( param_key )( param_idx ) )
					
					injection_state = httpRequestInjectionCheck( Request.QueryString( param_key )( param_idx ) )

					If injection_state = True Then 
						Exit For
					End If 
				Next
				
				show_text = show_text & " ) <br /> "

				Call setParam( param_key,  get_array )

			Else
				
				show_text = show_text & param_key & " => "& Trim( Request.QueryString( param_key )( 1 ) ) & "<br />"

				Call setParam( param_key, Trim( Request.QueryString( param_key )( 1 ) ) )

				injection_state = httpRequestInjectionCheck( Request.QueryString( param_key )( 1 ) )

				If injection_state = True Then 
					Exit For
				End If 

			End If 
			
			If injection_state = True Then 
				Exit For
			End If 

		Next
		
		show_text = show_text &  "</pre>"
		
		If arg_tesk_type = "show" Then 
			Response.write show_text
		End If 

		getHttpRequestGetHandler = injection_state

	End Function ' // getHttpRequestGetHandler
	

	'***********************************************
	' POST 요청에 대한 체크를 수행하고 전역 변수 data에 할당한다.
	' arg_tesk_type : 작업처리 형식 - get = 각 파라미터 값을 할당 / show = 파라미터 값을 브라우저에 노출
	'***********************************************
	Private Function getHttpRequestPostHandler( ByVal arg_tesk_type )

		Dim param_key, param_idx, get_array(), get_array_idx, injection_state
		Dim show_text 

		injection_state = False 

		show_text = show_text & "<pre>"

		For each param_key in REQUEST.FORM
			
			If REQUEST.FORM( param_key ).Count > 1 Then
				
				show_text = show_text &  param_key & " => Array ( <br />"

				ReDim Preserve get_array( 0 )

				For param_idx = 1 to REQUEST.FORM( param_key ).Count

					get_array_idx = (param_idx - 1 )
					
					show_text = show_text & " &#09;&#09; ["& get_array_idx &"] => "& Trim( REQUEST.FORM( param_key )( param_idx ) ) & "<br />"
					
					ReDim Preserve get_array( get_array_idx )

					get_array( get_array_idx ) = Trim( REQUEST.FORM( param_key )( param_idx ) )

					injection_state = httpRequestInjectionCheck( REQUEST.FORM( param_key )( param_idx ) )

					If injection_state = True Then 
						Exit For
					End If 

				Next
				
				show_text = show_text & " ) <br /> "

				Call setParam( param_key,  get_array )

			Else
				
				show_text = show_text &  param_key & " => "& Trim( REQUEST.FORM( param_key )( 1 ) ) & "<br />"

				Call setParam( param_key, Trim( REQUEST.FORM( param_key )( 1 ) ) )

				injection_state = httpRequestInjectionCheck( REQUEST.FORM( param_key )( 1 ) )

				If injection_state = True Then 
					Exit For
				End If 

			End If 
			
			If injection_state = True Then 
				Exit For
			End If 

		Next
		
		show_text = show_text &  "</pre>"

		If arg_tesk_type = "show" Then 
			Response.write show_text
		End If 
		
		getHttpRequestPostHandler = injection_state

	End Function ' // getHttpRequestPostHandler

	'***********************************************
	' multipart/form-data 요청에 대한 체크를 수행하고 전역 변수 data에 할당한다.
	' arg_tesk_type : 작업처리 형식 - get = 각 파라미터 값을 할당 / show = 파라미터 값을 브라우저에 노출
	'***********************************************
	Function getHttpRequestUploadComponentHandler( ByVal arg_tesk_type )
		
		Dim param_key, param_idx, get_array(), get_array_idx, injection_state, file_type, param_str
		Dim show_text

		injection_state = False 
		
		show_text = show_text & "<pre>"
		
		If LCase( use_upload_obj ) = "abc" Then 

			Call getUploadComponentObject()
			

			For each param_key in upload_component
				
				If upload_component( param_key ).Count > 1 Then 
					
					show_text = show_text & param_key & " => Array ( <br />"

					ReDim Preserve get_array( 0 )

					For param_idx = 1 to upload_component( param_key ).Count
					
						get_array_idx = (param_idx - 1 )
						
						Set file_type = upload_component( param_key )( param_idx )
						
						If file_type.FileExists = True Then
							param_str = Trim( file_type.RawFileName )
							
							show_text = show_text & " &#09;&#09; ["& get_array_idx &"] => "& param_str & "<br />"

							Call setParam( param_key, param_str )

						Else 
							
							param_str = Trim( upload_component( param_key )( param_idx ) )
							
							show_text = show_text & " &#09;&#09; ["& get_array_idx &"] => "& param_str & "<br />"

							ReDim Preserve get_array( get_array_idx )

							get_array( get_array_idx ) = param_str

						End If 
						
						injection_state = httpRequestInjectionCheck( param_str )

						If injection_state = True Then 
							Exit For
						End If 

					Next
					
					show_text = show_text & " ) <br /> "
					
					Call setParam( param_key,  get_array )

				Else 
					
					Set file_type = upload_component( param_key )( 1 )
						
					If file_type.FileExists = True Then
						
						param_str = Trim( file_type.RawFileName )
						
						show_text = show_text & param_key & " => "& param_str & "<br />"

						Call setParam( param_key, param_str )
						
					Else 
						
						param_str = Trim( upload_component( param_key )( 1 ) )
						
						Call setParam( param_key, param_str )
						
						show_text = show_text & param_key & " => "& param_str & "<br />"
						
					End If 

					injection_state = httpRequestInjectionCheck( param_str )

					If injection_state = True Then 
						Exit For
					End If 


				End If 
				
				If injection_state = True Then 
					Exit For
				End If 

			Next

		ElseIf LCase( use_upload_obj ) = "sg" Then 
			' SiteGalaxyUpload 컴포넌트 사용시 
			Set upload_component = Server.CreateObject("SiteGalaxyUpload.Form") 
		Else 
			Call errorHandler("view", "getHttpContents", "upload_component 설정이 필요합니다." )
		End If 
		
		show_text = show_text & "</pre>"

		If arg_tesk_type = "show" Then 
			Response.write show_text
		End If 
		
		getHttpRequestUploadComponentHandler = injection_state

	End Function ' // getHttpRequestUploadComponentHandler

	'***********************************************
	' 인자 값의 injection 공격 유효성을 체크한다.
	' arg_value : 확인 대상
	'***********************************************
	Private Function httpRequestInjectionCheck( ByVal arg_value )

		Dim injection_check_arr, injection_result, check_loop

		injection_result = False
		
		injection_check_arr = Array(_
			
			 "@variable" _
			, "@@variable" _
			, "+" _
			, " print " _
			, " set " _
			, "%" _
			, "<script>" _
			, "<SCRIPT>" _
			, "script" _
			, "SCRIPT" _
			, "or " _
			, "union " _
			, "and " _			
			, "openrowset " _
			, "xp_ " _
			, "XP_ " _
			, "decare " _
			, "DECLARE " _
			, "insert " _
			, "INSERT " _
			, "select " _
			, "SELECT " _
			, "update " _
			, "UPDATE " _
			, "delete " _
			, "DELETE " _
			, "shutdown " _
			, "SHUTDOWN " _
			, "drop " _
			, "DROP " _
			, "--" _
			, "/*" _
			, "*/" _
		)

		For check_loop = 0 to Ubound( injection_check_arr )

			If InStr( 1, arg_value ,injection_check_arr( check_loop ), 1 ) > 0 Then

				injection_result = True

				Response.write "<br /> injection_result : " & injection_check_arr( check_loop ) & "<br />"

				Exit For 

			End If
		Next
		
		httpRequestInjectionCheck = injection_result

	End Function ' // httpRequestInjectionCheck

	'***********************************************
	' 페이징 데이터를 정의한다.
	' paging_id : 페이징 아이디
	' arg_key : 정의 키
	' arg_value : key 의 내용
	'***********************************************
	Public Sub setPagingData( ByVal paging_id, ByVal arg_key, ByVal arg_value )
		
		paging_id = LCase( Trim( paging_id ) )
		arg_key = LCase( Trim( arg_key ) )

		If data.Exists( "paging" ) = false Then
			Call data.add( "paging", Server.CreateObject("Scripting.Dictionary") )
		End If 

		If data.Item("paging").Exists( paging_id ) = false Then
			Call data.Item("paging").add( paging_id , Server.CreateObject("Scripting.Dictionary") )
			Call data.Item("paging").item( paging_id ).add( paging_id & "_page", "" )
			Call data.Item("paging").item( paging_id ).add( paging_id & "_size", "" )
		End If 
		
		If data.Item("paging").item( paging_id ).Exists( arg_key ) = True Then 
			data.Item("paging").item( paging_id ).item( arg_key ) = arg_value
		Else
			Call data.Item("paging").item( paging_id ).add( arg_key, arg_value )
		End If 

	End Sub ' // setPagingData
	
	'***********************************************
	' 페이징 데이터를 요청한다.
	' paging_id : 페이징 아이디
	' arg_key : 요청 키
	'***********************************************
	Public Function getPagingData( ByVal paging_id, ByVal arg_key )
		
		Dim result : result = ""
		
		paging_id = LCase( Trim( paging_id ) )
		arg_key = LCase( Trim( arg_key ) )

		If data.Item("paging").item( paging_id ).Exists( arg_key ) = True Then 
			result = data.Item("paging").item( paging_id ).item( arg_key )
		End If 

		getPagingData = result
		
	End Function '// getPagingData

	'***********************************************
	' 페이징이 있는 목록에서 사용하는 SQL 문을 실행한다.
	' paging_id : 페이징 아이디
	'***********************************************
	Public Function sqlExecuteList( ByVal use_db, ByVal paging_id )
		Dim query_select, query_from, query_where, query_orderby, page, size, rs, re_query, total_count
		Dim db_obj, query
		Dim total_page, limit_start, limit_end

		query_select = getPagingData( paging_id, "query_select" )
		query_from = getPagingData( paging_id, "query_from" )
		query_where = getPagingData( paging_id, "query_where" )
		query_orderby = getPagingData( paging_id, "query_orderby" )
		page = getPagingData( paging_id, "page" )
		size = getPagingData( paging_id, "size" )
		
		If use_db = "" Then 
			Call errorHandler("view", "sqlExecuteList", "use_db 설정이 필요합니다. <br /> setPagingData 함수를 이용하여 정의를 먼저해주세요." )
		End If 

		If query_select = "" Then 
			Call errorHandler("view", "sqlExecuteList", "query_select 설정이 필요합니다. <br /> setPagingData 함수를 이용하여 정의를 먼저해주세요." )
		End If 

		If query_from = "" Then 
			Call errorHandler("view", "sqlExecuteList", "query_from 설정이 필요합니다. <br /> setPagingData 함수를 이용하여 정의를 먼저해주세요." )
		End If 

		If query_orderby = "" Then 
			Call errorHandler("view", "sqlExecuteList", "query_orderby 설정이 필요합니다. <br /> setPagingData 함수를 이용하여 정의를 먼저해주세요." )
		End If 

		If page = "" Then 
			Call errorHandler("view", "sqlExecuteList", "paging page 설정이 필요합니다. <br /> setPagingData 함수를 이용하여 정의를 먼저해주세요." )
		End If 
		
		If size = "" Then 
			Call errorHandler("view", "sqlExecuteList", "paging size 설정이 필요합니다. <br /> setPagingData 함수를 이용하여 정의를 먼저해주세요." )
		End If
	
		If query_where = "" Then 
			query_where = " 1=1 "
		End If 

		'--------------------------------------------------------------------
		' DB 연결
		'--------------------------------------------------------------------
		Set db_obj = db_conn.connection( use_db )
		
		query = " SELECT COUNT(*) AS total_count FROM ( SELECT " &_
							query_select &_
				" FROM " & query_from &_
				" WHERE " & query_where & " ) AS t_get_count "
			
		Set rs = db_obj.Execute( query )

		total_count = rs("total_count")
		
		total_page = Ceil( total_count / size )
		
		If CInt( page ) > CInt( total_page ) Then 
			page = CInt( total_page )
		End If 
		
		limit_start = ( ( page - 1 ) * size ) + 1
		limit_end = ( ( page - 1 ) * size ) +  size

		re_query =	" SELECT * FROM (" &_
					"	SELECT ROW_NUMBER() OVER( ORDER BY "& query_orderby &" ) AS row_num, "& query_select &_
					"	FROM " & query_from & " WHERE " & query_where &_
					" ) AS t_list WHERE row_num >= " & limit_start & " AND row_num <= " & limit_end & " ORDER BY row_num ASC "

		Set rs = db_obj.Execute( re_query )
		
		Call wm.setPagingData( paging_id, "total_page", total_page )
		Call wm.setPagingData( paging_id, "total_count", total_count )
		
	
		Set sqlExecuteList = rs

		'--------------------------------------------------------------------
		' DB 연결 종료
		'--------------------------------------------------------------------
'		db_obj.close
'		Set db_obj = Nothing

	End Function ' //sqlExecuteList

	'***********************************************
	' 에러에 대한 처리를 한다.
	' arg_type : view - 화면에 노출 / send - 관리자에게 알림을 보낼 수 있도록 조치( 미개발 )
	'***********************************************
	Public Sub errorHandler( ByVal arg_type, ByVal arg_fn_name, ByVal arg_message )
		Dim error_html
		
		error_html = ""

		Select Case arg_type
			Case "view" ' 일반노출

				error_html = error_html & "<div style=""width:100%;"" >"
				error_html = error_html & "	<div style=""margin:0 auto;width:600px;background-color:#330000;color:#ff0000"" >"
				error_html = error_html & "		<hr />"
				error_html = error_html & "		ERROR - INFO <br />"
				error_html = error_html & "		<hr /><br />"
				error_html = error_html & "		FUNCTION : "& arg_fn_name &" <br /><br />"
				error_html = error_html & "		<hr />"
				error_html = error_html & "		ERROR - DESCRIPTION <br />"
				error_html = error_html & "		<hr /><br />"
				error_html = error_html & "		" & arg_message
				error_html = error_html & "	</div>"
				error_html = error_html & "</div>"

				Response.write error_html
				Response.End 

			Case "send" ' 관리자에게 전달

				error_html = error_html & "<div style=""width:100%;"" >"
				error_html = error_html & "	<div style=""margin:0 auto;width:600px;background-color:#330000;color:#ff0000\"" >"
				error_html = error_html & "		<hr />"
				error_html = error_html & "		ERROR - INFO <br />"
				error_html = error_html & "		<hr /><br />"
				error_html = error_html & "		HTTP_HOST : "& strDomain &" <br /><br />"
				error_html = error_html & "		FILENAME : "& arg_fn_name &" <br /><br />"
				error_html = error_html & "		QUERYSTRING : "& strQueryString &" <br /><br />"
				error_html = error_html & "		FUNCTION : "& arg_fn_name &" <br /><br />"
				error_html = error_html & "		REQUEST_TIME : "& arg_fn_name &" <br /><br />"
				error_html = error_html & "		<hr />"
				error_html = error_html & "		ERROR - DESCRIPTION <br />"
				error_html = error_html & "		<hr /><br />"
				error_html = error_html & "		" & arg_message
				error_html = error_html & "	</div>"
				error_html = error_html & "</div>"
			
			Case Else 

				error_html = ""
				error_html = error_html & "<div style=""width:100%;"" >"
				error_html = error_html & "	<div style=""margin:0 auto;width:600px;background-color:#330000;color:#ff0000\"" >"
				error_html = error_html & "		<hr />"
				error_html = error_html & "		ERROR - INFO <br />"
				error_html = error_html & "		<hr /><br />"
				error_html = error_html & "		FUNCTION : errorHandler() <br /><br />"
				error_html = error_html & "		<hr />"
				error_html = error_html & "		ERROR - DESCRIPTION <br />"
				error_html = error_html & "		<hr /><br />"
				error_html = error_html & "		정의되지 않은 타입 - " & arg_type
				error_html = error_html & "	</div>"
				error_html = error_html & "</div>"

				Response.write error_html

		End Select 
		
	End Sub ' // errorHandler
	
	Public Sub display( ByVal arg_sub_name, ByVal arg_path )
		Call rw.addDisplaySub( arg_sub_name,  arg_path )
		execute( "Call " & arg_sub_name )
	End Sub 

	'***********************************************
	' 알림을 보여주거나 페이지를 이동한다.
	'***********************************************
	Public Sub moveHandler( ByVal arg_type, ByVal arg_message, ByVal arg_move_path )
		
		Response.Redirect "/notification.asp?arg_type=" & arg_type & "&arg_message=" & arg_message & "&arg_move_path=" & Server.URLEncode( arg_move_path )

	End Sub 

	'***********************************************
	' 쿠키를 생성한다.
	'***********************************************
	Public Sub writeCookies(ByVal CookieName1, ByVal CookieName2, ByVal CookiesValue, ByVal CookiesExpires)
		Response.Cookies(CookieName1).Domain = site_domain
		Response.Cookies(CookieName1).Path = "/"
		If CookieName2 = "" then
			Response.Cookies(CookieName1) = CookiesValue
		Else
			If IsNull(CookiesValue) then CookiesValue = ""
			Response.Cookies(CookieName1)(CookieName2) = CookiesValue
		End If
		If Not CookiesExpires = "" then Response.Cookies(CookieName1).Expires = CookiesExpires
	End Sub ' // writeCookies

	'***********************************************
	' 쿠키를 제거한다.
	'***********************************************
	Sub deleteCookies(ByVal CookieName)
		Response.Cookies(CookieName).Domain = site_domain
		Response.Cookies(CookieName).Expires = DateAdd("d", -999, date())
	End Sub ' // deleteCookies

	'***********************************************
	' 쿠키 값을 반환한다.
	'***********************************************
	Function getCookies(ByVal CookieName1, ByVal CookieName2, ByRef GetCookieValue)
		If CookieName2 = "" then
			GetCookieValue = Request.Cookies(CookieName1)
		Else
			GetCookieValue = Request.Cookies(CookieName1)(CookieName2)
		End If
	End Function ' // getCookies

End Class 
%>