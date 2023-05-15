
var $color : Integer

$color:=Form:C1466.border_color.colorPicker()
Form:C1466.currentRow.borderColor:=Form:C1466.border_color.css.hexLong
SET TIMER:C645(-1)