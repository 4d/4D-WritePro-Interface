Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		
		GOTO OBJECT:C206(*;"")
		
		SET WINDOW TITLE:C213(Form:C1466.extra.windowTitle)
		
		  //$options.typeExport:="pdf"
		Form:C1466.local:=New object:C1471
		
		If (Form:C1466[wk optimized for:K81:317]=wk screen:K81:319)
			Form:C1466.local.rbScreen:=1
			Form:C1466.local.rbPrint:=0
		Else   //"print"
			Form:C1466.local.rbScreen:=0
			Form:C1466.local.rbPrint:=1
		End if 
		
		If (Form:C1466.extra.extension="pdf")
			FORM GOTO PAGE:C247(2)
		End if 
		
		
	: (FORM Event:C1606.code=On Unload:K2:2)
		
		OB REMOVE:C1226(Form:C1466;"local")
		
End case 