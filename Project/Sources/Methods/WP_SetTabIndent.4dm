//%attributes = {"invisible":true}
#DECLARE($indent : Real)

var $ptr : Pointer
var $n : Integer

$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "lb_offsets")

$n:=Size of array:C274($ptr->)

If ($n=0)
	APPEND TO ARRAY:C911($ptr->; $indent)
Else 
	$ptr->{$n}:=$indent
End if 
