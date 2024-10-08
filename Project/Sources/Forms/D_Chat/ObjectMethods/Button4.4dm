var $aiParameters : Object
var $file : 4D:C1709.File

$file:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"Images/AI/"+Form:C1466.prompt+".png")

If (Not:C34($file.exists))
	
	
	$aiParameters:=New object:C1471
	
	$aiParameters.apiKey:=Form:C1466.apiKey
	$aiParameters.windowID:=Form:C1466.windowID
	
	$aiParameters.function:="images"
	$aiParameters.callbackAction:="icon"  //same : chat or picture
	$aiParameters.prompt:=Form:C1466.prompt
	
	$aiParameters.size:="1024x1024"  // for pictures only
	
	Form:C1466.answer:=""
	OBJECT SET VISIBLE:C603(*; "waitGears"; True:C214)
	AI Call($aiParameters)
	
End if 
