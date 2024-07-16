//%attributes = {}
//#DECLARE($target : Object; $picture : Picture; $replace : Integer) : Object

//var $image : Object
//$image:=Null


//If (OB Instance of($target; 4D.WriteRange))
//$target:=OB Copy($target)  //ensure to not modify original target
//$targetRange:=OB Copy($target)  //already a range
//Else 
//$targetRange:=WP Text range($target; wk start text; wk end text)  //element or section -> get full range from it
//End if 


//WP INSERT PICTURE($target; $picture; $replace)


//ASSERT($targetRange#Null)

//$container:=$targetRange.container#Null ? $targetRange.container : $targetRange.owner

//ASSERT($container#Null)

//Case of 
//: ($replace=wk replace)
//$range:=WP Text range($container; $targetRange.start; $targetRange.start+1)
//: ($replace=wk append)
//$range:=WP Text range($container; $targetRange.end; $targetRange.end+1)
//: ($replace=wk prepend)
//$range:=WP Text range($container; $targetRange.start; $targetRange.start+1)

//End case 

//$images:=WP Get elements($range; wk type image)
//ASSERT($images.length>0)
//If ($images.length>0)
//$image:=$images[0]
//End if 


//return $image




