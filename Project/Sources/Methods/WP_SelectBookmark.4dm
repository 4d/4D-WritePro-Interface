//%attributes = {"invisible":true}

C_OBJECT:C1216($1)  // document
C_TEXT:C284($2;$3)  // area Name, bookmark name

C_OBJECT:C1216($o_Document)  // document
C_TEXT:C284($areaName;$bookmarkName)  // area Name, bookmark name

C_OBJECT:C1216($oRange)

$o_Document:=$1
$areaName:=$2
$bookmarkName:=$3

$oRange:=WP Bookmark range:C1416($o_Document;$bookmarkName)
WP SELECT:C1348(*;$areaName;$oRange)

If (Shift down:C543)
	GOTO OBJECT:C206(*;$areaName)
End if 

