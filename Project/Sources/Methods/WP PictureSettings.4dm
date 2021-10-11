//%attributes = {"shared":true,"invisible":true}
#DECLARE($range : Object)

var $form; $range : Object
var $elements : Collection
var $win : Integer


$form:=New object:C1471()
$form.range:=$range

If ($range.type=2)
	$form.picture:=$range
Else 
	
	$elements:=WP Get elements:C1550($range; wk type image:K81:192)
	
	If ($elements.length>=1)
		$form.picture:=$elements[0]
	End if 
	
End if 

If (Not:C34(Undefined:C82($form.picture)))
	$win:=Open form window:C675("D_pictureSettings"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("D_pictureSettings"; $form)
End if 

