var $wp : Object
var $table : Object
var $columns : Object
var $i : Integer



$wp:=cs:C1710.WPdocument.new()

If (False:C215)
	$table:=$wp.insertTable(wk append:K81:179; wk include in range:K81:180; 0; 0)
	$table.appendRow(7; "ABC"; Current time:C178; Current date:C33; True:C214)
	
	$columns:=$table.getColumns(1; 10)
	$columns.setAttributes({width: "2.5cm"; textAlign: 2})
	
Else 
	
	$table:=$wp.insertTable(wk append:K81:179; wk include in range:K81:180; 0; 0)
	$table.appendRow(7; "ABC"; Current time:C178; Current date:C33; True:C214)
	
	$table.getColumns(1; 10).setAttributes({width: "2.5cm"; textAlign: 2})
	
End if 

Form:C1466.wp:=$wp.document
