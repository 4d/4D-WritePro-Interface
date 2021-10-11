//%attributes = {"invisible":true}

//C_POINTER($ptr)
//C_BOOLEAN($scrollbar; $scrollbarDefined)
//C_TEXT($subformDetail; $subformList)
//C_LONGINT($p)
//C_LONGINT($x1; $y1; $x2; $y2)
//C_LONGINT($height)
//C_LONGINT($availableHeight)



//If (False)  // useless, the scrollbar is always "visible" but outside the form…

//If (Not(Undefined(skin)))
//If (OB Is defined(skin; "scrollbar"))
//$scrollbar:=OB Get(skin; "scrollbar")
//$scrollbarDefined:=True
//End if 
//End if 


//If (Not($scrollbarDefined))

//OBJECT GET SUBFORM(*; "PaletteSubform"; $ptr; $subformDetail; $subformList)

//$p:=oForm.SidebarTabs.subforms.indexOf($subformDetail)

//If ($p>=0)
//$height:=oForm.SidebarTabs.heights[$p]

//OBJECT GET SUBFORM CONTAINER SIZE($x1; $y1)
//$availableHeight:=$y1-50

//OBJECT GET COORDINATES(*; "PaletteSubform"; $x1; $y1; $x2; $y2)
//OBJECT SET COORDINATES(*; "PaletteSubform"; $x1; $y1; $x2; $y1+$availableHeight)

//If ($availableHeight<$height)  // 50 : top of sub-subform
//$scrollbar:=True
//Else 
//$scrollbar:=False
//End if 
//End if 
//End if 

//OBJECT SET SCROLLBAR(*; "PaletteSubform"; False; $scrollbar)

//End if 

