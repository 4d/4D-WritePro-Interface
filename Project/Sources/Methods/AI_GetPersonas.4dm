//%attributes = {"executedOnServer":true}
#DECLARE($lang : Text)->$personas : Collection

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File
var $persona : Object
var $files : Collection
var $validated : Boolean

$personas:=[]

$folder:=Folder:C1567("/DATA/Personas/"+$lang; *)  // host data
If ($folder.exists=False:C215)
	$folder:=Folder:C1567("/DATA/Personas/en/"; *)  // host data
End if 

If ($folder.exists)
	
	$files:=$folder.files(fk ignore invisible:K87:22)
	For each ($file; $files)
		//$validated:=This.JSONvalidate("persona"; $file.getText())
		$validated:=True:C214
		If ($validated)
			$persona:=JSON Parse:C1218($file.getText())
			$persona._fileName:=$file.fullName
			
			$personas.push($persona)
		End if 
	End for each 
End if 

