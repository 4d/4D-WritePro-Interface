//%attributes = {"invisible":true}
#DECLARE($color_t : Text)->$color : Integer

var $red; $green; $blue : Integer
var $p1; $p2; $p3 : Integer

If ($color_t="RGB(@")
	$p1:=Position:C15(","; $color_t)
	$p2:=Position:C15(","; $color_t; $p1+1)
	$p3:=Position:C15(")"; $color_t; $p2+1)
	
	$red:=Num:C11(Substring:C12($color_t; 5; $p1-5))
	$green:=Num:C11(Substring:C12($color_t; $p1+1; $p2-$p1))
	$blue:=Num:C11(Substring:C12($color_t; $p2+1; $p3-$p2))
	
	$color:=($red << 16)+($green << 8)+$blue
Else 
	$color:=Num:C11($color_t)
End if 





