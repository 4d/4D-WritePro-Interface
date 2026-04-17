OBJECT SET TITLE:C194(*; "labelTitle"; Form:C1466.title)
OBJECT SET TITLE:C194(*; "buttonOK"; Form:C1466.labelOk)
OBJECT SET TITLE:C194(*; "buttonCancel"; Form:C1466.labelCancel)
OBJECT SET PLACEHOLDER:C1295(*; "inputValue"; Form:C1466.placeHolder)
SET WINDOW TITLE:C213(Form:C1466.windowTitle)

var $left; $right; $top; $bottom : Integer
OBJECT GET COORDINATES:C663(*; "buttonOK"; $left; $top; $right; $bottom)

var $width; $height : Integer
OBJECT GET BEST SIZE:C717(*; "buttonOK"; $width; $height)
OBJECT SET COORDINATES:C1248(*; "buttonOK"; $right-$width; $top; $right; $bottom)

$left:=$right-$width-20

OBJECT GET BEST SIZE:C717(*; "buttonCancel"; $width; $height)
OBJECT SET COORDINATES:C1248(*; "buttonCancel"; $left-$width; $top; $left; $bottom)
