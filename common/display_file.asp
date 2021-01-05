<%
'---------------------------------------------------------------------
' dec : html files include sub pakage file
'---------------------------------------------------------------------
' auto write
'---------------------------------------------------------------------
%>
<%
Sub getMainDisplay()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/main.asp" -->
<%
End sub
%>
<%
Sub nurseryList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/nursery/nursery_list.asp" -->
<%
End sub
%>
<%
Sub nurseryView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/nursery/nursery_view.asp" -->
<%
End sub
%>
<%
Sub boardList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/board_list.asp" -->
<%
End sub
%>
<%
Sub boardWrite()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/board_view.asp" -->
<%
End sub
%>
<%
Sub waitingForEntranceView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/wfe_view.asp" -->
<%
End sub
%>
<%
Sub voucherView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/voucher_view.asp" -->
<%
End sub
%>
<%
Sub timeView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/time_view.asp" -->
<%
End sub
%>
<%
Sub reportView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/report_view.asp" -->
<%
End sub
%>
<%
Sub kidcardView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/kidcard_view.asp" -->
<%
End sub
%>
<%
Sub disclosureSummary()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/disclosure_summary.asp" -->
<%
End sub
%>
<%
Sub disclosureItem()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/board/disclosure_item.asp" -->
<%
End sub
%>
<%
Sub miniHome()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/main.asp" -->
<%
End sub
%>
<%
Sub greetingView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/info/greeting.asp" -->
<%
End sub
%>
<%
Sub teacherView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/info/teacher.asp" -->
<%
End sub
%>
<%
Sub operateView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/info/operate.asp" -->
<%
End sub
%>
<%
Sub entranceInfoView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/info/entrance_info.asp" -->
<%
End sub
%>
<%
Sub facilityInfoView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/info/facility_info.asp" -->
<%
End sub
%>
<%
Sub childcareMapView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/info/childcare_map.asp" -->
<%
End sub
%>
<%
Sub noticeList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/notice_list.asp" -->
<%
End sub
%>
<%
Sub noticeView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/notice_view.asp" -->
<%
End sub
%>
<%
Sub newsletterList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/newsletter_list.asp" -->
<%
End sub
%>
<%
Sub jobsList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/job_list.asp" -->
<%
End sub
%>
<%
Sub eventPlan()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/event_plan.asp" -->
<%
End sub
%>
<%
Sub ChildcareCarte()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/carte.asp" -->
<%
End sub
%>
<%
Sub ChildcareSchedule()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/schedule.asp" -->
<%
End sub
%>
<%
Sub ChildcareBooksList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/books_list.asp" -->
<%
End sub
%>
<%
Sub newsletterView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/newsletter_view.asp" -->
<%
End sub
%>
<%
Sub jobsView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/job_view.asp" -->
<%
End sub
%>
<%
Sub ChildcareBooksView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/books_view.asp" -->
<%
End sub
%>
<%
Sub ChildcareClassInfoMain()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/class_info/class_info_main.asp" -->
<%
End sub
%>
<%
Sub ChildcareClassInfoText()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/class_info/class_info.asp" -->
<%
End sub
%>
<%
Sub ChildcareClassInfoPhoto()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/class_info/class_photo.asp" -->
<%
End sub
%>
<%
Sub ChildcareClassInfoPhotoView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/class_info/class_photo_view.asp" -->
<%
End sub
%>
<%
Sub ChildcareFreeList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/community/free_list.asp" -->
<%
End sub
%>
<%
Sub ChildcareQnaList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/community/qna_list.asp" -->
<%
End sub
%>
<%
Sub ChildcareFreeView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/community/free_view.asp" -->
<%
End sub
%>
<%
Sub ChildcareQnaView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/community/qna_view.asp" -->
<%
End sub
%>
<%
Sub exEduList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/external_edu_list.asp" -->
<%
End sub
%>
<%
Sub exEduView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/board/external_edu_view.asp" -->
<%
End sub
%>
<%
Sub cctvState()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/cctv/cctv_state.asp" -->
<%
End sub
%>
<%
Sub cctvView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/cctv/cctv_view.asp" -->
<%
End sub
%>
<%
Sub locationView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/cctv/cctv_view.asp" -->
<%
End sub
%>
<%
Sub ChildcarePhotoClass()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/class_info/photo_class.asp" -->
<%
End sub
%>

<%
Sub ChildcareProposalView()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/community/proposal_view.asp" -->
<%
End sub
%>
<%
Sub ChildcareProposalList()
Dim data, data_loop, val_key, val_item, val_str, tmp
Set data = wm.getViewVal()
val_key = data.keys
val_item = data.items
For data_loop = 0 To Ubound( val_key )
	If TypeName( val_item( data_loop ) ) = "Recordset" Then 
		Set tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : Set " & val_key( data_loop ) & " = tmp"
	Else 
		tmp = val_item( data_loop )
		val_str = "Dim " & val_key( data_loop ) & " : " & val_key( data_loop ) & " = tmp"
	End If 
	execute( val_str )
Next
%>
<!-- #include virtual = "/view/user/v170428/childcare/community/proposal_list.asp" -->
<%
End sub
%>
