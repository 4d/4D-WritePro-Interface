
var $area : cs:C1710.WPdocument
var $pictElem : cs:C1710.WPelement
var $picture : Picture
var $path : Text

$path:=File:C1566("/RESOURCES/Images/HLbullet.png").platformPath

READ PICTURE FILE:C678($path; $picture)

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$pictElem:=$area.insertPicture($picture; wk prepend:K81:178)
$pictElem.setAttributes({width: "2cm"; height: "2cm"; marginLeft: "1cm"; marginRight: "1cm"; borderStyle: 1; borderColor: "red"})


//ALERT($textBox.getText())
