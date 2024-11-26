//%attributes = {"invisible":true}
#DECLARE($original : Text)->$result : Text

var $lastIsNumber : Boolean
var $stringNum : Text
var $l : Integer

$l:=Length:C16($original)

// "abcd" -> "abcd1"
// "abcd0" -> "abcd1"
// "abcd123"  -> "abcd124"
// "18" -> "19"

$stringNum:=""
Repeat 
	$lastIsNumber:=(($original[[$l]])>="0") & (($original[[$l]])<="9")
	If ($lastIsNumber)
		$stringNum:=$original[[$l]]+$stringNum
		$l:=$l-1
		$original:=Substring:C12($original; 1; $l)
	End if 
Until ($l<=0) | ($lastIsNumber=False:C215)

$result:=$original+String:C10(Num:C11($stringNum)+1)
