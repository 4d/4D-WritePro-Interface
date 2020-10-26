Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		
		If ((Form:C1466.extension="4wp") | (Form:C1466.extension="4w7"))
			OBJECT SET VISIBLE:C603(*;"infoNotImported";True:C214)
		End if 
		
		SET TIMER:C645(-1)
		
	: (FORM Event:C1606.code=On Clicked:K2:4)
		SET TIMER:C645(-1)
		
	: (FORM Event:C1606.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If (Form:C1466.newDocument)
			OBJECT SET RGB COLORS:C628(*;"InfoImported";"black")
			OBJECT SET RGB COLORS:C628(*;"infoNotImported";"grey")
		Else 
			OBJECT SET RGB COLORS:C628(*;"InfoImported";"grey")
			OBJECT SET RGB COLORS:C628(*;"infoNotImported";"black")
		End if 
		
End case 