Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
	: (Form event code:C388=On Double Clicked:K2:5)
		Self:C308->:=100
		
End case 

WP_SetTextLineHeight(Form:C1466.paragraphRange; Self:C308->; wk unit percent:K81:139)

(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightInput"))->:=Self:C308->