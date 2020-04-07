//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($o_Document)

C_LONGINT:C283($i;$n)

$o_Document:=$1

If (Not:C34(OB Is empty:C1297($o_Document)))
	
	ARRAY TEXT:C222($_Sources;0)
	ARRAY POINTER:C280($_Targets;0)
	
	APPEND TO ARRAY:C911($_Sources;wk title:K81:79)
	APPEND TO ARRAY:C911($_Sources;wk subject:K81:80)
	APPEND TO ARRAY:C911($_Sources;wk author:K81:81)
	APPEND TO ARRAY:C911($_Sources;wk company:K81:82)
	APPEND TO ARRAY:C911($_Sources;wk notes:K81:83)
	APPEND TO ARRAY:C911($_Sources;wk date creation:K81:84)
	APPEND TO ARRAY:C911($_Sources;wk date modified:K81:85)
	
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Title"))
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Subject"))
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Author"))
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Company"))
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Notes"))
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Created"))
	APPEND TO ARRAY:C911($_Targets;OBJECT Get pointer:C1124(Object named:K67:5;"Modified"))
	
	$n:=Size of array:C274($_Sources)
	For ($i;1;$n)
		WP GET ATTRIBUTES:C1345($o_Document;$_Sources{$i};$_Targets{$i}->)
	End for 
	
End if 
