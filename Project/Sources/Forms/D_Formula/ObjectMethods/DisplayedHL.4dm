var $p : Integer
var $json : Text

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		$p:=Selected list items:C379(Form:C1466.contextDisplayedHList)
		UI_Formula("listUpdated"; $p)
		
		//ALERT(String($p))
		
		
End case 