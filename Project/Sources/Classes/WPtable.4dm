

Class extends WPelement

Class constructor($table : Object)  //4D_WriteElement)
	
	Super:C1705($table)
	This:C1470.table:=$table
	
	
	//Function appendRow // how to wrap ???
	
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
	WP TABLE DELETE COLUMNS:C1694(This:C1470.table; $rowNumber; $rowCount)
	
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
	
	
	//mark:-INSERT
	
Function insertColumns($colNumber : Integer; $columnCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<2)
		$columnCount:=1
	End if 
	$range:=cs:C1710.WPrange.new(WP Table insert columns:C1692(This:C1470.table; $colNumber; $columnCount))
	
Function insertRows($rowNumber : Integer; $rowCount : Integer)->$range : cs:C1710.WPrange
	If (Count parameters:C259<2)
		$rowCount:=1
	End if 
	$range:=cs:C1710.WPrange.new(WP Table insert columns:C1692(This:C1470.table; $rowNumber; $rowCount))
	
	
	//mark:-SPLIT MERGE
	
Function splitCells($startColumn : Integer; $startRow : Integer; $columnCount : Integer; $rowCount : Integer)
	If (Count parameters:C259<4)
		$rowCount:=1
		If (Count parameters:C259<3)
			$columnCount:=1
		End if 
	End if 
	WP TABLE SPLIT CELLS:C1816(This:C1470.table; $startColumn; $startRow; $columnCount; $rowCount)
	
Function mergeCells($startColumn : Integer; $startRow : Integer; $columnCount : Integer; $rowCount : Integer)
	If (Count parameters:C259<4)
		$rowCount:=1
		If (Count parameters:C259<3)
			$columnCount:=1
		End if 
	End if 
	WP TABLE MERGE CELLS:C1815(This:C1470.table; $startColumn; $startRow; $columnCount; $rowCount)
	
	
	
	