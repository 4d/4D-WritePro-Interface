//%attributes = {"invisible":true}
C_OBJECT:C1216($1)

C_OBJECT:C1216($range)
C_REAL:C285($textIndentPt;$textIndentUnit)
C_TEXT:C284($textIndentUnit_t)

$range:=$1
If (Not:C34(OB Is empty:C1297($range)))
	
	  // get the indent in user units
	WP GET ATTRIBUTES:C1345($range;wk text indent:K81:52;$textIndentUnit)  // result in user unit
	WP GET ATTRIBUTES:C1345($range;wk text indent:K81:52;$textIndentUnit_t)
	
	If ($textIndentUnit#wk mixed:K81:89)
		
		$textIndentPt:=WP_Convert ($textIndentUnit;userUnit;wk unit pt:K81:136)
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"textIndentRuler"))->:=$textIndentPt
		(OBJECT Get pointer:C1124(Object named:K67:5;"textIndentInput"))->:=$textIndentUnit
	Else 
		(OBJECT Get pointer:C1124(Object named:K67:5;"textIndentRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5;"textIndentInput"))->:=0
	End if 
	
End if 
