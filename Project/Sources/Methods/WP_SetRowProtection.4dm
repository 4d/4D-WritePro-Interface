//%attributes = {"invisible":true}
C_OBJECT:C1216($1;$textRange)
C_LONGINT:C283($2;$protection)

C_OBJECT:C1216($rows)

$textRange:=$1
$protection:=$2

$rows:=WP Table get rows:C1475($textRange)
WP SET ATTRIBUTES:C1342($rows;wk protected:K81:306;$protection)
