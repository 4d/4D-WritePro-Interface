
var $o : Object
var $table; $formula : Object

$o:=New object:C1471
$o[wk visible references:K81:286]:=True:C214
WP SET VIEW PROPERTIES:C1648(*; "WParea"; $o)

$table:=WP Get element by ID:C1549(Form:C1466.wp; "t1")
If ($table#Null:C1517)  // can happen if zero field checked
	
	WP GET ATTRIBUTES:C1345($table; wk datasource:K81:367; $formula)
	
	Form:C1466.calls:=0
	
	WP RESET ATTRIBUTES:C1344($table; wk datasource:K81:367)
	WP COMPUTE FORMULAS:C1707(Form:C1466.wp)
	WP SET ATTRIBUTES:C1342($table; wk datasource:K81:367; $formula)
	
End if 

Form:C1466.wizard.templateUI()
