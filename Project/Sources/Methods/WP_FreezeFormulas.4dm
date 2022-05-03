//%attributes = {"invisible":true}
#DECLARE($scope : Integer)  // 0  = all document, 1 = selection only

If ($scope=0)
	WP FREEZE FORMULAS:C1708(Form:C1466.selection.owner; wk do not recompute expressions:K81:312)
Else 
	WP FREEZE FORMULAS:C1708(Form:C1466.selection; wk do not recompute expressions:K81:312)
End if 
