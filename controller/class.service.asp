<%
	Class service
		
		'***********************************************
		' 회사소개
		'***********************************************
		Public Sub intro() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "intro" )

			inc_file_path = wm.user_view_path & "/service/intro.asp"
			Call wm.display( "getCompanyIntro",  inc_file_path )

		END Sub  '// 

		'***********************************************
		' 윤리강령
		'***********************************************
		Public Sub ethics() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "ethics" )

			inc_file_path = wm.user_view_path & "/service/code_of_ethics.asp"
			Call wm.display( "getCompanyEthics",  inc_file_path )

		END Sub  '// ethics

		'***********************************************
		' 이용약관
		'***********************************************
		Public Sub terms() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "terms" )

			inc_file_path = wm.user_view_path & "/service/terms.asp"
			Call wm.display( "getCompanyTerms",  inc_file_path )

		END Sub  '// terms

		'***********************************************
		' 개인정보처리방침
		'***********************************************
		Public Sub personal_info() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "personal_info" )

			inc_file_path = wm.user_view_path & "/service/personal_info.asp"
			Call wm.display( "getCompanyPersonalInfo",  inc_file_path )

		END Sub  '// personal_info

		'***********************************************
		' 청소년보호정책
		'***********************************************
		Public Sub policy() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()

			Call wm.setViewVal( "service_on", "policy" )

			inc_file_path = wm.user_view_path & "/service/policy.asp"
			Call wm.display( "getCompanyPolicy",  inc_file_path )

		END Sub  '// policy

		'***********************************************
		' 저작권규약
		'***********************************************
		Public Sub copyright() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()

			Call wm.setViewVal( "service_on", "copyright" )

			inc_file_path = wm.user_view_path & "/service/copyright.asp"
			Call wm.display( "getCompanyCopyright",  inc_file_path )

		END Sub  '// copyright
		
		'***********************************************
		' 저작권규약
		'***********************************************
		Public Sub rss() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' 메뉴를 설정 함수를 호출한다.
			Call initCategory()

			Call wm.setViewVal( "service_on", "rss" )

			inc_file_path = wm.user_view_path & "/service/rss.asp"
			Call wm.display( "getRssService",  inc_file_path )

		END Sub  '// copyright
		
		

	End Class 
%>