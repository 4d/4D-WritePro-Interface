



If (Form:C1466.persona#Null:C1517)
	
	Form:C1466.editPersona:=OB Copy:C1225(Form:C1466.persona)
	
	Form:C1466.saveDestination.index:=Form:C1466.persona._origin
	// 0 : "Default" = resources of 4DWP interface
	// 1 : "Resources" = resources of HOST database
	// 2 : User preferences folder
	// 3 : Data folder "All Users"
	SET TIMER:C645(-1)
	
	
Else 
	
	Form:C1466.editPersona:=New object:C1471
	Form:C1466.editPersona.name:=""
	Form:C1466.editPersona.prompt:=""
	Form:C1466.editPersona.temperature:=1
	
	Form:C1466.saveDestination.index:=3  // all users
	
End if 