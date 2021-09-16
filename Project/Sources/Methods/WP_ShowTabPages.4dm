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

C_COLLECTION:C1488($1; $_tabs)

C_BOOLEAN:C305($found)

C_LONGINT:C283($width; $height; $nbPages)
C_LONGINT:C283($id)

C_OBJECT:C1216($param)

C_TEXT:C284($tab)
C_TEXT:C284($typeForm)
C_TEXT:C284($buttonName)
C_TEXT:C284($className)

$_tabs:=$1
distinctKeepOrder($_tabs)  //.distinct()

FORM GET PROPERTIES:C674(Current form name:C1298; $width; $height; $nbPages)
If ($nbPages>1)  // toolbar
	$typeForm:="toolbar"
	$className:="ToolbarTabs"
Else   //palettes
	$typeForm:="sidebar"
	$className:="SidebarTabs"
End if 

// 1st : disable ALL tabs of the current form
For each ($tab; oForm[$className].buttonNames)
	OBJECT SET ENABLED:C1123(*; $tab; False:C215)
	OBJECT SET VISIBLE:C603(*; $tab; False:C215)
End for each 

If ($_tabs.length>0)
	
	$param:=New object:C1471
	$param.formName:=$typeForm
	$param.buttonNames:=$_tabs
	
	InitButtons($param)
	
	// activate 1st tab
	$buttonName:="tabBtn_"+$_tabs[0]
	
	If ($typeForm="toolbar")  // if Toolbar, goto page
		TB_GotoPage($buttonName)
	Else   // in sidebar, switch subform
		UI_Selector($buttonName)
	End if 
	
End if 
