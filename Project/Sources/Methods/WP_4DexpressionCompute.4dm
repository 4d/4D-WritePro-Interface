//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_TEXT:C284($2)
C_LONGINT:C283($3; $4)

C_LONGINT:C283($scope)
C_TEXT:C284($areaName)
C_LONGINT:C283($start; $end)

C_LONGINT:C283($i; $n)
ARRAY TEXT:C222($_objects; 0)
ARRAY POINTER:C280($_variables; 0)


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
		
		CALL FORM:C1391(Current form window:C827; Current method name:C684; $scope; areaName; $start; $end)
	End if 
	
Else   // parent context
	
	$scope:=$1  // 0  = all document, 1 = selection only
	$areaName:=$2
	$start:=$3
	$end:=$4
	
	
	// is the $areaName a form object ?  (ACI ???????)
	
	OBJECT GET COORDINATES:C663(*; $areaName; $x1; $y1; $y1; $y2)  // <ACI0101020> 
	If (($x1+$y1+$y1+$y2)#0)
		ST COMPUTE EXPRESSIONS:C1285(*; $areaName; $start; $end)
	Else 
		
		FORM GET OBJECTS:C898($_objects; $_variables; Form current page:K67:6)
		$n:=Size of array:C274($_objects)
		For ($i; 1; $n)
			If (OBJECT Get type:C1300(*; $_objects{$i})=Object type subform:K79:40)
				EXECUTE METHOD IN SUBFORM:C1085($_objects{$i}; Current method name:C684; *; $1; $2; $3; $4)
			End if 
		End for 
		
	End if   // </ACI0101020> 
	
End if 