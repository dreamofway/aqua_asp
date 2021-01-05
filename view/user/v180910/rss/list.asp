<%
Dim ArticleID, Subject, SubTitle, Contents, img_path, WriterName, RegDate, conv_mod_date
Dim conv_reg_date, article_relation_cnt, article_relation_row, article_relation_loop
Dim list_loop, title_len, contents_len
Dim link, con_time, description

%><?xml version="1.0" encoding="utf-8" ?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">
	<channel>
		<title>우리아이뉴스</title>
		<link>http://news.ikn.kr</link>
		<description>우리아이뉴스 RSS : </description>
		<lastBuildDate><%=FormatDateTime( now() , 2) & " " & FormatDateTime( now() , 4) & ":00 +0900"%></lastBuildDate>
		<copyright>Copyright @ Compa Company ikn.kr Crop, All Rights Reserved.</copyright>
		<webMaster>hnl@compa.kr</webMaster>
		<language>ko</language>
		<%
			If Ubound( news_row ) > -1 Then 
				For list_loop = 0 To Ubound( news_row )
					
					ArticleID = news_row( list_loop ).item("ArticleID")
					Subject = news_row( list_loop ).item("Subject")
					SubTitle = news_row( list_loop ).item("SubTitle")
					Contents = news_row( list_loop ).item("Contents")
					img_path = news_row( list_loop ).item("img_path")
					WriterName = news_row( list_loop ).item("WriterName")
					RegDate = news_row( list_loop ).item("RegDate")
					article_relation_cnt = news_row( list_loop ).item("article_relation_cnt")
					conv_reg_date = dateType( "T09", news_row( list_loop ).item("conv_reg_date") ) 
					'conv_mod_date = dateType( "T09", news_row( list_loop ).item("conv_mod_date") ) 
					conv_mod_date = dateType( "T09", news_row( list_loop ).item("conv_reg_date") ) 

					If conv_mod_date = "" Then 
						conv_mod_date = conv_reg_date
					End If 

					link = "http://news.ikn.kr/news/list.asp?ArticleID="& ArticleID &"&catr=" & news_row( list_loop ).item("CatrCode")

		
					con_time = FormatDateTime( RegDate , 2) & "T" & FormatDateTime( RegDate , 4) & ":00+0900"

					description = CutString( Replace(removeContens( Contents ), "&nbsp;", "" )  , 200, "")
					description = Replace(description, chr(10), "" )
					description = Contents


		%>
		<item>
			<title><![CDATA[<%=Subject%>]]></title>
			<link><![CDATA[<%=link%>]]></link>
			<description><![CDATA[<%=description%>]]></description>
			<dc:date><%=con_time%></dc:date>
			<author><![CDATA[]]></author>
			<pubDate><%=con_time%></pubDate>
		</item>
		<%

				Next 
			End If 
		%>
	</channel>
</rss>