CONFIRM:C162(".Are you sure?.")
If (ok=1)
	Form:C1466.ai.delete(Form:C1466.persona)
	
	Form:C1466.ai:=cs:C1710.AiWizard.new()
	LISTBOX SELECT ROW:C912(*; "LB_Personas"; 1; lk replace selection:K53:1)
	
	Form:C1466.personasDD:={values: Form:C1466.ai.personas.extract("name"); index: 0}
	SET TIMER:C645(-1)
	
End if 
