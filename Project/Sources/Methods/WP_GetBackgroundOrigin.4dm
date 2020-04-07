//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_POINTER:C301($ptr)
C_LONGINT:C283($p)
C_LONGINT:C283($origin)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	WP GET ATTRIBUTES:C1345($range;wk background origin:K81:26;$origin)
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndOriginVal")
	If ($origin#wk mixed:K81:89)
		$p:=Find in array:C230($ptr->;$origin)
	Else 
		$p:=0
	End if 
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndOrigin")
	$ptr->:=$p
	
End if 
