//%attributes = {"invisible":true}
C_OBJECT:C1216($1; $textRange)
C_LONGINT:C283($2; $protection)

C_OBJECT:C1216($cells)

$textRange:=$1
$protection:=$2

$cells:=WP Table get cells:C1477($textRange)
If ($cells#Null:C1517)
	WP SET ATTRIBUTES:C1342($cells; wk protected:K81:306; $protection)
End if 