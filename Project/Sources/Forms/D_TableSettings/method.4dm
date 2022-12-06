
var $tableTarget; $tableSource : Object
var $_sources; $_targets; $_types : Collection
var $range : Object
var $element : Object

var $i; $type : Integer

var $_attributes : Collection
var $attribute : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		wpTableDoc:=WP New:C1317()
		
		$tableTarget:=WP Insert table:C1473(wpTableDoc; wk replace:K81:177)
		$tableSource:=Form:C1466.table
		
		For each ($attribute; $tableSource)
			
			Case of 
				: ($attribute="type")
				: ($attribute="owner")
				: ($attribute="rowCount")
				: ($attribute="columnCount")
				Else 
					$tableTarget[$attribute]:=$tableSource[$attribute]
			End case 
		End for each 
		
		$range:=WP Table insert rows:C1691($tableTarget; 1; $tableSource.rowCount)
		$range:=WP Table insert columns:C1692($tableTarget; 1; $tableSource.columnCount)
		
		
		$_types:=New collection:C1472(wk type table row:K81:223; wk type table cell:K81:224)
		For each ($type; $_types)
			
			$_sources:=WP Get elements:C1550($tableSource; $type)
			$_targets:=WP Get elements:C1550($tableTarget; $type)
			
			$i:=0
			For each ($element; $_sources)
				
				$_attributes:=OB Keys:C1719($element)
				For each ($attribute; $_attributes)
					Case of 
						: ($attribute="type")
						: ($attribute="owner")
						: ($attribute="cellCount")
						: ($attribute="tableID")
						: ($attribute="protected")
							
						Else 
							WP SET ATTRIBUTES:C1342($_targets[$i]; $attribute; $_sources[$i][$attribute])
					End case 
					
				End for each 
			End for each 
			
		End for each 
		
		
		
		
		
End case 
