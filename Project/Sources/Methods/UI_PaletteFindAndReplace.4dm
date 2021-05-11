//%attributes = {"invisible":true}


If (oForm.FR.find="")
	OBJECT SET ENABLED:C1123(*; "btn@"; False:C215)
	OBJECT SET ENABLED:C1123(*; "btnOptions"; True:C214)
Else 
	OBJECT SET ENABLED:C1123(*; "btn@"; True:C214)
	//If (Form.selection.end=Form.selection.start)
	//OBJECT SET ENABLED(*; "btnReplaceSingle"; False)
	//End if 
End if 

OBJECT SET ENTERABLE:C238(*; "input@"; True:C214)
OBJECT SET ENABLED:C1123(*; "input@"; True:C214)



If (oForm.FR.kanaSensitive)
	
	//oForm.FR.caseSensitive:=True
	//oForm.FR.diacriticSensitive:=True
	
	OBJECT SET ENABLED:C1123(*; "cbCaseSensitive"; False:C215)
	OBJECT SET ENABLED:C1123(*; "cbAccentSensitive"; False:C215)
	
	
	OBJECT SET ENABLED:C1123(*; "cbWidthSensitive"; True:C214)
	
	
Else 
	
	//oForm.FR.widthSensitive:=False
	
	OBJECT SET ENABLED:C1123(*; "cbCaseSensitive"; True:C214)
	OBJECT SET ENABLED:C1123(*; "cbAccentSensitive"; True:C214)
	
	OBJECT SET ENABLED:C1123(*; "cbWidthSensitive"; False:C215)
	
End if 

//
OBJECT SET ENTERABLE:C238(*; "occurencesInfo@"; False:C215)

// the tab buttons are always enabled
OBJECT SET ENABLED:C1123(*; "tabBtn_@"; True:C214)


If (oForm.FR.flashMessage=True:C214)
	
	OBJECT SET VISIBLE:C603(*; "tempoMessage"; True:C214)
	SET TIMER:C645(60*3)
	oForm.FR.flashMessage:=False:C215
	
Else 
	oForm.FR.message:=""
	OBJECT SET VISIBLE:C603(*; "tempoMessage"; False:C215)
End if 

