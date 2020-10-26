//%attributes = {"invisible":true}
C_BOOLEAN:C305($insert)
C_TEXT:C284($objectName;$memoErrorMethod;$softHyphen;$previousChar;$nextChar)
C_POINTER:C301($ptr)
C_OBJECT:C1216($document;$range;$headerFooterRange;$documentRange;$paragraphRange)

$insert:=True:C214  // lets be OPTIMISTIC

If (Form:C1466.selection#Null:C1517)
	
	$range:=Form:C1466.selection
	$document:=$range.owner
	
	If ($range.type=wk type character:K81:296)
		
		$paragraphRange:=WP Paragraph range:C1346(WP Get elements:C1550($range;wk type paragraph:K81:191)[0])
		
		Case of 
			: ($range.start=$paragraphRange.start)  // ignore beginning of §
				
			: ($range.end=$paragraphRange.end)  // ignore ending of §
				
			: ($range.start#$range.end)  // just to be sure the soft hyphen will NOT replace a selection
				
			Else 
				
				$softHyphen:=Char:C90(0x00AD)
				
				$previousChar:=WP Get text:C1575(WP Text range:C1341($range;$range.start-1;$range.start))
				$nextChar:=WP Get text:C1575(WP Text range:C1341($range;$range.start;$range.start+1))
				
				Case of 
						  //ignore those cases
					: ($previousChar=$softHyphen)
					: ($nextChar=$softHyphen)
					: ($previousChar=" ")
					: ($nextChar=" ")
					: ($previousChar=".")
					: ($nextChar=".")
					: ($previousChar=",")
					: ($nextChar=",")
					Else 
						WP SET TEXT:C1574($range;$softHyphen;wk replace:K81:177;wk exclude from range:K81:181)
				End case 
				
		End case 
		
	End if 
End if 
