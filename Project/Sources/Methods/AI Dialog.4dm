//%attributes = {"shared":true}
#DECLARE($apikey)

var $windowID : Integer

If (Count parameters:C259=0)
	// alert (An API key is needed)
	$apiKey:="XXXXXXX"
	
	//Else 
	
	$windowID:=Open form window:C675("D_Chat"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("D_Chat"; {apiKey: $apiKey; windowID: $windowID})
	
End if 