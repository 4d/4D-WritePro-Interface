//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_PICTURE:C286($2)
C_PICTURE:C286($pict)

If (Count parameters:C259>=2)
	
	$range:=$1
	$pict:=$2
	
	If (Picture size:C356($pict)#0)
		WP SET ATTRIBUTES:C1342($range;wk background image:K81:21;$pict)
	Else 
		WP SET ATTRIBUTES:C1342($range;wk background image:K81:21;"")
	End if 
	
Else 
	
	ALERT:C41("Missing parameters")
	
End if 

