C_TEXT:C284($stylesheetName)

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		$stylesheetName:=Self:C308->{Self:C308->}
		WP SET ATTRIBUTES:C1342(Form:C1466.selection;wk style sheet:K81:63;$stylesheetName)
		
		SET TIMER:C645(-1)
End case 
