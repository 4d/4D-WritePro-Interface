//%attributes = {"invisible":true}
// This method returns TRUE if the area is NOT enterable

#DECLARE($manageFocus : Boolean)->$protected : Boolean

var $protectedDoc; $protectedSel : Integer

$protected:=False:C215  // NOT protected by default

If (Count parameters:C259<1)
	$manageFocus:=True:C214  // area MUST have to focus otherwise the widget is fully disabled
End if 

If (Not:C34(Undefined:C82(Form:C1466.focus))) & ($manageFocus)
	$protected:=Not:C34(Form:C1466.focus)
End if 

If (Not:C34($protected))  // still not protected ?
	
	If (Not:C34(Undefined:C82(Form:C1466.enterable)))
		$protected:=Not:C34(Form:C1466.enterable)
	End if 
	
	If (Not:C34($protected)) && (Form:C1466.selection#Null:C1517)  // still not protected ? // ACI0103861
		
		WP Get attributes:C1345(Form:C1466.selection.owner; wk protection enabled:K81:307; $protectedDoc)  // 1 protection enabled, 0 protection disabled
		WP Get attributes:C1345(Form:C1466.selection; wk protected:K81:306; $protectedSel)  // 1 protected, 0 not protected, wk mixed= semi protected
		$protected:=(($protectedDoc#0) & ($protectedSel#0))
		
		//If (Not($protected))  // still not protected ?
		
		//$actionInfo:=Get action info(wk border style)  // works for text as for pictures !
		
		//If (OB Is defined($actionInfo;"enabled"))  //action is defined in the process
		//$protected:=Not($actionInfo.enabled)
		//End if 
		
		//  //If (Not($protected))  // still not protected ?
		//  //If (Not($protected))  // still not protected ?
		//  //End if 
		//  //End if 
		
		//End if 
	End if 
End if 



