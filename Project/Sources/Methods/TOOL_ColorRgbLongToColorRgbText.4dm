//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_TEXT:C284($0)

C_LONGINT:C283($color)
C_TEXT:C284($color_t)

$color:=$1

$color_t:="RGB("+String:C10(($color & 0x00FF0000) >> 16)+","+String:C10(($color & 0xFF00) >> 8)+","+String:C10($color & 0x00FF)+")"

$0:=$color_t
