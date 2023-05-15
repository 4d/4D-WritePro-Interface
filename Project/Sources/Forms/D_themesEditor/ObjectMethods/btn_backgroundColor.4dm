var $color : Integer

$color:=Form:C1466.background_color.colorPicker()
Form:C1466.currentRow.backgroundColor:=Form:C1466.background_color.css.hexLong
SET TIMER:C645(-1)
