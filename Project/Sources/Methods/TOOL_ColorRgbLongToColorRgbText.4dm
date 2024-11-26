//%attributes = {"invisible":true}
#DECLARE($color : Integer)->$color_t : Text
$color_t:="RGB("+String:C10(($color & 0x00FF0000) >> 16)+","+String:C10(($color & 0xFF00) >> 8)+","+String:C10($color & 0x00FF)+")"
