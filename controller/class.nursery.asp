<%
Class nursery
	Private Sub Class_Initialize() 
	END Sub
	
	Private Sub Class_Terminate() 
	END Sub

	Public Sub list()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, cc_list_class, search_citycode, search_arcode, search_keyword,  page, size, get_val, addr_text
		Dim db_obj, rs, query
		Dim city_rs, town_info
		Dim query_select, query_from, query_where, query_orderby, add_where
		Dim side_first_rs, side_second_rs


		list_class = wm.getParam( "list_class" )
		cc_list_class = wm.getParam( "cc_list_class" )
		search_citycode = wm.getParam( "search_citycode" )
		search_arcode = wm.getParam( "search_arcode" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )


		If (page = "" ) Then 
			page = 1
		End If 

		If (size = "" ) Then 
			size = 10
		End If 
		
		list_name = "nursery_list"

		get_val =	"list_class=" & list_class & _
					"&cc_list_class=" & cc_list_class &_
					"&search_citycode=" & search_citycode &_
					"&search_arcode=" & search_arcode &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size
		
		add_where = ""

		Set db_obj = db_conn.connection( "kids" )

		' 도시 코드를 가져온다.
		Set city_rs = getChildAreaCode( 1, "rs" )
		' 구/군 코드를 가져온다.
		town_info = getChildAreaCode( 2, "json" )

		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )

		' 어린이집 목록을 조회한다.
		If search_citycode <> "" Then 
			add_where = add_where & " AND (Citycode = '"& search_citycode &"' ) "
		End If 
		If search_arcode <> "" Then 
			add_where = add_where & " AND (ARcode = '"& search_arcode &"' ) "
		End If 
		If search_keyword <> "" Then 
			add_where = add_where & " AND (Crname LIKE '%"& search_keyword &"%' ) "
		End If 
			
		If search_citycode = "" Then 
			addr_text = "전국 어린이집"
		Else 
			query = "SELECT ARName FROM ChildAreaCode WHERE ARcode='"& search_citycode &"' ORDER BY IDX DESC"
			Set rs = db_obj.Execute( query )

			addr_text = rs("ARName")
			
			If search_arcode <> "" Then 
				query = "SELECT ARName FROM ChildAreaCode WHERE ARcode='"& search_arcode &"' ORDER BY IDX DESC"
				Set rs = db_obj.Execute( query )

				addr_text = addr_text & "&nbsp;" & rs("ARName")

			End If 

			

		End If 
		query_select =	" * "
		query_from = " ChildDetails "
		query_where = " DelFlag = 0 "  & add_where
		query_orderby = " Regdate DESC "
		
		'--------------------------------------------------------------------
		' 페이징 초기화
		'--------------------------------------------------------------------
		Call wm.setPagingData( list_name, "use_db", "kids" )
		Call wm.setPagingData( list_name, "query_select", query_select )
		Call wm.setPagingData( list_name, "query_from", query_from )
		Call wm.setPagingData( list_name, "query_where", query_where )
		Call wm.setPagingData( list_name, "query_orderby", query_orderby )
		Call wm.setPagingData( list_name, "page_param", get_val )
		Call wm.setPagingData( list_name, "page_per_block", size )
		Call wm.setPagingData( list_name, "page", page )
		Call wm.setPagingData( list_name, "size", size )

		Call wm.setViewVal( "list_class", list_class )
		Call wm.setViewVal( "cc_list_class", cc_list_class )
		Call wm.setViewVal( "search_citycode", search_citycode )
		Call wm.setViewVal( "search_arcode", search_arcode )
		Call wm.setViewVal( "search_keyword", search_keyword )
		Call wm.setViewVal( "page", page )
		Call wm.setViewVal( "size", size )
		Call wm.setViewVal( "get_val", get_val )
		Call wm.setViewVal( "addr_text", addr_text )

		Call wm.setViewVal( "list_name", list_name )
		Call wm.setViewVal( "city_rs", city_rs )
		Call wm.setViewVal( "town_info", town_info )
		Call wm.setViewVal( "nursery_rs", wm.sqlExecuteList( "kids", list_name ) )
		Call wm.setViewVal( "total_count", wm.getPagingData( list_name, "total_count" ) )

		Call wm.setViewVal( "side_first_rs", side_first_rs )
		Call wm.setViewVal( "side_second_rs", side_second_rs )
		

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/nursery/nursery_list.asp"
		Call wm.display( "nurseryList",  inc_file_path )

	End Sub '// list
	
	Public Sub view()

		Dim inc_file_path, list_name, cUserID
		Dim list_class, cc_list_class, search_citycode, search_arcode, search_keyword,  page, size, get_val, idx, mode
		Dim db_obj, rs, query
		Dim city_rs, town_info
		Dim query_select, query_from, query_where, query_orderby, add_where
		
		Dim Citycode, ARcode, Sidoname, Sigunguname, Crname, CRtypename, CRstatusname
		Dim Zipcode, CRaddr, CRtelno, CRfaxno, CRhome, Nrtrroomcnt, Nrtrroomsize
		Dim Plgrdco, Chcrtescnt, CRcapat, CRchcnt, LA, LO, CRcargbname
		Dim CRcnfmdt, CRpausebegindt, CRpauseenddt, CRabldt, CRspec, DelFlag, Regdate
		Dim side_first_rs, side_second_rs

		mode = wm.getParam( "mode" )
		list_class = wm.getParam( "list_class" )
		cc_list_class = wm.getParam( "cc_list_class" )
		search_citycode = wm.getParam( "search_citycode" )
		search_arcode = wm.getParam( "search_arcode" )
		search_keyword = wm.getParam( "search_keyword" )
		page = wm.getParam( "page" )
		size = wm.getParam( "size" )
		idx = wm.getParam( "idx" )
		
		get_val =	"list_class=" & list_class & _
					"&cc_list_class=" & cc_list_class &_
					"&search_citycode=" & search_citycode &_
					"&search_arcode=" & search_arcode &_
					"&search_keyword=" & search_keyword &_
					"&size=" & size

		cUserID = wm.getVal( "cUserID" )

		Set db_obj = db_conn.connection( "kids" )
		
		' 도시 코드를 가져온다.
		Set city_rs = getChildAreaCode( 1, "rs" )
		' 구/군 코드를 가져온다.
		town_info = getChildAreaCode( 2, "json" )
		

		' 보육뉴스 
		query = "SELECT TOP 5 * FROM ChildcareInfo WHERE DelFlag=0 AND ChildInfoType='02' ORDER BY IDX DESC"
		Set side_first_rs = db_obj.Execute( query )


		query = "SELECT *, ( convert(varchar(16), RegDate, 120) ) AS conv_reg_date FROM ChildDetails WHERE IDX='"& idx &"' "
		Set rs = db_obj.Execute( query )

		If rs.Eof Or rs.Bof Then 
			Call wm.moveHandler("replace", "존재하지 않는 게시물입니다.", "/child_manage/list?page="& page & "&" & get_val )
		Else 
			

			Citycode =  nullToSpace( rs("Citycode") )
			ARcode =  nullToSpace( rs("ARcode") )
			Sidoname =  nullToSpace( rs("Sidoname") )
			Sigunguname =  nullToSpace( rs("Sigunguname") )
			Crname =  nullToSpace( rs("Crname") )
			CRtypename =  nullToSpace( rs("CRtypename") )
			CRstatusname =  nullToSpace( rs("CRstatusname") )
			Zipcode =  nullToSpace( rs("Zipcode") )
			CRaddr =  nullToSpace( rs("CRaddr") )
			CRtelno =  nullToSpace( rs("CRtelno") )
			CRfaxno =  nullToSpace( rs("CRfaxno") )
			CRhome =  nullToSpace( rs("CRhome") )
			Nrtrroomcnt =  nullToSpace( rs("Nrtrroomcnt") )
			Nrtrroomsize =  nullToSpace( rs("Nrtrroomsize") )
			Plgrdco =  nullToSpace( rs("Plgrdco") )
			Chcrtescnt =  nullToSpace( rs("Chcrtescnt") )
			CRcapat =  nullToSpace( rs("CRcapat") )
			CRchcnt =  nullToSpace( rs("CRchcnt") )
			LA =  nullToSpace( rs("LA") )
			LO =  nullToSpace( rs("LO") )
			CRcargbname =  nullToSpace( rs("CRcargbname") )
			CRcnfmdt =  nullToSpace( rs("CRcnfmdt") )
			CRpausebegindt =  nullToSpace( rs("CRpausebegindt") )
			CRpauseenddt =  nullToSpace( rs("CRpauseenddt") )
			CRabldt =  nullToSpace( rs("CRabldt") )
			CRspec =  nullToSpace( rs("CRspec") )
			DelFlag =  nullToSpace( rs("DelFlag") )
			Regdate =  nullToSpace( rs("conv_reg_date") )
			
		End If 

		Call wm.setViewVal( "Citycode", Citycode )
		Call wm.setViewVal( "ARcode", ARcode )
		Call wm.setViewVal( "Sidoname", Sidoname ) 
		Call wm.setViewVal( "Sigunguname", Sigunguname )
		Call wm.setViewVal( "Crname", Crname )
		Call wm.setViewVal( "CRtypename", CRtypename )
		Call wm.setViewVal( "CRstatusname", CRstatusname )
		Call wm.setViewVal( "Zipcode", Zipcode )
		Call wm.setViewVal( "CRaddr", CRaddr )
		Call wm.setViewVal( "CRtelno", CRtelno )
		Call wm.setViewVal( "CRfaxno", CRfaxno )
		Call wm.setViewVal( "CRhome", CRhome )
		Call wm.setViewVal( "Nrtrroomcnt", Nrtrroomcnt )
		Call wm.setViewVal( "Nrtrroomsize", Nrtrroomsize )
		Call wm.setViewVal( "Plgrdco", Plgrdco )
		Call wm.setViewVal( "Chcrtescnt", Chcrtescnt )
		Call wm.setViewVal( "CRcapat", CRcapat )
		Call wm.setViewVal( "CRchcnt", CRchcnt )
		Call wm.setViewVal( "LA", LA )
		Call wm.setViewVal( "LO", LO )
		Call wm.setViewVal( "CRcargbname", CRcargbname )
		Call wm.setViewVal( "CRcnfmdt", CRcnfmdt )
		Call wm.setViewVal( "CRpausebegindt", CRpausebegindt )
		Call wm.setViewVal( "CRpauseenddt", CRpauseenddt )
		Call wm.setViewVal( "CRabldt", CRabldt )
		Call wm.setViewVal( "CRspec", CRspec )
		Call wm.setViewVal( "DelFlag", DelFlag )
		Call wm.setViewVal( "Regdate", Regdate )
		
		Call wm.setViewVal( "mode", mode )
		Call wm.setViewVal( "idx", idx )
		Call wm.setViewVal( "cUserID", cUserID )
		Call wm.setViewVal( "list_class", list_class )
		Call wm.setViewVal( "cc_list_class", cc_list_class )
		Call wm.setViewVal( "search_citycode", search_citycode )
		Call wm.setViewVal( "search_arcode", search_arcode )
		Call wm.setViewVal( "search_keyword", search_keyword )
		Call wm.setViewVal( "page", page )
		Call wm.setViewVal( "size", size )
		Call wm.setViewVal( "get_val", get_val )
		Call wm.setViewVal( "city_rs", city_rs )
		Call wm.setViewVal( "town_info", town_info )

		Call wm.setViewVal( "side_first_rs", side_first_rs )
		Call wm.setViewVal( "side_second_rs", side_second_rs )
		
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/nursery/nursery_view.asp"
		Call wm.display( "nurseryView",  inc_file_path )

	End Sub ' // view

End Class 
%>