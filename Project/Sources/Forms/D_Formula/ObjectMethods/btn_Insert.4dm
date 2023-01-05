var $o : Object

$o:=New object:C1471("areaName"; Form:C1466.areaName; "source"; Form:C1466.formulaSource; "doNext"; "insertSpace")
CALL FORM:C1391(Form:C1466.windowRef; "UI_Formula"; "insertFormula"; 0; $o)

OBJECT SET ENABLED:C1123(*; "btn_OK"; False:C215)  // to avoid two inserts
OBJECT SET ENABLED:C1123(*; "btn_Insert"; False:C215)  // to avoid two inserts