//%attributes = {"invisible":true}
#DECLARE($scope : Integer)  // 0  = all document, 1 = selection only

If ($scope=0)  // full document
	WP COMPUTE FORMULAS:C1707(Form:C1466.selection.owner)
Else 
	WP COMPUTE FORMULAS:C1707(Form:C1466.selection)
End if 
