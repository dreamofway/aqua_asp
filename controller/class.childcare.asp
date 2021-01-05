<%
Class childcare
	
	Private inc_file_path ' html file 경로 
	Private fid ' 어린이집 코드
	
	
	Private Sub Class_Initialize()
	
		fid = wm.getParam( "fid" )

		If fid = "" Then 
			Call moveHandler( "popup_close", "잘못된 접근입니다.", "" )
		End If 
		
		' 메뉴 생성 함수 호출
		Call checkMenuState( fid )

		Call wm.setVal( "fid", fid )
		Call wm.setVal( "top_code", wm.getParam( "top_code" ) )
		Call wm.setVal( "left_code", wm.getParam( "left_code" ) )

	END Sub
	
	Private Sub Class_Terminate() 
	END Sub
	
	'***********************************************
	' 설명 : 홈
	'***********************************************
	Public Sub home()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/main.asp"
		Call wm.display( "miniHome",  inc_file_path )

	End Sub ' // home

	'***********************************************
	' 설명 : 어린이집 정보
	'***********************************************
	Public Sub childcareInfo()
		
	End Sub ' // childcareInfo

	'***********************************************
	' 설명 : 원장 인사말
	'***********************************************
	Public Sub greeting()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/info/greeting.asp"
		Call wm.display( "greetingView",  inc_file_path )

	End Sub ' // greeting

	'***********************************************
	' 설명 : 교직원 소개
	'***********************************************
	Public Sub teacher()
		
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/info/teacher.asp"
		Call wm.display( "teacherView",  inc_file_path )

	End Sub ' // teacher

	'***********************************************
	' 설명 : 운영 및 방침
	'***********************************************
	Public Sub operate()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/info/operate.asp"
		Call wm.display( "operateView",  inc_file_path )

	End Sub ' // operate

	'***********************************************
	' 설명 : 입학 안내
	'***********************************************
	Public Sub entrance_info()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/info/entrance_info.asp"
		Call wm.display( "entranceInfoView",  inc_file_path )

	End Sub ' // entrance_info

	'***********************************************
	' 설명 : 시설 안내
	'***********************************************
	Public Sub facility_info()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/info/facility_info.asp"
		Call wm.display( "facilityInfoView",  inc_file_path )

	End Sub ' // facility_info

	'***********************************************
	' 설명 : 오시는 길
	'***********************************************
	Public Sub childcare_map()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/info/childcare_map.asp"
		Call wm.display( "childcareMapView",  inc_file_path )

	End Sub ' // childcare_map


	'***********************************************
	' 설명 : 공지사항 목록
	'***********************************************
	Public Sub notice_list()

		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/notice_list.asp"
		Call wm.display( "noticeList",  inc_file_path )

	End Sub ' // notice_list

	'***********************************************
	' 설명 : 공지사항 상세
	'***********************************************
	Public Sub notice_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/notice_view.asp"
		Call wm.display( "noticeView",  inc_file_path )
	End Sub ' // notice_view

	'***********************************************
	' 설명 : 가정통신문 목록
	'***********************************************
	Public Sub newsletter_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/newsletter_list.asp"
		Call wm.display( "newsletterList",  inc_file_path )
	End Sub ' // newsletter_list

	'***********************************************
	' 설명 : 가정통신문 상세
	'***********************************************
	Public Sub newsletter_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/newsletter_view.asp"
		Call wm.display( "newsletterView",  inc_file_path )
	End Sub ' // newsletter_view

	'***********************************************
	' 설명 : 구인구직 목록
	'***********************************************
	Public Sub job_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/job_list.asp"
		Call wm.display( "jobsList",  inc_file_path )
	End Sub ' // job_list

	'***********************************************
	' 설명 : 구인구직 상세
	'***********************************************
	Public Sub job_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/job_view.asp"
		Call wm.display( "jobsView",  inc_file_path )
	End Sub ' // job_view

	'***********************************************
	' 설명 : 이달의 행사
	'***********************************************
	Public Sub event_plan()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/event_plan.asp"
		Call wm.display( "eventPlan",  inc_file_path )
	End Sub ' // event_plan

	'***********************************************
	' 설명 : 식단표
	'***********************************************
	Public Sub carte()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/carte.asp"
		Call wm.display( "ChildcareCarte",  inc_file_path )
	End Sub ' // carte
	
	'***********************************************
	' 설명 : 일정표
	'***********************************************
	Public Sub schedule()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/schedule.asp"
		Call wm.display( "ChildcareSchedule",  inc_file_path )
	End Sub ' // schedule
	
	'***********************************************
	' 설명 : 추천도서 목록
	'***********************************************
	Public Sub books_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/books_list.asp"
		Call wm.display( "ChildcareBooksList",  inc_file_path )
	End Sub ' // books_list

	'***********************************************
	' 설명 : 추천도서 상세
	'***********************************************
	Public Sub books_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/books_view.asp"
		Call wm.display( "ChildcareBooksView",  inc_file_path )
	End Sub ' // books_list
	
	'***********************************************
	' 설명 : 반소개 - 메인
	'***********************************************
	Public Sub class_info_main()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/class_info/class_info_main.asp"
		Call wm.display( "ChildcareClassInfoMain",  inc_file_path )
	End Sub ' // class_info_main
	
	'***********************************************
	' 설명 : 반소개 - 상세
	'***********************************************
	Public Sub class_info()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/class_info/class_info.asp"
		Call wm.display( "ChildcareClassInfoText",  inc_file_path )
	End Sub ' // class_info

	'***********************************************
	' 설명 : 반소개 - 앨범
	'***********************************************
	Public Sub class_photo()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/class_info/class_photo.asp"
		Call wm.display( "ChildcareClassInfoPhoto",  inc_file_path )
	End Sub ' // class_photo

	'***********************************************
	' 설명 : 반소개 - 앨범
	'***********************************************
	Public Sub class_photo_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/class_info/class_photo_view.asp"
		Call wm.display( "ChildcareClassInfoPhotoView",  inc_file_path )
	End Sub ' // class_photo_view


	'***********************************************
	' 설명 : 앨범 - class 목록
	'***********************************************
	Public Sub photo_class()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/class_info/photo_class.asp"
		Call wm.display( "ChildcarePhotoClass",  inc_file_path )
	End Sub ' // photo_class

	'***********************************************
	' 설명 : 자유게시판 목록
	'***********************************************
	Public Sub free_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/community/free_list.asp"
		Call wm.display( "ChildcareFreeList",  inc_file_path )
	End Sub ' // free_list

	'***********************************************
	' 설명 : 자유게시판 상세
	'***********************************************
	Public Sub free_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/community/free_view.asp"
		Call wm.display( "ChildcareFreeView",  inc_file_path )
	End Sub ' // free_view

	'***********************************************
	' 설명 : Q&A 목록
	'***********************************************
	Public Sub qna_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/community/qna_list.asp"
		Call wm.display( "ChildcareQnaList",  inc_file_path )
	End Sub ' // qna_list

	'***********************************************
	' 설명 : Q&A 상세
	'***********************************************
	Public Sub qna_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/community/qna_view.asp"
		Call wm.display( "ChildcareQnaView",  inc_file_path )
	End Sub ' // qna_view
	
	'***********************************************
	' 설명 : 건의사항 목록
	'***********************************************
	Public Sub proposal_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/community/proposal_list.asp"
		Call wm.display( "ChildcareProposalList",  inc_file_path )
	End Sub ' // proposal_list

	'***********************************************
	' 설명 : 건의사항 목록
	'***********************************************
	Public Sub proposal_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/community/proposal_view.asp"
		Call wm.display( "ChildcareProposalView",  inc_file_path )
	End Sub ' // proposal_list

	'***********************************************
	' 설명 : 외부교육 목록
	'***********************************************
	Public Sub external_edu_list()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/external_edu_list.asp"
		Call wm.display( "exEduList",  inc_file_path )
	End Sub ' // external_edu_list

	'***********************************************
	' 설명 : 외부교육 상세
	'***********************************************
	Public Sub external_edu_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/board/external_edu_view.asp"
		Call wm.display( "exEduView",  inc_file_path )
	End Sub ' // external_edu_view
	
	'***********************************************
	' 설명 : cctv - 메인
	'***********************************************
	Public Sub cctv_state()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/cctv/cctv_state.asp"
		Call wm.display( "cctvState",  inc_file_path )
	End Sub ' // cctv_state

	'***********************************************
	' 설명 : cctv - 상세
	'***********************************************
	Public Sub cctv_view()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/cctv/cctv_view.asp"
		Call wm.display( "cctvView",  inc_file_path )
	End Sub ' // cctv_view

	'***********************************************
	' 설명 : 위치추적
	'***********************************************
	Public Sub location()
		' view 페이지의 경로를 정의한다.
		inc_file_path = wm.user_view_path & "/childcare/location/location.asp"
		Call wm.display( "locationView",  inc_file_path )
	End Sub ' // location
	
		
End Class 
%>