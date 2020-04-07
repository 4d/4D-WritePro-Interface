//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_LONGINT:C283($2)

C_OBJECT:C1216($range)
C_LONGINT:C283($color)

$range:=$1
$color:=$2

If ($range#Null:C1517)
	$range:=WP Table get cells:C1477($range)
	If ($range#Null:C1517)
		WP SET ATTRIBUTES:C1342($range;wk background color:K81:20;$color)
	End if 
End if 
