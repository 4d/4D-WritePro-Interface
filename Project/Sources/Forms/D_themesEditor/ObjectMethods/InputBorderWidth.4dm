var $var : Variant

Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		If (Value type:C1509(Form:C1466.borderWidth)=Is text:K8:3)  // Arrow down
			
			$var:=Form:C1466.wizard.themeGetDefault(Form:C1466.theme; "borderWidth")
			
			If (Value type:C1509($var)=Is text:K8:3)
				Form:C1466.borderWidth:=Num:C11($var; ".")
			Else 
				Form:C1466.borderWidth:=$var
			End if 
			
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
End case 

Form:C1466.currentRow.borderWidth:=String:C10(Form:C1466.borderWidth; "&xml")+"pt"

SET TIMER:C645(-1)