var $area : cs:C1710.WPdocument
var $section : cs:C1710.WPsection
var $pictElem : cs:C1710.WPelement
var $picture : Picture
var $path : Text

$path:=File:C1566("/RESOURCES/Images/HLbullet.png").platformPath

READ PICTURE FILE:C678($path; $picture)

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)
If (Shift down:C543)
	$section:=$area.getSection(2)
Else 
	$section:=$area.getSection(1)
End if 

$pictElem:=$section.insertPicture($picture; wk append:K81:179)

$pictElem.setAttributes({width: "1cm"; height: "1cm"; marginLeft: "5mm"; marginRight: "5mm"; borderStyle: 2; borderColor: "purple"})

Form:C1466.wp:=$area.document

//ALERT($textBox.getText())
