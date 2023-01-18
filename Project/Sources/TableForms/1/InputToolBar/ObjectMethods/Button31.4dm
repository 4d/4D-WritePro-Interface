
var $range; $table : Object
var $tables; $rows : Collection
var $headerRowCount : Integer


$range:=WP Selection range:C1340([SAMPLE:1]WP:2)
If ($range.type#2)  // anchored picture
	
	$tables:=WP Get elements:C1550($range; wk type table:K81:222)
	Case of 
		: ($tables.length=0)
			ALERT:C41("select a table first")
		: ($tables.length>1)
			ALERT:C41("select a single table first")
			
		: ($tables.length=1)  // == else
			
			rows:=WP Table get rows:C1475($range)
			If (rows.rowCount>1)
				ALERT:C41("select a single row first")
			Else 
				$table:=$tables[0]
				WP GET ATTRIBUTES:C1345($table; wk header row count:K81:364; $headerRowCount)
				If (rows.firstRow<=$headerRowCount)
					ALERT:C41("select a row below the header")
				Else 
					// ok ! 
					
				End if 
				
			End if 
			
			
	End case 
	
Else 
	ALERT:C41("This is a picture, not")
	
End if 