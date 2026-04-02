//%attributes = {"invisible":true}
var $document : Object:=Form:C1466.selection[wk owner:K81:168]

var $stylesheetType:=WP_GetStylesheetType
var $_stylesheets:=WP Get style sheets:C1655($document; $stylesheetType)

var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
COLLECTION TO ARRAY:C1562($_stylesheets; $ptrStylesheetNames->; "name")
SORT ARRAY:C229($ptrStylesheetNames->; >)

WP_GetStyleSheet
