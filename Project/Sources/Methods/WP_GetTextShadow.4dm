//%attributes = {"invisible":true}
#DECLARE($range : Object)

var $color; $frameColor; $offset : Integer

$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($range)))
	
	WP Get attributes:C1345($range; wk text shadow color:K81:71; $color)
	
	If ($color=wk mixed:K81:89)
		
		oForm.cbShadow:=2
		OBJECT SET VISIBLE:C603(*; "MultiShadowColor"; True:C214)
		OBJECT SET RGB COLORS:C628(*; "ColorShadow"; $frameColor; 0x00FFFFFF)
		
	Else 
		
		OBJECT SET VISIBLE:C603(*; "MultiShadowColor"; False:C215)
		
		If ($color=wk transparent:K81:134)
			oForm.cbShadow:=0
		Else 
			oForm.cbShadow:=1
			OBJECT SET RGB COLORS:C628(*; "ColorShadow"; $frameColor; $color)
		End if 
		
	End if 
	
	// offset
	
	If ($color#wk transparent:K81:134)
		
		WP Get attributes:C1345($range; wk text shadow offset:K81:72; $offset)
		
		If ($offset=wk mixed:K81:89)
			oForm.cbShadow:=2
			oForm.shadowOffset:=0
		Else 
			oForm.shadowOffset:=$offset
		End if 
		
	End if 
	
End if 

