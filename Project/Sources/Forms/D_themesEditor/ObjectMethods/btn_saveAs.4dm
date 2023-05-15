var $theme : Object
var $index : Integer

$theme:=Form:C1466.wizard.themeFromCollection(Form:C1466.collection)
$index:=Form:C1466.wizard.themeSave($theme; "")

// rebuild the drop down list
Form:C1466.themeList:=Form:C1466.wizard.themeDropDownList()
Form:C1466.themeList.index:=$index

LISTBOX SELECT ROW:C912(*; "LB_collection"; 1)
SET TIMER:C645(-1)

