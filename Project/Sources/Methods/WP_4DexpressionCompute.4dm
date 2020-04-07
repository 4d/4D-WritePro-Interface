//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_TEXT:C284($2)
C_LONGINT:C283($3;$4)

C_LONGINT:C283($scope)
C_TEXT:C284($areaName)
C_LONGINT:C283($start;$end)

If (Count parameters:C259=1)  // component context
	
	If (areaName#"")
		$scope:=$1  // 0  = all document, 1 = selection only
		
		If ($scope=0)
			$start:=ST Start text:K78:15
			$end:=ST End text:K78:16
		Else 
			$start:=ST Start highlight:K78:13
			$end:=ST End highlight:K78:14
		End if 
		
		CALL FORM:C1391(Current form window:C827;Current method name:C684;$scope;areaName;$start;$end)
	End if 
	
Else   // parent context
	
	$scope:=$1  // 0  = all document, 1 = selection only
	$areaName:=$2
	$start:=$3
	$end:=$4
	
	ST COMPUTE EXPRESSIONS:C1285(*;$areaName;$start;$end)
	
End if 