//%attributes = {"invisible":true}
/* 

Possible values inside collection for sidebar

"Fonts"
"Alignments"
"Tabulations"
"Frames"
"Sizes"
"Backgrounds"
"Expressions"
"Bookmarks"
"Stylesheets"
"Tables"
"Protection"
"ImportExport"
"FindAndReplace"

Possible values inside collection for toolbar

"Home"
"Insert"
"Margins"
"Borders"
"Images"
"Printing"
"Tables"
"Spell"
"Protection"
"ImportExport"
"FindAndReplace"

*/

#DECLARE($_tabs : Collection)

var $width; $height; $nbPages : Integer
var $typeForm; $buttonName; $className : Text


distinctKeepOrder($_tabs)  //.distinct()

FORM GET PROPERTIES:C674(Current form name:C1298; $width; $height; $nbPages)
If ($nbPages>1)  // toolbar
	$typeForm:="toolbar"
	$className:="ToolbarTabs"
Else   //palettes
	$typeForm:="sidebar"
	$className:="SidebarTabs"
End if 

//$n:=$_tabs.length
//For ($i; 0; $n-1)
//$_tabs[$i]:="tabBtn_"+$_tabs[$i]
//End for 

oForm[$className].setButtons($_tabs)

If ($_tabs.length>0)
	
	// activate 1st tab
	$buttonName:=$_tabs[0]
	
	If ($typeForm="toolbar")  // if Toolbar, goto page
		TB_GotoPage($buttonName)
	Else   // in sidebar, switch subform
		UI_Selector($buttonName)
	End if 
	
End if 
