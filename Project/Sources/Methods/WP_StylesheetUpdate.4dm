//%attributes = {"invisible":true}
var $hdl:=cs:C1710._wp.me
var $selectedType:=$hdl.selectedSyleSheetType()  // Paragraph, char, picture, table, row or cell
var $type:=$hdl.selectedSyleSheetType(True:C214)
var $name:=$hdl.selectedStyleSheetName()

If (Length:C16($name)=0)
	
	return 
	
End if 

var $styleSheet:=WP Get style sheet:C1656($hdl.document; $name)

If ($stylesheet=Null:C1517)  // Should never happen
	
	return 
	
End if 

WP_StylesheetSetAttributes({\
list: WP_GetStyleAttributesByType($selectedType); \
from: Form:C1466.selection; \
to: $stylesheet})