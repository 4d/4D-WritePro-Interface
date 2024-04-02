

Case of 
	: (Form event code:C388=On After Edit:K2:43)
		oForm.FR.find:=Get edited text:C655
		oForm.FR.displayReplacements:=False:C215
		SET TIMER:C645(15)  // 1/4 of sec.
End case 



