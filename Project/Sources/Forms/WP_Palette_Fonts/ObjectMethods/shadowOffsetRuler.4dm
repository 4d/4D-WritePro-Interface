var $color : Integer
var $offset : Integer

OBJECT GET RGB COLORS:C1074(*; "ColorShadow"; $color; $color)

$offset:=formData.shadowOffset
WP_SetTextShadow(Form:C1466.selection; $offset; $color)

formData.cbShadow:=1
