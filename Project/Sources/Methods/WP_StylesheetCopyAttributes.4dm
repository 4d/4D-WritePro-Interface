//%attributes = {"invisible":true}
#DECLARE($o : Object)

var $source : Object:=$o.from
var $target : Object:=$o.to

var $attributes : Collection:=$o.list || OB Entries:C1720($o.from)

var $skip:=["name"; "type"; "owner"]

var $item : Object
For each ($item; $attributes)  // Only contains attribute NAMES, VALUES will be added (or not)
	
	If ($skip.includes($item.key))
		
		continue
		
	End if 
	
	Try($target[$item.key]:=$source[$item.key])
	
End for each 