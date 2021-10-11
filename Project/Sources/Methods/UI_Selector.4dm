//%attributes = {"invisible":true}
C_TEXT:C284($1; $btnName)
C_LONGINT:C283($id; $p)
C_TEXT:C284($subform)
C_TEXT:C284($btn)

If (Count parameters:C259=1)
	$btnName:=$1
Else 
	$btnName:=OBJECT Get name:C1087(Object current:K67:2)  // physical button name ("btn_Home")
End if 

$p:=Position:C15("_"; $btnName)
If ($p>0)
	$btnName:=Substring:C12($btnName; $p+1)  // logical button name ("Home")
End if 




$id:=oForm.SidebarTabs.allButtonNames.indexOf($btnName)  //ACI0101694

If ($id>=0)
	
	$subform:=oForm.SidebarTabs.subforms[$id]
	OBJECT SET SUBFORM:C1138(*; "PaletteSubform"; $subform; "")
	
	For each ($btn; oForm.SidebarTabs.buttonNames)
		//OBJECT SET FONT STYLE(*; $btn; Plain)
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabBtn_"+$btn))->:=0
	End for each 
	
	//OBJECT SET FONT STYLE(*; $btnName; Bold)
	(OBJECT Get pointer:C1124(Object named:K67:5; "tabBtn_"+$btnName))->:=1
	
	
	SET TIMER:C645(-1)
End if 
