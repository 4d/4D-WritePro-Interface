If (formData.FR.kanaSensitive)
	
	formData.FR.caseSensitive:=True:C214
	formData.FR.diacriticSensitive:=True:C214
	
	
Else 
	
	formData.FR.caseSensitive:=False:C215
	formData.FR.diacriticSensitive:=False:C215
	
	formData.FR.widthSensitive:=False:C215
	
End if 


SET TIMER:C645(-1)
