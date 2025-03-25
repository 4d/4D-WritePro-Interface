var $doc : Object

$doc:=WP New:C1317(WP Selection range:C1340(*; "WParea"))
If (Form:C1466.wpSelection.type#2)  // NOT an achored picture
	WP Insert document body:C1411(Form:C1466.wpSelection; $doc; wk replace:K81:177)
End if 


