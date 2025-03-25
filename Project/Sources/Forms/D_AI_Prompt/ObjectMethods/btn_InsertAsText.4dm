var $text : Text

$text:=WP Get text:C1575(WP Selection range:C1340(*; "WParea"); wk expressions as value:K81:255)
If (Form:C1466.wpSelection.type#2)  // NOT an anchored picture.
	WP SET TEXT:C1574(Form:C1466.wpSelection; $text; wk replace:K81:177)
End if 


