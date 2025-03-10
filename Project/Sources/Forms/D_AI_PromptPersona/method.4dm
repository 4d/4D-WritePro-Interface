Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.personaWizard:=cs:C1710.PersonaWizard.new()
		LISTBOX SELECT ROW:C912(*; "LB_Personas"; 1; lk replace selection:K53:1)
		
		Form:C1466.saveDestination:={values: [".Default"; ".Resources"; ".Single user"; ".All users"]; index: 0}
		
		UI_Personas("init")
		
	: (Form event code:C388=On Timer:K2:25)
		
		
		SET TIMER:C645(0)
		UI_Personas("enable")
		
		
		
End case 