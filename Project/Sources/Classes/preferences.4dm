
// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	This:C1470.target:=Null:C1517
	This:C1470.content:=Null:C1517
	
	This:C1470._user:=Folder:C1567(fk user preferences folder:K87:10).folder(Folder:C1567(Database folder:K5:14; *).name)
	This:C1470._database:=Folder:C1567(fk database folder:K87:14; *).folder("Preferences")
	This:C1470._session:=Folder:C1567(fk desktop folder:K87:19).parent.folder("Library/Preferences/")
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function user($fileName) : cs:C1710.preferences
	
	$fileName:=$fileName || "preference.pref"
	
	This:C1470.target:=This:C1470._user.file($fileName)
	This:C1470.load()
	
	return (This:C1470)
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function database($fileName) : cs:C1710.preferences
	
	$fileName:=$fileName || "preference.pref"
	
	This:C1470.target:=This:C1470._database.file($fileName)
	This:C1470.load()
	
	return (This:C1470)
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function session($fileName) : cs:C1710.preferences
	
	$fileName:=$fileName || "preference.pref"
	
	This:C1470.target:=This:C1470._session.file($fileName)
	This:C1470.load()
	
	return (This:C1470)
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function sefDefault($defaultValues : Object)
	
	var $attribute : Text
	
	For each ($attribute; $defaultValues)
		If (Undefined:C82(This:C1470.content[$attribute]))
			This:C1470.content[$attribute]:=$defaultValues[$attribute]
		End if 
	End for each 
	
	// Save immediately
	This:C1470.save()
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function get($key : Text) : Variant
	
	return (This:C1470.content[$key])
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function set($key : Text; $value)
	
	This:C1470.content[$key]:=$value
	
	// Save immediately
	This:C1470.save()
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function remove($key : Text)
	
	OB REMOVE:C1226(This:C1470.content; $key)
	
	// Save immediately
	This:C1470.save()
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function load()
	
	If (Asserted:C1132(This:C1470.target#Null:C1517; "target is null"))
		
		If (This:C1470.target.exists)
			
			This:C1470.content:=JSON Parse:C1218(This:C1470.target.getText())
			
		Else 
			
			// Create
			This:C1470.content:=New object:C1471
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function save()
	
	If (Asserted:C1132(This:C1470.target#Null:C1517; "content is null"))
		
		This:C1470.target.setText(JSON Stringify:C1217(This:C1470.content; *))
		
	End if 