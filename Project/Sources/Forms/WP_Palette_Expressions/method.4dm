
var $paletteID; $typeSelection : Integer
var $setupOK : Boolean
var $info : Object

//var $p1; $p2 : Pointer

$paletteID:=4
$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		oForm.skinAppliedSub:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (oForm.skinAppliedSub=False:C215)  // may have changed on bound variable change
			oForm.skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteInfos
		
		If ($setupOK) & ($typeSelection#2)
			WP_GetDocInfos(Form:C1466.selection[wk owner:K81:168])
			WP_GetURL
			WP_GetFormulas
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		WP_SetDocInfos(Form:C1466.selection[wk owner:K81:168])
		
End case 
