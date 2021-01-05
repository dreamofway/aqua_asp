<%@ codepage="65001" language="vbscript"%>
<%
	'---------------------------------------------------------------------
	' 설명 : 사이트 설정 파일
	' * 주의 * 
	' 1. include_files.asp 파일을 확인하여 동적으로 읽고 쓰지만 다른 동작들에 앞서 include 파일을 먼저 확인하는 ASP 특성상 
	'   최초 실행시 초기 오류는 잡아주고 사용을 하여야 함.
	' 2. display_file.asp 파일도 마찬가지로 빈 파일이라도 먼저 만들어 두어야 함.
	'---------------------------------------------------------------------
	'모바일 http://m.ikn.kr
	'데스크 http://desk.ikn.kr
	'우리아이뉴스 http://news.ikn.kr
	'어린이집 http://child.ikn.kr
	'---------------------------------------------------------------------
	' 작성자 : IT사업부 대리 이정훈
	' 작성일 : 2017.02.17
	'---------------------------------------------------------------------
	
	'---------------------------------------------------------------------
	' 사이트 기본한경 설정
	'---------------------------------------------------------------------
	Option Explicit

	Session.CodePage  = "65001"
	Response.CharSet  = "utf-8"
	Response.ContentType = "text/html;charset=utf-8"
	Response.AddHeader "Pragma","no-cache"
	Response.AddHeader "cache-control","no-cache"
	Response.Expires = -1
	Response.Buffer=True

	'---------------------------------------------------------------------
	' 필수 파일 import
	'---------------------------------------------------------------------
	Call importFolders()
	
	'---------------------------------------------------------------------
	' 전역 설정
	'---------------------------------------------------------------------
	Dim rw, wm, db_conn
	
	Set wm = New workManager
	Set rw = New fileRW
	Set db_conn = New DBHandler
	
	wm.image_domain = "//img.compa.kr"
	wm.image_path = "//img.compa.kr/ikn/nursery"
	wm.image_upload_path = "D:\home\img.healthi.kr\_upload"
	wm.admin_view_path = ""
	wm.user_view_path = "/view/user/v170428"
	wm.use_upload_obj = "abc"
	wm.meta_title = "[우리아이]어린이집"
	wm.meta_description = "콤파의 또 하나의 대표사이트 우리아이 어린이집 입니다. 우리아이어린이집에서는 지역별 어린이집 정보 및 육아관련 정보를 모든 고객님들께 제공합니다."
	wm.meta_keywords = "교육,문화,칼럼,리포트,신문,기사,뉴스,영상,취재,건강,헬스닥터,헬스앤라이프,우리아이뉴스, 우리아이어린이집"
	wm.ogp_title = "우리 아이를 위한 세상의 모든 정보"
	wm.ogp_stitle_name = "우리아이어린이집"
	wm.ogp_description = wm.meta_description	
	wm.ogp_image = wm.site_domain &"/img/ogp/health_ogp.jpg"
	wm.ogp_url = "http://" & wm.site_domain & wm.current_url & "?" & wm.current_query_string

	wm.getHttpRequest("get") ' http request 값 show (노출) / 비노출 ( anyting )
	
	
	rw.createDisplay() ' 페이지 include 파일 확인 함수 호출

	Call db_conn.setDbInfo("health", "healthlife", "compadep", "dep2018!@", "211.110.1.52")
	Call db_conn.setDbInfo("kids", "kids", "compadep", "dep2018!@", "211.110.1.52")
	Call db_conn.setDbInfo("biz", "biz", "compadep", "dep2018!@", "211.110.1.52")

	'---------------------------------------------------------------------
	' router 호출
	'---------------------------------------------------------------------
	Call routerHandler()
	
	'***********************************************
	' 설명 : 현재 url로 class와 method를 호출한다.
	'***********************************************
	Sub routerHandler()
		'On Error Resume Next

		Dim set_class
		Dim get_method_arr, get_method_name
		Dim permit_call_end_class

		permit_call_end_class = "login"

'		echoBr( "HTTP_X_ORIGINAL_URL : " & getServerVal("HTTP_X_ORIGINAL_URL") )

		If ( InStr( getServerVal("HTTP_X_ORIGINAL_URL"), "/" ) > 0 ) Then 
			
			wm.current_path_arr = Split(getServerVal("HTTP_X_ORIGINAL_URL"), "/") 
			
			Select Case Ubound( wm.current_path_arr )
				Case 1
					
					' class 호출시 페이지 종료 되는 목록과 일치하는 데이터가 없다면 잘못된 접근으로 분류한다.
					If InStr( permit_call_end_class, wm.current_path_arr(1) ) > 0 Then 
						execute( "Set set_class = New " & wm.current_path_arr(1) )
						If( wm.current_path_arr(1) = "admin" ) Then 
							execute( "set_class.login" )
						End If 
					Else 
						echoBr("비정상 접근")
					End If 
					
					
				Case 2

					execute( "Set set_class = New " & wm.current_path_arr(1) )

					If InStr(wm.current_path_arr(2), "?") > 0 Then 
						get_method_arr = Split(wm.current_path_arr(2), "?") 
						get_method_name = Trim( get_method_arr(0) )
					Else 
						get_method_name = Trim( wm.current_path_arr(2) )
					End If 
					 
					If ( get_method_name = "" ) Then 
						echoBr("비정상 접근")
					Else 
						execute( "set_class."& get_method_name  )
					End If 
					

					'execute( "call set_class."& get_method_name )

				Case Else 
					'/ Response.Redirect "/"
					echoBr("비정상 접근")
			End Select 
		Else 
			Set set_class = New main
		End If 
		
		'Response.write TypeName( set_class )
	End Sub 
	
	'***********************************************
	' 설명 : 설정된 경로 하위의 파일을 include 하는 include_files.asp 파일을 생성한다.
	'***********************************************
	Sub importFolders()

		Dim obj_fso, obj_folder, obj_files, obj_text, map_path, item, file_obj
		Dim open_mode, open_create, open_format
		Dim target_file_arr(3), loop_cnt, file_path
		Dim files_list_arr(), files_list
		Dim save_file_path, save_file, write_flag, inc_path
		
		write_flag = False 

		save_file_path = Server.MapPath( "/common/include_files.asp" )
		ReDim Preserve files_list_arr(-1)
		
		Set obj_fso = CreateObject("Scripting.FileSystemObject")      '파일시스템 개체 생성
		
		' include_files.asp 파일을 읽는다.
		open_mode = 1 ' 1 : 읽기전용 / 2 : 쓰기 / 8 : 파일 끝에 추가
		open_create = true ' true : 파일이 없는경우 생성 / false : 파일이 없는경우 생성하지 않음
		open_format = 0 ' 0 : 기본값 / -1 : 유니코드로 오픈 / -2 시스템 기본값을 사용
		
		Set file_obj = obj_fso.OpenTextFile( save_file_path, open_mode, open_create, open_format  )
		save_file = file_obj.readAll

		target_file_arr(0) = "/common/class"
		target_file_arr(1) = "/common/function"
		target_file_arr(2) = "/controller"
		target_file_arr(3) = "/lib"
		
		For loop_cnt = 0 To Ubound( target_file_arr )
			
			file_path = target_file_arr( loop_cnt )

			map_path = Server.MapPath( file_path )
			
			'1. 폴더 존재 확인
			IF NOT( obj_fso.FolderExists( map_path ) ) Then
				' 폴더가 존재하지 않음.
				Response.write "<br />Error - 경로 오류 :  "& map_path &" <br />"

			Else 
				' include 될 경로를 설정한다.
				Set obj_folder = obj_fso.GetFolder( map_path )
				Set obj_files = obj_folder.files	

				if obj_files.count > 0 Then

					For Each item in obj_files
						
						ReDim Preserve files_list_arr( Ubound(files_list_arr) + 1 )
						
						inc_path = file_path & "/" & item.name

						If Not( InStr( save_file, inc_path ) > 0 ) Then
							' 현재 폴더 하위의 파일 목록들과 파일의 작성 상태가 다른 경우 파일을 새로 쓸 수 있게 flag 값을 참으로 변경한다.
							write_flag = True 
						End If 
						files_list_arr( Ubound(files_list_arr) ) = "<!-- #include virtual = """& inc_path &""" -->"

					Next 
				End If 

			End If 
		Next 		
		
		' 쓰기 flag가 참 인 경우 파일을 새로 쓴다.
		If write_flag = True Then 
			' include 파일 목록 string 형식으로 변환
			For loop_cnt = 0 To Ubound( files_list_arr )
				If loop_cnt > 0 Then 

					files_list = files_list & chr(13) & chr(10) & files_list_arr( loop_cnt )

				Else 

					files_list = files_list_arr( loop_cnt )

				End If 
				
			Next
			
			open_mode = 2 ' 1 : 읽기전용 / 2 : 쓰기 / 8 : 파일 끝에 추가
			open_create = true ' true : 파일이 없는경우 생성 / false : 파일이 없는경우 생성하지 않음
			open_format = 0 ' 0 : 기본값 / -1 : 유니코드로 오픈 / -2 시스템 기본값을 사용

			Set file_obj = obj_fso.OpenTextFile( save_file_path, open_mode, open_create, open_format  )

			' 파일 쓰기
			file_obj.Write( files_list )

		End If 
		
	End Sub '// importFolders
	
%>
<!-- #include virtual = "/common/include_files.asp" -->
<!-- #include virtual = "/common/display_file.asp" -->