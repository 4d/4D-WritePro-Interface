var $area : cs:C1710.WPdocument
var $section : cs:C1710.WPsection
var $pictElem : cs:C1710.WPelement
var $header : cs:C1710.WPelement
var $textRange : cs:C1710.WPrange

var $picture : Picture
var $path : Text

$path:=File:C1566("/RESOURCES/Images/HLbullet.png").platformPath

READ PICTURE FILE:C678($path; $picture)

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)
$header:=$area.getHeader(1)
$textRange:=$header.textRange(2; 4)
$textRange.setAttributes({fontBold: True:C214; backgroundColor: "Yellow"})

If (Shift down:C543)
	$pictElem:=$textRange.insertPicture($picture; wk append:K81:179; wk exclude from range:K81:181)
Else 
	$pictElem:=$textRange.insertPicture($picture; wk append:K81:179; wk include in range:K81:180)
End if 


If ($pictElem#Null:C1517)
	$pictElem.setAttributes({width: "1cm"; height: "1cm"; marginLeft: "2mm"; marginRight: "2mm"; borderStyle: 2; borderColor: "purple"})
End if 



//Form.wp:=$area.document

//ALERT($textBox.getText())
