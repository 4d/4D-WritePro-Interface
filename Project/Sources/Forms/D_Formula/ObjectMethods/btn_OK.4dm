var $o : Object

$o:=New object:C1471
$o.areaName:=Form:C1466.areaName
$o.source:=Form:C1466.formulaSource

CALL FORM:C1391(Form:C1466.windowRef; "Wizard_InsertFormula"; $o)

