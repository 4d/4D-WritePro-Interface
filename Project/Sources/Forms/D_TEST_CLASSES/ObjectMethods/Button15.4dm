
var $area : cs:C1710.WPdocument
var $pictElem : cs:C1710.WPelement
var $picture : Picture
var $path : Text

$path:=File:C1566("/RESOURCES/Images/HLbullet.png").platformPath

READ PICTURE FILE:C678($path; $picture)

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)
$pictElem:=$area.insertPicture($picture; wk append:K81:179)

$pictElem.setAttributes({width: "1cm"; height: "1cm"; marginLeft: "5mm"; marginRight: "5mm"; borderStyle: 2; borderColor: "purple"})


Form:C1466.wp:=$area.document

//ALERT($textBox.getText())
