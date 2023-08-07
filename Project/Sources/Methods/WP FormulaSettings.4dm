//%attributes = {"invisible":true,"shared":true}
#DECLARE($range : Object)  // MUST be a range(of any kind)

var $elements : Collection
var $case : Integer
var $formulaSource : Text
var $formula : Object

If (Count parameters:C259=0)
	$range:=WP Selection range:C1340(Self:C308->)
End if 


Case of 
	: (Not:C34(Undefined:C82($range.start))) && (Not:C34(Undefined:C82($range.end)))  // it's a range
		$case:=1
		
		$elements:=WP Get formulas:C1702($range)
		If ($elements.length>0)
			$formulaSource:=$elements[0].formula.source
		End if 
		
		
	: (Not:C34(Undefined:C82($range.anchorOrigin)))
		$case:=2
		
		WP GET ATTRIBUTES:C1345($range; wk image formula:K81:305; $formula)
		If ($formula#Null:C1517)
			$formulaSource:=$formula.source
		End if 
		
End case 


If ($formulaSource#"")
	
	EDIT FORMULA:C806(Table:C252(1)->; $formulaSource)
	If (ok=1)
		
		Case of 
			: ($case=1)
				WP INSERT FORMULA:C1703($elements[0].range; Formula from string:C1601($formulaSource; 1); wk replace:K81:177)  // ∆∆∆ Feature 125
				
			: ($case=2)
				WP SET ATTRIBUTES:C1342($range; wk image formula:K81:305; Formula from string:C1601($formulaSource; 1))  // ∆∆∆ Feature 125
				
		End case 
		
	End if 
	
End if 