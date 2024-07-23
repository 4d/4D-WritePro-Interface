

Class extends WPelement

Class constructor($table : Object)  //4D_WriteElement)
	
	Super:C1705($table)
	This:C1470.table:=$table
	
	
	
	//mark:-DELETE
	
Function deleteColumns($colNumber : Integer; $columnCount : Integer)
	If (Count parameters:C259<2)
		$columnCount:=1
	End if 
	WP TABLE DELETE COLUMNS:C1694(This:C1470.table; $colNumber; $columnCount)
	
Function deleteRows($rowNumber : Integer; $rowCount : Integer)
	If (Count parameters:C259<2)
		$rowCount:=1
	End if 
	WP TABLE DELETE ROWS:C1693(This:C1470.table; $rowNumber; $rowCount)
	
	//mark:-GET
Function getCells($startCol : Integer; $startRow : Integer; $columnCount : Integer; $rowCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<4)
		$rowCount:=1
		If (Count parameters:C259<3)
			$columnCount:=1
		End if 
	End if 
	$range:=cs:C1710.WPrange.new(WP Table get cells:C1477(This:C1470.table; $startCol; $startRow; $columnCount; $rowCount))
	
Function getColumns($startCol : Integer; $columnCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<2)
		$columnCount:=1
	End if 
	$range:=cs:C1710.WPrange.new(WP Table get columns:C1476(This:C1470.table; $startCol; $columnCount))
	
Function getRows($startRow : Integer; $rowCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<2)
		$rowCount:=1
	End if 
	$range:=cs:C1710.WPrange.new(WP Table get rows:C1475(This:C1470.table; $startRow; $rowCount))
	
	
	//mark:-APPEND ROW - INSERT ROWS & COLUMNS- 
	
Function appendRow( ...  : Variant)->$range : Object
	
	var $parameters : Collection
	var $f : 4D:C1709.Function
	var $formulaString : Text
	var $i; $n : Integer
	var $o : Object
	
	// ce que je veux faire :
	//If (False)
	//$range:=WP Table append row(This.table; $1; $2; $3)  //;  ... )
	//End if 
	
	//    OK UNIQUEMENT SI LE NOMBRE DE PARAMTRES EST EXACT, sinon KO
	//If (False)
	//$parameters:=Copy parameters
	//$parameters.insert(0; This.table)
	
	//$f:=Formula($range:=WP Table append row($1; $2; $3; $4; $5))
	
	//$range:=$f.apply(Null; $parameters)
	//End if 
	
	
	// solution (temporaire ?)
	
	$parameters:=Copy parameters:C1790
	$formulaString:="This.range:=WP Table append row(This.table; "
	
	$o:=New object:C1471()
	$o.table:=This:C1470.table
	
	$n:=$parameters.length-1
	For ($i; 0; $n)
		$o["p"+String:C10($i+1)]:=$parameters[$i]
		$formulaString+="This.p"+String:C10($i+1)
		If ($i=$n)
			$formulaString+=")"
		Else 
			$formulaString+=";"
		End if 
	End for 
	
	
	$f:=Formula from string:C1601($formulaString)
	$range:=$f.call($o)  // $range returns undefined
	$range:=$o.range  // $o.range is not :-)
	
	
Function insertColumns($colNumber : Integer; $columnCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<2)
		$columnCount:=1
	End if 
	$range:=cs:C1710.WPrange.new(WP Table insert columns:C1692(This:C1470.table; $colNumber; $columnCount))
	
Function insertRows($rowNumber : Integer; $rowCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<2)
		$rowCount:=1
	End if 
	$range:=cs:C1710.WPrange.new(WP Table insert rows:C1691(This:C1470.table; $rowNumber; $rowCount))
	
	
	//mark:-SPLIT MERGE
	
Function splitCells($startColumn : Integer; $startRow : Integer; $columnCount : Integer; $rowCount : Integer)
	If (Count parameters:C259=0)
		WP TABLE SPLIT CELLS:C1816(This:C1470.table; 1; 1; MAXLONG:K35:2; MAXLONG:K35:2)  // means split the whole table
	Else 
		
		If (Count parameters:C259<4)
			$rowCount:=1
			If (Count parameters:C259<3)
				$columnCount:=1
			End if 
		End if 
		WP TABLE SPLIT CELLS:C1816(This:C1470.table; $startColumn; $startRow; $columnCount; $rowCount)
	End if 
	
Function mergeCells($startColumn : Integer; $startRow : Integer; $columnCount : Integer; $rowCount : Integer)
	If (Count parameters:C259=0)
		WP TABLE MERGE CELLS:C1815(This:C1470.table; 1; 1; MAXLONG:K35:2; MAXLONG:K35:2)  // means merge the whole table  (1x1)
	Else 
		If (Count parameters:C259<4)
			$rowCount:=1
			If (Count parameters:C259<3)
				$columnCount:=1
			End if 
		End if 
		WP TABLE MERGE CELLS:C1815(This:C1470.table; $startColumn; $startRow; $columnCount; $rowCount)
	End if 
	
	