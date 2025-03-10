var $range : Object

If (Form:C1466.bookmarks.length>0)
	
	If (Form:C1466.selectedRow=Null:C1517)
		
		Form:C1466.selectedRowID:=1
		LISTBOX SELECT ROW:C912(*; "LB_Bookmarks"; 1; lk replace selection:K53:1)
		
		Form:C1466.selectedRow:=Form:C1466.bookmarks[0]
		
	End if 
	
	//$range:=Form.selectedRow.promptRange
	$range:=Form:C1466.selectedRow.answerRange
	WP SELECT:C1348(*; "WParea"; $range)  //$range.start; $range.start)
	
	GOTO OBJECT:C206(*; "WParea")
	//SET TIMER(-1)
	
	//Form.WPai:=Form.WPai
	
End if 