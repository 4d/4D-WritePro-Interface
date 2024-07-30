var $section : Object

$section:=WP Get section:C1581(Form:C1466.wp; 2)
If (Shift down:C543)
	WP SELECT:C1348($section; 10; 10+(Random:C100%20))
Else 
	WP SELECT:C1348($section)
End if 