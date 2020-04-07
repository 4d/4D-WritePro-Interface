//%attributes = {"invisible":true}
C_TEXT:C284($selectedRawText)

If (Form:C1466.selection.type=2)
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*;"@";True:C214)
	
	$selectedRawText:=WP Get text:C1575(Form:C1466.selection)
	
	OBJECT SET ENABLED:C1123(*;"btnFind@";oForm.FR.find#"")
	
	  //OBJECT SET ENABLED(*;"btnreplace@";(oForm.FR.replace#"") & (oForm.FR.find=$selectedRawText))
	
	OBJECT SET ENABLED:C1123(*;"btnreplace@";(oForm.FR.find=$selectedRawText))
	OBJECT SET ENABLED:C1123(*;"btnReplaceAll";(oForm.FR.find#""))
	
End if 
