<%
'---------------------------------------------------------------------
' 설명 : DB 연결을 수행하는 class
'---------------------------------------------------------------------
' 작성자 : IT사업부 과장 이정훈
' 작성일 : 2017.04.04
'---------------------------------------------------------------------
' 메소드 목록
'---------------------------------------------------------------------
' setDbInfo() : 접속할 데이터 베이스의 정보를 정의한다.
' connection() : 데이터 베이스에 접속하고 개체를 반환한다.
'---------------------------------------------------------------------

Class DBHandler

	Private db_info
	Private translate_error
	
	Private Sub Class_Initialize() 
		
		Set db_info = Server.CreateObject("Scripting.Dictionary")

	END Sub  
	
	Private Sub Class_Terminate() 
		Set db_info = Nothing
	END Sub
	
	'-------------------------------------------------------
	' DB 정보를 정의 한다.
	'-------------------------------------------------------
	Public Sub setDbInfo( ByVal arg_db_id, ByVal arg_db_name, ByVal arg_user_id, ByVal arg_user_pw , ByVal arg_db_source  ) 

		If arg_db_name = "" Then 
			Call rw.errorHandler("view", "dbConnection.setDbInfo", "필수값 누락 : arg_db_name" )
		End If 

		If arg_user_id = "" Then 
			Call rw.errorHandler("view", "dbConnection.setDbInfo", "필수값 누락 : arg_user_id" )
		End If 

		If arg_user_pw = "" Then 
			Call rw.errorHandler("view", "dbConnection.setDbInfo", "필수값 누락 : arg_user_pw" )
		End If 

		If arg_db_source = "" Then 
			Call rw.errorHandler("view", "dbConnection.setDbInfo", "필수값 누락 : arg_db_source" )
		End If 
		
		arg_db_id = LCase( Trim( arg_db_id ) )

		If db_info.Exists( arg_db_id ) = false Then
			
			Call db_info.add( arg_db_id, Server.CreateObject("Scripting.Dictionary") )
		End If 
		
		Call db_info.item( arg_db_id ).add( "connect_type", "provider" )
		Call db_info.item( arg_db_id ).add( "db_name", arg_db_name )
		Call db_info.item( arg_db_id ).add( "user_id", arg_user_id )
		Call db_info.item( arg_db_id ).add( "user_pw", arg_user_pw )
		Call db_info.item( arg_db_id ).add( "db_source", arg_db_source )
		
	End Sub ' // setDbInfo
	
	Public Sub setDb( ByVal arg_db_id, ByVal path ) 

		arg_db_id = LCase( Trim( arg_db_id ) )

		If db_info.Exists( arg_db_id ) = false Then			
			Call db_info.add( arg_db_id, Server.CreateObject("Scripting.Dictionary") )
		End If 

		Call db_info.item( arg_db_id ).add( "connect_type", "udl" )
		Call db_info.item( arg_db_id ).add( "path", path )

	End Sub ' // setDb

	'-------------------------------------------------------
	' 데이터 베이스에 접속하고 개체를 반환한다.
	'-------------------------------------------------------
	Public Function connection( ByVal arg_db_id ) 
		
		Dim conn_obj

		arg_db_id = LCase( Trim( arg_db_id ) )
		
		If db_info.Exists( arg_db_id ) = true Then
			
			Dim str_connect

			If db_info.Item( arg_db_id ).Item("connect_type") = "provider" Then 
				str_connect =	"Provider=SQLOLEDB.1;Persist Security Info=True;Network=Dbmssocn;" &_							
								"User ID="& db_info.Item( arg_db_id ).Item("user_id") &";" &_
								"Password="& db_info.Item( arg_db_id ).Item("user_pw") &";" &_
								"Initial Catalog="& db_info.Item( arg_db_id ).Item("db_name") &";" &_
								"Data Source="& db_info.Item( arg_db_id ).Item("db_source") &";"
			Else 
				str_connect = "File Name=" & db_info.Item( arg_db_id ).Item("path")
			End If 

			Set conn_obj = Server.CreateObject("ADODB.Connection")
			conn_obj.Open( str_connect )
			
		Else 
			Call wm.errorHandler("view", "DBConn", "정의되지 않은 DB ID 입니다.")
		End If
		
		Set connection = conn_obj

	End Function ' // connection
	
	'***********************************************
	' SQL translate 를 수행한다.
	' db_obj : db 접속 객체 
	' arg_type : start / end
	'***********************************************
	Public Function translateProcessor( ByRef db_obj, ByVal arg_type )
		
		Dim result

		If arg_type = "start" Then 

			' 트랜젝션 시작
			db_obj.BeginTrans

			result = True 
		Else 
			If db_obj.Errors.count <> 0  Then 
				' 롤백
				result = False
				db_obj.Errors.Clear
				db_obj.RollbackTrans

			Else 
				result = True
				db_obj.Errors.Clear
				db_obj.CommitTrans

			End If 
		End If 
		
		translateProcessor = result

	End Function 
	

	'***********************************************
	' SQL INSERT / UPDATE / DELETE 를 수행하기 위한 세팅
	' proc : insert / update / delete
	' table : 사용할 테이블 명
	' query_where : update 에서 필요한 where 절
	'***********************************************
	Public Sub setSql( ByVal arg_key, ByVal arg_val )

		If db_info.Exists( "set_sql" ) = false Then				
			Call db_info.add( "set_sql", Server.CreateObject("Scripting.Dictionary") )
		End If 
		
		If ( ( arg_key = "proc" ) Or ( arg_key = "use_table" ) Or ( arg_key = "query_where" ) ) Then 
			If db_info.Item("set_sql").Exists( arg_key ) = false Then	
				Call db_info.Item("set_sql").add( arg_key, arg_val )
			Else 
				db_info.Item("set_sql").Item( arg_key ) = arg_val
			End If 
		Else
			If db_info.Item("set_sql").Exists( "column_info" ) = false Then				
				Call db_info.Item("set_sql").add( "column_info", Server.CreateObject("Scripting.Dictionary") )
			End If 
			Call db_info.Item("set_sql").Item("column_info").add( arg_key, arg_val )
		End If  

	End Sub 

	Public Function getSql( ByVal arg_key )
		Dim column_info, data

		If arg_key = "keys" Then 
		

			If db_info.Item("set_sql").Exists( "column_info" ) = False Then
				Call wm.errorHandler("view", "DBHandler.getSql", "query에 필요한 column 정보가 없습니다.")
			Else 
				getSql = db_info.Item("set_sql").Item( "column_info" ).keys

			End If 

		ElseIf arg_key = "values" Then 

			If db_info.Item("set_sql").Exists( "column_info" ) = False Then
				Call wm.errorHandler("view", "DBHandler.getSql", "query에 필요한 column 정보가 없습니다.")
			Else 

				getSql = db_info.Item("set_sql").Item( "column_info" ).items

			End If 

		Else 
			If db_info.Item("set_sql").Exists( arg_key ) = False Then
				getSql = ""
			Else 
				getSql = db_info.Item("set_sql").Item( arg_key )
			End If 
			
		End If 
		
	End Function 

	'***********************************************
	' SQL INSERT / UPDATE / DELETE 를 수행한다.
	'***********************************************
	Public Sub sqlProcessor( ByRef arg_db )

		Dim query, get_column_info, column_keys, data
		Dim column_query
		
		If Not( ( LCase(getSql("proc")) = "insert" ) Or ( LCase(getSql("proc")) = "update" ) ) Then 
			Call wm.errorHandler("view", "DBHandler.sqlProcessor", "query를 실행하기위한 처리자가 없습니다. : proc")
		End If 

		If getSql("use_table") = "" Then 
			Call wm.errorHandler("view", "DBHandler.sqlProcessor", "query를 실행하기위한 테이블 명이 없습니다 : use_table")
		End If 
		
		If LCase(getSql("proc")) = "update" Then 
			If getSql("query_where") = "" Then 
				Call wm.errorHandler("view", "DBHandler.sqlProcessor", "query_where 값은 필수입니다.")
			End If 
		End If

		Select Case LCase(getSql("proc"))
			Case "insert" 
				query = " INSERT INTO "& getSql("use_table") &" ( " & arrToString( getSql("keys"), ",") & " ) VALUES ( "& arrToString( getSql("values"), "," ) &" ) "				
			Case "update" 
				Dim query_data_arr(), loop_cnt, keys, values
				
				keys = getSql("keys")
				values = getSql("values")
				
				query = " UPDATE "& getSql("use_table") &" SET "

				ReDim Preserve query_data_arr( -1 )

				For loop_cnt = 0 To Ubound( keys )
					ReDim Preserve query_data_arr( Ubound( query_data_arr ) + 1 )

					query_data_arr( loop_cnt ) = keys( loop_cnt ) & " = " & values( loop_cnt )

				Next
				
				query = query & arrToString( query_data_arr, ", " ) & " WHERE " & getSql("query_where")

			Case "delete" 
				query = "DELETE FROM " & getSql("use_table") & " WHERE " & getSql("query_where")
		End Select 
		
		'echoBr( query )
		arg_db.Execute( query )
		db_info.remove( "set_sql" )
	End Sub 

End Class 

%>