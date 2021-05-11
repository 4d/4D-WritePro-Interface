If (oForm.FR.kanaSensitive)
	
	oForm.FR.caseSensitive:=True:C214
	oForm.FR.diacriticSensitive:=True:C214
	
	
Else 
	
	oForm.FR.caseSensitive:=False:C215
	oForm.FR.diacriticSensitive:=False:C215
	
	oForm.FR.widthSensitive:=False:C215
	
End if 


SET TIMER:C645(-1)
