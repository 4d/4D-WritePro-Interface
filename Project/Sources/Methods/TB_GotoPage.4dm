//%attributes = {"invisible":true}
C_TEXT:C284($1; $btnName)
C_LONGINT:C283($id)
C_LONGINT:C283($page; $p)

If (Count parameters:C259=1)
	$btnName:=$1
Else 
	$btnName:=OBJECT Get name:C1087(Object current:K67:2)  // physical button name ("btn_Home")
End if 

$p:=Position:C15("_"; $btnName)
If ($p>0)
	$btnName:=Substring:C12($btnName; $p+1)  // logical button name ("Home")
End if 


$id:=oForm.ToolbarTabs.allButtonNames.indexOf($btnName)  // ACI0101694
//$id:=oForm.ToolbarTabs.buttonNames.indexOf($btnName)  // ACI0101694

If ($id>=0)
	
	$page:=oForm.ToolbarTabs.pageIndexes[$id]
	
	//$tempppppp:=0
	//If (Shift down)
	//$page:=$page+1
	//End if 
	
	FORM GOTO PAGE:C247($page; *)
	
	oForm.ToolbarTabs.activate($btnName)
	
	//For each ($btn; oForm.ToolbarTabs.buttonNames)
	//OBJECT SET FONT STYLE(*; $btn; Plain)
	//End for each 
	//OBJECT SET FONT STYLE(*; $btnName; Bold)
	
	
End if 



