
C_LONGINT:C283($paletteID)
$paletteID:=4

C_BOOLEAN:C305($setupOK)

C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbValues"))->:=1
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbExpressions"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbScopeSelection"))->:=0
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteInfos
		
		If ($setupOK) & ($typeSelection#2)
			WP_GetDocInfos(Form:C1466.selection[wk owner:K81:168])
			WP_GetExpressions
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		WP_SetDocInfos(Form:C1466.selection[wk owner:K81:168])
		
End case 
