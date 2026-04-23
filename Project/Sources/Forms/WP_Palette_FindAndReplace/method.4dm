Case of 
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		formData:=formData || {}  // ACI0101427 when used as a single palette, not as a sub-sub-form
		
		If (formData.FR=Null:C1517)  // First init
			
			formData.FR:={\
				find: ""; \
				replace: ""; \
				displayReplacements: False:C215; \
				occurences: -1\
				}
			
		End if 
		
		WP_FR_InitOptions("sidebar")  // Common with toobar
		
		formData.skinAppliedSub:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
			
		End if 
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Bound Variable Change:K2:52)\
		 | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		var $setupOK : Boolean:=SetupLocalVariables
		
		If (formData.skinAppliedSub=False:C215)  // May have changed on bound variable change
			
			formData.skinAppliedSub:=UI_ApplySkin
			
		End if 
		
		If (Length:C16(formData.FR.find)>0)  //
			
			formData.FR.occurences:=FR_Script("findAll")
			
		Else 
			
			formData.FR.occurences:=-1
			
		End if 
		
		UI_PaletteFindAndReplace
		
		// ________________________________________________________________________________
End case 