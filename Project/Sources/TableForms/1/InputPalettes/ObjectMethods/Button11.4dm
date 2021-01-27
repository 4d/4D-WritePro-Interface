C_OBJECT:C1216($table;$row;$cells;$header)
C_LONGINT:C283($i)

$header:=WP Get header:C1503([SAMPLE:1]WP:2;1)


$table:=WP Insert table:C1473($header;wk append:K81:179)
For ($i;1;3)
	If (Random:C100>Random:C100) & (Not:C34(Shift down:C543))
		$row:=WP Table append row:C1474($table;"jhg";789;Milliseconds:C459;Random:C100)
	Else 
		$row:=WP Table append row:C1474($table;123;"tom";Random:C100;Milliseconds:C459;Random:C100)
	End if 
End for 

$cells:=WP Table get cells:C1477($table;1;1;MAXLONG:K35:2;MAXLONG:K35:2)
WP SET ATTRIBUTES:C1342($cells;wk width:K81:45;"2cm")
