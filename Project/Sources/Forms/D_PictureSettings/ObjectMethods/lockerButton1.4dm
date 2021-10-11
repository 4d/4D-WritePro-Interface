Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		
		Form:C1466.pictSettings[wk margin left:K81:11]:=Form:C1466.pictSettings[wk margin top:K81:13]
		Form:C1466.pictSettings[wk margin right:K81:12]:=Form:C1466.pictSettings[wk margin top:K81:13]
		Form:C1466.pictSettings[wk margin bottom:K81:14]:=Form:C1466.pictSettings[wk margin top:K81:13]
		
		SET TIMER:C645(-1)
		
		//OBJECT SET RGB COLORS(*; "RectMargins@"; 0x00FF)
		
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		OBJECT SET VISIBLE:C603(*; "RectMargins@"; True:C214)
		//OBJECT SET RGB COLORS(*; "RectMargins@"; "grey")
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*; "RectMargins@"; False:C215)
		
		
End case 