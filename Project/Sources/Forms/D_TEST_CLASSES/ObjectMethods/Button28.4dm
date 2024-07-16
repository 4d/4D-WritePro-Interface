
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange
var $table : cs:C1710.WPtable
var $pict : cs:C1710.WPelement

var $picture : Picture
var $name; $path : Text

$area:=cs:C1710.WPdocument.new()
$area.setText("ABCD"; wk append:K81:179)


$path:=File:C1566("/RESOURCES/Images/HLbullet.png").platformPath
READ PICTURE FILE:C678($path; $picture)

$pict:=$area.insertPicture($picture; wk append:K81:179)

Case of 
	: (Shift down:C543)
		$table:=$pict.insertTable(wk prepend:K81:178; wk include in range:K81:180; 3; 6)
	: (Macintosh option down:C545)
		$table:=$pict.insertTable(wk replace:K81:177; wk include in range:K81:180; 3; 6)
	Else 
		$table:=$pict.insertTable(wk append:K81:179; wk include in range:K81:180; 3; 6)
End case 

Form:C1466.wp:=$area.document
