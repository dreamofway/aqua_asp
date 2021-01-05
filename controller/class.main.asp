<%
	Class main
		
		Private Sub Class_Initialize() 
			Call initMain()
		END Sub
		
		Private Sub Class_Terminate() 
			'echoBr("메인을 종료합니다.")
		END Sub
		
		'-------------------------------------------------------
		' 메인 페이지를 구성한다.
		'-------------------------------------------------------
		Private Sub initMain()
			
			Dim inc_file_path			
			Dim result_headline, result_lately, result_mans, result_womans, result_keyword, result_card, result_interview, result_naver
			Dim result_policy, result_photo, result_peple, result_moms_news, result_popular_news, result_food_security_news, result_age_solution, result_industry
			Dim db_obj, rs, query
			
			Set db_obj = db_conn.connection( "kids" )

			' 메뉴를 호출한다.
			Call initCategory()
			' 기자 정보를 가져온다.
			Call setWriterInfo()

			' 메인 헤드라인 뉴스 호출
			result_headline = getMainNews(11)

			' 메인 최신뉴스 호출
			result_lately = makeOneImgeTypeList( 12, 2,  3, false, "" )

			' man's opinion
			result_mans = getMainNews(12)
			' woman's opinion
			result_womans = getMainNews(13)
			' 키워드 기사 호출
			result_keyword = getMainNews(14)
			
			' 정책
			result_policy = getMainNews(18)

			' 산업
			result_industry = getMainNews(21)
			
			' 기획
			result_peple = getMainNews(19)

			
			' 엄마기자단
			result_moms_news = getNewsPage( _
				"main_moms_news_list" _
				, "kids" _
				, false _
				, true _
				, "" _
				, 1 _
				, 3 _
				, "exist_img" _ 
				, 15 _
				, "" _
				, "" _
			)

			' 많이 본 뉴스
			result_popular_news = getNewsPage( _
				"main_popular_news_list" _
				, "kids" _
				, false _
				, false _
				, "" _
				, 1 _
				, 10 _
				, "popular" _ 
				, "" _
				, "" _
				, "" _
			)
			response.write query
			' 카드뉴스 호출
			result_card = getMainNews(15)
			' 인터뷰 호출
			'result_interview = getMainNews(16)

			' 연령별 솔루션
			result_age_solution = getMainNews(20)

			' 포스트 호출
			result_naver = getMainNews(17)
			
			' 식품안전정보 호출
			result_food_security_news = getMainNews(22)


			Call wm.setVal( "hl_ArticleID", result_headline(0).item("ArticleID") )
			Call wm.setVal( "hl_Subject", result_headline(0).item("main_subject") )
			Call wm.setVal( "hl_SubTitle", result_headline(0).item("SubTitle") )
			Call wm.setVal( "hl_Contents", result_headline(0).item("Contents") )
			Call wm.setVal( "hl_reg_date", result_headline(0).item("conv_reg_date") )
			Call wm.setVal( "hl_CatrCode", result_headline(0).item("CatrCode") )
			Call wm.setVal( "hl_WriterName", result_headline(0).item("WriterName") )
			Call wm.setVal( "hl_img_path", result_headline(0).item("img_path") )
			Call wm.setVal( "hl_img_info_main", result_headline(0).item("img_info_main") )
			
			Call wm.setVal( "main_lately", result_lately )
			Call wm.setVal( "keyword_news", result_keyword )
			Call wm.setVal( "card_news", result_card )
			Call wm.setVal( "interview", result_interview )
			Call wm.setVal( "naver_post", result_naver )
			Call wm.setVal( "result_policy", result_policy )
			Call wm.setVal( "result_industry", result_industry )
			Call wm.setVal( "result_photo", result_photo )
			Call wm.setVal( "result_peple", result_peple )
			Call wm.setVal( "result_moms_news", result_moms_news )
			Call wm.setVal( "result_popular_news", result_popular_news )
			Call wm.setVal( "result_age_solution", result_age_solution )
			Call wm.setVal( "result_food_security_news", result_food_security_news )
			
			' view 페이지의 경로를 정의한다.
			inc_file_path = wm.user_view_path & "/main.asp"
			Call wm.display( "getMainDisplay",  inc_file_path )
		End Sub ' // initMain



		
	End Class 


%>
