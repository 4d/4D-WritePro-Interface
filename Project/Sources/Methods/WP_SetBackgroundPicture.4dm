//%attributes = {"invisible":true}
#DECLARE($range : Object; $picture : Picture)

If (Picture size:C356($picture)#0)
	WP SET ATTRIBUTES:C1342($range; wk background image:K81:21; $picture)
Else 
	WP RESET ATTRIBUTES:C1344($range; wk background image:K81:21)
End if 


