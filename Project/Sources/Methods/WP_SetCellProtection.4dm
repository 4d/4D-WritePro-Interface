//%attributes = {"invisible":true}
#DECLARE($textRange : Object; $protection : Integer)

var $cells : Object

$cells:=WP Table get cells:C1477($textRange)
If ($cells#Null:C1517)
	WP SET ATTRIBUTES:C1342($cells; wk protected:K81:306; $protection)
End if 