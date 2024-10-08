//%attributes = {}
#DECLARE($thems : Collection)->$dropDown : Object

var $them : Object

$dropDown:=New object:C1471

$dropDown.values:=New collection:C1472
$dropDown.index:=0

$dropDown.prompts:=New collection:C1472
$dropDown.pictures:=New collection:C1472

For each ($them; $thems)
	$dropDown.values.push($them.name)
	$dropDown.prompts.push($them.prompt)
	$dropDown.pictures.push($them.icon)
End for each 



