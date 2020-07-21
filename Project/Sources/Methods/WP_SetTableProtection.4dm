//%attributes = {"invisible":true}
C_OBJECT:C1216($1;$textRange)
C_LONGINT:C283($2;$protection)

C_OBJECT:C1216($tableRange)

$textRange:=$1
$protection:=$2

$tableRange:=WP Table range:C1553($textRange)
WP SET ATTRIBUTES:C1342($tableRange;wk protected:K81:306;$protection)
