//%attributes = {"invisible":true}
C_OBJECT:C1216($1;$o)


C_COLLECTION:C1488($_attributes)

C_OBJECT:C1216($source)
C_OBJECT:C1216($target)

C_TEXT:C284($name)


$o:=$1

$source:=$o.from
$target:=$o.to

If ($o.list#Null:C1517)
	$_attributes:=$o.list
Else 
	ARRAY TEXT:C222($_attributeNames;0)
	$_attributes:=New collection:C1472
	OB GET PROPERTY NAMES:C1232($source;$_attributeNames)
	ARRAY TO COLLECTION:C1563($_attributes;$_attributeNames)
End if 

  //$object:=New object
For each ($name;$_attributes)  // only contains attribute NAMES, VALUES will be added (or not)
	
	Case of 
		: ($name="name")
		: ($name="type")
		: ($name="owner")
		Else 
			$target[$name]:=$source[$name]
	End case 
	
End for each 


