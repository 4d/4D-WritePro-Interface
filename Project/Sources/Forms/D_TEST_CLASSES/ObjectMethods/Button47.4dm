var $wp : cs:C1710.WPdocument
var $i : Integer

$wp:=cs:C1710.WPdocument.new()

For ($i; 1; 10)
	$wp.setText(String:C10($i); wk append:K81:179)
	If ($i#10)
		$wp.insertBreak(wk page break:K81:188; wk append:K81:179)
	End if 
End for 

Form:C1466.wp:=$wp.document

