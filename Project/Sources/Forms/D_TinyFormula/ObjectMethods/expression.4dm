var $text; $expression; $errorMessage : Text

Case of 
	: (Form event code:C388=On After Edit:K2:43)
		
		$text:=Get edited text:C655
		$expression:=Parse formula:C1576($text; Formula in with virtual structure:K88:1; $errorMessage)
		
		If ($errorMessage="")
			OBJECT SET ENABLED:C1123(*; "bOK"; True:C214)
			Form:C1466.expression:=$expression
			Form:C1466.formula:=Formula from string:C1601($expression)
		Else 
			OBJECT SET ENABLED:C1123(*; "bOK"; False:C215)
			Form:C1466.formula:=Null:C1517
		End if 
		
End case 