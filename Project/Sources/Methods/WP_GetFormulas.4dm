//%attributes = {"invisible":true}

var $ptrTrueExpression; $ptrVirtualExpression : Pointer
var $virtualExpression; $trueExpression : Text
var $_formulas : Collection

$ptrTrueExpression:=OBJECT Get pointer:C1124(Object named:K67:5; "TrueExpression")
If (Not:C34(Is nil pointer:C315($ptrTrueExpression)))
	$ptrTrueExpression->:=""
End if 

$ptrVirtualExpression:=OBJECT Get pointer:C1124(Object named:K67:5; "VirtualExpression")
If (Not:C34(Is nil pointer:C315($ptrVirtualExpression)))
	$ptrVirtualExpression->:=""
End if 

If (Not:C34((Is nil pointer:C315($ptrTrueExpression)) | (Is nil pointer:C315($ptrVirtualExpression))))
	
	If (Form:C1466.selection.start#Form:C1466.selection.end)  //ACI0104093
		
		$_formulas:=WP Get formulas:C1702(Form:C1466.selection)
		If ($_formulas.length>0)
			//.formula
			//.formula.source
			//.owner
			//.range
			
			$trueExpression:=$_formulas[0].formula.source
			$virtualExpression:=Parse formula:C1576($trueExpression; Formula out with virtual structure:K88:2)
			
			$ptrTrueExpression->:=$trueExpression
			$ptrVirtualExpression->:=$virtualExpression  //display expression using virtual structure (RL palettes only)
			
		End if 
	End if 
	
End if 