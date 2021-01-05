<%
	
'---------------------------------------------------------------------------------------------------
	'문자열 분활
	Private Function SplitChar(ByVal strWords, ByVal strChar, ByRef arrSplitWords)
		arrSplitWords = Split(strWords, strChar, -1, 1)
	End Function
'---------------------------------------------------------------------------------------------------
	'중간의 문자를 삭제하여 완성된 문자열을 보냄
	Private Function CutChars(ByVal strChars, ByVal intFirst, ByVal intSecond, ByRef strCompleteChars)
		Dim intTotalLen, strCutLeft, strCutRight
		strCompleteChars = ""
		strChars = Trim(strChars)
		intTotalLen = Len(strChars)
		If intTotalLen > 0 then
			strCutLeft = Left(strChars, intFirst - 1)
			strCutRight = Right(strChars, intTotalLen - intSecond)
			strCompleteChars = strCutLeft & strCutRight
		End If
	End Function
'----------------------------------------------------------------------------------------------
	'현재 페이지명을 구한다.
	Function GetPageName(ByRef strPageName)
		Dim arrPageName
		Call SplitChar(strURL, "/", arrPageName)
		strPageName = arrPageName(UBound(arrPageName))
	End Function
'----------------------------------------------------------------------------------------------
	'서브디렉토리명 구하기
	Function GetSubDirectory(ByRef strSubDirName)
		Dim strTmpDir
		Call CutChars(strURL, 1, 1, strTmpDir)
		strSubDirName = "root"
		If Instr(strTmpDir, "/") > 0 then strSubDirName = Mid(strTmpDir, 1, Instr(2, strURL, "/", 1) - 2)
	End Function
'----------------------------------------------------------------------------------------------
	'타임체크 저장
	Sub TimerReport(ByVal strNowTimer)
		strTimerReport = strTimerReport + strNowTimer
		strTimerReport = Replace(strTimerReport, "|", " sec"& chr(10) &"")
	End sub
'----------------------------------------------------------------------------------------------
	'타임체크 출력
	Sub TimerReportPrint()
		Response.Write vbLf & vbLf & vbLf &"<!--"& vbLf &"-------------------------------------------------------"& vbLf & vbLf & strTimerReport &"Totol Execute Time : "& FormatNumber(Timer() - pTimeStart, 3) &" sec"& vbLf & vbLf &"-------------------------------------------------------"& vbLf &"//-->"
	End Sub

'---------------------------------------------------------------------------------------------------
	'SQL-Server 에러방지 : 문자열 앞뒤공백제거, 작은따옴표('), 큰 따옴표(") 변환(NotUseHTML:HTML 사용금지-true,false)
	Function ConvertText(ByVal strChars, ByVal NotUseHTML, ByRef strCompleteChars)
		strCompleteChars = Trim(strChars)
		strCompleteChars = Replace(strCompleteChars, "'", "''")
		strCompleteChars = Replace(strCompleteChars, chr(34), """")
		If NotUseHTML Then strCompleteChars = Server.HTMLencode(strCompleteChars)
	End Function
'---------------------------------------------------------------------------------------------------
	'QueryString에서 변수제거
	Function DelValQueryString(ByVal strDelValName, ByRef strDelQueryString)
		Dim ValName, arrValName, chkThisVal, i, j
		Call SplitChar(strDelValName,"|",arrValName)
		strDelQueryString = "" : i = 1
		For Each ValName in Request.QueryString
			chkThisVal = true
			For j = 0 To UBound(arrValName)
				If LCase(arrValName(j)) = LCase(ValName) Then
					chkThisVal = false
					Exit For
				End If
			Next
			If chkThisVal Then
				If i > 1 Then strDelQueryString = strDelQueryString &"&"
				strDelQueryString = strDelQueryString & ValName &"="& Server.UrlEncode(Trim(Request.QueryString(ValName)))
				i = i + 1
			End If
		Next
	End Function
'---------------------------------------------------------------------------------------------------
	'배열형식으로 문자변환
	Function MakeArrayTypeString(ByVal strString, ByVal strChar, ByRef strCompletString)
		strString = Trim(strString)
		strString = Replace(strString,strChar,"|")
		strCompletString = Replace(strString," ","")
	End Function
'---------------------------------------------------------------------------------------------------
	'HTML 삭제
	Function RemoveHTML(ByVal strHTML, ByRef strOutput)
		Dim objRegExp
		Set objRegExp = New RegExp
		objRegExp.IgnoreCase = True
		objRegExp.Global = True
		objRegExp.Pattern = "<(.*)>"
		strOutput = objRegExp.Replace(strHTML,"")
		Set objRegExp = Nothing
	End Function

'---------------------------------------------------------------------------------------------------
	Function RemoveHTML2( strText )
		Dim RegEx

		Set RegEx = New RegExp

		RegEx.Pattern = "<[^>]*>"
		RegEx.Global = True

		RemoveHTML2 = RegEx.Replace(strText, "")
	End Function

'---------------------------------------------------------------------------------------------------
	Function RemovePhrase(ByVal iPhrase, ByVal sChar, ByVal eChar, ByRef oPhrase)
		Dim objRegExp
		Set objRegExp = New RegExp
		objRegExp.IgnoreCase = True
		objRegExp.Global = True
		objRegExp.Pattern = sChar &"[^"& sChar &"|"& eChar &"]*"& eChar
		oPhrase = objRegExp.Replace(iPhrase,"")
		Set objRegExp = Nothing
	End Function
'---------------------------------------------------------------------------------------------------
	Function fnGetTagImage(ByVal iPhrase, ByVal Method, ByRef arrImages)
		Dim i, regEx, RetStr, Matches, Match
		ReDim arrImages(1)
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		Select Case Method
			Case "tag" : regEx.Pattern = "<img [^<>]*>"
			Case "src" : regEx.Pattern = "[^= ']*\.(gif|jpg|bmp|png)"
			Case "file" : regEx.Pattern = "[^= '/]*\.(gif|jpg|bmp|png)"
			Case Else : Exit Function
		End Select
		Set Matches = regEx.Execute(iPhrase)
		i = 0
		For Each Match in Matches
			arrImages(i) = Match.Value
			i = i + 1
			If i > UBound(arrImages) Then Exit For
		Next
	End Function
'---------------------------------------------------------------------------------------------------
	'정규식 패턴검사
	Function RegExpTest(ByVal regRule, ByVal chkStr, ByRef retValue)
		Dim regEx
		Set regEx = New RegExp
		Select Case regRule
			Case "id"		: regEx.Pattern = "[^A-Za-z0-9_]"
			Case "email"	: regEx.Pattern = "^(\w+)@(\w+)\.(\w+)"
			Case "digt"		: regEx.Pattern = "\d"
			Case "phone"	: regEx.Pattern = "^(\d+)\-(\d+)\-(\d+)"
			Case "links"	: regEx.Pattern = "http://*"
		End Select
		regEx.IgnoreCase = True
		retValue = regEx.Test(chkStr)
		Set regEx = Nothing
	End Function
'---------------------------------------------------------------------------------------------------
	'Enter Key를 <br />태그로 변환
	Function ViewDetail(ByVal DisplayType, ByVal strChars, ByRef strCompleteChars)
		strCompleteChars = Trim(strChars)
		Select Case DisplayType
		Case "1" : strCompleteChars = Replace(strCompleteChars, chr(10), "<br />") 'Text + <br />
		Case "2" : 'Html
		Case "3" : strCompleteChars = Replace(strCompleteChars, chr(10), "<br /><br />") 'Text + <br />
		Case Else 'Text
			strCompleteChars = Server.HTMLEncode(strCompleteChars)
			strCompleteChars = Replace(strCompleteChars, chr(10), "<br />")
		End Select
	End Function
'---------------------------------------------------------------------------------------------------
	'랜덤문자열 생성
	Function GenRandom(ByVal strRandomSource, ByVal rLength, ByVal lowerbound, ByVal upperbound, ByRef strRandomValue)
		Dim arrSplitWords, tmpRandomValue
		Call SplitChar(strRandomSource, "|", arrSplitWords)
		lowerbound = lowerbound - 1
		upperbound = upperbound - 1
		Randomize
		strRandomValue = ""
		Do Until Len(strRandomValue) = rLength
			tmpRandomValue = Int((upperbound - lowerbound + 1) * Rnd + lowerbound)
			strRandomValue = strRandomValue & arrSplitWords(tmpRandomValue)
		Loop
	End Function
'---------------------------------------------------------------------------------------------------
	'SMS 보내기
	Function SendSMS(ByVal SND_PHN_ID,ByVal RCV_PHN_ID, ByVal sndDate, ByVal SND_MSG)
		Dim xmldoc, smsTexts, IsToNumber, IsFromNumber,sndResult
		sndResult = False
		SND_PHN_ID = Replace(SND_PHN_ID,"-","") : RCV_PHN_ID = Replace(RCV_PHN_ID,"-","")
		Call RegExpTest("digt", SND_PHN_ID, IsToNumber)
		Call RegExpTest("digt", RCV_PHN_ID, IsFromNumber)
		If IsToNumber And IsFromNumber Then
			Set xmldoc = Server.CreateObject("MSXML2.DOMDocument")
			xmldoc.async = False
			xmldoc.setProperty("ServerHTTPRequest") = True
			smsTexts = "http://cas.chcare.com/adminsys/utils/send.sms.asp?SND_PHN_ID="& SND_PHN_ID &"&RCV_PHN_ID="& RCV_PHN_ID &"&stran_date="& sndDate &"&SND_MSG="& server.URLEncode(SND_MSG) 
			xmldoc.load smsTexts
			sndResult = xmldoc.text
			Response.write "sndResult" &  sndResult
			Response.End
			
			Set xmldoc = Nothing
		End If
	End Function

	Function POSTXml(Byval Url)
	dim objHTTP
	Set objHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
		objHTTP.Open "POST", Url, FALSE
		objHTTP.setRequestHeader  "Accept", "*/*"
		objHTTP.send
		POSTXml = objHTTP.ResponseText
	set objHTTP = Nothing
	End Function

	Function GETXml(Byval Url)
	dim objHTTP
	Set objHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
		objHTTP.Open "GET", Url, FALSE
		objHTTP.setRequestHeader  "Accept", "*/*"
		objHTTP.send
		GETXml = objHTTP.ResponseText
	set objHTTP = Nothing
	End Function

'---------------------------------------------------------------------------------------------------
	'특별한 내용의 배경색 및 글자색 변경(검색등)
	Function RepSearch(ByVal strKeyword, ByVal strHTML, ByRef RepHTML)
		RepHTML = Replace(strHTML, strKeyword, "<span style='background-color:#FFFF00;font-weight:bolder'>"& strKeyword &"</span>")
	End Function
'---------------------------------------------------------------------------------------------------
	'글자수 제한(...으로 변경)
	Function CutString(ByVal strString, ByVal intCutLength, ByRef RepHTML)

		Dim result_str

		If Len(Trim(strString)) > intCutLength then
			result_str = Left(Trim(strString), intCutLength - 1) &".."
		Else
			result_str = Trim(strString)
		End If
		
		If RepHTML = "" Then 
			CutString = result_str
		Else 
			RepHTML = result_str
		End If 
		

	End Function
'---------------------------------------------------------------------------------------------------
	'lf line을 한 라인로 만들기
	Function LfOneLine(ByVal strWords, ByRef strLineMsg)
		DIM arrlfMsg, m, strCutMsg
		arrlfMsg = Split(strWords, chr(10), -1, 1)
		strLineMsg = ""
		For m = 0 to UBound(arrlfMsg)
			strCutMsg = LEFT(arrlfMsg(m), LEN(arrlfMsg(m))-1)
			strLineMsg = strLineMsg &" "& strCutMsg
		Next
	End Function
'---------------------------------------------------------------------------------------------------
	'확장자 구하기
	Function GetFileExt(ByVal strFilePath, ByRef strFileExt)
		Dim intFileLength, intExtLength
		intFileLength = Len(strFilePath)
		intExtLength = InstrRev(strFilePath, ".", -1, 1)
		strFileExt = Right(strFilePath, intFileLength - intExtLength)
		strFileExt = LCase(strFileExt)
	End Function
'---------------------------------------------------------------------------------------------------
	'테이블 TR 배경색상
	Function RowBGColors(ByVal intRowCount,ByVal FirstColor, ByVal SecondColor, ByRef RepColor)
		If intRowCount Mod 2 = 0 Then
			RepColor=FirstColor
		Else
			RepColor=SecondColor
		End If
	End Function
'----------------------------------------------------------------------------------------------
	'사이트 고유 아이디 생성
	Function CreatConnID(ByRef ConnID)
		Dim strGenString, tmpConnID
		strGenString = "0|1|2|3|4|5|6|7|8|9"
		ConnID = FormatDateTime(Now, 2) & FormatDateTime(Now, 4)
		If Second(Now) < 10 Then
			ConnID = ConnID &"0"& Second(Now)
		Else
			ConnID = ConnID & Second(Now)
		End If
		ConnID = Replace(ConnID,"-","")
		ConnID = Replace(ConnID,":","")
		Call GenRandom(strGenString,6,1,10,tmpConnID)
		ConnID = ConnID & tmpConnID
	End Function
'----------------------------------------------------------------------------------------------
	Function getGmt(ByVal sDate,ByRef GMTDate) '시간을 받아 GMT 포맷으로 리턴
		Dim arrDayName(6), arrMonthName(11)
		arrDayName(0) = "Sun" : arrDayName(1) = "Mon" : arrDayName(2) = "The" : arrDayName(3) = "Wed" : arrDayName(4) = "Thu" : arrDayName(5) = "Fri" : arrDayName(6) = "Sat"
		arrMonthName(0) = "Jan" : arrMonthName(1) = "Feb" : arrMonthName(2) = "Mar" : arrMonthName(3) = "Apr" : arrMonthName(4) = "May" : arrMonthName(5) = "Jun" : arrMonthName(6) = "Jul" : arrMonthName(7) = "Aug" : arrMonthName(8) = "Sep" : arrMonthName(9) = "Oct" : arrMonthName(10) = "Nov" : arrMonthName(11) = "Dec"
		GMTDate = arrDayName(DatePart("w", sDate)-1) &" "& Day(sDate) &" "& arrMonthName(DatePart("m", sDate)-1) &" "& year(sDate) &" "& mid(sDate, InstrRev(sDate, " ")) &" GMT"
	End Function
'----------------------------------------------------------------------------------------------
	Function fnHTMLEncode(sText)	'Html -> HtmlEncode
		Dim k
		sText = Replace(sText, Chr(34), "&quot;")
		sText = Replace(sText, Chr(60), "&lt;"  )
		sText = Replace(sText, Chr(62), "&gt;"  )
		sText = Replace(sText, Chr(38), "&amp;" )
		sText = Replace(sText, Chr(32), "&nbsp;")
		fnHTMLEncode = sText
	End Function
'----------------------------------------------------------------------------------------------
	Function HTMLDecode(sText)	'HtmlEncode -> HtmlDecode
		Dim k
		sText = Replace(sText, "&quot;", Chr(34))
		sText = Replace(sText, "&lt;"  , Chr(60))
		sText = Replace(sText, "&gt;"  , Chr(62))
		sText = Replace(sText, "&amp;" , Chr(38))
		sText = Replace(sText, "&nbsp;", Chr(32))
		sText = Replace(sText, "\", "" )
		For k = 1 to 255
			sText = Replace(sText, "&#" & k & ";", Chr(k))
		Next
		HTMLDecode = sText
	End Function
'----------------------------------------------------------------------------------------------
	Function URLDecode(sConvert)
		Dim aSplit, sOutput, I
		If IsNull(sConvert) Then
			URLDecode = ""
			Exit Function
		End If
		sOutput = REPLACE(sConvert, "+", " ")
		aSplit = Split(sOutput, "%")
		If IsArray(aSplit) Then
			sOutput = aSplit(0)
			For I = 0 to UBound(aSplit) - 1
				sOutput = sOutput & Chr("&H" & Left(aSplit(i + 1), 2)) & Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
			Next
		End If
		URLDecode = sOutput
	End Function
'----------------------------------------------------------------------------------------------

	Function MyRandom( couponLength )

	Dim couponValue(35)
    Dim i ,idvalue,couponNo

	couponValue(0) = "A"
	couponValue(1) = "B"
	couponValue(2) = "C" 
	couponValue(3) = "D" 
	couponValue(4) = "E" 
	couponValue(5) = "F" 
	couponValue(6) = "G" 
	couponValue(7) = "H" 
	couponValue(8) = "I" 
	couponValue(9) = "J" 
	couponValue(10) = "K" 
	couponValue(11) = "L" 
	couponValue(12) = "M" 
	couponValue(13) = "N" 
	couponValue(14) = "O" 
	couponValue(15) = "P" 
	couponValue(16) = "Q" 
	couponValue(17) = "R" 
	couponValue(18) = "S" 
	couponValue(19) = "T" 
	couponValue(20) = "U" 
	couponValue(21) = "V" 
	couponValue(22) = "W" 
	couponValue(23) = "X" 
	couponValue(24) = "Y" 
	couponValue(25) = "Z" 
	couponValue(26) = "0" 
	couponValue(27) = "1" 
	couponValue(28) = "2" 
	couponValue(29) = "3" 
	couponValue(30) = "4" 
	couponValue(31) = "5" 
	couponValue(32) = "6" 
	couponValue(33) = "7" 
	couponValue(34) = "8" 
	couponValue(35) = "9"
	'ex) idvalue = Int(( 100-1+1 )*Rnd + 1 ) "1부터 100까지의 난수발생
	'ex) idvalue = Int((50-2+1 ) *Rnd+2 ) "2부터 50까지의 난수발생
	'ex) idvalue = Int((35-0+1 )*Rnd+0 ) "0부터 35까지의 난수 발생

	'couponLength 길이 만큼의 쿠폰번호를 만든다 
	For i=1 To couponLength
	Randomize '난수 발생 초기화
	idvalue=Int((35- 0 + 1) * Rnd + 0)
	couponNo = couponNo & couponValue(idvalue)
	Next
	 
	MyRandom = couponNo '리턴값
	 
	End Function
'----------------------------------------------------------------------------------------------


	'----------------------------------------------------------------------------------------------
	'메일보내기
	Function SendMail(ByVal FromName, ByVal FromMail, ByVal ToName, ByVal ToMail, ByVal strMailSubject, ByVal strMailBody, ByVal AppendFile)
		Dim objMessage, objConfig, Flds
		Const cdoSendUsingPort = 1  '1-로컬, 2-외부
		SET objConfig = createobject("CDO.Configuration")
		SET Flds = objConfig.Fields
		With Flds
			.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = cdoSendUsingPort
			.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost" 'Host 설정
			.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "C:\Inetpub\mailroot\Pickup"
			.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'port
			.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30 'timeout
//'			.Item("http://schemas.microsoft.com/cdo/configuration/smtpaccountname") = "" '계정이름
//'			.Item("http://schemas.microsoft.com/cdo/configuration/sendemailaddress")  = ""
//'			.Item("http://schemas.microsoft.com/cdo/configuration/smtpuserreplyemailaddress")= ""
//'			.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")  = 1 'cdo basic
//'			.Item("http://schemas.microsoft.com/cdo/configuration/sendusername")  = "" '메일서버 계정
//'			.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword")  = "" '메일서버 계정 비밀번호
		.update
		End With

		SET objMessage = Server.CreateObject("CDO.Message")
		SET objMessage.Configuration = objConfig
		With objMessage
			.BodyPart.Charset = "euc-kr"
			.From = FromName &"<"& FromMail &">"
			.To = ToName &"<"& ToMail &">"
			.CC = ""
			.Subject = strMailSubject
			.HTMLBody = strMailBody
			If AppendFile <> "" Then .AddAttachment Server.MapPath("/") & AppendFile
			.Fields.update
			.Send
		End With
		SET objConfig = Nothing
		SET objMessage = Nothing
	End Function
'---------------------------------------------------------------------------------------------------

	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
	' 메일의 기본 틀을 추가하여 내용을 완성한다
	'=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+\
	Function makeMailContents( ByVal param_type, ByVal param_contents ) 
		Dim body

		Select Case param_type
			Case "normal" 
			Case Else 
				body =	"	<div style=""width:100% "" >" &_
						"		<div style=""border:1px solid #c9c9c9; margin:0 auto; width:760px "" > " &_
						"			<div style=""background:#464646"" > " &_
						"				<img src=""http://www.compa.kr/new/image/main/mainimg.png"" style=""width:100%""/> " &_
						"			</div>" &_
						"			<div style=""padding:7px; min-height:250px"">" &_
										param_contents &_
						"			</div>" &_
						"			<div style=""background:#333333; padding:7px"" > " &_
						"				<img src=""http://www.compa.kr/new/image/inc/logo_foot.png"" style=""width:100px""/> " &_
						"				<img src=""http://www.compa.kr/new/image/inc/add.jpg"" style=""width:100px""/> " &_
						"			</div>" &_
						"		</div>" &_
						"	</div>" 
		End Select
		
		makeMailContents = body

	End Function ' //makeMailContents


	
	'******************************************************
	' 일반 textara 에서 작성된 글 보여줄때 라인변경 함수
	'******************************************************
	Function replaceEnter(contents)
		Dim temp_contents
		temp_contents = Replace(contents, Chr(10), "<br />")
		replaceEnter = temp_contents
	End Function 

	
	'****************************************************************
	' 올림함수
	'****************************************************************
	Function Ceil(ByVal intParam)
		Ceil = -(Int(-(intParam)))
	End Function
	
	'****************************************************************
	' 날짜형식 변경 함수
	'****************************************************************
	Function dateType( ByVal arg_type, ByVal arg_date )
		
		Dim response_date
		
		If  arg_date <> ""  Then

			arg_date = cStr(arg_date)

			If Instr( arg_date, "-" ) > 0 Then 
				arg_date = Replace(arg_date, "-", "")
			End If 

			Select Case arg_type
				Case "T01"
					response_date = mid(arg_date,1,4)&"-"&mid(arg_date,5,2)&"-"&mid(arg_date,7,2)
				Case "T02"
					response_date = mid(arg_date,5,2)&"-"&mid(arg_date,7,2)
				Case "T03"
					response_date = mid(arg_date,1,4)&"."&mid(arg_date,5,2)&"."&mid(arg_date,7,2)
				Case "T04"
					response_date = Cint(mid(arg_date,5,2))&"."&mid(arg_date,7,2)
				Case "T05"
					response_date = mid(arg_date,1,4)&"/"&mid(arg_date,5,2)&"/"&mid(arg_date,7,2)	
				Case "T06"
					response_date = mid(arg_date,5,2)&"/"&mid(arg_date,7,2)
				Case "T07"
					response_date = mid(arg_date,1,4)&"년 "&mid(arg_date,5,2)&"월 "&mid(arg_date,7,2)&"일"	
				Case "T08"
					response_date = mid(arg_date,5,2)&"월 "&mid(arg_date,7, 2)&"일"
				Case "T09"
					response_date = mid(arg_date,1,4)&"."&mid(arg_date,5,2)&"."& mid(arg_date,7,2) & "&nbsp;" & mid(arg_date,9,6)
				Case "T10"
					response_date = mid(arg_date,1,4)&"/"&mid(arg_date,5,2)&"/"& mid(arg_date,7,2) & "&nbsp;" & mid(arg_date,9,6)
				Case "T11"
					response_date = mid(arg_date,1,4)&"-"&mid(arg_date,5,2)&"-"& mid(arg_date,7,2) &  mid(arg_date,9,10) 
			End Select 
			
		Else 
			response_date = arg_date
		End If ' // If  arg_date <> ""  Then
		
		dateType = response_date

	End Function ' // dateType
	
	'***********************************************
	'       요일구하기
	'***********************************************
	function WeekStr(inDate)

		Dim WeekInt
		Dim rtvStr

		WeekInt = WeekDay(inDate)

		if WeekInt = 1 then
			rtvStr = "일"
		elseif WeekInt = 2 then
			rtvStr = "월"
		elseif WeekInt = 3 then
			rtvStr = "화"
		elseif WeekInt = 4 then
			rtvStr = "수"
		elseif WeekInt = 5 then
			rtvStr = "목"
		elseif WeekInt = 6 then
			rtvStr = "금"
		elseif WeekInt = 7 then
			rtvStr = "토"
		end if 
		WeekStr = rtvStr
	end Function

	
	'***********************************************
	' 텍스트에 \ 추가
	'***********************************************
	function addSlahes( ByVal input )
		addSlahes = replace(input,"\","\\")
		addSlahes = replace(addSlahes,"'","\'")
		addSlahes = replace(addSlahes,chr(34),"\"+chr(34))
	end Function
	
	'***********************************************
	' 설명 : 랜덤 숫자를 생성한다.
	' param_min : 최소값 
	' param_max : 최대값
	' param_except : 제외할 값
	'***********************************************
	Function rand( ByVal param_min, ByVal param_max, ByVal param_except ) 
		
		Dim rand_result
		If param_min = "" Then 
			param_min = 1
		End If 

		If Int( param_min ) > Int( param_max ) Then 
			Response.write "함수 rand -> 최소값이 최대값 보다 클 수 없습니다."
			Response.End 
		End If 

		Randomize
		
		rand_result = Int( ( ( ( param_max - param_min) + 1 ) * ( Rnd + param_min ) ) )

		If ( ( param_except <> "" ) And ( InStr(param_except, rand_result) > 0 ) ) Then 
			rand_result = rand( param_min , param_max, param_except )
		End If 
		
		If rand_result > param_max Then 
			rand_result = rand( param_min , param_max, param_except )
		End If 

		rand = rand_result


	End Function

	'***********************************************
	' 설명 : url을 인코딩 한다
	'***********************************************
	Function URLEncode(URLStr)

		Dim sURL                '** 입력받은 URL 문자열
		Dim sBuffer             '** Encoding 중의 URL 을 담을 Buffer 문자열
		Dim sTemp               '** 임시 문자열
		Dim cChar               '** URL 문자열 중의 현재 Index 의 문자

		Dim Index

		 On Error Resume Next

		 Err.Clear
		 sURL = Trim(URLStr)     '** URL 문자열을 얻는다.
		 sBuffer = ""            '** 임시 Buffer 용 문자열 변수 초기화.


		 '******************************************************
		 '* URL Encoding 작업
		'******************************************************

		 For Index = 1 To Len(sURL)
			 '** 현재 Index 의 문자를 얻는다.
			 cChar = Mid(sURL, Index, 1)

			 If cChar = "0" Or _
				(cChar >= "1" And cChar <= "9") Or _
				(cChar >= "a" And cChar <= "z") Or _
				(cChar >= "A" And cChar <= "Z") Or _
				cChar = "-" Or _
				cChar = "*" Then

				 '** URL 에 허용되는 문자들 :: Buffer 문자열에 추가한다.
				 sBuffer = sBuffer & cChar

			 ElseIf cChar = " " Then
				 '** 공백 문자 :: + 로 대체하여 Buffer 문자열에 추가한다.
				 sBuffer = sBuffer & "+"
			 Else
				 '** URL 에 허용되지 않는 문자들 :: % 로 Encoding 해서 Buffer 문자열에 추가
				sTemp = CStr(Hex(Asc(cChar)))

				 If Len(sTemp) = 4 Then
					 sBuffer = sBuffer & "%" & Left(sTemp, 2) & "%" & Mid(sTemp, 3, 2)
				 ElseIf Len(sTemp) = 2 Then
					 sBuffer = sBuffer & "%" & sTemp
				 End If
			 End If
		 Next


		 '** Error 처리
		If Err.Number > 0 Then
			 URLEncode = ""
			 Exit Function
		 End If

		 '** 결과를 리턴한다.
		 URLEncode = sBuffer
		 Exit Function

	 End Function

	'***********************************************
	' 설명 : 접속 기기를 파악한다. pc / mobile
	'***********************************************
	 Function checkFlatform() 
		
		Dim result
		Dim eregObj
		Dim regexp_result
		Set eregObj = New RegExp

		Dim user_agent_info
		
		user_agent_info = Request.ServerVariables("HTTP_USER_AGENT")
		eregObj.IgnoreCase = True: '//대소문자 구분 여부
		eregObj.Global = True: '//전체 문서에서 검색
		eregObj.Pattern = "(iPod|iPhone|Android|BlackBerry|SymbianOS|SCH-M\d+|Opera Mini|Windows CE|Nokia|SonyEricsson|webOS|PalmOS|iPad)": '//패턴 설정

		regexp_result = eregObj.test( user_agent_info )
		
		If regexp_result = True Then 
			result = "mobile"
		Else 
			result = "pc"
		End If 

		checkFlatform = result

	End Function '// checkFlatform

	
	'***********************************************
	' 설명 : null check 후 공백 치환
	'***********************************************
	Function nullToSpace( ByVal param )
		
		Dim result

		If isnull( Trim( param ) ) = True Then 
			result = ""
		Else 
			result = Trim( param )
		End If 
		
		nullToSpace = result

	End Function
	
	'***********************************************
	' 10보다 작은 수 앞에 0을 붙인다.
	'***********************************************
	Function addZero( ByVal arg_val )
		
		If arg_val <> "" Then 
			If CInt( arg_val ) < 10 Then 
				arg_val = "0" & arg_val 
			End If 
		End If 

		addZero = arg_val

	End Function 
	
	'***********************************************
	' 설명 : 폴더 하위의 파일을 동적으로 import 한다
	'***********************************************
	Sub importFolder( ByVal folder_path )
		
		Dim obj_fso, obj_folder, obj_files, obj_text, map_path, item
		Dim obj_stream, stream_code
		
		map_path = Server.MapPath( folder_path )
		
		Set obj_fso = CreateObject("Scripting.FileSystemObject")      '파일시스템 개체 생성
		
		IF NOT( obj_fso.FolderExists( map_path ) ) Then
			
			Response.write "<br />경로에 폴더가 없음.<br />"

		Else 

			Set obj_stream = CreateObject("ADODB.Stream")		
			obj_stream.CharSet = Response.CharSet
			obj_stream.Open
			
			Set obj_folder = obj_fso.GetFolder( map_path )

			Set obj_files = obj_folder.files
			
			if obj_files.count > 0 Then
				For Each item in obj_files

					obj_stream.LoadFromFile( map_path & "\" & item.name )
					stream_code = Replace(Replace( obj_stream.ReadText(),"<"&"%",""),"%"&">","")
					executeGlobal( stream_code ) 

				Next 

				Set obj_text = Nothing

			End If 
		End If 
		
		Set obj_fso = Nothing 

	End Sub

	Function eregi_replace(pattern, replace, text)
		Dim eregObj:

		Set eregObj = New RegExp:

		eregObj.Pattern = pattern: '//패턴 설정
		eregObj.IgnoreCase = True: '//대소문자 구분 여부
		eregObj.Global = True: '//전체 문서에서 검색

		eregi_replace = eregObj.Replace(text, replace): '//Replace String
	End Function

	'	CxImageATL 객체 사용시 파일타입 리턴
	Function GetFileType(sFile)
		Dim dot, filetype, sExt		
		dot = InStrRev(sFile, ".")
		filetype=2
		If dot > 0 Then sExt = LCase(Mid(sFile, dot + 1, 3))
		If sExt = "bmp" Then filetype = 0
		If sExt = "gif" Then filetype = 1
		If sExt = "jpg" Then filetype = 2
		If sExt = "png" Then filetype = 3
		If sExt = "ico" Then filetype = 4
		If sExt = "tif" Then filetype = 5
		If sExt = "tga" Then filetype = 6
		If sExt = "pcx" Then filetype = 7
		GetFileType=filetype
	End Function

	'***********************************************
	' 설명 : 브라우저 캐시방지 ver param 값 생성
	'***********************************************
	Function verMake()
		verMake = year(now)&month(now)&day(now)&timer
	End Function 
	
	'***********************************************
	' 설명 : 배열을 연속된 문자열로 반환한다.
	'***********************************************
	Function arrToString( ByVal arg_arr, ByVal arg_symbol )
		arrToString = Join(arg_arr, arg_symbol)
	End Function 
	
	'***********************************************
	' 설명 : 접속자의 유입경로를 파악하고 db에 insert 한다.
	'***********************************************
	Function userAccessLog() 
			
		Dim temp, UserBrowser, arrRobots, arrRobotsIP, IsUser, i
		Dim CheckOverlap, ConnBrowser, ConnOS, ToDay, ConnMinute
		Dim QueryTable, QueryCol, QueryValue, QueryWhere
		Dim access_device
		
		Dim user_agent_info
		Dim ereg_result
		Dim eregObj, ereg_browser_obj
		Dim regexp_result, reg_result_row, ereg_browser_result
		

		ToDay = FormatDateTime(date, 2)
		ToDay = ToDay &" 00:00:00"
		ToDay = CDate(ToDay)

		access_device = checkFlatform()
		user_agent_info = Request.ServerVariables("HTTP_USER_AGENT")
	
		Set eregObj = New RegExp
		eregObj.IgnoreCase = true: '//대소문자 구분 여부
		eregObj.Global = True: '//전체 문서에서 검색

		Set ereg_browser_obj = New RegExp
		ereg_browser_obj.IgnoreCase = true: '//대소문자 구분 여부
		ereg_browser_obj.Global = True: '//전체 문서에서 검색
		
		If access_device = "pc" Then 

			eregObj.Pattern = "(Windows NT .*?\.(.?)|Windows 95|Win98|Macintosh|Mac_PowerPC|mac|Linux|Wget|Unix)": '//패턴 설정

		Else
		
			eregObj.Pattern = "(Android|mac)": '//패턴 설정

		End If 

		Set regexp_result = eregObj.Execute( user_agent_info )

		For Each reg_result_row In regexp_result
			ConnOS = reg_result_row.Value
		Next 
		
		ereg_browser_obj.Pattern = "(Firefox|Chrome|Safari|OPR|Swing|msie|konq|Nets)": '//패턴 설정
		Set ereg_browser_result = ereg_browser_obj.Execute( user_agent_info )

		For Each reg_result_row In ereg_browser_result
			ConnBrowser = reg_result_row.Value
		Next 
		
		' 익스 : Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko
		' 크롬 : Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36
		' 사파리 : Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2
		' 파이어폭스 : Mozilla/5.0 (Windows NT 6.3; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0
		' 오페라 : Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36 OPR/41.0.2353.69
		' 스윙 : Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.3; WOW64; Trident/7.0; .NET4.0E; .NET4.0C; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729) Swing/3.4.1.0

		If ConnBrowser = "Safari" Then 
			If Instr(LCase(user_agent_info),"chrome") > 0 Then 
				ConnBrowser = "Chrome"
			End If 
		End If 

'		If strClientIP = "115.91.124.179" Then
'			echoBr( user_agent_info )
'		End If 

		Dim vReferer, vfReferer, tmpReferer
		vfReferer = Trim(Request.ServerVariables("HTTP_REFERER"))
		tmpReferer = Instr(8,vfReferer,"/",1)
		If tmpReferer > 0 Then
			vReferer = Left(vfReferer,tmpReferer-1)
			Call CutChars(vReferer,1,7,vReferer)
		Else
			vReferer = "direct connect"
		End If

		IsUser = False
		'네이버 접속만 카운트
		If InStr(1, LCase(vReferer), "naver.com", 1) > 0 Then IsUser = True
		If InStr(1, LCase(vReferer), "zum.com", 1) > 0 Then IsUser = True

		IsUser = True
		 
		If IsUser Then

			Dim Analysis_db, query, rs

			Set Analysis_db = db_conn.connection("Analysis")
			
			Call runTransaction( Analysis_db , "start")

			'접속통계입력	
			query = "SELECT Count(StatDate) as CheckOverlap FROM KIDsStatsCount WHERE StatDate = '"& ToDay &"' "
			Set rs = Analysis_db.Execute( query )
			
			If rs("CheckOverlap") = 0 then

				Call initSql("proc", "insert")
				Call initSql("use_table", "KIDsStatsCount")
				Call initSql("StatDate", "'"& ToDay &"'")
				Call initSql("ConnCnt", "'1'")
				Call executeSql( Analysis_db )

			Else

				Call initSql("proc", "update")
				Call initSql("use_table", "KIDsStatsCount")
				Call initSql("query_where", " StatDate = '"& ToDay &"'")
				Call initSql("ConnCnt", " ConnCnt + 1 ")
				Call executeSql( Analysis_db )

			End If

			ConnMinute = Minute(now)

			If ConnMinute < 10 Then ConnMinute = "0" & ConnMinute
			
			Call initSql("proc", "insert")
			Call initSql("use_table", "KIDsStatsInfo")
			Call initSql("ConnIP", "'"& wm.user_ip &"'")
			Call initSql("ConnBrowser", "'"& ConnBrowser &"'")
			Call initSql("ConnOS", "'"& ConnOS &"'")
			Call initSql("ConnReferer", "'"& vReferer &"'")
			Call initSql("ConnRefererFull", "'"& vfReferer &"'")
			Call initSql("ConnURL", "'"& wm.current_url &"'")
			Call initSql("ConnURLFull", "'"& getServerVal( "HTTP_X_ORIGINAL_URL" ) &"'")
			Call initSql("ConnHour", "'"& Hour(now) &"'")
			Call initSql("ConnMinute", "'"& ConnMinute &"'")
			Call initSql("ConnDate", "getdate()")
			Call executeSql( Analysis_db )
			

			Call runTransaction( Analysis_db , "end")

		End If
	End Function '// userAccessLog()

%>