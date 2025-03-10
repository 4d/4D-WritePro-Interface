Case of 
	: (Form event code:C388=On After Edit:K2:43)
		
		If (Get edited text:C655="")
			Form:C1466._extra.state:=-1
		Else 
			Form:C1466._extra.state:=0
		End if 
		
		Form:C1466.radio.opt1:=True:C214
		Form:C1466.radio.opt2:=False:C215
		Form:C1466.radio.opt3:=False:C215
		
		SET TIMER:C645(-1)
		
End case 
