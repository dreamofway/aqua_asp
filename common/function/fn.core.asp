<%
	'---------------------------------------------------------------------
	' 설명 : framework 구성에 필요한 필수 함수모음
	'---------------------------------------------------------------------
	' 작성자 : IT사업부 대리 이정훈
	' 작성일 : 2017.02.23
	'---------------------------------------------------------------------
	' getServerVal : ServerVariables 값을 화면에 출력하는 함수
	'---------------------------------------------------------------------
	
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	' 변수의 내용을 dom에 노출한다. 
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	Sub echo( ByVal arg_str )
		Response.write( valuesAnalyzer( arg_str ) ) 
	End Sub 
	'// echo

	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	' 변수의 내용을 dom에 노출. - br 태그 포함
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	Sub echoBr( ByVal arg_str )
		Response.write( "<br />" &  valuesAnalyzer( arg_str ) & "<br />" ) 
	End Sub 
	'// echoBr

	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	' 변수의 내용을 dom에 노출. - br 태그 포함
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	Sub echoEnd( ByVal arg_str )
		Response.write( valuesAnalyzer( arg_str ) )
		Response.End 
	End Sub 
	'// echoEnd
	
	Function echoHtml( ByVal arg_str )
		Response.Write( Replace(Replace(Replace(arg_str, "<", "&lt;"), ">", "&gt;"), chr(13) & chr(10), "<br /><br />")  )
	End Function '// echoHtml
	
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	' echo / echoBr 함수의 내용을 생성한다.
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	Function valuesAnalyzer( ByVal arg_value )

		Dim return_val
		Dim pre_use

		Select Case TypeName( arg_value )
			Case "Dictionary"

				Dim dic_key, dic_item, dic_loop
				
				pre_use = True 
				dic_key = arg_value.keys
				dic_item = arg_value.items

				If arg_value.count > 0 Then 
					
					return_val = "Dictionary ( <br />"

					For dic_loop = 0 To Ubound( dic_key )
						return_val = return_val & "&#09; ["& dic_key( dic_loop ) &"] => "& valuesAnalyzer( dic_item(dic_loop) ) & "<br />"
					Next 

					return_val = return_val & " )<br />"
					
				Else 
					return_val = "Empty"
				End If 

			Case "Object"
				
				pre_use = False 
				return_val = "Object"

			Case "Variant()"
				
				pre_use = True 

				If IsArray( arg_value ) = True Then 

					Dim array_key

					return_val = "Array ( <br />"

					For array_key = 0 to UBound( arg_value )
						return_val = return_val & "&#09; ["& array_key &"] => "& Trim( valuesAnalyzer( arg_value( array_key ) ) ) & "<br />"
					Next 

					return_val = return_val & " )<br />"

				End If 
				
			Case Else 
				pre_use = False 
				return_val = arg_value 
		End Select 
		
		If pre_use = True Then 
			return_val = "<pre>" & return_val & "</pre>"
		End If 
		valuesAnalyzer = return_val

	End Function 
	' // valuesAnalyzer 
	
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	' ServerVariables 값을 화면에 출력하는 함수
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	Function getServerVal( ByVal arg_type )
		
		If arg_type = "" Then 
			Dim item
			For Each item In Request.ServerVariables
				Response.write item & " : " & Request.ServerVariables( item ) & "<br />"
			Next
		Else 
			
			getServerVal = Request.ServerVariables( arg_type )
			
		End If 
		
	End Function 
	' // getServerVal

	Sub initSql( ByVal arg_key, ByVal arg_val )
		Call db_conn.setSql( arg_key , arg_val )
	End Sub 

	Sub executeSql( ByRef arg_db )
		Call db_conn.sqlProcessor( arg_db )
	End Sub 
	
	Function runTransaction( ByRef arg_db, ByVal arg_val )
		runTransaction = db_conn.translateProcessor( arg_db ,  arg_val)
	End Function 
	
	Sub moveHandler( ByVal arg_type, ByVal arg_message, ByVal arg_move_path )
		Call wm.moveHandler( arg_type, arg_message, arg_move_path)
	End Sub 
%>

	