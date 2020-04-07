//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_LONGINT:C283($2)
C_LONGINT:C283($positionHor)

C_LONGINT:C283($3)
C_LONGINT:C283($positionVert)


If (Count parameters:C259>=3)
	
	$range:=$1
	$positionHor:=$2
	$positionVert:=$3
	
	WP SET ATTRIBUTES:C1342($range;wk background position horizontal:K81:22;$positionHor)
	WP SET ATTRIBUTES:C1342($range;wk background position vertical:K81:23;$positionVert)
	
Else 
	
	ALERT:C41("Missing parameters")
	
End if 

