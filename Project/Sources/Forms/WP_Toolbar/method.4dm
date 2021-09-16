C_BOOLEAN:C305($check)

C_COLLECTION:C1488($_buttonNames)

C_LONGINT:C283($typeSelection)
C_LONGINT:C283($page)

C_OBJECT:C1216($param)

C_TEXT:C284($buttonName)


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitFontLists
		
		$param:=New object:C1471
		$param.formName:="toolbar"
		
		//APPEND TO ARRAY(WP_applyTo;".tables")
		//APPEND TO ARRAY(WP_applyTo;".cells")
		
		//If (Is Windows)
		//OBJECT SET VISIBLE(*; "btn_mac_@"; False)
		//Else 
		//OBJECT SET VISIBLE(*; "btn_win_@"; False)
		//End if 
		
		// style sheets
		
		If (oForm=Null:C1517)
			oForm:=New object:C1471
		End if 
		
		$_buttonNames:=New collection:C1472(\
			"tabBtn_Home"; \
			"tabBtn_Insert"; \
			"tabBtn_Margins"; \
			"tabBtn_Borders"; \
			"tabBtn_Images"; \
			"tabBtn_Printing"; \
			"tabBtn_Tables"; \
			"tabBtn_Spell"; \
			"tabBtn_Protection"; \
			"tabBtn_ImportExport"; \
			"tabBtn_FindAndReplace")
		
		For each ($buttonName; $_buttonNames)
			OBJECT SET FONT STYLE:C166(*; $buttonName; Bold:K14:2)  // Temporary to be sure they fit in space
		End for each 
		
		oForm.ToolbarTabs:=cs:C1710.Toolbar.new($_buttonNames; "TabArea")
		
		oForm.ToolbarTabs.setButtonSizes(100; 20)  // height (temp) and height (fixed)
		oForm.ToolbarTabs.setLabelMargins(2; 2)  //2px label margins
		oForm.ToolbarTabs.setButtonMargins(2; 0; 2; 0)  // left - top - right - bottom
		oForm.ToolbarTabs.pageIndexes:=New collection:C1472(1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11)
		
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
		
		
		// temporarly
		OBJECT SET ENABLED:C1123(*; "ssType3"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType4"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType5"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType6"; False:C215)
		
		If (Is macOS:C1572)
			OBJECT SET VISIBLE:C603(*; "mac_@"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "win_@"; True:C214)
		End if 
		
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		ARRAY TEXT:C222(WP_applyTo; 0)
		If ((FORM Get current page:C276(*)=3) | (FORM Get current page:C276(*)=4))
			APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("sections"))  //1
			APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("paragraphs"))  //2
			APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("pictures"))  //3
			APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("Table"))  //4
			APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("Cell"))  //5
			If (FORM Get current page:C276(*)=4)
				APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("Row"))  //6
			End if 
			WP_applyTo:=2
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If (Form:C1466#Null:C1517)  //ACI0100560
			If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
				If (Form:C1466.selection#Null:C1517)  //ACI0100560
					If (Not:C34(Undefined:C82(Form:C1466.selection.type)))  //ACI0100560
						
						$typeSelection:=Form:C1466.selection.type
						SetupLocalVariables  // in this widget, mainly for areaName and masterTable
						
						
						If ($typeSelection#2)
							WP_GetExpressions
							WP_GetFontInfo(Form:C1466.selection)  // font, size, weight, textcolor  (common method with font palette)
						End if 
						
						$page:=FORM Get current page:C276(*)
						Case of 
								
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
						
						// WP_GetProtection  // page 2
						
					End if 
				End if 
			End if 
		End if 
		
		UI_Toolbar  // will call UI_PaletteFindAndReplace
		
	Else 
		
		ALERT:C41("Event not taken into account")
		
End case 

