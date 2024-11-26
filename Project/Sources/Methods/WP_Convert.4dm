//%attributes = {"invisible":true}
#DECLARE($value : Real; $fromUnit : Text; $toUnit : Text)->$result : Real

If ($toUnit#$fromUnit)
	If ($value#0)
		
		WP SET ATTRIBUTES:C1342(oTempArea; wk layout unit:K81:78; $fromUnit)
		WP SET ATTRIBUTES:C1342(oTempArea; wk background width:K81:27; $result)  //wk line height   // <ACI0104082>
		
		WP SET ATTRIBUTES:C1342(oTempArea; wk layout unit:K81:78; $toUnit)
		WP Get attributes:C1345(oTempArea; wk background width:K81:27; $result)  //wk margin left    // <ACI0104082>
	Else 
		$result:=0
	End if 
Else 
	$result:=$value
End if 
