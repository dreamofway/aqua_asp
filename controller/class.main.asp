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
			Dim result_policy, result_photo, result_peple, result_moms_news, result_popular_news
			Dim db_obj, rs, query
			Dim city_rs, town_info, join_board_rs, city_nursery_rs, child_care_rs
			
			Set db_obj = db_conn.connection( "kids" )
			
			' 시/도 컬러 클래스 설정 
			Call wm.setVal( "11000", "su" ) ' 서울
			Call wm.setVal( "26000", "bs" ) ' 부산
			Call wm.setVal( "27000", "dg" ) ' 대구
			Call wm.setVal( "28000", "ic" ) ' 인천
			Call wm.setVal( "29000", "gj" ) ' 광주
			Call wm.setVal( "30000", "dj" ) ' 대전
			Call wm.setVal( "31000", "us" ) ' 울산
			Call wm.setVal( "36000", "sj" ) ' 울산
			Call wm.setVal( "41000", "gg" ) ' 경기
			Call wm.setVal( "42000", "gw" ) ' 강원
			Call wm.setVal( "43000", "cb" ) ' 충북
			Call wm.setVal( "44000", "cn" ) ' 충남
			Call wm.setVal( "45000", "jb" ) ' 전북
			Call wm.setVal( "46000", "jn" ) ' 전남
			Call wm.setVal( "47000", "gb" ) ' 경북
			Call wm.setVal( "48000", "gn" ) ' 경남
			Call wm.setVal( "50000", "jj" ) ' 제주


			' 도시 코드를 가져온다.
			Set city_rs = getChildAreaCode( 1, "rs" )
			' 구/군 코드를 가져온다.
			town_info = getChildAreaCode( 2, "json" )
			
			' 우리아이뉴스 최신 2개
			query = "SELECT		TOP 2 * " &_
					", IsNULL( (" & _
					"		SELECT TOP 1" & _
					"			 ImagePath + '/' + ImageName  " & _
					"		FROM ActicleImage " & _
					"		WHERE ArticleID = t_std.ArticleID AND align='news_list_thum' " & _
					"		ORDER BY SEQ DESC " & _
					"	) , '' ) AS img_path " & _			
					"FROM	ArticleData AS t_std " &_
					"WHERE	IsPublish=1 AND CatrCode LIKE '11%' "&_
					"ORDER BY RegDate DESC" 
			Set join_board_rs = db_obj.Execute( query )

			' 시/도 별 어린이집 16개
			query = " SELECT IDX, Citycode, ARcode, STcode, Crname FROM ( "
			Dim while_cnt : while_cnt = 0

			Do While not city_rs.Eof
				
				If while_cnt = 0 Then 
					query = query & "SELECT TOP 16 IDX, Citycode, ARcode, STcode, Crname FROM ChildDetails WHERE Citycode = '"& city_rs("ARcode") &"' ORDER BY NEWID()"
				Else 
					query = query & "UNION SELECT TOP 16 IDX, Citycode, ARcode, STcode, Crname FROM ChildDetails WHERE Citycode = '"& city_rs("ARcode") &"' ORDER BY NEWID()"
				End If 
				

				city_rs.MoveNext()
				while_cnt = while_cnt + 1 
			Loop 
			city_rs.MoveFirst ' main.asp 에서도 사용하기위해 시작 점으로 이동
			query = query & " ) AS nursery "
			
			Set city_nursery_rs = db_obj.Execute( query )

			' 보육뉴스 
			query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
			Set child_care_rs = db_obj.Execute( query )

			' 메인 등록 어린이집 1개 ( 현재 메인관리 없음 )
			
			Call wm.setViewVal( "city_rs", city_rs )
			Call wm.setViewVal( "town_info", town_info )
			Call wm.setViewVal( "join_board_rs", join_board_rs )
			Call wm.setViewVal( "city_nursery_rs", city_nursery_rs )
			Call wm.setViewVal( "child_care_rs", child_care_rs )

			' view 페이지의 경로를 정의한다.
			inc_file_path = wm.user_view_path & "/main.asp"
			Call wm.display( "getMainDisplay",  inc_file_path )
		End Sub ' // initMain



		
	End Class 


%>
