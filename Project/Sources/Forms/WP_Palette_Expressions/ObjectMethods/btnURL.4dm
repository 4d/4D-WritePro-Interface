
C_LONGINT:C283($x1;$y1;$x2;$y2)
  //C_LONGINT($win)

C_TEXT:C284($Label;$URL)

OBJECT GET COORDINATES:C663(*;"SeparatorURL";$x1;$y1;$x2;$y2)
$y2:=$y2+5
CONVERT COORDINATES:C1365($x1;$y2;XY Current form:K27:5;XY Main window:K27:8)

  //$win:=Open form window("D_inputURL";Modal form dialog box;$x1;$y2)

$Label:=(OBJECT Get pointer:C1124(Object named:K67:5;"URLlabel"))->
$URL:=(OBJECT Get pointer:C1124(Object named:K67:5;"URLurl"))->

  //DIALOG("D_inputURL")

WP_Set4Durl ($Label;$URL)

