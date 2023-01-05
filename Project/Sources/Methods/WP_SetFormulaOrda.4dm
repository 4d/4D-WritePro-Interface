//%attributes = {}
var $range; $form; $context : Object
var $_formulas : Collection
var $win : Integer


If (Form:C1466.selection#Null:C1517)  //from WP updateWidget
	
	$form:=New object:C1471()
	
	$_formulas:=WP Get formulas:C1702(Form:C1466.selection)
	If ($_formulas.length>0)
		$form.formulaSource:=$_formulas[0].formula.source
	End if 
	$form.context:=Form:C1466.context  //// see setuplocal variables
	$form.areaName:=Form:C1466.areaName  // from WP updateWidget
	$form.windowRef:=Current form window:C827
	
	$win:=Open form window:C675("D_formula"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("D_formula"; $form; *)
	
	
End if 