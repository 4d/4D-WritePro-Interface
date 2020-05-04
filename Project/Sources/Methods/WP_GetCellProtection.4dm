//%attributes = {}
C_OBJECT:C1216($1;$textRange)
C_LONGINT:C283($0;$protection)

C_OBJECT:C1216($cells)

$textRange:=$1

$cells:=WP Table get cells:C1477($textRange)
If (Not:C34($cells=Null:C1517))
	
	WP GET ATTRIBUTES:C1345($cells;wk protected:K81:306;$protection)
	
	If ($protection=wk mixed:K81:89)
		$protection:=2
	End if 
	
Else 
	$protection:=0
End if 

$0:=$protection
