var $normal : Object

$normal:=WP Get style sheet:C1656([SAMPLE:1]WP:2; "Normal")

If (Shift down:C543)
	WP RESET ATTRIBUTES:C1344($normal; wk border style:K81:29; wk border color:K81:34)
Else 
	WP SET ATTRIBUTES:C1342($normal; wk border style:K81:29; wk dashed:K81:117; wk border color:K81:34; "red")
End if 