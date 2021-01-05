<%
	Dim objError

	SET objError = server.GetLastError

'	Response.write strClientIP
'	Response.End

		Response.Write "<html >"
		Response.Write "<head>"
		Response.Write "<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"" />"
		Response.Write "</title>에러정보</title>"
		Response.Write "</head>"
		Response.Write "<body>"
		Response.Write "<table>"
		Response.Write "<tr><td>"
		Response.Write "ASPError.ASPCODE : <font color='red'>"& objError.ASPCode&"<br></font>"
		Response.Write "ASPError.Number : <font color='red'>"& objError.Number&"<br></font>"
		Response.Write "ASPError.Source : <font color='red'>"& objError.Source&"<br></font>"
		Response.Write "ASPError.Category : <font color='red'>"& objError.Category&"<br></font>"
		Response.Write "ASPError.File : <font color='red'>"& objError.File&"<br></font>"
		Response.Write "ASPError.Line : <font color='red'>"& objError.Line&"<br></font>"
		Response.Write "ASPError.Column : <font color='red'>"& objError.Column&"<br></font>"
		Response.Write "ASPError.Desription : <font color='red'>"& objError.Description&"<br></font>"
		Response.Write "ASPError.ASPDescription : <font color='red'>"& objError.ASPDescription&"<br></font>"
		Response.Write "</td>"
		Response.Write "</tr>"
		Response.Write "</table>"


%>




