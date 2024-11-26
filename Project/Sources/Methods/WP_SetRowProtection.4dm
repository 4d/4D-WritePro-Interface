//%attributes = {"invisible":true}
#DECLARE($textRange : Object; $protection : Integer)

var $rows : Object

$rows:=WP Table get rows:C1475($textRange)
If ($rows#Null:C1517)
	WP SET ATTRIBUTES:C1342($rows; wk protected:K81:306; $protection)
End if 
