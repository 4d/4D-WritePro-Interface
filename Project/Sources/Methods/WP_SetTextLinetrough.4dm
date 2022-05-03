//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_LONGINT:C283($2)


C_OBJECT:C1216($range)
C_LONGINT:C283($color)

$range:=$1
$color:=$2

If (Not:C34(OB Is empty:C1297($range)))
	
	If ($color>=0) | ($color=-1)
		WP SET ATTRIBUTES:C1342($range; wk text linethrough color:K81:76; $color)
	End if 
	
End if 