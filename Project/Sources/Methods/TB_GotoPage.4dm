//%attributes = {"invisible":true}
#DECLARE($buttonName : Text)

$buttonName:=$buttonName || OBJECT Get name:C1087(Object current:K67:2)  // Physical button name ("btn_Home")

var $pos:=Position:C15("_"; $buttonName)

If ($pos>0)
	
	$buttonName:=Substring:C12($buttonName; $pos+1)  // Logical button name ("Home")
	
End if 

var $id : Integer:=formData.ToolbarTabs.allButtonNames.indexOf($buttonName)  // ACI0101694

If ($id>=0)
	
	var $page : Integer:=formData.ToolbarTabs.pageIndexes[$id]
	FORM GOTO PAGE:C247($page; *)
	
	formData.ToolbarTabs.activate($buttonName)
	
End if 