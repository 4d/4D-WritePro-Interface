//%attributes = {"invisible":true}
C_BOOLEAN:C305($GotoPage2)

C_LONGINT:C283($p)
C_LONGINT:C283($x1; $y1; $x2; $y2; $memoX; $memoY)
C_LONGINT:C283($width; $height)

C_TEXT:C284($Unit; $format; $format1; $format2)
C_TEXT:C284($find; $replace)


If (Form event code:C388=On Load:K2:1)
	If (FORM Get color scheme:C1761="dark")
		
		OBJECT SET RGB COLORS:C628(*; "BackgroundA@"; "#141414"; "#141414")  // very dark grey
		OBJECT SET RGB COLORS:C628(*; "BackgroundB@"; "#282828"; "#282828")  // a bit less dark grey
		
		//OBJECT SET RGB COLORS(*; "BackgroundTop_0@"; "#485767"; "#485767")  // top dark grey-blue
		//OBJECT SET RGB COLORS(*; "BackgroundTop_1@"; "#798999"; "#798999")  // top light grey-blue
		
		//OBJECT SET RGB COLORS(*; "BackgroundTop_0@"; "#141414"; "#141414")  // top dark grey-blue
		//OBJECT SET RGB COLORS(*; "BackgroundTop_1@"; "#282828"; "#282828")  // top light grey-blue
		
		
		OBJECT SET RGB COLORS:C628(*; "RectPadding"; "lightGrey")  // dotted lines for report
		OBJECT SET RGB COLORS:C628(*; "RectMargins"; "lightGrey")  // dotted lines for report
		
	End if 
End if 

WP GET ATTRIBUTES:C1345(Form:C1466.picture.owner; wk layout unit:K81:78; $Unit)

Case of 
	: ($Unit="mm")
		$format1:="###,##0 mm ; -###,##0 mm ; 0 mm"
		$format2:="###,##0 mm ; -###,##0 mm ; auto"
		
	: ($Unit="cm")
		$format1:="###,##0.0 cm ; -###,##0.0 cm ; 0 cm"
		$format2:="###,##0.0 cm ; -###,##0.0 cm ; auto"
		
	: ($Unit="in")
		$format1:="###,##0.00 in ; -###,##0.00 in ; 0 in"
		$format2:="###,##0.00 in ; -###,##0.00 in ; auto"
		
	: ($Unit="pt")
		$format1:="###,##0 pt ; -###,##0 pt ; 0 pt"
		$format2:="###,##0 pt ; -###,##0 pt ; auto"
		
End case 

OBJECT SET FORMAT:C236(*; "margin@"; $format1)
OBJECT SET FORMAT:C236(*; "padding@"; $format1)
OBJECT SET FORMAT:C236(*; "offset@"; $format1)
OBJECT SET FORMAT:C236(*; "pictureWidthHeight@"; $format2)

//--------------------------------------------------------------------------

If (Form:C1466.display.pictureRatioLocked=False:C215)
	$find:="link-on.png"
	$replace:="link-off.png"  // make sure the icon is NOT locked
	OBJECT SET VISIBLE:C603(*; "LinkLine"; False:C215)
Else 
	$find:="link-off.png"
	$replace:="link-on.png"  // make sure the icon IS locked
	OBJECT SET VISIBLE:C603(*; "LinkLine"; True:C214)
End if 

//End if 






$format:=OBJECT Get format:C894(*; "lockerButton")
$p:=Position:C15($find; $format)
If ($p>0)
	$format:=Replace string:C233($format; $find; $replace)
	OBJECT SET FORMAT:C236(*; "lockerButton"; $format)
End if 

$p:=Find in array:C230(_displayFormatValues; Form:C1466.pictSettings[wk image display mode:K81:340])
If ($p>0)
	_displayFormatLabels:=$p
End if 

//--------------------------------------------------------------------------


If (Form:C1466.display.UI_WindowResized=False:C215)
	
	//OBJECT GET BEST SIZE(*; "marginsLabel"; $width; $height)
	//OBJECT GET COORDINATES(*; "marginsLabel"; $x1; $y1; $x2; $y2)
	//OBJECT SET COORDINATES(*; "marginsLabel"; $x2-$width-5; $y1; $x2; $y1+$height+2)
	
	//OBJECT GET BEST SIZE(*; "paddingLabel"; $width; $height)
	//OBJECT GET COORDINATES(*; "paddingLabel"; $x1; $y1; $x2; $y2)
	//OBJECT SET COORDINATES(*; "paddingLabel"; $x2-$width-5; $y1; $x2; $y1+$height+2)
	
	
	If (True:C214)
		OBJECT GET BEST SIZE:C717(*; "btnReport1"; $width; $height)
		OBJECT GET COORDINATES:C663(*; "btnReport1"; $x1; $y1; $x2; $y2)
		OBJECT SET COORDINATES:C1248(*; "btnReport1"; $x1; $y1; $x1+$width+2; $y2)
		$memoX:=$x1+$width+2
		OBJECT GET COORDINATES:C663(*; "BackgroundTop_0b"; $x1; $y1; $x2; $y2)
		OBJECT SET COORDINATES:C1248(*; "BackgroundTop_0b"; $x1; $y1; $memoX; $y2)
		
		
		OBJECT GET BEST SIZE:C717(*; "btnReport2"; $width; $height)
		OBJECT GET COORDINATES:C663(*; "btnReport2"; $x1; $y1; $x2; $y2)
		OBJECT SET COORDINATES:C1248(*; "btnReport2"; $x1; $y1; $x1+$width+2; $y2)
		$memoX:=$x1+$width+2
		OBJECT GET COORDINATES:C663(*; "BackgroundTop_1b"; $x1; $y1; $x2; $y2)
		OBJECT SET COORDINATES:C1248(*; "BackgroundTop_1b"; $x1; $y1; $memoX; $y2)
	End if 
	
	
	$GotoPage2:=False:C215
	
	If (Form:C1466.pictSettings.anchored=True:C214)  // ANCHORED PICTURE
		If (Form:C1466.pictSettings[wk anchor section:K81:228]=wk anchor embedded:K81:230)
			$GotoPage2:=True:C214
		End if 
	Else   // INLINE PICTURE
		$GotoPage2:=True:C214
	End if 
	
	
	If ($GotoPage2)  // either INLINE PICTURE *** OR *** (Anchored picture + Embedded mode)
		FORM GOTO PAGE:C247(2)
		
		
		GET WINDOW RECT:C443($memoX; $memoY; $x2; $y2)
		OBJECT GET COORDINATES:C663(*; "rectPage2"; $x1; $y1; $x2; $y2)
		SET WINDOW RECT:C444($memoX; $memoY; $memoX+($x2-$x1); $memoY+($y2-$y1))
		
		
	End if 
	
	Form:C1466.display.UI_WindowResized:=True:C214
End if 



If (Form:C1466.pictSettings.anchored=True:C214)
	
	If (_anchorPage=5)  // specific page number
		
		//OBJECT SET VISIBLE(*; "anchorPageNumber@"; True)
		OBJECT SET ENTERABLE:C238(*; "anchorPageNumber@"; True:C214)
		OBJECT SET ENABLED:C1123(*; "anchorPageNumber@"; True:C214)
		
		_anchorSection:=1  // forces ALL sections
		OBJECT SET ENABLED:C1123(*; "anchorSectionDropDown"; False:C215)
		
	Else 
		
		//OBJECT SET VISIBLE(*; "anchorPageNumber@"; False)
		OBJECT SET ENABLED:C1123(*; "anchorPageNumber@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "anchorPageNumber@"; False:C215)
		//Form.display.anchorPage:=0
		
		OBJECT SET ENABLED:C1123(*; "anchorSectionDropDown"; True:C214)
		
	End if 
	
	
	Case of 
		: (_anchorSection<=1)  //wk anchor all or empty array
			//OBJECT SET VISIBLE(*; "anchorSectionNumber@"; False)
			
			OBJECT SET ENTERABLE:C238(*; "anchorSectionNumber@"; False:C215)
			OBJECT SET ENABLED:C1123(*; "anchorSectionNumber@"; False:C215)
			//Form.display.anchorSection:=0
			
			
		: (_anchorSection=2)  // section number
			//OBJECT SET VISIBLE(*; "anchorSectionNumber@"; True)
			
			OBJECT SET ENTERABLE:C238(*; "anchorSectionNumber@"; True:C214)
			OBJECT SET ENABLED:C1123(*; "anchorSectionNumber@"; True:C214)
			
	End case 
	
End if 




