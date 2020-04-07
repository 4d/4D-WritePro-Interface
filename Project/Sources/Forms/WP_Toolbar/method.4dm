C_TEXT:C284($fontName;$fontFamily)
C_BOOLEAN:C305($spellCheck)
C_OBJECT:C1216($wpRange)
C_LONGINT:C283($pos)
C_POINTER:C301($ptr)

C_LONGINT:C283($typeSelection)
C_LONGINT:C283($page)


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitFontLists 
		
		ARRAY TEXT:C222(WP_applyTo;0)
		APPEND TO ARRAY:C911(WP_applyTo;Get localized string:C991("sections"))
		APPEND TO ARRAY:C911(WP_applyTo;Get localized string:C991("paragraphs"))
		APPEND TO ARRAY:C911(WP_applyTo;Get localized string:C991("pictures"))
		WP_applyTo:=2
		
		TB_GotoPage (1)
		
		If (Is Windows:C1573)
			OBJECT SET VISIBLE:C603(*;"btn_mac_@";False:C215)
		End if 
		
		  // style sheets
		
		oForm:=New object:C1471
		oForm.styleSheet:=New object:C1471
		oForm.styleSheet.btnType:=New collection:C1472(1;0;0;0;0;0)  // buttons (1 : pushed)
		oForm.styleSheet.btnValue:=New collection:C1472(wk type paragraph:K81:191;wk type default:K81:190;wk type image:K81:192;wk type table:K81:222;wk type table row:K81:223;wk type table cell:K81:224)  // type of style sheet for each button
		
		
		  // find and replace
		oForm.FR:=New object:C1471
		
		oForm.FR.find:=""
		oForm.FR.replace:=""
		
		oForm.FR.caseSensitive:=False:C215
		oForm.FR.fullWord:=False:C215
		oForm.FR.keepCharStyle:=False:C215
		
		oForm.FR.param:=New object:C1471  // used later
		
		
		  // Tables
		oForm.tables:=New object:C1471  // see UI_ToolbarTables
		oForm.tables.shiftLeft:=1
		oForm.tables.shiftUp:=0
		
		
		
		  // temporarly
		OBJECT SET ENABLED:C1123(*;"ssType3";False:C215)
		OBJECT SET ENABLED:C1123(*;"ssType4";False:C215)
		OBJECT SET ENABLED:C1123(*;"ssType5";False:C215)
		OBJECT SET ENABLED:C1123(*;"ssType6";False:C215)
		
		SET TIMER:C645(-1)
		
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		  //If (Not(Undefined(Form.selection.type)))
		
		If (Form:C1466#Null:C1517)  //ACI0100560
			If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
				If (Form:C1466.selection#Null:C1517)  //ACI0100560
					If (Not:C34(Undefined:C82(Form:C1466.selection.type)))  //ACI0100560
						$typeSelection:=Form:C1466.selection.type
						SetupLocalVariables   // in this widget, mainly for areaName and masterTable
						
						If ($typeSelection#2)
							WP_GetExpressions 
							WP_GetFontInfo (Form:C1466.selection)  // font, size, weight, textcolor  (common method with font palette)
							
						End if 
						
						UI_ToolbarStylesheets 
						
						
						$ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)
						
						
						If (OB Is defined:C1231($ptr->;"spellCheck"))
							$spellCheck:=OB Get:C1224($ptr->;"spellCheck")
							OBJECT SET VISIBLE:C603(*;"tab8";$spellCheck)  // spell tab visible or not
						End if 
						
						If (FORM Get current page:C276=1)
							SET TIMER:C645(-1)
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If (Form:C1466#Null:C1517)  //ACI0100560
			If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
				If (Form:C1466.selection#Null:C1517)  //ACI0100560
					If (Not:C34(Undefined:C82(Form:C1466.selection.type)))  //ACI0100560
						
						$page:=FORM Get current page:C276(*)
						Case of 
							: ($page=1)
								If (Form:C1466.selection.type#wk type image:K81:192)
									WP_GetStyleSheets 
								End if 
								UI_ToolbarStylesheets 
								
							: ($page=7)
								  //UI_ToolbarTables 
								UI_PaletteTables 
								WP_GetCellsBackgroundColor (Form:C1466.selection)
								
						End case 
						
					End if 
				End if 
			End if 
		End if 
		
	Else 
		
		ALERT:C41("Event not taken into account")
		
End case 
