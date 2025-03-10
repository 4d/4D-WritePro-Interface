CONFIRM:C162(Localized string:C991("ClearHistory"))
If (ok=1)
	
	
	
	
	var $aiParameters : Object
	
	$aiParameters:=New object:C1471
	
	$aiParameters.apiKey:=Form:C1466.apiKey
	$aiParameters.windowID:=Form:C1466.windowID
	
	$aiParameters.function:="Reset Context"
	$aiParameters.callbackAction:="Reset Context"
	
	Form:C1466._extra.state:=1  // running
	AI Call($aiParameters)
	
	SET TIMER:C645(-1)
	
End if 