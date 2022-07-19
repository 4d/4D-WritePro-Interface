//%attributes = {"invisible":true}
#DECLARE()->$_tables : Collection
$_tables:=WP Get elements:C1550(Form:C1466.selection.owner; wk type table:K81:222).query("dataSource != :1"; Null:C1517)


