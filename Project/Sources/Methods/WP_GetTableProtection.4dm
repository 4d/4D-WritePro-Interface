//%attributes = {}
C_OBJECT:C1216($1;$textRange)
C_LONGINT:C283($0;$protection)

C_OBJECT:C1216($tableRange)
$textRange:=$1
If (WP Get elements:C1550($textRange;wk type table:K81:222).length>0)
	
	$tableRange:=WP Table range:C1553($textRange)
	WP GET ATTRIBUTES:C1345($tableRange;wk protected:K81:306;$protection)
	
	If ($protection=wk mixed:K81:89)
		$protection:=2
	End if 
	
Else 
	$protection:=0
End if 

$0:=$protection
