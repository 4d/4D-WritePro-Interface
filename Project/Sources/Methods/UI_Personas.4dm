//%attributes = {}
#DECLARE($action : Text)


Case of 
	: ($action="enable")
		
		var $enabled : Boolean
		
		$enabled:=False:C215
		Case of 
			: (Form:C1466.editPersona.name="")  // name must be filled
				
			: (Form:C1466.saveDestination.index=0) && ((Folder:C1567("/RESOURCES/"; *).platformPath)#(Folder:C1567("/RESOURCES/").platformPath))  // host base cannot save in 4DWPresources
				
			Else   // other cases are ok for save and delete
				$enabled:=True:C214
		End case 
		
		OBJECT SET ENABLED:C1123(*; "btnDelete"; $enabled)
		OBJECT SET ENABLED:C1123(*; "btnSave"; $enabled)
		
		
	: ($action="init")
		
		Form:C1466.ai:=cs:C1710.AiWizard.new()
		Form:C1466.personasDD:={values: Form:C1466.ai.personas.extract("name"); index: 0}
		
		LISTBOX SELECT ROW:C912(*; "LB_Personas"; 1; lk replace selection:K53:1)
		Form:C1466.editPersona:=OB Copy:C1225(Form:C1466.ai.personas[0])
		
		SET TIMER:C645(-1)
		
End case 