var $body : Object

$body:=WP Get body:C1516(Form:C1466.wp)

If (Shift down:C543)
	WP SELECT:C1348(*; "WParea"; $body)  // OK
Else 
	WP SELECT:C1348($body; 10; 10+(Random:C100%50))  //OK
End if 

//WP SELECT(*; "WParea"; $body; 10; 20)  // BUG