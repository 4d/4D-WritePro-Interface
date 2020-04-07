//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_LONGINT:C283($2)
C_LONGINT:C283($3)

C_OBJECT:C1216($range)
C_LONGINT:C283($offset)
C_LONGINT:C283($color)

$range:=$1
$offset:=$2
If (Count parameters:C259>=3)
	$color:=$3
Else 
	$color:=-1
End if 

If (Not:C34(OB Is empty:C1297($range)))
	
	  // set the shadow offset in pt
	WP SET ATTRIBUTES:C1342($range;wk text shadow offset:K81:72;$offset)
	
	If ($color>=0) | ($color=wk transparent:K81:134)
		WP SET ATTRIBUTES:C1342($range;wk text shadow color:K81:71;$color)
	End if 
End if 