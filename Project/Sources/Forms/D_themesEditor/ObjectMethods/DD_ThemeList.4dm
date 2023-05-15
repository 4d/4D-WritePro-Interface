
Form:C1466.theme:=Form:C1466.wizard.themeGet(Form:C1466.themeList.index)  // them object
Form:C1466.collection:=Form:C1466.wizard.themeToCollection(Form:C1466.theme; "LB_collection")  // them collection (and listbox)
Form:C1466.wp:=Form:C1466.wizard.WP_BuildThemeSample(Form:C1466.collection; "WParea")  // 4DWP document

Form:C1466.currentRow:=Form:C1466.collection[0]

LISTBOX SELECT ROW:C912(*; "LB_collection"; 1)
SET TIMER:C645(-1)

