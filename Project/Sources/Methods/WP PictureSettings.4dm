//%attributes = {"shared":true,"invisible":true}
#DECLARE($object : Object)  // 

var $form : Object
var $elements : Collection
var $win : Integer
var $object : Object


If (Count parameters:C259=0)
	$object:=WP Selection range:C1340(Self:C308->)  // text range OR anchored picture
End if 

$form:=New object:C1471()

Case of 
	: (Not:C34(Undefined:C82($object.start))) && (Not:C34(Undefined:C82($object.end)))  // it's a range
		
		$elements:=WP Get elements:C1550($object; wk type image:K81:192)
		
		If ($elements.length>=1)
			$form.picture:=$elements[0]
			$form.range:=$object
		End if 
		
	: (Not:C34(Undefined:C82($object.anchorOrigin)))
		
		$form.picture:=$object
		$form.range:=Null:C1517
		
End case 




If (Not:C34(Undefined:C82($form.picture)))
	$win:=Open form window:C675("D_pictureSettings"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("D_pictureSettings"; $form)
End if 

