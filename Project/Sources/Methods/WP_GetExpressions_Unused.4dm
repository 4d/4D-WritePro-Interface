//%attributes = {"invisible":true}

C_TEXT:C284($1)
C_LONGINT:C283($2; $3)

C_POINTER:C301($4; $5; $6; $7)

C_TEXT:C284($areaName)
C_LONGINT:C283($start; $end)
C_POINTER:C301($ptrLabel; $ptrURL; $ptrTrueExpression; $ptrVirtualExpression)

C_LONGINT:C283($start; $end)
C_LONGINT:C283($i; $n)
ARRAY TEXT:C222($_objects; 0)
ARRAY POINTER:C280($_variables; 0)

C_TEXT:C284($memoExpression; $virtualExpression; $trueExpression)

//$ptrLabel:=OBJECT Get pointer(Object named; "URLlabel")
//If (Not(Is nil pointer($ptrLabel)))
//$ptrLabel->:=""
//End if 

//$ptrURL:=OBJECT Get pointer(Object named; "URLurl")
//If (Not(Is nil pointer($ptrURL)))
//$ptrURL->:=""
//End if 

$ptrTrueExpression:=OBJECT Get pointer:C1124(Object named:K67:5; "TrueExpression")
If (Not:C34(Is nil pointer:C315($ptrTrueExpression)))
	$ptrTrueExpression->:=""
End if 

$ptrVirtualExpression:=OBJECT Get pointer:C1124(Object named:K67:5; "VirtualExpression")
If (Not:C34(Is nil pointer:C315($ptrVirtualExpression)))
	$ptrVirtualExpression->:=""
End if 


If (areaName#"")
	
	If (Count parameters:C259=0)  // component context)
		
		If (Not:C34((Is nil pointer:C315($ptrTrueExpression)) | (Is nil pointer:C315($ptrVirtualExpression))))
			
			$start:=Form:C1466.selection[wk start:K81:87]
			$end:=Form:C1466.selection[wk end:K81:88]
			CALL FORM:C1391(Current form window:C827; Current method name:C684; areaName; $start; $end; $ptrLabel; $ptrURL; $ptrTrueExpression; $ptrVirtualExpression)
			
		End if 
		
	Else   // host database context
		
		$areaName:=$1
		$start:=$2
		$end:=$3
		
		$ptrLabel:=$4
		$ptrURL:=$5
		$ptrTrueExpression:=$6
		$ptrVirtualExpression:=$7
		
		
		OBJECT GET COORDINATES:C663(*; $areaName; $x1; $y1; $y1; $y2)
		If (($x1+$y1+$y1+$y2)#0)
			
			// form in current page
			
			//ST GET URL(*; $areaName; $label; $URL; $start; $end)
			
			//$ptrLabel->:=$label
			//$ptrURL->:=$URL
			
			// when the cursor is just prior the expression, the expression should be "" // ACI0101873
			
			
			
			$ptrTrueExpression->:=""
			$ptrVirtualExpression->:=""
			
			If ($start#$end)
				$memoExpression:=ST Get expression:C1287(*; $areaName; $start; $end)
				$virtualExpression:=Parse formula:C1576($memoExpression; Formula out with virtual structure:K88:2)
				$trueExpression:=Parse formula:C1576($virtualExpression; Formula in with virtual structure:K88:1)
				
				If ($memoExpression=$trueExpression)
					$ptrTrueExpression->:=$trueExpression
					$ptrVirtualExpression->:=$virtualExpression  //display expression using virtual structure (RL palettes only)
				End if 
			End if 
			
		Else 
			
			// try in subforms
			
			FORM GET OBJECTS:C898($_objects; $_variables; Form current page:K67:6)
			$n:=Size of array:C274($_objects)
			For ($i; 1; $n)
				If (OBJECT Get type:C1300(*; $_objects{$i})=Object type subform:K79:40)
					EXECUTE METHOD IN SUBFORM:C1085($_objects{$i}; Current method name:C684; *; $1; $2; $3; $4; $5; $6; $7)
				End if 
			End for 
			
		End if 
		
	End if 
	
End if 



