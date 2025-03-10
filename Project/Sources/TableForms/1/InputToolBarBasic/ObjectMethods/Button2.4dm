var $file : 4D:C1709.File
var $ai_pref : Object
var $apiKey : Text

$file:=File:C1566("/RESOURCES/4DWP_AI/aiPref.json")
If ($file.exists)
	$ai_pref:=JSON Parse:C1218($file.getText())
	$apiKey:=$ai_pref.apiKey
	
	WP SetAIKey($apiKey)
	
Else 
	ALERT:C41("The Resources/AI/aiPref.json file is missing!")
	//$ok:=False
End if 
