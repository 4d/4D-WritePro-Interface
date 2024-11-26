//%attributes = {"invisible":true}
//Method created 2020/06/03 to fix the ACI0100879

#DECLARE($title : Text; $value : Text; $labelOk : Text; $labelCancel : Text; $placeHolder : Text)->$answer : Text

var $o : Object
var $x1; $y1; $x2; $y2; $win : Integer

$o:=New object:C1471
$o.title:=$title
$o.value:=$value
$o.labelOk:=$labelOk
$o.labelCancel:=$labelCancel
$o.placeHolder:=$placeHolder
$o.windowTitle:=""

GET WINDOW RECT:C443($x1; $y1; $x2; $y2)

// form to open is 420 * 140
$x1:=(($x1+$x2)/2)-Int:C8(420/2)  // horizontaly centered in the main window - half of 420
$y1:=$y1+40  // Arbitrary 40 pixels from the top

If (Is macOS:C1572)  //& (Not(Shift down))
	$win:=Open form window:C675("D_Request"; Sheet form window:K39:12)
Else 
	$win:=Open form window:C675("D_Request"; Movable form dialog box:K39:8; $x1; $y1)
End if 
DIALOG:C40("D_Request"; $o)

If (ok=1)
	$answer:=$o.value
Else 
	$answer:=""
End if 

