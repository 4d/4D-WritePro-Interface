
//ACI0098389 (new item added)

var $textLineHeight : Integer

If (Self:C308->=1)  //%
	$textLineHeight:=100
Else 
	$textLineHeight:=12
End if 

(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightRuler"))->:=$textLineHeight
(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightInput"))->:=$textLineHeight

WP_SetTextLineHeight(Form:C1466.paragraphRange; $textLineHeight)

SET TIMER:C645(-1)  // redessine interface 
