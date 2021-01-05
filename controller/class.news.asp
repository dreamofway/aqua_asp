<%
	Class news
		
		'***********************************************
		' 뉴스 목록을 생성한다.
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
			
			' 카드뉴스
			right_card_news = getMainNews(15)

			' 인터뷰
			query = "SELECT		TOP 3 * " &_
					", IsNULL( (" & _
					"		SELECT TOP 1" & _
					"			 ImagePath + '/' + ImageName  " & _
					"		FROM ActicleImage " & _
					"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
					"		ORDER BY SEQ DESC " & _
					"	) , '' ) AS img_path " & _			
					"FROM	ArticleData AS t_std " &_
					" LEFT OUTER JOIN (select DISTINCT ArticleID,ImageName,ImagePath,align,DelFlag from  ActicleImage) AS t_img " & _
					" ON t_std.ArticleID = t_img.ArticleID " & _
					" AND t_img.align='news_list_thum' " & _
					"WHERE	CatrCode LIKE '%1302%' "&_
					"		AND ( t_img.ImagePath IS NOT NULL ) " &_
					"ORDER BY RegDate DESC" 

			Set right_interview = db_obj.Execute( query )
			

			' 많이 본 뉴스
			right_popular_news = getNewsPage( _
				"right_popular_list" _
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

			Call wm.setVal( "get_value", get_value )

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
			Call wm.setViewVal( "right_card_news", right_card_news )
			Call wm.setViewVal( "right_interview", right_interview )
			Call wm.setViewVal( "right_popular_news", right_popular_news )
			

			inc_file_path = wm.user_view_path & "/list.asp"
			Call wm.display( "getNewsList",  inc_file_path )

		END Sub  '// list
		
		'***********************************************
		' 뉴스 상세 페이지 데이터를 구성
		'***********************************************
		Public Sub view() 
			
			Dim inc_file_path
			Dim ArticleID, catr, page, size, get_value, search_keyword, cno, search_type
			Dim db_obj, query, rs, update_query, add_where
			Dim conv_mod_date, news_contents
			Dim right_card_news, right_interview, right_popular_news


			ArticleID = wm.getParam("ArticleID")
			page = wm.getParam("page")
			size = wm.getParam("size")
			catr = wm.getParam("catr")
			search_keyword = wm.getParam("search_keyword")
			cno = wm.getParam("cno")
			
			get_value = ""
			get_value = get_value &  "catr="&catr
			get_value = get_value &  "&size="&size
			get_value = get_value &  "&search_type="&search_type
			get_value = get_value &  "&search_keyword="&search_keyword
			get_value = get_value &  "&cno="&cno
			

			' 기자 정보를 가져온다.
			Call setWriterInfo()

			' 메뉴를 호출한다.
			Call initCategory()
			
			'--------------------------------------------------------------------
			' DB 연결
			'--------------------------------------------------------------------
			Set db_obj = db_conn.connection( "kids" )
			
			' 카드뉴스			
			right_card_news = getMainNews(15)

			' 인터뷰
			query = "SELECT		TOP 3 * " &_
					", IsNULL( (" & _
					"		SELECT TOP 1" & _
					"			 ImagePath + '/' + ImageName  " & _
					"		FROM ActicleImage " & _
					"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
					"		ORDER BY SEQ DESC " & _
					"	) , '' ) AS img_path " & _			
					"FROM	ArticleData AS t_std " &_
					" LEFT OUTER JOIN (select DISTINCT ArticleID,ImageName,ImagePath,align,DelFlag from  ActicleImage) AS t_img " & _
					" ON t_std.ArticleID = t_img.ArticleID " & _
					" AND t_img.align='news_list_thum' " & _
					"WHERE	CatrCode LIKE '%1302%' "&_
					"		AND ( t_img.ImagePath IS NOT NULL ) " &_
					"ORDER BY RegDate DESC" 

			Set right_interview = db_obj.Execute( query )
			

			' 많이 본 뉴스
			right_popular_news = getNewsPage( _
				"right_popular_list" _
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

			' 본문
			If ArticleID = "170508107127" Then 
				add_where = " AND IsPublish = 0 "
			Else 
				add_where = " AND IsPublish = 1 "
			End If 
			query =	" SELECT *, ( convert(varchar(16), t_std.RegDate, 120) ) AS conv_reg_date, ( convert(varchar(16), t_std.LastModDate, 120) ) AS conv_mod_date" & _
						", IsNULL( (" & _
						"		SELECT TOP 1" & _
						"			 ImagePath + '/' + ImageName  " & _
						"		FROM ActicleImage " & _
						"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
						"		ORDER BY SEQ DESC " & _
						"	) , '' ) AS img_path " & _
			" FROM ArticleData AS t_std" & _
			" WHERE ArticleID = '" & ArticleID & "' " & add_where

			Set rs = db_obj.Execute( query )
			
			If rs.Eof Or rs.Bof Then 
				Call echoEnd( "잘못된 접근입니다." )
			Else 

				' viewCnt update
				update_query =	" UPDATE ArticleData SET  " & _
								"						ViewCnt = ViewCnt + 1 " & _
								" WHERE ArticleID = '"& ArticleID &"' "
				

				db_obj.Execute( update_query )
				
				wm.view_page_flag = True 

				wm.ogp_title = rs("Subject")
				wm.meta_title = rs("Subject")
				wm.ogp_stitle_name = rs("SubTitle")
				wm.ogp_description = CutString( removeContens( rs("Contents") ) , 40, "")
				
				If rs("img_path") <> "" Then 
					wm.ogp_image = wm.image_domain & rs("img_path")
				End If 
				
				If (Trim(rs("LastModDate")) = "") Or ( isnull(rs("LastModDate")) = true) Then 								
					conv_mod_date = rs("conv_reg_date")
				Else 
					conv_mod_date = rs("conv_mod_date")
				End If 

				Call ViewDetail( 1, rs("Contents") , news_contents )
				news_contents= Replace( rs("Contents") ,"<br style=""clear: both;"">","<br>" )
				news_contents= Replace( rs("Contents") ,"[헬스앤라이프]","" )
				
				Call wm.setViewVal( "ArticleID", rs("ArticleID") )
				Call wm.setViewVal( "Subject", rs("Subject") )
				Call wm.setViewVal( "SubTitle", rs("SubTitle") )
				Call wm.setViewVal( "reg_date", dateType( "T09", rs("conv_reg_date") ) )
'				Call wm.setViewVal( "mod_date", dateType( "T09", conv_mod_date ) )
				Call wm.setViewVal( "mod_date", dateType( "T09", rs("conv_reg_date") ) )
				
				Call wm.setViewVal( "news_contents", news_contents )
				Call wm.setViewVal( "writer_name",  rs("WriterName") )
				Call wm.setViewVal( "consult_no",  rs("ConsultNo") )
				Call wm.setViewVal( "EPCnt",  rs("EPCnt") )
				Call wm.setViewVal( "news_source",  rs("source") )
				Call wm.setViewVal( "writer_info",  mixWriteName( getWriterInfo( rs("WriterID"), "AdminDepartment" ), rs("WriterName") ) )
				
				Call wm.setViewVal( "top_menu_title", wm.getVal( "top_menu_title" ) )
				Call wm.setViewVal( "sub_menu_title", wm.getVal( "sub_menu_title" ) )
				Call wm.setViewVal( "meta_published_time", FormatDateTime( rs("RegDate") , 2) & "T" & FormatDateTime( rs("RegDate") , 4) & ":00+09:00" )

				Call wm.setViewVal( "catr", catr )
				Call wm.setViewVal( "page", page )
				Call wm.setViewVal( "size", size )
				Call wm.setViewVal( "search_keyword", search_keyword )
				Call wm.setViewVal( "search_type", search_type )
				Call wm.setViewVal( "cno", cno )
				Call wm.setViewVal( "get_value", get_value )

				Call wm.setViewVal( "right_card_news", right_card_news )
				Call wm.setViewVal( "right_interview", right_interview )
				Call wm.setViewVal( "right_popular_news", right_popular_news )
				
				inc_file_path = wm.user_view_path & "/view.asp"
				Call wm.display( "getNewsView",  inc_file_path )
			End If 

		END Sub
		
		'***********************************************
		' 뉴스 상세 페이지 데이터를 구성
		'***********************************************
		Public Sub viewPrint() 
			
			Dim inc_file_path
			Dim ArticleID, catr, page, size, get_value, search_keyword, cno, search_type
			Dim db_obj, query, rs, update_query
			Dim conv_mod_date, news_contents
			Dim right_card_news, right_interview, right_popular_news


			ArticleID = wm.getParam("ArticleID")
			page = wm.getParam("page")
			size = wm.getParam("size")
			catr = wm.getParam("catr")
			search_keyword = wm.getParam("search_keyword")
			cno = wm.getParam("cno")
			
			get_value = ""
			get_value = get_value &  "catr="&catr
			get_value = get_value &  "&size="&size
			get_value = get_value &  "&search_type="&search_type
			get_value = get_value &  "&search_keyword="&search_keyword
			get_value = get_value &  "&cno="&cno
			

			' 기자 정보를 가져온다.
			Call setWriterInfo()
			
			'--------------------------------------------------------------------
			' DB 연결
			'--------------------------------------------------------------------
			Set db_obj = db_conn.connection( "kids" )
			
			' 본문
			query =	" SELECT *, ( convert(varchar(16), t_std.RegDate, 120) ) AS conv_reg_date, ( convert(varchar(16), t_std.LastModDate, 120) ) AS conv_mod_date" & _
						", IsNULL( (" & _
						"		SELECT TOP 1" & _
						"			 ImagePath + '/' + ImageName  " & _
						"		FROM ActicleImage " & _
						"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
						"		ORDER BY SEQ DESC " & _
						"	) , '' ) AS img_path " & _
			" FROM ArticleData AS t_std" & _
			" WHERE ArticleID = '" & ArticleID & "' AND IsPublish = 1 "

			Set rs = db_obj.Execute( query )
			
			If rs.Eof Or rs.Bof Then 
				Call echoEnd( "잘못된 접근입니다." )
			Else 

				
				wm.ogp_title = rs("Subject")
				wm.ogp_stitle_name = rs("SubTitle")
				wm.ogp_description = CutString( removeContens( rs("Contents") ) , 40, "")
				
				If rs("img_path") <> "" Then 
					wm.ogp_image = wm.image_domain & rs("img_path")
				End If 
				
				If (Trim(rs("LastModDate")) = "") Or ( isnull(rs("LastModDate")) = true) Then 								
					conv_mod_date = rs("conv_reg_date")
				Else 
					conv_mod_date = rs("conv_mod_date")
				End If 

				Call ViewDetail( 1, rs("Contents") , news_contents )
				news_contents= Replace( rs("Contents") ,"<br style=""clear: both;"">","<br>" )
				news_contents= Replace( rs("Contents") ,"[헬스앤라이프]","" )
				
				Call wm.setViewVal( "ArticleID", rs("ArticleID") )
				Call wm.setViewVal( "Subject", rs("Subject") )
				Call wm.setViewVal( "SubTitle", rs("SubTitle") )
				Call wm.setViewVal( "reg_date", dateType( "T09", rs("conv_reg_date") ) )
				Call wm.setViewVal( "mod_date", dateType( "T09", conv_mod_date ) )
				Call wm.setViewVal( "news_contents", news_contents )
				Call wm.setViewVal( "writer_name",  rs("WriterName") )
				Call wm.setViewVal( "consult_no",  rs("ConsultNo") )
				Call wm.setViewVal( "EPCnt",  rs("EPCnt") )
				Call wm.setViewVal( "writer_info",  mixWriteName( getWriterInfo( rs("WriterID"), "AdminDepartment" ), rs("WriterName") ) )

				Call wm.setViewVal( "catr", catr )
				Call wm.setViewVal( "page", page )
				Call wm.setViewVal( "size", size )
				Call wm.setViewVal( "search_keyword", search_keyword )
				Call wm.setViewVal( "search_type", search_type )
				Call wm.setViewVal( "cno", cno )
				Call wm.setViewVal( "get_value", get_value )

				
				
								
				inc_file_path = wm.user_view_path & "/popup/print_news_view.asp"
				Call wm.display( "popupNewPrint",  inc_file_path )
			End If 

		END Sub

		'***********************************************
		' 뉴스 좋아요 카운트 증가 처리
		'***********************************************
		Public Sub likeProc()

			Dim article_id, json_result_arr, news_cookie, db_obj, update_query
			
			article_id = wm.getParam("article_id")

			Set json_result_arr = jsObject()

			If article_id = "" Then 
				json_result_arr("state") = "error"
				json_result_arr("response") = "empty_idx"
			Else 
				
				Call wm.getCookies( "news_like_history" , article_id, news_cookie)
				
				If news_cookie = "" Then 

					Set db_obj = db_conn.connection( "kids" )
					
					'++++++++++++++++++++++++++++++ UPDATE ++++++++++++++++++++++++++++++

					update_query =	" UPDATE ArticleData SET  " & _
									"		EPCnt = EPCnt + 1 " & _
									" WHERE ArticleID = '"& article_id &"' "
					
					db_obj.Execute( update_query )

					Call wm.writeCookies("news_like_history", article_id, "clicked", DateAdd("h", 1, now()) )

					json_result_arr("state") = "success"
					json_result_arr("response") = "update"

				Else 
					
					' 좋아요 기록이 있다면 동작없음
					json_result_arr("state") = "error"
					json_result_arr("response") = "exist"

				End If 

			End If 
			
			echo( toJSON( json_result_arr ) )

		End Sub 
		
		'***********************************************
		' 배너 클릭수, 조회수 처리
		'***********************************************
		Public Sub bannerProc()


			Dim banner_id, proc_type, zone_id, today
			Dim update_query, insert_query, select_query, rs_detail, db_obj

			Dim json_result_arr
			
			Set json_result_arr = jsObject()

			'--------------------------------------------------------------------
			' get parameter
			'--------------------------------------------------------------------

			banner_id = Trim( Request("banner_id") )
			zone_id = Trim( Request("zone_id") )
			proc_type = Trim( Request("proc_type") )

			
			'--------------------------------------------------------------------
			' set page
			'--------------------------------------------------------------------
			today = FormatDateTime(Now(), 2)
			
			'--------------------------------------------------------------------
			' DB 접속
			'--------------------------------------------------------------------
			Set db_obj = db_conn.connection( "health" )

			If proc_type = "click" Then 
				'------------- 배너 클릭을 처리한다. -------------

				
				select_query =  " SELECT count(AdID) AS cnt "&_
								" FROM AdStat "&_
								" WHERE  AdID = '" & banner_id & "' AND ClickDate='"& today &"' "
				Set rs_detail = db_obj.Execute( select_query )
				
				If rs_detail("cnt") > 0 Then 
					' 같은 날짜에 해당 배너가 클릭 기록이 있는 상태 - update
					update_query =	" UPDATE AdStat SET  " & _
									"						ClickCnt = ClickCnt + 1 " & _
									" WHERE AdID = '"& banner_id &"' "

					 db_obj.Execute( update_query )
				Else
					' 클릭 기록이 없는 상태 - insert
					insert_query =  " INSERT INTO AdStat "&_
									" (ZoneID, AdID, ClickDate, ClickCnt) "&_
									" VALUES ('"& zone_id & "', '"& banner_id & "', '"& today & "', '1') "

					db_obj.Execute( insert_query )
				End If 

				update_query =	" UPDATE AdInfo SET  " & _
								"						AdClick = AdClick + 1 " & _
								" WHERE AdID = '"& banner_id &"' "

				db_obj.Execute( update_query )
				
				json_result_arr("state") = "success"
				json_result_arr("response") = "click"

			Else 
				'------------- 배너 노출을 처리한다. -------------

				update_query =	" UPDATE AdInfo SET  " & _
								"						AdImpression = AdImpression + 1 " & _
								" WHERE AdID = '"& banner_id &"' "

				db_obj.Execute( update_query )
				
				json_result_arr("state") = "success"
				json_result_arr("response") = "show"

			End If 
			

			'--------------------------------------------------------------------
			' DB 종료
			'--------------------------------------------------------------------
			db_obj.close
			Set db_obj = Nothing
			
			echo( toJSON( json_result_arr ) )


		End Sub 

	End Class 
%>