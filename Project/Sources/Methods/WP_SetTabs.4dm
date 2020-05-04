//%attributes = {}
C_COLLECTION:C1488($1;$_tabs)
C_TEXT:C284($tab)
C_LONGINT:C283($x;$x1;$y1;$x2;$y2)
C_LONGINT:C283($width;$height;$nbPages)
C_TEXT:C284($typeForm)
C_TEXT:C284($buttonName)

$_tabs:=$1

FORM GET PROPERTIES:C674(Current form name:C1298;$width;$height;$nbPages)
If ($nbPages>1)  // toolbar
	$typeForm:="toolbar"
Else   //palettes
	$typeForm:="palette"
End if 

  // 1st disable all tabs
For each ($tab;oForm[$typeForm].tabButtonNames)
	OBJECT SET ENABLED:C1123(*;$tab;False:C215)
	OBJECT SET VISIBLE:C603(*;$tab;False:C215)
End for each 

  // get position of tabArea
OBJECT GET COORDINATES:C663(*;"tabArea";$x1;$y1;$x2;$y2)
$x:=$x1

  // 2nd enable requested tabs
For each ($tab;$_tabs)
	$buttonName:="tabBtn_"+$tab
	OBJECT SET ENABLED:C1123(*;$buttonName;True:C214)
	OBJECT SET VISIBLE:C603(*;$buttonName;True:C214)
	
	OBJECT GET COORDINATES:C663(*;$buttonName;$x1;$y1;$x2;$y2)
	$x2:=$x+($x2-$x1)
	OBJECT SET COORDINATES:C1248(*;$buttonName;$x;$y1;$x2;$y2)
	$x:=$x2
	
End for each 

  // activate 1st tab
$buttonName:="tabBtn_"+$_tabs[0]
If ($nbPages>1)  // if multipage form (tool bar) then goto page
	TB_GotoPage ($buttonName)
Else   // if siglepage form (palette) then switch subform form
	UI_Selector ($buttonName)
End if 

