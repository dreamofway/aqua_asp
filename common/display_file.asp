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
<!-- #include virtual = "/view/user/v180910/main.asp" -->
<%
End sub
%>
<%
Sub getNewsList()
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
<!-- #include virtual = "/view/user/v180910/list.asp" -->
<%
End sub
%>
<%
Sub getNewsView()
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
<!-- #include virtual = "/view/user/v180910/view.asp" -->
<%
End sub
%>
<%
Sub popupNewPrint()
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
<!-- #include virtual = "/view/user/v180910/popup/print_news_view.asp" -->
<%
End sub
%>

<%
Sub getCompanyIntro()
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
<!-- #include virtual = "/view/user/v180910/service/intro.asp" -->
<%
End sub
%>
<%
Sub getCompanyEthics()
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
<!-- #include virtual = "/view/user/v180910/service/code_of_ethics.asp" -->
<%
End sub
%>
<%
Sub getCompanyTerms()
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
<!-- #include virtual = "/view/user/v180910/service/terms.asp" -->
<%
End sub
%>
<%
Sub getCompanyPersonalInfo()
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
<!-- #include virtual = "/view/user/v180910/service/personal_info.asp" -->
<%
End sub
%>
<%
Sub getCompanyPolicy()
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
<!-- #include virtual = "/view/user/v180910/service/policy.asp" -->
<%
End sub
%>
<%
Sub getCompanyCopyright()
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
<!-- #include virtual = "/view/user/v180910/service/copyright.asp" -->
<%
End sub
%>
<%
Sub getRssService()
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
<!-- #include virtual = "/view/user/v180910/service/rss.asp" -->
<%
End sub
%>
<%
Sub getRssList()
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
<!-- #include virtual = "/view/user/v180910/rss/list.asp" -->
<%
End sub
%>
