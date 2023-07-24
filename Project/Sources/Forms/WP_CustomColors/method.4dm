C_LONGINT:C283($x1; $y1; $x2; $y2; $memoX2)
C_TEXT:C284($path)
C_POINTER:C301($ptr)

Case of 
	: (Form event code:C388=On Deactivate:K2:10)
		CANCEL:C270
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY OBJECT:C1221($_oFillColors; 0)
		ARRAY TEXT:C222($_colors_t; 0)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Colors.svg"  //always exists, checked before calling the dialog
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "SVGPalette")
		READ PICTURE FILE:C678($path; $ptr->)
		
		If (wp_allowTransparency=False:C215)
			
			OBJECT GET COORDINATES:C663(*; "btnTransparent"; $x1; $y1; $x2; $y2)
			OBJECT SET VISIBLE:C603(*; "btnTransparent"; False:C215)
			$memoX2:=$x2
			OBJECT GET COORDINATES:C663(*; "sample"; $x1; $y1; $x2; $y2)
			OBJECT SET COORDINATES:C1248(*; "sample"; $x1; $y1; $memoX2; $y2)
			
		End if 
		
End case 
