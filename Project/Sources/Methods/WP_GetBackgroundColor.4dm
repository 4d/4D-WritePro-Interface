//%attributes = {"invisible":true}
#DECLARE($oCurrent : Object)

var $color; $frameColor : Integer

$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($oCurrent)))
	
	OBJECT SET RGB COLORS:C628(*; "backgroundColor"; $frameColor; 0x00FFFFFF)
	OBJECT SET VISIBLE:C603(*; "InvisibleBackground"; False:C215)
	OBJECT SET VISIBLE:C603(*; "MultiBackgroundColor"; False:C215)
	
	WP Get attributes:C1345($oCurrent; wk background color:K81:20; $color)
	
	Case of 
		: ($color=wk transparent:K81:134)
			OBJECT SET VISIBLE:C603(*; "InvisibleBackground"; True:C214)
			
		: ($color=wk mixed:K81:89)
			OBJECT SET VISIBLE:C603(*; "MultiBackgroundColor"; True:C214)
			
		Else 
			OBJECT SET RGB COLORS:C628(*; "backgroundColor"; $frameColor; $color)
	End case 
	
End if 

