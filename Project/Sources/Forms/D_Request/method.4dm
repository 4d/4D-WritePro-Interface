//dial created 2020/06/03 to fix the ACI0100879

C_LONGINT:C283($width; $height; $x1; $x2; $y1; $y2)

Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		
		OBJECT SET TITLE:C194(*; "labelTitle"; Form:C1466.title)
		OBJECT SET TITLE:C194(*; "buttonOK"; Form:C1466.labelOk)
		OBJECT SET TITLE:C194(*; "buttonCancel"; Form:C1466.labelCancel)
		OBJECT SET PLACEHOLDER:C1295(*; "inputValue"; Form:C1466.placeHolder)
		
		SET WINDOW TITLE:C213(Form:C1466.windowTitle)
		
		
		OBJECT GET COORDINATES:C663(*; "buttonOK"; $x1; $y1; $x2; $y2)
		OBJECT GET BEST SIZE:C717(*; "buttonOK"; $width; $height)
		OBJECT SET COORDINATES:C1248(*; "buttonOK"; $x2-$width; $y1; $x2; $y2)
		
		$x1:=$x2-$width-20
		
		OBJECT GET BEST SIZE:C717(*; "buttonCancel"; $width; $height)
		OBJECT SET COORDINATES:C1248(*; "buttonCancel"; $x1-$width; $y1; $x1; $y2)
		
End case 