//%attributes = {"invisible":true}
#DECLARE()->$value : Integer
var $index : Integer

$index:=oForm.styleSheet.btnType.indexOf(1)
$value:=oForm.styleSheet.btnValue[$index]
