// ACI0104036 : standard action in button "Popup_columnCount" :   columncount  -> section/columncount

var $_buttonNames : Collection
var $typeSelection : Integer
var $page : Integer
var $param : Object

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitFontLists
		
		$param:=New object:C1471
		$param.formName:="toolbar"
		
		If (oForm=Null:C1517)
			oForm:=New object:C1471
		End if 
		
		// WITHOUT PREFIX !!! (tabBtn_ or tabRect_" managed in class)
		$_buttonNames:=New collection:C1472(\
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
			"FindAndReplace")
		
		//For each ($buttonName; $_buttonNames)
		//OBJECT SET FONT STYLE(*; "tabBtn_"+$buttonName; Bold)  // Temporary to be sure they fit in space // Removed ACI0103537 - JAPANESE BUG
		//End for each 
		
		oForm.ToolbarTabs:=cs:C1710.Toolbar.new($_buttonNames; "TabArea")  // create CLASS
		
		//oForm.ToolbarTabs.setButtonSizes(50; 20)  // width (temp) and height (fixed)
		oForm.ToolbarTabs.setLabelMargins(2; 2)  //2px label margins
		oForm.ToolbarTabs.setButtonMargins(2; 0; 2; 0)  // left - top - right - bottom
		oForm.ToolbarTabs.pageIndexes:=New collection:C1472(1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11)
		
		oForm.ToolbarTabs.activate($_buttonNames[0])
		
		TB_GotoPage(oForm.ToolbarTabs.buttonNames[0])
		
		oForm.styleSheet:=New object:C1471
		oForm.styleSheet.btnType:=New collection:C1472(1; 0; 0; 0; 0; 0)  // buttons (1 : pushed)
		oForm.styleSheet.btnValue:=New collection:C1472(wk type paragraph:K81:191; wk type default:K81:190; wk type image:K81:192; wk type table:K81:222; wk type table row:K81:223; wk type table cell:K81:224)  // type of style sheet for each button
		
		
		// find and replace (Page 11)
		oForm.FR:=New object:C1471
		oForm.FR.find:=""
		oForm.FR.replace:=""
		oForm.FR.displayReplacements:=False:C215
		oForm.FR.occurences:=-1
		
		// ++see on timer
		
		oForm.comboFontSizes:=New object:C1471("values"; New collection:C1472(9; 10; 11; 12; 13; 14; 16; 18; 20; 24; 28; 32); "value"; 9)
		
		oForm.eventCode:=-1  //  no need to test "undefined" see WP_SetListFont
		oForm.eventForcedCode:=-1  //  no need to test "undefined" see WP_SetListFont
		
		oForm.aiKey:=""  //  no need to test "undefined" see UI_manageAIButton
		oForm.aiWindow:=0  // ΩAIΩ
		
		// temporarly
		OBJECT SET ENABLED:C1123(*; "ssType3"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType4"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType5"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType6"; False:C215)
		
		If (Is macOS:C1572)
			OBJECT SET VISIBLE:C603(*; "mac_@"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "win_@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "btn_mac_@"; False:C215)  // RL 2024/03/28  (spell check page)
			OBJECT SET VISIBLE:C603(*; "sep_Mac_@"; False:C215)  // RL 2024/03/28  (spell check page)
		End if 
		
		
		oForm.skinAppliedMain:=UI_ApplySkin
		oForm.redrawTabs:=True:C214
		
		//Show empty or unsupported images.
		//Montrer les images vides ou non prises en charge.
		
		//tips
		OBJECT SET HELP TIP:C1181(*; "btn_visibleEmptyImages"; Action info:C1442("visibleEmptyImages").title)
		OBJECT SET HELP TIP:C1181(*; "btn_displayAsSymbol"; Action info:C1442("displayFormulaAsSymbol").title)
		
		
		OBJECT SET HELP TIP:C1181(*; "btn_imageBehind@"; Action info:C1442("anchorLayout?value=behind").title)  //@ is temporary
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
		
	: (Form event code:C388=On Page Change:K2:54)
		
		UI_setApplyTo
		
		Case of 
				
			: (FORM Get current page:C276(*)=3)
				TB_setAutomaticActions("Margins")
				TB_setAutomaticActions("Paddings")
				
			: (FORM Get current page:C276(*)=4)
				TB_setAutomaticActions("BordersAndRadius")
				
				
		End case 
		
		SET TIMER:C645(-1)
		
		
		
		
	: (Form event code:C388=On Resize:K2:27)
		oForm.redrawTabs:=True:C214
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		//oForm.ToolbarTabs.redraw()
		SET TIMER:C645(0)
		
		If (Form:C1466#Null:C1517)  //ACI0100560
			If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
				If (Form:C1466.selection#Null:C1517)  //ACI0100560
					If (Not:C34(Undefined:C82(Form:C1466.selection.type)))  //ACI0100560
						
						$typeSelection:=Form:C1466.selection.type
						SetupLocalVariables  // in this widget, mainly for areaName and masterTable
						
						If (Not:C34(oForm.skinAppliedMain))
							oForm.skinAppliedMain:=UI_ApplySkin
						End if 
						
						
						If ($typeSelection#2)  // anchored picture
							
							WP_GetFormulas
							WP_GetFontInfo(Form:C1466.selection)  // font, size, weight, textcolor  (common method with font palette)
							oForm.comboFontSizes.currentValue:=oForm.fontSize
							
							$page:=FORM Get current page:C276(*)
							Case of 
									
								: ($page=1)
									WP_SetListFont(Form:C1466.selection)
									
								: ($page=9)
									WP_GetProtections(Form:C1466.selection)
									
								: ($page=11)  //  find & replace
									
									//UI_PaletteFindAndReplace
									WP_FR_InitOptions("toolbar")
									
									
									If (Length:C16(oForm.FR.find)>0)  //
										oForm.FR.occurences:=FR_Script("findAll")  //; oForm.FR.find)
									Else 
										oForm.FR.occurences:=-1
									End if 
									
									
							End case 
							
						End if 
						
						
						// WP_GetProtection  // page 2
						
					End if 
					
					If (Not:C34(Undefined:C82(oForm.aiWindow))) && (oForm.aiWindow#0)
						CALL FORM:C1391(oForm.aiWindow; "AI_Update"; "Context"; Form:C1466.selection)
					End if 
					
				End if 
			End if 
		End if 
		
		UI_Toolbar  // will call UI_PaletteFindAndReplace
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		If (Not:C34(Undefined:C82(oForm.aiWindow))) && (oForm.aiWindow#0)
			CALL FORM:C1391(oForm.aiWindow; "AI_Update"; "Close"; Form:C1466.selection)
		End if 
		
	Else 
		
		ALERT:C41("Event not taken into account")
		
End case 

