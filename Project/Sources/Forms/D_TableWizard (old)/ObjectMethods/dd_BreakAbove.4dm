
If ((Form:C1466.tableBreakAbove.index+Form:C1466.tableBreakBelow.index)>Form:C1466.maxBreaks)
	Form:C1466.tableBreakBelow.index:=Form:C1466.maxBreaks-Form:C1466.tableBreakAbove.index
End if 

SET TIMER:C645(-1)

