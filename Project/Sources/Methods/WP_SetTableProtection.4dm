//%attributes = {"invisible":true}
#DECLARE($textRange : Object; $protection : Integer)

var $tableRange : Object

$tableRange:=WP Table range:C1553($textRange)
WP SET ATTRIBUTES:C1342($tableRange; wk protected:K81:306; $protection)
