//%attributes = {"invisible":true}
//#DECLARE($range : Object)  // MUST be a range(of any kind)

//var $elements : Collection
//var $case : Integer
//var $formulaSource : Text
//var $formula : Object
//var $range : Object

//If (Count parameters=0)
//$range:=WP Selection range(Self->)
//End if 


//Case of 
//: (Not(Undefined($range.start))) && (Not(Undefined($range.end)))  // it's a range
//$case:=1

//$elements:=WP Get formulas($range)
//If ($elements.length>0)
//$formulaSource:=$elements[0].formula.source
//End if 


//: (Not(Undefined($range.anchorOrigin)))
//$case:=2

//WP GET ATTRIBUTES($range; wk image formula; $formula)
//If ($formula#Null)
//$formulaSource:=$formula.source
//End if 

//End case 


//If ($formulaSource#"")

//EDIT FORMULA(Table(1)->; $formulaSource)
//If (ok=1)

//Case of 
//: ($case=1)
//WP INSERT FORMULA($elements[0].range; Formula from string($formulaSource); wk replace)

//: ($case=2)
//WP SET ATTRIBUTES($range; wk image formula; Formula from string($formulaSource))

//End case 

//End if 

//End if 