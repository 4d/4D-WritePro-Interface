//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

$range:=$1

C_TEXT:C284($pictureAltText)

If (Not:C34(OB Is empty:C1297($range)))
	
	$pictureAltText:=(OBJECT Get pointer:C1124(Object named:K67:5;"pictAltText"))->
	WP SET ATTRIBUTES:C1342($range;wk image alternate text:K81:170;$pictureAltText)
	
End if 