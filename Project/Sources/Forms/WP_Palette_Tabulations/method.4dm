_O_C_LONGINT:C283(wp_tabList)

var $setupOK : Boolean

_O_C_LONGINT:C283($paletteID)
$paletteID:=3

_O_C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		_tabs:=New collection:C1472
		tabDefault:=New object:C1471
		
		
		OBJECT SET STYLE SHEET:C1257(*; "@"; Automatic style sheet_additional:K14:14)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType0"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType1"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType2"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType3"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType4"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabIndentRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabIndentInput"))->:=0
		
		
		CLEAR LIST:C377(wp_tabList; *)
		wp_tabList:=New list:C375
		APPEND TO LIST:C376(wp_tabList; Localized string:C991("Left"); 0)
		APPEND TO LIST:C376(wp_tabList; Localized string:C991("Right"); 1)
		APPEND TO LIST:C376(wp_tabList; Localized string:C991("Center"); 2)
		APPEND TO LIST:C376(wp_tabList; Localized string:C991("Decimal"); 3)
		APPEND TO LIST:C376(wp_tabList; Localized string:C991("Bars"); 4)
		
		OBJECT SET LIST BY REFERENCE:C1266(*; "lb_types"; Required list:K42:20; wp_tabList)
		
		oForm.skinAppliedSub:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (oForm.skinAppliedSub=False:C215)  // may have changed on bound variable change
			oForm.skinAppliedSub:=UI_ApplySkin
		End if 
		
		
		If ($setupOK) & ($typeSelection#2)
			WP_GetTabInfo(Form:C1466.paragraphRange)
			//WP_TabsDrawBar 
		End if 
		
		UI_PaletteTabulations
		
	: (Form event code:C388=On Unload:K2:2)
		CLEAR LIST:C377(wp_tabList; *)
		
		CLEAR VARIABLE:C89(_tabs)
		CLEAR VARIABLE:C89(tabDefault)
		
End case 
