//%attributes = {"invisible":true}
var $ui:=cs:C1710._ui.me
var $selectedType:=$ui.selectedSyleSheetType()  // Paragraph, char, picture, table, row or cell
var $name:=$ui.selectedStyleSheetName()

If (Length:C16($name)=0)
	
	return 
	
End if 

var $styleSheet:=WP Get style sheet:C1656($ui.document; $name)

If ($stylesheet=Null:C1517)  // Should never happen
	
	return 
	
End if 

WP_StylesheetSetAttributes({\
list: WP_GetStyleAttributesByType($selectedType); \
from: Form:C1466.selection; \
to: $stylesheet})