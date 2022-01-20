var $x1; $y1; $x2; $y2; $posX; $posY; $posZ; $win : Integer

GET WINDOW RECT:C443($x1; $y1; $x2; $y2)
GET MOUSE:C468($posX; $posY; $posZ)

$win:=Open form window:C675("D_FindOptions"; Pop up form window:K39:11; $x1+$posX; $y1+$posY)
DIALOG:C40("D_FindOptions"; Form:C1466)

SET TIMER:C645(10)

