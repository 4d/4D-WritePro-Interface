
var $properties : Object

If (Shift down:C543)
	$properties:={visibleHorizontalRuler: True:C214; visibleVerticalRuler: False:C215}
Else 
	$properties:={visibleHorizontalRuler: False:C215; visibleVerticalRuler: True:C214}
End if 

WP SET VIEW PROPERTIES:C1648(*; "WParea"; $properties)

