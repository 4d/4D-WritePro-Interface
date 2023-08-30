//%attributes = {}
var $trueExpression : Text
var $ptr : Pointer
var $n : Integer

$trueExpression:=oForm.imageSource
// the formula is displayed with virtual structure
// parse to real structure before edit


If (Not:C34(Is nil pointer:C315(masterTable)))  // 27 sept 2018 (was not used before!)
	$ptr:=masterTable
Else 
	$ptr:=Current form table:C627
	If (Is nil pointer:C315($ptr))
		// RL 2019/12/02 : check for available table in database
		GET TABLE TITLES:C803($_titles; $_nums)
		$n:=Size of array:C274($_nums)
		If ($n>0)
			$ptr:=Table:C252($_nums{1})
		End if 
	End if 
End if 

If (Not:C34(Is nil pointer:C315($ptr)))
	EDIT FORMULA:C806($ptr->; $trueExpression)
	If (ok=1)
		WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk image expression:K81:258; $trueExpression)
	End if 
End if 