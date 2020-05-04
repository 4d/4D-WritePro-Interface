  //ACI0097045
Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"previousValue"))->:=Self:C308->
		
	: (Form event code:C388=On Data Change:K2:15)
		
		vError:=False:C215
		ON ERR CALL:C155("TrapError")
		
		WP_SetSizes (Form:C1466.imageRange;"picture")  //ACI0100269
		
		ON ERR CALL:C155("")
		If (vError=True:C214)
			Self:C308->:=(OBJECT Get pointer:C1124(Object named:K67:5;"previousValue"))->
		End if 
		
End case 