var $o; $formula : Object

$o:=New object:C1471
$o.areaName:=Form:C1466.areaName
$o.source:=Form:C1466.formulaSource

$formula:=Formula:C1597(WP_TableWizardNew.formulaInsert($o))
CALL FORM:C1391(Form:C1466.windowRef; $formula)

