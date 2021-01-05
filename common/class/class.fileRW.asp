<%
'---------------------------------------------------------------------
' 설명 : 파일을 읽고 쓰는 클래스
'---------------------------------------------------------------------
' 작성자 : IT사업부 대리 이정훈
' 작성일 : 2017.03.23
'---------------------------------------------------------------------
' include 파일 목록
'---------------------------------------------------------------------
' create() : 파일을 생성
' createDisplay() : display_file.asp 파일을 생성하는 함수
' addDisplaySub() : display_file.asp 파일에 sub를 추가
'---------------------------------------------------------------------

'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
' 파일을 생성 / 편집한다.
'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
Class fileRW
	
	Private obj_fso		

	Private Sub Class_Initialize() 
		Set obj_fso = CreateObject("Scripting.FileSystemObject")      '파일시스템 개체 생성
	END Sub  
	
	Private Sub Class_Terminate() 
		Set obj_fso = Nothing
	END Sub
	
	'-------------------------------------------------------
	' 파일을 생성하는 함수
	'-------------------------------------------------------
	Public Function create( ByVal arg_path ) 

		Dim server_root
		Dim path_arr, path_loop
		Dim folder_obj, created_obj
		Dim file_folder
		Dim file_name
		
		If ( InStr( arg_path, "/" ) > 0 ) Then
			
			server_root = Server.MapPath( "/" )

			IF NOT( obj_fso.FileExists( server_root & "/" & arg_path ) ) Then
				'///////////// 파일을 생성 /////////////

				' # 폴더 경로와 파일명을 추출한다.
				path_arr = Split( arg_path, "/" ) 
				file_folder = server_root
				file_name = path_arr( Ubound( path_arr ) )

				For path_loop = 0 To ( Ubound( path_arr ) -1 )
					
					If path_arr(path_loop) <> "" Then 
						file_folder = file_folder & "/" &  path_arr(path_loop)
					End If 
				Next 
				
				' # 추출한 정보로 파일 생성
				Set folder_obj = obj_fso.GetFolder( file_folder )
				Set created_obj = folder_obj.CreateTextFile( file_name , False )

				created_obj.Close
				Set created_obj = Nothing 
				Set folder_obj = Nothing

			End If 

		Else 
			echoBr("Error - create : 절대경로로 작성해주세요")
		End If 

	End Function '// create
	
	'-------------------------------------------------------
	' server에 display_file.asp 파일을 생성하는 함수
	'-------------------------------------------------------
	Public Sub createDisplay() 

		Dim display_file_path, map_path
		Dim file_obj, created_obj, display_file_folder, display_file_name
		
		display_file_folder = Server.MapPath( "/common" )
		display_file_name = "display_file.asp"

		map_path = display_file_folder & "\" &  display_file_name

		IF NOT( obj_fso.FileExists( map_path ) ) Then
			' 파일에 include sub를 작성한다.
			Dim open_mode, open_create, open_format

			open_mode = 2 ' 1 : 읽기전용 / 2 : 쓰기 / 8 : 파일 끝에 추가
			open_create = true ' true : 파일이 없는경우 생성 / false : 파일이 없는경우 생성하지 않음
			open_format = -2 ' 0 : 기본값 / -1 : 유니코드로 오픈 / -2 시스템 기본값을 사용

			Set file_obj = obj_fso.OpenTextFile( map_path, open_mode, open_create, open_format  )

			file_obj.WriteLine("<"&"%")
			file_obj.WriteLine("'---------------------------------------------------------------------")
			file_obj.WriteLine("' dec : html files include sub pakage file ")
			file_obj.WriteLine("'---------------------------------------------------------------------")
			file_obj.WriteLine("' auto write ")
			file_obj.WriteLine("'---------------------------------------------------------------------")
			file_obj.WriteLine("%"&">")

			file_obj.Close

			Set file_obj = Nothing 
		End If 

	End Sub ' // createDisplay

	'-------------------------------------------------------
	' server에 display_file.asp 파일에 sub를 추가한다.
	'-------------------------------------------------------
	Public Sub addDisplaySub( ByVal arg_sub_name,  ByVal arg_path ) 

		Dim display_file_path, map_path
		Dim file_obj, created_obj
		Dim open_mode, open_create, open_format, read_text
		Dim find_text, display_file_folder, display_file_name

		display_file_folder = Server.MapPath( "/common" )
		display_file_name = "display_file.asp"

		map_path = display_file_folder & "\" &  display_file_name
					
		open_mode = 1 ' 1 : 읽기전용 / 2 : 쓰기 / 8 : 파일 끝에 추가
		open_create = true ' true : 파일이 없는경우 생성 / false : 파일이 없는경우 생성하지 않음
		open_format = 0 ' 0 : 기본값 / -1 : 유니코드로 오픈 / -2 시스템 기본값을 사용

		Set file_obj = obj_fso.OpenTextFile( map_path, open_mode, open_create, open_format  )
		
		read_text = file_obj.ReadAll

		file_obj.Close

		If ( InStr( read_text, arg_sub_name ) = 0 ) Then 
			' 파일에 include sub를 작성한다.

			open_mode = 8 ' 1 : 읽기전용 / 2 : 쓰기 / 8 : 파일 끝에 추가
			open_create = True ' true : 파일이 없는경우 생성 / false : 파일이 없는경우 생성하지 않음
			open_format = -2 ' 0 : 기본값 / -1 : 유니코드로 오픈 / -2 시스템 기본값을 사용
			
			Set file_obj = obj_fso.OpenTextFile( map_path, open_mode, open_create, open_format  )

			file_obj.WriteLine("<"&"%")
			file_obj.WriteLine( "Sub "& arg_sub_name & "()" )
			file_obj.WriteLine("Dim data, data_loop, val_key, val_item, val_str, tmp")
			file_obj.WriteLine("Set data = wm.getViewVal()")
			file_obj.WriteLine("val_key = data.keys")
			file_obj.WriteLine("val_item = data.items")
			file_obj.WriteLine("For data_loop = 0 To Ubound( val_key )")
			file_obj.WriteLine("	If TypeName( val_item( data_loop ) ) = ""Recordset"" Then ")
			file_obj.WriteLine("		Set tmp = val_item( data_loop )")
			file_obj.WriteLine("		val_str = ""Dim "" & val_key( data_loop ) & "" : Set "" & val_key( data_loop ) & "" = tmp""" )
			file_obj.WriteLine("	Else " )
			file_obj.WriteLine("		tmp = val_item( data_loop )")
			file_obj.WriteLine("		val_str = ""Dim "" & val_key( data_loop ) & "" : "" & val_key( data_loop ) & "" = tmp""" )
			file_obj.WriteLine("	End If " )
			file_obj.WriteLine("	execute( val_str )" )
			file_obj.WriteLine("Next" )
			file_obj.WriteLine("%"&">")
			file_obj.WriteLine( "<!-- #include virtual = """& arg_path &""" -->" )
			file_obj.WriteLine("<"&"%")
			file_obj.WriteLine( "End sub" )
			file_obj.WriteLine("%"&">")

			If getServerVal("HTTP_X_ORIGINAL_URL") = "" Then 
				Response.Redirect "/"
			Else 
				Response.Redirect getServerVal("HTTP_X_ORIGINAL_URL")
			End If 
			

		Else 
			
			Dim get_sub_text, get_start_pos, get_end_pos, replaced_text
			Dim reg_exp, match, match_val, pattern, result_exp
			
			' 현재 호출된 sub 명을 찾는다.
			If ( InStr( read_text, arg_sub_name ) > 0 ) Then 
				
				' 패턴 초기화
				SET reg_exp = New RegExp
				reg_exp.pattern = "[^=""]*\.asp"
				reg_exp.IgnoreCase = True
				reg_exp.Global = True 
				
				' 1. 기존 sub 시작 라인을 찾는다.
				get_start_pos = InStr( read_text, arg_sub_name )
				
				' 2. sub 종료 라인을 찾는다.
				get_sub_text = Mid( read_text, get_start_pos )
				get_end_pos = InStr( get_sub_text, "End sub" )
				
				' 3. sub 의 파일 include 영역을 추출한다.
				get_sub_text = Mid( read_text, get_start_pos, get_end_pos )

				Set result_exp = reg_exp.Execute( get_sub_text )
				
				' 4. 파일 경로를 추출
				if result_exp.count > 0 Then

					For Each match In result_exp
						match_val = match.Value						
					Next 
					
				end If
				
				' 5. 기존 파일 경로와 현재 파일 경로가 일치하지 않을 경우 최신 경로로 치환.
				If match_val <> arg_path Then 
					replaced_text = Replace( read_text, match_val, arg_path )
					
					' 6. 기존 파일을 변경된 텍스트로 덮어쓰기 한다.
					open_mode = 2 ' 1 : 읽기전용 / 2 : 쓰기 / 8 : 파일 끝에 추가
					open_create = True ' true : 파일이 없는경우 생성 / false : 파일이 없는경우 생성하지 않음
					open_format = 0 ' 0 : 기본값 / -1 : 유니코드로 오픈 / -2 시스템 기본값을 사용
					
					Set file_obj = obj_fso.OpenTextFile( map_path, open_mode, open_create, open_format  )
					
					file_obj.Write( replaced_text )
					
					' 7 변경된 페이지 적용을 위해 reload
					'echoBr( getServerVal("HTTP_X_ORIGINAL_URL") )
					Response.Redirect "/" & getServerVal("HTTP_X_ORIGINAL_URL")
				End If 

			End If 

		End If 
		
		file_obj.Close
		Set file_obj = Nothing 
		

	End Sub ' // addDisplaySub

End Class '// fileRW

%>