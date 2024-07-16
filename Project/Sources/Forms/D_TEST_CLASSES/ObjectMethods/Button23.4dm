
var $area : cs:C1710.WPdocument
var $section : cs:C1710.WPsection
var $pictElem; $newPictElem : cs:C1710.WPelement
var $header : cs:C1710.WPelement
var $textRange : cs:C1710.WPrange

var $picture1; $picture2 : Picture
var $path : Text

$path:=File:C1566("/RESOURCES/Images/HLbullet.png").platformPath
READ PICTURE FILE:C678($path; $picture1)
$path:=File:C1566("/RESOURCES/Images/drag.png").platformPath
READ PICTURE FILE:C678($path; $picture2)

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)
$header:=$area.getHeader(1)
If ($header=Null:C1517)
	$section:=$area.getSection(1)
	$header:=$section.newHeader()
End if 


$header.setText("ABCDEF"; wk append:K81:179)

$textRange:=$header.textRange(1; 2)
$textRange.setAttributes({fontBold: True:C214})

$textRange:=$header.textRange(2; 3)  // second char
$pictElem:=$textRange.insertPicture($picture1; wk prepend:K81:178; wk include in range:K81:180)



// TEST

$newPictElem:=$pictElem.insertPicture($picture2; wk replace:K81:177)
$newPictElem.setAttributes({borderStyle: 1; borderColor: "red"})
