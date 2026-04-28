var $ui:=cs:C1710._ui.me
var $e:=FORM Event:C1606

Case of 
		
		//________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		formData:=formData || {}
		
		If (Undefined:C82(formData.styleSheet))
			
			formData.styleSheet:={\
				btnType: [1; 0; 0; 0; 0; 0; 0]; \
				btnValue: [\
				wk type paragraph:K81:191; \
				wk type default:K81:190; \
				wk type image:K81:192; \
				wk type table:K81:222; \
				wk type table row:K81:223; \
				wk type table cell:K81:224; \
				wk type paragraph:K81:191/* Hierarchical Style Sheets */]}
			
		End if 
		
		formData.skinAppliedSub:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			
			SET TIMER:C645(-1)  // If events are NOT managed in the area, then Form will be null (ACI0102661)
			
		End if 
		
		//________________________________________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)\
		 | ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		var $setupOK:=SetupLocalVariables
		
		If (formData.skinAppliedSub=False:C215)  // May have changed on bound variable change
			
			formData.skinAppliedSub:=UI_ApplySkin
			
		End if 
		
		If (Form:C1466.selection.type=2)
			
			// Static pict selected
			
		Else 
			
			$ui.updateListOfStyleSheets()
			
		End if 
		
		UI_PaletteStylesheets
		
		//________________________________________________________________________________
End case 