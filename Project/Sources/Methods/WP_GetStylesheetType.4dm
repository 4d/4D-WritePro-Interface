//%attributes = {"invisible":true}
#DECLARE() : Integer

var $index : Integer:=oForm.styleSheet.btnType.indexOf(1)

return oForm.styleSheet.btnValue[$index]