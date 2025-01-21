var $text : Text
var $range : Object

If (Form:C1466.selectedRow#Null:C1517)
	
	$range:=Form:C1466.selectedRow.answerRange
	$text:=WP Get text:C1575($range; wk expressions as value:K81:255)
	WP SET TEXT:C1574(Form:C1466.wpSelection; $text; wk replace:K81:177)
End if 


