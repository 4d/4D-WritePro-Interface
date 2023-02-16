//%attributes = {"invisible":true}

C_LONGINT:C283($page)
C_BOOLEAN:C305($protected)

OBJECT SET ENABLED:C1123(*; "@"; False:C215)  //ACI0100560
OBJECT SET ENTERABLE:C238(*; "@"; False:C215)  //ACI0100560


If (oForm.redrawTabs)
	oForm.ToolbarTabs.redraw()
	oForm.redrawTabs:=False:C215
End if 


//If (Asserted(Form#Null;"The variable associated to the toolbar should be an object!")) // before ACI0100560
If (Form:C1466#Null:C1517)  //;"The variable associated to the toolbar should be an object!")) //ACI0100560
	
	// check only on load
	If (Form event code:C388=On Load:K2:1)
		If (Form:C1466.spellCheck#Null:C1517)
			If (Value type:C1509(Form:C1466.spellCheck)=Is boolean:K8:9)
				OBJECT SET VISIBLE:C603(*; "tabBtn_Spell"; Form:C1466.spellCheck)  // true or false
			End if 
		End if 
	End if 
	
	If (Form:C1466.selection#Null:C1517)
		
		$page:=FORM Get current page:C276(*)
		
		//specific cases first
		Case of 
				
			: ($page=5)  // image
				UI_PaletteImage(True:C214)  // means take focus into account (nothing is focusable in the toolbar)
				
			: ($page=9)  // page 9 is special case
				
				UI_PaletteProtect  // common with palettes
				
			: ($page=10)  // page 10 is also special case
				
				UI_PaletteImportExport  //
				
			: ($page=11)  // page 11 find and replace
				
				UI_PaletteFindAndReplace  //ACI0103628 - see method too
				
			Else 
				// general cases after
				If ($page=1) || ($page=11)  // both pages have enterable areas
					$protected:=UI_isProtected(False:C215)  // 2022 oct 13 (TEST) don't manage focus on page 1 because fontSize is focusable
				Else 
					$protected:=UI_isProtected(True:C214)
				End if 
				
				If ($protected)
					
					// Disable everyting (followed by exceptions)
					
					OBJECT SET ENABLED:C1123(*; "@"; False:C215)
					OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
					
					
					Case of 
							
						: ($page=2)  //Except buttons for local protection button
							
							OBJECT SET ENABLED:C1123(*; "btnProtectionEnabled"; True:C214)
							
						: ($page=6)  // Except for Print
							
							OBJECT SET ENABLED:C1123(*; "@"; True:C214)
							OBJECT SET ENABLED:C1123(*; "@"; True:C214)
							
						: ($page=11)  // except page 11 find and replace
							
							
					End case 
					
				Else 
					
					// Enable everyting (followed by exceptions)
					
					OBJECT SET ENABLED:C1123(*; "@"; True:C214)
					OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
					
					Case of 
						: ($page=1)
							If (Form:C1466.selection.type#wk type image:K81:192)
								WP_GetStyleSheets
							End if 
							UI_ToolbarStylesheets
							
						: ($page=7)
							UI_Tables("Toolbar")
							
							
							
					End case 
					
				End if 
				
		End case 
		
		//  TAB BUTTONS ARE ALWAYS ENABLED.
		OBJECT SET ENABLED:C1123(*; "tab@"; True:C214)
		
		
		//// the local protection button is ALWAYS based on global document protection
		//WP GET ATTRIBUTES(Form.selection.owner; wk protection enabled; $protected)
		//OBJECT SET ENABLED(*; "btnProtected"; Not($protected))
		
		
	End if 
	
End if 
