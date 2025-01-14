//%attributes = {"executedOnServer":true}
#DECLARE($persona : Object; $lang : Text)

var $folder : 4D:C1709.Folder
var $oldFile; $newFile : 4D:C1709.File
var $json : Text

$folder:=Folder:C1567("/DATA/Personas/"+$lang; *)  // host data
If ($folder.exists=False:C215)
	$folder.create()
End if 

$oldFile:=File:C1566($folder.platformPath+$persona._fileName; fk platform path:K87:2)
If ($oldFile.exists)  // always
	$oldFile.delete()
End if 

$newFile:=File:C1566($folder.platformPath+$persona.name+".json"; fk platform path:K87:2)
OB REMOVE:C1226($persona; "_origin")
OB REMOVE:C1226($persona; "_originIcon")
OB REMOVE:C1226($persona; "_fileName")

$json:=JSON Stringify:C1217($persona; *)
$newFile.setText($json)


