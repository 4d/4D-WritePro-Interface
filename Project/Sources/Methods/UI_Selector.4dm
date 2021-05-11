//%attributes = {"invisible":true}
C_TEXT:C284($1; $btnName)
C_LONGINT:C283($id)
C_TEXT:C284($subform)
C_TEXT:C284($btn)

If (Count parameters:C259=1)
	$btnName:=$1
Else 
	$btnName:=OBJECT Get name:C1087(Object current:K67:2)
End if 

$id:=oForm.SidebarTabs.allButtonNames.indexOf($btnName)  //ACI0101694

If ($id>=0)
	
	$subform:=oForm.SidebarTabs.subforms[$id]
	OBJECT SET SUBFORM:C1138(*; "PaletteSubform"; $subform; "")
	
	For each ($btn; oForm.SidebarTabs.buttonNames)
		OBJECT SET FONT STYLE:C166(*; $btn; Plain:K14:1)
		(OBJECT Get pointer:C1124(Object named:K67:5; $btn))->:=0
	End for each 
	
	OBJECT SET FONT STYLE:C166(*; $btnName; Bold:K14:2)
	(OBJECT Get pointer:C1124(Object named:K67:5; $btnName))->:=1
	
	
	SET TIMER:C645(-1)
End if 
