//%attributes = {"executedOnServer":true}
#DECLARE($persona : Object; $lang : Text)

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File
var $json : Text

$folder:=Folder:C1567("/DATA/4DWP_AI/Personas/"+$lang)  // host data
If ($folder.exists=False:C215)
	$folder:=Folder:C1567("/DATA/4DWP_AI/Personas/en/")  // host data
End if 

$file:=File:C1566($folder.path+$persona.name+".json"; fk posix path:K87:1)
OB REMOVE:C1226($persona; "_origin")
OB REMOVE:C1226($persona; "_originIcon")
$json:=JSON Stringify:C1217($persona; *)
$file.setText($json)


