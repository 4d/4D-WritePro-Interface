//%attributes = {"invisible":true}
#DECLARE($range : Object)

var $color; $frameColor; $i : Integer
var $colorAttribute; $widgetColor; $widgetMultiColor : Text

$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($range)))
	
	For ($i; 1; 2)
		
		If ($i=1)  // ---------------- LINETHROUGH ------------------------
			
			$colorAttribute:=wk text linethrough color:K81:76
			$widgetColor:="LinethroughColor"
			$widgetMultiColor:="MultiLinethroughColor"
			
		Else   // ___________________ UNDERLINE ______________________
			
			$colorAttribute:=wk text underline color:K81:74
			$widgetColor:="UnderlineColor"
			$widgetMultiColor:="MultiUnderlineColor"
			
		End if 
		
		
		WP Get attributes:C1345($range; $colorAttribute; $color)
		If ($color=-1)  // automatic
			WP Get attributes:C1345($range; wk text color:K81:64; $color)  // lets display as text color (maybe mixed too…)
		End if 
		
		If ($color=wk mixed:K81:89)
			OBJECT SET VISIBLE:C603(*; $widgetMultiColor; True:C214)
			OBJECT SET RGB COLORS:C628(*; $widgetColor; $frameColor; 0x00FFFFFF)
		Else 
			OBJECT SET VISIBLE:C603(*; $widgetMultiColor; False:C215)
			If ($color>=0)
				OBJECT SET RGB COLORS:C628(*; $widgetColor; $frameColor; $color)
			End if 
		End if 
		
	End for 
	
End if 



