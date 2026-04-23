var $e:=FORM Event:C1606

Case of 
		
		// ________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		InitFontLists
		
		var $param:={formName: "toolbar"}
		
		formData:=formData || {}
		
		// WITHOUT PREFIX !!! (tabBtn_ or tabRect_" managed in class)
		var $_buttonNames:=[\
			"Home"; \
			"Insert"; \
			"Margins"; \
			"Borders"; \
			"Images"; \
			"Printing"; \
			"Tables"; \
			"Spell"; \
			"Protection"; \
			"ImportExport"; \
			"FindAndReplace"]
		
		formData.ToolbarTabs:=cs:C1710.Toolbar.new($_buttonNames; "TabArea")  // Create CLASS
		
		formData.ToolbarTabs.setLabelMargins(2; 2)  // 2px label margins
		formData.ToolbarTabs.setButtonMargins(2; 0; 2; 0)  // Left - top - right - bottom
		formData.ToolbarTabs.pageIndexes:=[1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11]
		
		formData.ToolbarTabs.activate($_buttonNames[0])
		
		TB_GotoPage(formData.ToolbarTabs.buttonNames[0])
		
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
		
		// Find and replace (Page 11)
		formData.FR:={\
			find: ""; \
			replace: ""; \
			displayReplacements: False:C215; \
			occurences: -1}
		
		// ++see on timer
		
		formData.comboFontSizes:={\
			values: [9; 10; 11; 12; 13; 14; 16; 18; 20; 24; 28; 32]; \
			value: 9}
		
		formData.eventCode:=-1  // No need to test "undefined" see WP_SetListFont
		formData.eventForcedCode:=-1  // No need to test "undefined" see WP_SetListFont
		
		formData.aiKey:=""  // No need to test "undefined" see UI_manageAIButton
		formData.aiWindow:=0  // ΩAIΩ
		
		// Temporarly
		OBJECT SET ENABLED:C1123(*; "ssType3"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType4"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType5"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType6"; False:C215)
		
		If (Is macOS:C1572)
			
			OBJECT SET VISIBLE:C603(*; "mac_@"; True:C214)
			
		Else 
			
			OBJECT SET VISIBLE:C603(*; "win_@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "btn_mac_@"; False:C215)  // RL 2024/03/28 (spell check page)
			OBJECT SET VISIBLE:C603(*; "sep_Mac_@"; False:C215)  // RL 2024/03/28 (spell check page)
			
		End if 
		
		formData.skinAppliedMain:=UI_ApplySkin
		formData.redrawTabs:=True:C214
		
		// Tips
		OBJECT SET HELP TIP:C1181(*; "btn_visibleEmptyImages"; Action info:C1442("visibleEmptyImages").title)
		OBJECT SET HELP TIP:C1181(*; "btn_displayAsSymbol"; Action info:C1442("displayFormulaAsSymbol").title)
		
		OBJECT SET HELP TIP:C1181(*; "btn_imageBehind@"; Action info:C1442("anchorLayout?value=behind").title)  // @ is temporary
		OBJECT SET HELP TIP:C1181(*; "btn_imageInline@"; Action info:C1442("anchorLayout?value=inline").title)
		OBJECT SET HELP TIP:C1181(*; "btn_imageInFront@"; Action info:C1442("anchorLayout?value=front").title)
		
		OBJECT SET HELP TIP:C1181(*; "btn_ImageWrapTopBottom"; Action info:C1442("anchorLayout?value=wrapTopBottom").title)
		OBJECT SET HELP TIP:C1181(*; "btn_ImageWrapSquare"; Action info:C1442("anchorLayout?value=wrapSquare").title)
		OBJECT SET HELP TIP:C1181(*; "btn_ImageWrapSquareLeft"; Action info:C1442("anchorLayout?value=wrapSquareLeft").title)
		OBJECT SET HELP TIP:C1181(*; "btn_ImageWrapSquareRight"; Action info:C1442("anchorLayout?value=wrapSquareRight").title)
		OBJECT SET HELP TIP:C1181(*; "btn_ImageWrapSquareLargest"; Action info:C1442("anchorLayout?value=wrapSquareLargest").title)
		OBJECT SET HELP TIP:C1181(*; "btn_visibleTableBorders"; Action info:C1442("visibleTableBorders").title)  // 20R6
		
		OBJECT SET TITLE:C194(*; "cb_distinctFirstPage"; Action info:C1442("section/differentFirstPage").title)
		OBJECT SET TITLE:C194(*; "cb_distinctLeftRightPage"; Action info:C1442("section/differentLeftRightPages").title)
		
		If (Form:C1466#Null:C1517)
			
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
			
		End if 
		
		// ________________________________________________________________________________
	: ($e.code=On Page Change:K2:54)
		
		UI_setApplyTo
		
		Case of 
				
				//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			: (FORM Get current page:C276(*)=3)
				
				TB_setAutomaticActions("Margins")
				TB_setAutomaticActions("Paddings")
				
				//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			: (FORM Get current page:C276(*)=4)
				
				TB_setAutomaticActions("BordersAndRadius")
				
				//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		End case 
		
		SET TIMER:C645(-1)
		
		// ________________________________________________________________________________
	: ($e.code=On Resize:K2:27)
		
		formData.redrawTabs:=True:C214
		SET TIMER:C645(-1)
		
		// ________________________________________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		// ________________________________________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If /*ACI0100560*/(Form:C1466#Null:C1517)\
			 && /*ACI0100560*/(Not:C34(Undefined:C82(Form:C1466.selection)))\
			 && /*ACI0100560*/(Form:C1466.selection#Null:C1517)
			
			If /*ACI0100560*/(Not:C34(Undefined:C82(Form:C1466.selection.type)))
				
				var $typeSelection : Integer:=Form:C1466.selection.type
				SetupLocalVariables  // In this widget, mainly for areaName and masterTable
				
				If (Not:C34(formData.skinAppliedMain))
					
					formData.skinAppliedMain:=UI_ApplySkin
					
				End if 
				
				If ($typeSelection#2)  // Anchored picture
					
					WP_GetFormulas
					WP_GetFontInfo(Form:C1466.selection)  // Font, size, weight, textcolor (common method with font palette)
					formData.comboFontSizes.currentValue:=formData.fontSize
					
					var $page:=FORM Get current page:C276(*)
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=1)
							
							WP_SetListFont(Form:C1466.selection)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=9)
							
							WP_GetProtections(Form:C1466.selection)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($page=11)  // Find & replace
							
							// UI_PaletteFindAndReplace
							WP_FR_InitOptions("toolbar")
							
							If (Length:C16(formData.FR.find)>0)  //
								
								formData.FR.occurences:=FR_Script("findAll")
								
							Else 
								
								formData.FR.occurences:=-1
								
							End if 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
				End if 
			End if 
			
			If (Not:C34(Undefined:C82(formData.aiWindow)))\
				 && (formData.aiWindow#0)
				
				CALL FORM:C1391(formData.aiWindow; "AI_Update"; "Context"; Form:C1466.selection)
				
			End if 
		End if 
		
		UI_Toolbar  // Will call UI_PaletteFindAndReplace
		
		// ________________________________________________________________________________
	: ($e.code=On Unload:K2:2)
		
		If (Not:C34(Undefined:C82(formData.aiWindow)))\
			 && (formData.aiWindow#0)
			
			CALL FORM:C1391(formData.aiWindow; "AI_Update"; "Close"; Form:C1466.selection)
			
		End if 
		
		// ________________________________________________________________________________
	Else 
		
		ALERT:C41("Event not taken into account")
		
		// ________________________________________________________________________________
End case 