var $x1; $y1; $x2; $y2; $memoX2 : Integer
var $path : Text
var $ptr : Pointer

Case of 
	: (Form event code:C388=On Deactivate:K2:10)
		CANCEL:C270
		
	: (Form event code:C388=On Load:K2:1)
		
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
