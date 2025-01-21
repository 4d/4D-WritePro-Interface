//%attributes = {}

#DECLARE($wpSelection : Object; $apikey : Text)

var $windowID : Integer
var $file : 4D:C1709.File
var $ai_pref : Object
var $ok : Boolean


If (Count parameters:C259<2)
	$apikey:=""
End if 

If ($apikey#"")
	$ok:=True:C214
Else 
	
	$file:=File:C1566("/RESOURCES/4DWP_AI/aiPref.json")
	If ($file.exists)
		$ai_pref:=JSON Parse:C1218($file.getText())
		$apiKey:=$ai_pref.apiKey
		$ok:=True:C214
	Else 
		ALERT:C41("The Resources/AI/aiPref.json file is missing!")
		$ok:=False:C215
	End if 
End if 

If ($ok)
	
	$windowID:=Open form window:C675("D_AI_Prompt"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("D_AI_Prompt"; {apiKey: $apiKey; windowID: $windowID; wpSelection: $wpSelection})
	
Else 
	
	ALERT:C41("No API Key")
	
End if 