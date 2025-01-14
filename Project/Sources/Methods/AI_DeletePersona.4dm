//%attributes = {"executedOnServer":true}
#DECLARE($persona : Object; $lang : Text)

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File
var $json : Text

$folder:=Folder:C1567("/DATA/Personas/"+$lang; *)  // host data
If ($folder.exists=False:C215)
	$folder:=Folder:C1567("/DATA/Personas/en/"; *)  // host data
End if 

$file:=File:C1566($folder.platformPath+$persona._fileName; fk platform path:K87:2)
If ($file.exists)
	$file.delete()
End if 

