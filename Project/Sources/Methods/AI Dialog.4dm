//%attributes = {"shared":true}


#DECLARE($apikey)

var $windowID : Integer
var $file : 4D:C1709.File
var $ai_pref : Object

If (Count parameters:C259=0)
	
	$file:=File:C1566("/RESOURCES/4DWP_AI/aiPref.json")
	If ($file.exists)
		
		$ai_pref:=JSON Parse:C1218($file.getText())
		$apiKey:=$ai_pref.apiKey
		
		//Else 
		
		$windowID:=Open form window:C675("D_Chat"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
		DIALOG:C40("D_Chat"; {apiKey: $apiKey; windowID: $windowID})
		
	Else 
		ALERT:C41("The Resources/AI/aiPref.json file is missing!")
	End if 
End if 