
C_LONGINT:C283($fontSize)

If (oForm.fontSize<=0)  // check <=0  (must be >=1)
	oForm.fontSize:=1
End if 
$fontSize:=oForm.fontSize

WP_SetFontSize(Form:C1466.selection; $fontSize)

//(OBJECT Get pointer(Object named;"fontSizeRuler"))->:=Self->  // report value into ruler