var $mouseX; $mouseY; $mouseZ; $col; $row : Integer


Form:C1466.messageLong:=Get localized string:C991("HoverOverTheLines")
Form:C1466.icon:=Form:C1466.icons.info

Case of 
		
	: (Form event code:C388=On Mouse Move:K2:35)
		GET MOUSE:C468($mouseX; $mouseY; $mouseZ)
		LISTBOX GET CELL POSITION:C971(*; "LB"; $mouseX; $mouseY; $col; $row)
		
		If ($row>0) & ($row<=Form:C1466.user.length)
			Form:C1466.messageLong:=Form:C1466.user[$row-1].messageLong
			Form:C1466.icon:=getIcon(Form:C1466.user[$row-1].type)
		End if 
		
End case 