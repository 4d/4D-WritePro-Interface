CONFIRM:C162(".Are you sure?.")
If (ok=1)
	Form:C1466.personaWizard.delete(Form:C1466.persona)
	
	
	//*** reload list
	
	UI_Personas("init")
	
	
End if 
