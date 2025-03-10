var $choice : Text

$choice:=Dynamic pop up menu:C1006(Form:C1466.promptMenu)
If ($choice#"")
	
	Form:C1466.prompt:=Form:C1466.prompts[Num:C11($choice)].prompt
	Form:C1466._extra.state:=0
	
	Form:C1466.radio.opt1:=False:C215
	Form:C1466.radio.opt2:=False:C215
	Form:C1466.radio.opt3:=False:C215
	
	Case of 
		: (Form:C1466.prompts[Num:C11($choice)].source="selection")
			Form:C1466.radio.opt2:=True:C214
		: (Form:C1466.prompts[Num:C11($choice)].source="document")
			Form:C1466.radio.opt3:=True:C214
		Else 
			Form:C1466.radio.opt1:=True:C214
	End case 
	
	SET TIMER:C645(-1)
	
End if 

