Class constructor($styleSheet : Object)  //4D_WriteStyleSheet)
	This:C1470.styleSheet:=$styleSheet
	
	
	//mark:-ATTRIBUTES
	
Function resetAttributes($attributeNames : Collection)  // collection of attribute names (strings)
	
	var $attributeName : Text
	For each ($attributeName; $attributeNames)
		WP RESET ATTRIBUTES:C1344(This:C1470.styleSheet; $attributeName)
	End for each 
	
	
Function setAttributes($attributes : Object)  //
	
	var $attributeName : Text
	For each ($attributeName; $attributes)
		WP SET ATTRIBUTES:C1342(This:C1470.styleSheet; $attributeName; $attributes[$attributeName])
	End for each 
	
Function getAttributes($attributeNames : Collection)->$attributes : Object  // collection of attribute names (strings)
	
	var $attributeName : Text
	var $attributeValue : Variant
	
	$attributes:=New object:C1471
	
	For each ($attributeName; $attributeNames)
		WP GET ATTRIBUTES:C1345(This:C1470.styleSheet; $attributeName; $attributeValue)
		$attributes[$attributeName]:=$attributeValue
	End for each 
	
	
	//mark:-DELETE
Function delete()
	
	WP DELETE STYLE SHEET:C1652(This:C1470.styleSheet)
	
	
	
	