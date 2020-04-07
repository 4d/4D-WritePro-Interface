//%attributes = {"invisible":true}

C_REAL:C285($1)
C_REAL:C285($indent)

C_POINTER:C301($ptr)
C_LONGINT:C283($n)

$indent:=$1

$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_offsets")

$n:=Size of array:C274($ptr->)

If ($n=0)
	APPEND TO ARRAY:C911($ptr->;$indent)
Else 
	$ptr->{$n}:=$indent
End if 
