//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_LONGINT:C283($2)
C_LONGINT:C283($clipVal)

If (Count parameters:C259>=2)
	
	$range:=$1
	$clipVal:=$2
	
	WP SET ATTRIBUTES:C1342($range;wk background clip:K81:25;$clipVal)
	
Else 
	
	ALERT:C41("Missing parameters")
	
End if 

