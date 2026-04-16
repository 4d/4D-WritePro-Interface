//%attributes = {"invisible":true}
#DECLARE($o : Object)

var $_attributes : Collection


var $source : Object:=$o.from
var $target : Object:=$o.to

$_attributes:=$o.list || OB Entries:C1720($source)

var $item : Object
For each ($item; $_attributes)  // Only contains attribute NAMES, VALUES will be added (or not)
	
	Case of 
			
			// ________________________________________________________________________________
		: ($item.name="name")
			
			// ________________________________________________________________________________
		: ($item.name="type")
			
			// ________________________________________________________________________________
		: ($item.name="owner")
			
			// ________________________________________________________________________________
		Else 
			
			$target[$item.name]:=$source[$item.name]
			
			// ________________________________________________________________________________
	End case 
End for each 