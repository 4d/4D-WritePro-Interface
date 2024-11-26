//%attributes = {"invisible":true}

var $text; $char : Text
var $range; $charRange; $document : Object
var $start; $end; $i; $n : Integer

If (Form:C1466.selection#Null:C1517)
	
	$range:=Form:C1466.selection
	$document:=$range.owner
	If ($range.type=wk type character:K81:296)
		
		If ($range.start=$range.end)  // extend the range to be sure to catch the SoftHyphens
			If ($range.start>1)
				$start:=$range.start-1
			Else 
				$start:=1
			End if 
			
			$end:=$range.end+1
			$range:=WP Text range:C1341($document; $start; $end)
			
		End if 
		
		$text:=WP Get text:C1575($range)
		$n:=Length:C16($text)
		For ($i; $n; 1; -1)
			
			$char:=$text[[$i]]
			If ($char=Char:C90(0x00AD))
				$charRange:=WP Text range:C1341($document; $range.start+$i-1; $range.start+$i)
				WP SET TEXT:C1574($charRange; ""; wk replace:K81:177)
			End if 
			
		End for 
		
	End if 
End if 



