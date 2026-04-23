//%attributes = {"invisible":true}
var $document : Object:=Form:C1466.selection[wk owner:K81:168]

var $selectedType:=getSelectedStyleSheetType  // 0 = Paragraph, 1 = Font, 6 = List
var $type:=$selectedType=6 ? wk type paragraph:K81:191 : $selectedType

var $c:=WP Get style sheets:C1655($document; $type)

var $namesArrayPtr:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
COLLECTION TO ARRAY:C1562($c; $namesArrayPtr->; "name")
SORT ARRAY:C229($namesArrayPtr->; >)

WP_GetStyleSheet
