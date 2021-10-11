Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		
		Form:C1466.pictSettings[wk padding left:K81:16]:=Form:C1466.pictSettings[wk padding top:K81:18]
		Form:C1466.pictSettings[wk padding right:K81:17]:=Form:C1466.pictSettings[wk padding top:K81:18]
		Form:C1466.pictSettings[wk padding bottom:K81:19]:=Form:C1466.pictSettings[wk padding top:K81:18]
		
		SET TIMER:C645(-1)
		
		
		
		//OBJECT SET RGB COLORS(*; "Rectpadding@"; "blue")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		OBJECT SET VISIBLE:C603(*; "Rectpadding@"; True:C214)
		//OBJECT SET RGB COLORS(*; "Rectpadding@"; "grey")
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*; "Rectpadding@"; False:C215)
		
		
End case 
