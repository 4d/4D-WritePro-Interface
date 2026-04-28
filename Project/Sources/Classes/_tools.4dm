singleton shared Class constructor
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function incrementString($original : Text; $separator : Text; $format : Text) : Text
	
	var $num; $pos; $len : Integer
	If (Match regex:C1019("(?m-si)\\D("+$separator+"\\d+)$"; $original; 1; $pos; $len))
		
		$num:=Num:C11(Substring:C12($original; $pos+1; $len))
		$original:=Substring:C12($original; 1; $pos)
		
	End if 
	
	$num+=1
	return $original+$separator+String:C10($num; $format)
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function copyAttributes($source : Object; $target : Object; $skip : Collection)
	
	$skip:=$skip || []
	
	var $attributes:=OB Keys:C1719($source)
	var $key : Text
	
	For each ($key; $attributes)
		
		If ($skip.includes($key))
			
			continue
			
		End if 
		
		$target[$key]:=$source[$key]
		
	End for each 