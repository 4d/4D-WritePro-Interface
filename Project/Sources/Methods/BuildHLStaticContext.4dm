//%attributes = {}
//#DECLARE($context : Object; $contextName : Text; $linksLevel : Integer)->$returnedContextList : Collection

#DECLARE($context : Object; $contextName : Text; $itemRef : Integer)->$HList : cs:C1710.HList

var $icon : Picture
var $picturePath; $attributeName; $dataClassName; $attributeNameTranslated; $json; $relatedDataClassName; $nextContextName : Text

var $subList : cs:C1710.HList

var $itemRef; $p; $type : Integer
var $o : Object
var $fill; $append : Boolean


If (Count parameters:C259=1)
	$picturePath:="path:/RESOURCES/Images/Colors/FrontColor_7.png"
	$itemRef:=1000
End if 

$HList:=cs:C1710.HList.new()



For each ($attributeName; $context)
	
	If (Value type:C1509($context[$attributeName])=Is object:K8:27)
		
		$subList:=BuildHLStaticContext($context[$attributeName]; $attributeName; $itemRef+1)
		
		$HList.append($attributeName; $itemRef; $subList.hlist; False:C215)  //
		$HList.setParameter($itemRef; Additional text:K28:7; String:C10($itemRef))  // TEMPO FOR DEBUG 
		//$HList.setProperties($itemRef; False; Bold; $picturePath)
		
		$itemRef:=$itemRef+$subList.countItems()+1
		
	Else 
		// not an object !
		
		
		$HList.append($attributeName; $itemRef)
		
		$o:=New object:C1471
		$o.type:=Is text:K8:3
		$o.formulaSource:="This.data."+$contextName+"."+$attributeName
		$o.name:=$contextName+"."+$attributeName
		
		$json:=JSON Stringify:C1217($o; *)  //  ";*" TEMPO FOR DEBUG 
		
		$HList.setParameter($itemRef; "JSON"; $json)
		$HList.setParameter($itemRef; "SOURCE"; $o.formulaSource)
		$HList.setParameter($itemRef; Additional text:K28:7; String:C10($itemRef))  // TEMPO FOR DEBUG 
		
		$itemRef:=$itemRef+1
		
	End if 
End for each 



//If ($HList.countItems()=1)
//$HList.expandItem(1)
//End if 

/*
: (Count parameters>=3)

$dataClass:=$context
$dataClassName:=$dataClass.getInfo().name


$HList:=cs.HList.new()  // sublist

For each ($attributeName; $dataClass)  // at this level, $context is a dataclass

//If ($attributeName="group") & (Shift down)
//TRACE
//End if 


$o:=New object

$append:=True
$type:=$dataClass[$attributeName].fieldType
Case of 
: ($type=Is date)  // date
$o.type:=Is date  // 4
: ($type=Is time)
$o.type:=Is time  //11
: ($type=Is real) || ($type=Is longint)
$o.type:=Is real  // 9 or 1
: ($type=Is text) || ($type=Is string var) || ($type=Is alpha field)
$o.type:=Is text  //2
: ($type=Is picture)
$o.type:=Is picture  //3
: ($type=Is boolean)
$o.type:=Is boolean  //6
Else 
// blob or object
$append:=False
//APPEND TO ARRAY(tDefauldFormat; -1)  // automatic
End case 

If ($append)

$o.formulaSource:="This.data."+$contextName+"."+$attributeName
$o.name:=$contextName+"."+$attributeName
$attributeNameTranslated:=$attributeName  // NOT TRANLATED

If (Not(Undefined(Form.local.attributes)))

$p:=Form.local.attributes.indexOf($attributeName)
If ($p>=0)
$attributeNameTranslated:=Form.local.attributesTranslated[$p]
$o.name:=$contextName+"."+$attributeNameTranslated
Else 
$append:=False
End if 

End if 

End if 

If ($append)

$HList.append($attributeNameTranslated; $itemRef)  // no sublist
$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 

$json:=JSON Stringify($o; *)  //  ";*" TEMPO FOR DEBUG 
$HList.setParameter($itemRef; "JSON"; $json)

$itemRef:=$itemRef+1

End if 




End for each 





End case 

//$HList:=$receivedFieldList
