//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_LONGINT:C283($2)

C_OBJECT:C1216($range)
C_LONGINT:C283($align)

$range:=$1
$align:=$2

If (Not:C34(OB Is empty:C1297($range)))
	
	WP SET ATTRIBUTES:C1342($range;wk text align:K81:49;$align)
	
End if 
