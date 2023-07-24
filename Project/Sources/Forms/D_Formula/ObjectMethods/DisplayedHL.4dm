var $p : Integer

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		$p:=Selected list items:C379(Form:C1466.contextDisplayedHList)
		Form:C1466.wizard.formulaUI("listUpdated"; $p)
		
End case 