//%attributes = {"invisible":true}

#DECLARE($wpSelection : Object; $apikey : Text)

var $windowID : Integer
var $file : 4D:C1709.File
var $ai_pref : Object
var $ok : Boolean
var $x1; $y1; $x2; $y2 : Integer

If ($apikey#"")
	
	If (Undefined:C82(formData))
		formData:={AIwindow: 0}
	End if 
	
	If (formData.aiWindow=0)
		formData.aiWindow:=Open form window:C675("D_AI_Prompt"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
		DIALOG:C40("D_AI_Prompt"; {apiKey: $apiKey; windowID: formData.aiWindow; wpSelection: $wpSelection}; *)
		
	Else 
		
		GET WINDOW RECT:C443($x1; $y1; $x2; $y2; formData.aiWindow)
		SET WINDOW RECT:C444($x1; $y1; $x2; $y2; formData.aiWindow)
		
	End if 
	
	
Else 
	
	ALERT:C41("No API Key")
	
End if 