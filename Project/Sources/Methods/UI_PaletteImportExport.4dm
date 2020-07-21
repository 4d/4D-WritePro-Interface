//%attributes = {"invisible":true}

OBJECT SET ENABLED:C1123(*;"@";True:C214)
OBJECT SET ENTERABLE:C238(*;"@";True:C214)

C_OBJECT:C1216($document)
C_BOOLEAN:C305($docProtected)

$document:=Form:C1466.selection.owner
WP GET ATTRIBUTES:C1345($document;wk protection enabled:K81:307;$docProtected)

If ($docProtected)
	
	OBJECT SET ENABLED:C1123(*;"btnImport@";False:C215)
	OBJECT SET ENABLED:C1123(*;"btnClear@";False:C215)
	
End if 
