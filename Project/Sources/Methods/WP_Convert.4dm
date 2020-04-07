//%attributes = {"invisible":true}
C_REAL:C285($1)  // value
C_TEXT:C284($2)  // from
C_TEXT:C284($3)  // to

C_REAL:C285($0)

C_REAL:C285($value)
C_TEXT:C284($fromUnit)
C_TEXT:C284($toUnit)

$value:=$1
$fromUnit:=$2
$toUnit:=$3

If ($toUnit#$fromUnit) & ($value#0)
	
	WP SET ATTRIBUTES:C1342(oTempArea;wk layout unit:K81:78;$fromUnit)
	WP SET ATTRIBUTES:C1342(oTempArea;wk text indent:K81:52;$value)  //wk line height
	
	WP SET ATTRIBUTES:C1342(oTempArea;wk layout unit:K81:78;$toUnit)
	WP GET ATTRIBUTES:C1345(oTempArea;wk text indent:K81:52;$value)  //wk margin left
	
End if 

$0:=$value


