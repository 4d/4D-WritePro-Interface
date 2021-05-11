//$col:=WP Find(WP Get body([SAMPLE]WP); "ALPHA"; 262144; "bravo")

If (Shift down:C543)
	WP SET ATTRIBUTES:C1342([SAMPLE:1]WP:2; wk tab decimal separator:K81:323; wk point or comma:K81:324)
Else 
	//WP SET ATTRIBUTES([SAMPLE]WP; wk tab decimal separator; wk system)
	WP SET ATTRIBUTES:C1342([SAMPLE:1]WP:2; wk tab decimal separator:K81:323; wk comma:K81:326)
	
End if 
