var $theme : Object
var $index : Integer

$theme:=Form:C1466.wizard.themeFromCollection(Form:C1466.collection)

$index:=Form:C1466.wizard.themeSave($theme; Form:C1466.themeList.values[Form:C1466.themeList.index]+".json")
