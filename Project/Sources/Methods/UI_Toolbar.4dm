//%attributes = {"invisible":true}
OBJECT SET ENABLED:C1123(*; "@"; False:C215)  // ACI0100560
OBJECT SET ENTERABLE:C238(*; "@"; False:C215)  // ACI0100560

If (oForm.redrawTabs)
	
	oForm.ToolbarTabs.redraw()
	oForm.redrawTabs:=False:C215
	
End if 

// If (Asserted(Form#Null;"The variable associated to the toolbar should be an object!")) // before ACI0100560
If (Form:C1466#Null:C1517)  // ;"The variable associated to the toolbar should be an object!")) //ACI0100560
	
	// Check only on load
	If (Form event code:C388=On Load:K2:1)
		
		If (Form:C1466.spellCheck#Null:C1517)
			
			If (Value type:C1509(Form:C1466.spellCheck)=Is boolean:K8:9)
				
				OBJECT SET VISIBLE:C603(*; "tabBtn_Spell"; Form:C1466.spellCheck)  // True or false
				
			End if 
		End if 
	End if 
	
	If (Form:C1466.selection#Null:C1517)
		
		var $page:=FORM Get current page:C276(*)
		
		// Specific cases first
		Case of 
				
				//________________________________________________________________________________
			: ($page=5)  // Image
				
				UI_PaletteImage(True:C214)  // Means take focus into account (nothing is focusable in the toolbar)
				
				//________________________________________________________________________________
			: ($page=9)  // Page 9 is special case
				
				UI_PaletteProtect  // Common with palettes
				
				//________________________________________________________________________________
			: ($page=10)  // Page 10 is also special case
				
				UI_PaletteImportExport  //
				
				//________________________________________________________________________________
			: ($page=11)  // Page 11 find and replace
				
				UI_PaletteFindAndReplace  // ACI0103628 - see method too
				
				//________________________________________________________________________________
			Else 
				
				If ($page=1)
					
					// ACI0104990 Pat Bensky
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: (oForm.fontSize=Int:C8(oForm.fontSize))
							
							OBJECT SET FORMAT:C236(*; "cbox_FontSize"; "###0;-###0;0")
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ((oForm.fontSize*10)=Int:C8(oForm.fontSize*10))
							
							OBJECT SET FORMAT:C236(*; "cbox_FontSize"; "###0.0;-###0.0;0")
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						Else 
							OBJECT SET FORMAT:C236(*; "cbox_FontSize"; "###0.00;-###0.0;00")
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
				End if 
				
				// General cases after
				If ($page=1)\
					 || ($page=11)  // Both pages have enterable areas
					
					var $protected:=UI_isProtected(False:C215)  // 2022 oct 13 (TEST) don't manage focus on page 1 because fontSize is focusable
					
				Else 
					
					$protected:=UI_isProtected(True:C214)
					
				End if 
				
				If ($protected)
					
					// Disable everyting (followed by exceptions)
					OBJECT SET ENABLED:C1123(*; "@"; False:C215)
					OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=2)  // Except buttons for local protection button
							
							OBJECT SET ENABLED:C1123(*; "btnProtectionEnabled"; True:C214)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=6)  // Except for Print
							
							OBJECT SET ENABLED:C1123(*; "@"; True:C214)
							OBJECT SET ENABLED:C1123(*; "@"; True:C214)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=11)  // Except page 11 find and replace
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
					
				Else 
					
					// Enable everyting (followed by exceptions)
					
					OBJECT SET ENABLED:C1123(*; "@"; True:C214)
					OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=1)
							
							If (Form:C1466.selection.type#wk type image:K81:192)
								
								WP_GetStyleSheets
								
							End if 
							
							UI_ToolbarStylesheets
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=7)
							
							UI_Tables("Toolbar")
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
				End if 
				
				//________________________________________________________________________________
		End case 
		
		UI_ManageTextAreaButtons  // Buttons btn_insertTextArea and btn_insertTextArea1 (page 2 and 5)
		
		UI_ManageAIbutton  // Don't know yet on which tab this button shall be located
		
		// TAB BUTTONS ARE ALWAYS ENABLED.
		OBJECT SET ENABLED:C1123(*; "tab@"; True:C214)
		
	End if 
End if 