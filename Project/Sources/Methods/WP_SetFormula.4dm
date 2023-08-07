//%attributes = {"invisible":true}

C_TEXT:C284($virtualExpression; $trueExpression)
C_LONGINT:C283($n)
C_POINTER:C301($ptr)

ARRAY TEXT:C222($_titles; 0)
ARRAY LONGINT:C221($_nums; 0)

var $formula : Object

$trueExpression:=(OBJECT Get pointer:C1124(Object named:K67:5; "TrueExpression"))->
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
	
	If (Form:C1466.selection.type#2)
		If (Form:C1466.selection.start=Form:C1466.selection.end)  //ACI0101873 (check again)
			$trueExpression:=""
			$virtualExpression:=""
		End if 
	Else 
		If (Form:C1466.selection.imageFormula#Null:C1517)
			$trueExpression:=Form:C1466.selection.imageFormula.source
		End if 
	End if 
	
	EDIT FORMULA:C806($ptr->; $trueExpression)
	
	If (ok=1)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "TrueExpression"))->:=$trueExpression
		
		$virtualExpression:=Parse formula:C1576($trueExpression; Formula in with virtual structure:K88:1)
		(OBJECT Get pointer:C1124(Object named:K67:5; "VirtualExpression"))->:=$virtualExpression
		
		If ($trueExpression#"")
			
			$formula:=Formula from string:C1601($trueExpression; 1)
			If (Form:C1466.selection.type#2)  // not an anchored picture
				WP INSERT FORMULA:C1703(Form:C1466.selection; $formula; wk replace:K81:177)
			Else   // si anchored picture, update the attribute
				Form:C1466.selection.imageFormula:=$formula
			End if 
			
		End if 
		
	End if 
	
Else 
	ALERT:C41(Get localized string:C991("NoTableAvailable"))
End if 


