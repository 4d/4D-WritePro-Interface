

Case of 
	: (Form event code:C388=On After Edit:K2:43)
		formData.FR.find:=Get edited text:C655
		formData.FR.displayReplacements:=False:C215
		SET TIMER:C645(15)  // 1/4 of sec.
End case 



