//%attributes = {"invisible":true}
C_TEXT:C284($1;$original)
C_TEXT:C284($0)

C_BOOLEAN:C305($lastIsNumber)
C_TEXT:C284($stringNum)
C_LONGINT:C283($l)

$original:=$1
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
		$original:=Substring:C12($original;1;$l)
	End if 
Until ($l<=0) | ($lastIsNumber=False:C215)

$0:=$original+String:C10(Num:C11($stringNum)+1)
