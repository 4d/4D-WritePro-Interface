//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_LONGINT:C283($scope)

$scope:=$1  // 0  = all document, 1 = selection only

If (areaName#"")
	If ($scope=0)
		ST FREEZE EXPRESSIONS:C1282(*;areaName;ST Start text:K78:15;ST End text:K78:16)
	Else 
		ST FREEZE EXPRESSIONS:C1282(*;areaName;ST Start highlight:K78:13;ST End highlight:K78:14)
	End if 
End if 
