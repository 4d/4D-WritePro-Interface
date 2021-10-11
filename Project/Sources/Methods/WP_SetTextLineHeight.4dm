//%attributes = {"invisible":true}
//ACI0098389 (new item added)

C_OBJECT:C1216($1)
C_REAL:C285($2)
C_TEXT:C284($3)

C_OBJECT:C1216($range)
C_REAL:C285($heightValue)
C_TEXT:C284($heightValue_t)
C_POINTER:C301($ptrTextLineHeightUnit)

$range:=$1
$heightValue:=$2


If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrTextLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "TextLineHeightUnit")
	
	If (($ptrTextLineHeightUnit->)=1)  // "%"
		$heightValue_t:=String:C10($heightValue)+"%"
	Else   //                         "pt"
		$heightValue_t:=String:C10($heightValue)+"pt"
	End if 
	
	WP SET ATTRIBUTES:C1342($range; wk line height:K81:51; $heightValue_t)
End if 
