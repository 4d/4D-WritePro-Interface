
If (Form:C1466.local.pdfa=0)
	OB REMOVE:C1226(Form:C1466; "pdfaVersion")
	
	
	OBJECT SET ENABLED:C1123(*; "rbPDFA2"; False:C215)
	OBJECT SET ENABLED:C1123(*; "rbPDFA3"; False:C215)
	
Else 
	
	If (Form:C1466.local.pdfa2=1)
		Form:C1466.pdfaVersion:="PDF/A-2"
	Else 
		Form:C1466.pdfaVersion:="PDF/A-3"
	End if 
	
	OBJECT SET ENABLED:C1123(*; "rbPDFA2"; True:C214)
	OBJECT SET ENABLED:C1123(*; "rbPDFA3"; True:C214)
End if 
