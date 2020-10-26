//%attributes = {"invisible":true}

C_POINTER:C301($ptr)
C_BOOLEAN:C305($scrollbar; $scrollbarDefined)
C_TEXT:C284($subformDetail; $subformList)
C_LONGINT:C283($p)
C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($height)
C_LONGINT:C283($availableHeight)


If (False:C215)  // useless, the scrollbar is always "visible" but outside the form…
	
	If (Not:C34(Undefined:C82(skin)))
		If (OB Is defined:C1231(skin; "scrollbar"))
			$scrollbar:=OB Get:C1224(skin; "scrollbar")
			$scrollbarDefined:=True:C214
		End if 
	End if 
	
	
	If (Not:C34($scrollbarDefined))
		
		OBJECT GET SUBFORM:C1139(*; "PaletteSubform"; $ptr; $subformDetail; $subformList)
		
		$p:=oForm.SidebarTabs.subforms.indexOf($subformDetail)
		
		If ($p>=0)
			$height:=oForm.SidebarTabs.heights[$p]
			
			OBJECT GET SUBFORM CONTAINER SIZE:C1148($x1; $y1)
			$availableHeight:=$y1-50
			
			OBJECT GET COORDINATES:C663(*; "PaletteSubform"; $x1; $y1; $x2; $y2)
			OBJECT SET COORDINATES:C1248(*; "PaletteSubform"; $x1; $y1; $x2; $y1+$availableHeight)
			
			If ($availableHeight<$height)  // 50 : top of sub-subform
				$scrollbar:=True:C214
			Else 
				$scrollbar:=False:C215
			End if 
		End if 
	End if 
	
	OBJECT SET SCROLLBAR:C843(*; "PaletteSubform"; False:C215; $scrollbar)
	
End if 

