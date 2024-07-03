Class constructor()
	This:C1470.document:=WP New:C1317
	
	
	
Function setText($newText : Text; $textPosition : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP SET TEXT:C1574(This:C1470.document; $newText; $textPosition; $rangeUpdate)
	
Function getText($expressions : Integer)->$text : Text
	If (Count parameters:C259=0)
		$expressions:=wk expressions as value:K81:255
	End if 
	$text:=WP Get text:C1575(This:C1470.document; $expressions)
	
	
	
Function textRange($start : Integer; $end : Integer)->$result : cs:C1710.WPrange
	$result:=cs:C1710.WPrange.new()
	$result.range:=WP Text range:C1341(This:C1470.document; $start; $end)
	
	
	
	
	
	