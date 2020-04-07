//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_LONGINT:C283($2)
C_LONGINT:C283($3)

C_OBJECT:C1216($range)
C_LONGINT:C283($style)
C_LONGINT:C283($color)

$range:=$1
$style:=$2
If (Count parameters:C259>=3)
	$color:=$3
Else 
	$color:=-1
End if 

If (Not:C34(OB Is empty:C1297($range)))
	If ($style#wk mixed:K81:89)
		WP SET ATTRIBUTES:C1342($range;wk text linethrough style:K81:75;$style)
	End if 
	
	If ($color>=0) | ($color=-1)
		WP SET ATTRIBUTES:C1342($range;wk text linethrough color:K81:76;$color)
	End if 
	
End if 