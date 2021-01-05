<%
Class linkageArr
		
	Private data ' 전역 적으로 사용할 Dictionary 객체 할당 변수

	Private Sub Class_Initialize() 
		Set data = Server.CreateObject("Scripting.Dictionary")	
	End Sub 

	Private Sub Class_Terminate() 
		Set data = Nothing
	END Sub
	
	Public Sub add( ByVal arg_index, ByVal arg_key, ByVal arg_value  ) 

		If data.Exists( arg_index ) = True Then 			
			Call data( arg_index ).add( arg_key, arg_value )
		Else
			Set data( arg_index ) = CreateObject("Scripting.Dictionary")
			Call data( arg_index ).add( arg_key, arg_value )
		End If 

	End Sub 
	
	Public Function count()
		count = data.count - 1
	End Function 

	Public Function getVal( ByVal arg_index, ByVal arg_key )
		
		Dim result

		arg_key = LCase( Trim( arg_key ) )
		
		If data( arg_index ).Exists( arg_key ) = True Then 
			
			If TypeName( data( arg_index ).item( arg_key ) ) = "Dictionary" Then 
				Set result = data( arg_index ).item( arg_key )
			Else 
				result = data( arg_index ).item( arg_key )
			End If 
			
		End If 

		If TypeName( data( arg_index ).item( arg_key ) ) = "Dictionary" Then 
			Set getVal = result
		Else 
			getVal = result
		End If 

	End Function 

End Class 
%>