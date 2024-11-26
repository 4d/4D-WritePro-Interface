//%attributes = {"invisible":true}
var $document : Object
var $_stylesheets : Collection

var $ptrStylesheetNames : Pointer
var $stylesheetType : Integer

$stylesheetType:=WP_GetStylesheetType
$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")

$document:=Form:C1466.selection[wk owner:K81:168]
$_stylesheets:=WP Get style sheets:C1655($document; $stylesheetType)
//$_stylesheets:=$_stylesheets.orderBy("name")

COLLECTION TO ARRAY:C1562($_stylesheets; $ptrStylesheetNames->; "name")
SORT ARRAY:C229($ptrStylesheetNames->; >)

WP_GetStyleSheet
