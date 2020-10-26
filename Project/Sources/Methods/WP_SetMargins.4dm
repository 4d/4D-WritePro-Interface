//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_TEXT:C284($4)

C_OBJECT:C1216($applyTo;$section)
C_TEXT:C284($attribute)
C_TEXT:C284($tempUnit)
C_REAL:C285($value)


$applyTo:=$1
$attribute:=$2
$value:=$3

If (Not:C34(OB Is empty:C1297($applyTo)))
	
	If (Count parameters:C259=4)
		$tempUnit:=$4
		$value:=WP_Convert($value;$tempUnit;userUnit)
	End if 
	
	If ($applyTo.type#Null:C1517)  //ACI0100306
		
		//If ($applyTo.type=wk type image) | ($applyTo.type=wk type paragraph)
		WP SET ATTRIBUTES:C1342($applyTo;$attribute;$value)
		
	Else   //ACI0100306
		
		$section:=WP Get section:C1581(Form:C1466.selection)
		
		Case of 
			: ($attribute=wk margin top:K81:13)
				$attribute:=wk page margin top:K81:268
				
			: ($attribute=wk margin bottom:K81:14)
				$attribute:=wk page margin bottom:K81:269
				
			: ($attribute=wk margin right:K81:12)
				$attribute:=wk page margin right:K81:267
				
			: ($attribute=wk margin left:K81:11)
				$attribute:=wk page margin left:K81:266
				
		End case 
		
		WP SET ATTRIBUTES:C1342($section;$attribute;$value)
		
	End if 
	
End if 
