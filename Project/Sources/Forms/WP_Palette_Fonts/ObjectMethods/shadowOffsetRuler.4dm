C_LONGINT:C283($color)
C_LONGINT:C283($offset)

OBJECT GET RGB COLORS:C1074(*;"ColorShadow";$color;$color)

$offset:=oForm.shadowOffset
WP_SetTextShadow (Form:C1466.selection;$offset;$color)

oForm.cbShadow:=1
