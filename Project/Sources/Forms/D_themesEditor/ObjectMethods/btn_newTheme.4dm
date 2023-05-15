var $theme : Object
var $index : Integer

$theme:=New object:C1471
$index:=Form:C1466.wizard.themeSave($theme; "")

// rebuild the drop down list
Form:C1466.themeList:=Form:C1466.wizard.themeDropDownList()
Form:C1466.themeList.index:=$index

// same as selected in dropdow list

Form:C1466.theme:=Form:C1466.wizard.themeGet(Form:C1466.themeList.index)  // them object
Form:C1466.collection:=Form:C1466.wizard.themeToCollection(Form:C1466.theme; "LB_template")  // them collection (and listbox)
Form:C1466.wp:=Form:C1466.wizard.WP_BuildThemeSample(Form:C1466.collection; "WParea")  // 4DWP document

LISTBOX SELECT ROW:C912(*; "LB_collection"; 1)
SET TIMER:C645(-1)
