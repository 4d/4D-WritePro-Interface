
C_BOOLEAN:C305($setupOK; $check)
C_LONGINT:C283($paletteID)
$paletteID:=10


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		If (oForm.FR=Null:C1517)  // first init
			oForm.FR:=New object:C1471
			oForm.FR:=New object:C1471
			oForm.FR.find:=""
			oForm.FR.replace:=""
			oForm.FR.displayReplacements:=False:C215
			oForm.FR.occurences:=-1
		End if 
		
		
		WP_FR_InitOptions("sidebar")  //common with toobar
		
		//OBJECT Get keyboard layout
		//Get database localization
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin
		End if 
		
		If (Length:C16(oForm.FR.find)>0)  //
			oForm.FR.occurences:=FR_Script("findAll")  //; oForm.FR.find)
		Else 
			oForm.FR.occurences:=-1
		End if 
		
		UI_PaletteFindAndReplace
		
End case 
