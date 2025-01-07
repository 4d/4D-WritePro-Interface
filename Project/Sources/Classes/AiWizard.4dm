property personas; _originIcons : Collection
property _originIcon : Picture

Class constructor($formName : Text)
	
	This:C1470._originIcons:=This:C1470.getIcons()
	This:C1470.personas:=This:C1470.getPersonas()
	
Function getPersonas()->$personas : Collection
	
	
	var $folder : 4D:C1709.Folder
	var $file : 4D:C1709.File
	var $lang : Text
	var $localizedPersonaFolders; $defaultPersonaFolders; $dataPersonas; $files : Collection
	var $persona : Object
	var $i : Integer
	var $validated : Boolean
	
	$lang:=Get database localization:C1009(Current localization:K5:22; *)
	$personas:=[]
	
	$localizedPersonaFolders:=[]
	$defaultPersonaFolders:=[]
	
	$localizedPersonaFolders.push(Folder:C1567("/RESOURCES/4DWP_AI/Personas/"+$lang))  // default
	$localizedPersonaFolders.push(Folder:C1567("/RESOURCES/4DWP_AI/Personas/"+$lang; *))  // host resources
	$localizedPersonaFolders.push(Folder:C1567(Folder:C1567(fk user preferences folder:K87:10).path+"4DWP_AI/Personas/"+$lang; fk posix path:K87:1))
	
	$defaultPersonaFolders.push(Folder:C1567("/RESOURCES/4DWP_AI/Personas/en/"))
	$defaultPersonaFolders.push(Folder:C1567("/RESOURCES/4DWP_AI/Personas/en/"; *))
	$defaultPersonaFolders.push(Folder:C1567(Folder:C1567(fk user preferences folder:K87:10).path+"4DWP_AI/Personas/en"; fk posix path:K87:1))
	
	// local personas
	For ($i; 0; $localizedPersonaFolders.length-1)
		$folder:=$localizedPersonaFolders[$i]
		If ($folder.exists=False:C215)
			$folder:=$defaultPersonaFolders[$i]
		End if 
		If ($folder.exists=True:C214)
			
			$files:=$folder.files(fk ignore invisible:K87:22)
			For each ($file; $files)
				//$validated:=This.JSONvalidate("persona"; $file.getText())
				$validated:=True:C214
				If ($validated)
					$persona:=JSON Parse:C1218($file.getText())
					$persona._fileName:=$file.fullName
					$persona._origin:=Choose:C955($i; "Default"; "Resources"; "Single User")
					$persona._originIcon:=This:C1470._originIcons[$i]
					$personas.push($persona)
				End if 
			End for each 
			
		End if 
	End for 
	
	// data (server) personas
	$dataPersonas:=AI_GetPersonas($lang)  // executed on server
	For each ($persona; $dataPersonas)
		$persona._origin:="All Users"
		$persona._originIcon:=This:C1470._originIcons[3]
	End for each 
	$personas.combine($dataPersonas)
	
	
Function getIcons()->$icons : Collection
	
	var $fileNames : Collection
	var $fileName; $filePath : Text
	var $picture : Picture
	
	$icons:=[]
	$fileNames:=["locker.png"; "database.png"; "single.png"; "multi.png"]
	For each ($fileName; $fileNames)
		$filePath:=File:C1566("/RESOURCES/Images/AI/"+$FileName).platformPath
		READ PICTURE FILE:C678($filePath; $picture)
		$icons.push($picture)
	End for each 
	
Function getPersona($id : Integer)->$persona : Object
	
	If ($id<=This:C1470.personas.length)
		$persona:=This:C1470.personas[$id]
	End if 
	
	
	
Function save($persona : Object)
	
	var $folder : 4D:C1709.Folder
	var $file : 4D:C1709.File
	var $lang; $json : Text
	
	$lang:=Get database localization:C1009(Current localization:K5:22; *)
	
	Case of 
		: ($persona._origin="default")  // must be saved in the 4DWP resources folder
			
			$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/"+$lang)
			If ($folder.exists=False:C215)
				$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/en/")
			End if 
			
		: ($persona._origin="resources")  // must be saved in the host database resources
			
			$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/"+$lang; *)
			If ($folder.exists=False:C215)
				$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/en/"; *)
			End if 
			
			
		: ($persona._origin="user")  // must be saved in the user's folder
			
			$folder:=Folder:C1567(Folder:C1567(fk user preferences folder:K87:10).path+"4DWP_AI/Personas/"+$lang; fk posix path:K87:1)
			If ($folder.exists=False:C215)
				$folder:=Folder:C1567(Folder:C1567(fk user preferences folder:K87:10).path+"4DWP_AI/Personas/en"; fk posix path:K87:1)
			End if 
			
		: ($persona._origin="data")  // must be saved in the data folder
			
	End case 
	
	
	If ($folder#Null:C1517)
		
		$file:=File:C1566($folder.path+$persona.name+".json"; fk posix path:K87:1)
		OB REMOVE:C1226($persona; "_origin")
		OB REMOVE:C1226($persona; "_originIcon")
		
		$json:=JSON Stringify:C1217($persona; *)
		$file.setText($json)
		
	Else   // data folder case
		
		AI_SavePersona($persona; $lang)
		
	End if 
	
	
	
Function delete($persona : Object)
	
	var $folder : 4D:C1709.Folder
	var $file : 4D:C1709.File
	var $lang; $json : Text
	
	$lang:=Get database localization:C1009(Current localization:K5:22; *)
	
	Case of 
		: ($persona._origin="default")  // must be saved in the 4DWP resources folder
			
			$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/"+$lang)
			If ($folder.exists=False:C215)
				$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/en/")
			End if 
			
		: ($persona._origin="resources")  // must be saved in the host database resources
			
			$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/"+$lang; *)
			If ($folder.exists=False:C215)
				$folder:=Folder:C1567("/RESOURCES/4DWP_AI/Personas/en/"; *)
			End if 
			
			
		: ($persona._origin="user")  // must be saved in the user's folder
			
			$folder:=Folder:C1567(Folder:C1567(fk user preferences folder:K87:10).path+"4DWP_AI/Personas/"+$lang; fk posix path:K87:1)
			If ($folder.exists=False:C215)
				$folder:=Folder:C1567(Folder:C1567(fk user preferences folder:K87:10).path+"4DWP_AI/Personas/en"; fk posix path:K87:1)
			End if 
			
		: ($persona._origin="data")  // must be saved in the data folder
			
	End case 
	
	
	If ($folder#Null:C1517)
		
		$file:=File:C1566($folder.path+$persona.name+".json"; fk posix path:K87:1)
		
		If ($file.exists)
			$file.delete()
		End if 
		
	Else   // data folder case
		
		AI_SavePersona($persona; $lang)
		
	End if 
	
	
	
	