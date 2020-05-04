//%attributes = {"invisible":true}
C_OBJECT:C1216($1;$paragraphs)
C_LONGINT:C283($0;$protected)

C_BOOLEAN:C305($protectionEnabled)

$paragraphs:=$1

WP GET ATTRIBUTES:C1345($paragraphs;wk protected:K81:306;$protected)
If ($protected=wk mixed:K81:89)
	$protected:=2  // semi-checked  (checked on toolbar, 
End if 

$0:=$protected
