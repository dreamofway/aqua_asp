<%
	Class service
		
		'***********************************************
		' ȸ��Ұ�
		'***********************************************
		Public Sub intro() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "intro" )

			inc_file_path = wm.user_view_path & "/service/intro.asp"
			Call wm.display( "getCompanyIntro",  inc_file_path )

		END Sub  '// 

		'***********************************************
		' ��������
		'***********************************************
		Public Sub ethics() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "ethics" )

			inc_file_path = wm.user_view_path & "/service/code_of_ethics.asp"
			Call wm.display( "getCompanyEthics",  inc_file_path )

		END Sub  '// ethics

		'***********************************************
		' �̿���
		'***********************************************
		Public Sub terms() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "terms" )

			inc_file_path = wm.user_view_path & "/service/terms.asp"
			Call wm.display( "getCompanyTerms",  inc_file_path )

		END Sub  '// terms

		'***********************************************
		' ��������ó����ħ
		'***********************************************
		Public Sub personal_info() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()
			
			Call wm.setViewVal( "service_on", "personal_info" )

			inc_file_path = wm.user_view_path & "/service/personal_info.asp"
			Call wm.display( "getCompanyPersonalInfo",  inc_file_path )

		END Sub  '// personal_info

		'***********************************************
		' û�ҳ⺸ȣ��å
		'***********************************************
		Public Sub policy() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()

			Call wm.setViewVal( "service_on", "policy" )

			inc_file_path = wm.user_view_path & "/service/policy.asp"
			Call wm.display( "getCompanyPolicy",  inc_file_path )

		END Sub  '// policy

		'***********************************************
		' ���۱ǱԾ�
		'***********************************************
		Public Sub copyright() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()

			Call wm.setViewVal( "service_on", "copyright" )

			inc_file_path = wm.user_view_path & "/service/copyright.asp"
			Call wm.display( "getCompanyCopyright",  inc_file_path )

		END Sub  '// copyright
		
		'***********************************************
		' ���۱ǱԾ�
		'***********************************************
		Public Sub rss() 
			
			Dim inc_file_path
			Dim catr, page, size, news_row, get_value, search_keyword, cno, search_type
			Dim right_card_news, right_interview, right_popular_news
			Dim db_obj, rs, query
			
			' �޴��� ���� �Լ��� ȣ���Ѵ�.
			Call initCategory()

			Call wm.setViewVal( "service_on", "rss" )

			inc_file_path = wm.user_view_path & "/service/rss.asp"
			Call wm.display( "getRssService",  inc_file_path )

		END Sub  '// copyright
		
		

	End Class 
%>