//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_LONGINT:C283($2)

C_OBJECT:C1216($range)
C_LONGINT:C283($size)

$range:=$1
$size:=$2

If (Not:C34(OB Is empty:C1297($range)))
	  // set the size (always in pt)
	  //WP RESET ATTRIBUTES($range;wk style sheet)  //†††
	WP SET ATTRIBUTES:C1342($range;wk font size:K81:66;$size)
End if 
