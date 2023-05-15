var $var : Variant

Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		If (Value type:C1509(Form:C1466.padding)=Is text:K8:3)  // Arrow down
			$var:=Form:C1466.wizard.themeGetDefault(Form:C1466.theme; "padding")
			
			If (Value type:C1509($var)=Is text:K8:3)
				Form:C1466.padding:=Num:C11($var; ".")
			Else 
				Form:C1466.padding:=$var
			End if 
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
End case 

Form:C1466.currentRow.padding:=String:C10(Form:C1466.padding; "&xml")+Form:C1466.unit.values[Form:C1466.unit.index]

SET TIMER:C645(-1)