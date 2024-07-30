Class constructor($target : Object; $index : Integer)  // $target is a 4D_WriteSection
	
	This:C1470.section:=$target
	
	
	//mark:-PAGE COUNT  (CALCULATED ATTRIBUTE)
	
Function get pageCount->$count : Integer
	If (Not:C34(Undefined:C82(This:C1470.section)))
		$count:=WP Get page count:C1412(This:C1470.section)
	End if 
	
	//mark:-GET TEXT -- SET TEXT
	
Function getText($expressions : Integer)->$text : Text
	If (Count parameters:C259=0)
		$expressions:=wk expressions as value:K81:255
	End if 
	$text:=WP Get text:C1575(This:C1470.section; $expressions)
	
Function setText($newText : Text; $textPosition : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP SET TEXT:C1574(This:C1470.section; $newText; $textPosition; $rangeUpdate)
	
	
	//mark:-HEADERS AND FOOTERS
	
Function newHeader()->$header : cs:C1710.WPelement
	$header:=cs:C1710.WPelement.new(WP New header:C1586(This:C1470.section))
	
Function getHeader()->$header : cs:C1710.WPelement
	$header:=cs:C1710.WPelement.new(WP Get header:C1503(This:C1470.section))
	
	
Function newFooter()->$footer : cs:C1710.WPelement
	$footer:=cs:C1710.WPelement.new(WP New footer:C1587(This:C1470.section))
	
Function getFooter()->$footer : cs:C1710.WPelement
	$footer:=cs:C1710.WPelement.new(WP Get footer:C1504(This:C1470.section))
	
	
	
	//mark:-SUBSECTION
	
Function getSubsection($subsectionType : Integer)->$subsection : cs:C1710.WPsection
	$subsection:=cs:C1710.WPsection.new(WP Get subsection:C1582(This:C1470.section; $subsectionType))
	
Function newSubsection($subsectionType : Integer)->$subsection : cs:C1710.WPsection
	$subsection:=cs:C1710.WPsection.new(WP New subsection:C1583(This:C1470.section; $subsectionType))
	
	
	//mark:-GET LINKS -- SET LINK
	
Function getLinks()->$links : Collection
	var $link : Object
	$links:=WP Get links:C1643(This:C1470.section)
	For each ($link; $links)
		$link.range:=cs:C1710.WPrange.new($link.range)  // transform 4D_WriteRange to cs.WPrange
	End for each 
	
	
Function setLink($linkObject)
	WP SET LINK:C1642(This:C1470.section; $linkObject)
	
	
	//mark:-FORMULAS
	
Function insertFormula($formula : Object; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT FORMULA:C1703(This:C1470.section; $formula; $mode; $rangeUpdate)
	
Function computeFormulas
	WP COMPUTE FORMULAS:C1707(This:C1470.section)
	
Function freezeFormulas($recompute : Integer)
	If (Count parameters:C259=0)
		$recompute:=wk recompute expressions:K81:311
	End if 
	WP FREEZE FORMULAS:C1708(This:C1470.section; $recompute)
	
Function getFormulas()->$formulas : Collection
	var $i; $n : Integer
	$formulas:=WP Get formulas:C1702(This:C1470.section)
	// REPLACE ALL _Range by cs.WPrange
	$n:=$formulas.length-1
	For ($i; 0; $n)
		$formulas[$i].range:=cs:C1710.WPrange.new($formulas[$i].range)
	End for 
	
	//mark:-BREAKS
	
Function getBreaks($breakType : Integer)->$breaks : Collection
	
	Case of 
		: (Count parameters:C259=0)
			$breaks:=WP Get breaks:C1768(This:C1470.section)
		: (Count parameters:C259>=1)
			$breaks:=WP Get breaks:C1768(This:C1470.section; $breakType)
	End case 
	
Function insertBreak($breakType : Integer; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT BREAK:C1413(This:C1470.section; $mode; $rangeUpdate)
	
	//mark:-ATTRIBUTES
	
Function resetAttributes($attributeNames : Collection)  // collection of attribute names (strings)
	
	var $attributeName : Text
	For each ($attributeName; $attributeNames)
		WP RESET ATTRIBUTES:C1344(This:C1470.section; $attributeName)
	End for each 
	
	
Function setAttributes($attributes : Object)  //
	
	var $attributeName : Text
	For each ($attributeName; $attributes)
		WP SET ATTRIBUTES:C1342(This:C1470.section; $attributeName; $attributes[$attributeName])
	End for each 
	
Function getAttributes($attributeNames : Collection)->$attributes : Object  // collection of attribute names (strings)
	
	var $attributeName : Text
	var $attributeValue : Variant
	
	$attributes:=New object:C1471
	
	For each ($attributeName; $attributeNames)
		WP GET ATTRIBUTES:C1345(This:C1470.section; $attributeName; $attributeValue)
		$attributes[$attributeName]:=$attributeValue
	End for each 
	
	
	//mark:-TEXT PARAGRAPH PICTURE TABLE RANGE
	
Function textRange($start : Integer; $end : Integer)->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Text range:C1341(This:C1470.section; $start; $end))
	
Function paragraphRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Paragraph range:C1346(This:C1470.section))
	
Function pictureRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Picture range:C1347(This:C1470.section))
	
Function tableRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Table range:C1553(This:C1470.section))
	
	
	
	//mark:-FIND ALL - FIND NEXT - FIND PREVIOUS
	
Function findAll($searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$rangeCollection : Collection  //∆∆∆
	var $range : Object
	var $i; $n : Integer
	Case of 
		: (Count parameters:C259=2)
			$rangeCollection:=WP Find all:C1755(This:C1470.section; $searchValue; $searchCondition)
		: (Count parameters:C259=3)
			$rangeCollection:=WP Find all:C1755(This:C1470.section; $searchValue; $searchCondition; $replaceValue)
	End case 
	// REPLACE ALL 4D_WriteRange by cs.WPrange
	$n:=$rangeCollection.length-1
	For ($i; 0; $n)
		$rangeCollection[$i]:=cs:C1710.WPrange.new($rangeCollection[$i])
	End for 
	
Function findNext($searchAfter : Object; $searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$range : cs:C1710.WPrange
	
	var $result : Object
	
	If (OB Instance of:C1731($searchAfter; cs:C1710.WPrange))
		$searchAfter:=$searchAfter.range  //cs.WPrange -> 4D_WriteRange
	End if 
	
	Case of 
		: (Count parameters:C259=3)
			$result:=WP Find next:C1764(This:C1470.section; $searchAfter; $searchValue; $searchCondition)
		: (Count parameters:C259=4)
			$result:=WP Find next:C1764(This:C1470.section; $searchAfter; $searchValue; $searchCondition; $replaceValue)
	End case 
	// replace 4D_WriteRange by cs.WPrange
	$range:=cs:C1710.WPrange($result)
	
Function findPrevious($searchBefore : Object; $searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$range : cs:C1710.WPrange
	var $result : Object
	If (OB Instance of:C1731($searchBefore; cs:C1710.WPrange))
		$searchBefore:=$searchBefore.range  //cs.WPrange -> 4D_WriteRange
	End if 
	Case of 
		: (Count parameters:C259=3)
			$result:=WP Find previous:C1765(This:C1470.section; $searchBefore; $searchValue; $searchCondition)
		: (Count parameters:C259=4)
			$result:=WP Find previous:C1765(This:C1470.section; $searchBefore; $searchValue; $searchCondition; $replaceValue)
	End case 
	// replace 4D_WriteRange by cs.WPrange
	$range:=cs:C1710.WPrange($result)
	
	//mark:-GET ELEMENTS
	
Function getElements($elementType : Integer)->$elements : Collection
	var $i; $n : Integer
	Case of 
		: (Count parameters:C259=0)
			$elements:=WP Get elements:C1550(This:C1470.section)
		: (Count parameters:C259=1)
			$elements:=WP Get elements:C1550(This:C1470.section; $elementType)
	End case 
	// replace 4D_WriteElement by cs.WPelement or cs.WPtable
	$n:=$elements.length-1
	For ($i; 0; $n)
		If ($elementType=wk type table:K81:222)  // table specificaly requested
			$elements[$i]:=cs:C1710.WPtable.new($elements[$i])
		Else 
			$elements[$i]:=cs:C1710.WPelement.new($elements[$i])
		End if 
	End for 
	
	//mark:-GET POSITION
	
Function getPosition($layout : Integer)->$information : Object
	If (Count parameters:C259=0)
		$layout:=wk 4D Write Pro layout:K81:176
	End if 
	$information:=WP Get position:C1577(This:C1470.section; $layout)
	
	
	//mark:-PICTURE
	
Function insertPicture($picture : Picture; $insertMode : Integer)->$pictureElement : cs:C1710.WPelement
	var $pictElements : Collection
	var $range : Object
	
	WP INSERT PICTURE:C1437(This:C1470.section; $picture; $insertMode)
	$range:=WP Text range:C1341(This:C1470.section; wk start text:K81:165; wk end text:K81:164)
	$pictElements:=WP Get elements:C1550($range; wk type image:K81:192)
	
	Case of 
		: ($insertMode=wk prepend:K81:178) | ($insertMode=wk replace:K81:177)
			$pictureElement:=cs:C1710.WPelement.new($pictElements[0])
			
		: ($insertMode=wk append:K81:179)
			$pictureElement:=cs:C1710.WPelement.new($pictElements[$pictElements.length-1])
	End case 
	
	//mark:-DELETE
	
Function delete($subsectionType)
	var $subsection : cs:C1710.WPsection
	
	Case of 
		: (Count parameters:C259=0)
			
			If (Not:C34(Undefined:C82(This:C1470.section.parent)))  // subsection type
				Case of 
					: (This:C1470.section.type=1)  // first page
						$subsectionType:=wk first page:K81:203
					: (This:C1470.section.type=2)  // left page
						$subsectionType:=wk left page:K81:204
					: (This:C1470.section.type=3)  // right page
						$subsectionType:=wk right page:K81:205
				End case 
				WP DELETE SUBSECTION:C1584(This:C1470.section.parent; $subsectionType)
			Else   //section type
				//WP DELETE SECTION(This.section) // in the future
			End if 
			
		: (Count parameters:C259=1)  // to be used with sections only, not subsections
			
			If (Undefined:C82(This:C1470.section.parent))  //section type
				WP DELETE SUBSECTION:C1584(This:C1470.section; $subsectionType)
			End if 
			
	End case 
	
	
	//mark:- INSERT DOCUMENT
	
Function insertDocument($wpDoc : Object; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT DOCUMENT:C1411(This:C1470.section; $wpDoc; $mode; $rangeUpdate)
	
	
	
	//mark:-TABLE INSERT
	
Function insertTable($mode : Integer; $rangeUpdate : Integer; $nbCols : Integer; $nbRows : Integer)->$table : cs:C1710.WPtable
	
	Case of 
		: (Count parameters:C259=0)
			$mode:=wk append:K81:179
			$rangeUpdate:=wk include in range:K81:180
		: (Count parameters:C259=1)
			$rangeUpdate:=wk include in range:K81:180
	End case 
	
	$table:=cs:C1710.WPtable.new(WP Insert table:C1473(This:C1470.section; $mode; $rangeUpdate; $nbCols; $nbRows))
	
	//mark:-TABLES DELETE ROWS & COLUMNS
	
Function tableDeleteColumns()  // all tables will be deleted
	WP TABLE DELETE COLUMNS:C1694(This:C1470.section)
	
Function tableDeleteRows()  // all tables will be deleted
	WP TABLE DELETE ROWS:C1693(This:C1470.section)
	
	//mark:-TABLE GET CELLS, ROWS & COLUMNS
	
Function tableGetCells()->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table get cells:C1477(This:C1470.section))
	
Function tableGetColumns()->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table get columns:C1476(This:C1470.section))
	
Function tableGetRows()->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table get rows:C1475(This:C1470.section))
	
	
	//mark:-TABLE INSERT ROWS & COLUMNS
	
Function tableInsertColumns($columnCount : Integer)->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table insert columns:C1692(This:C1470.section; $columnCount))
	
Function tableInsertRows($rowCount : Integer)->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table insert rows:C1691(This:C1470.section; $rowCount))
	
	
	//mark:-TABLE SPLIT & MERGE
	
Function tableSplitCells()
	WP TABLE SPLIT CELLS:C1816(This:C1470.section)  // all tables will be n x n
	
Function tableMergeCells()  // all tables will be 1x1
	WP TABLE MERGE CELLS:C1815(This:C1470.section)
	
	
	//mark:-INTERFACE
	
Function select($startRange : Integer; $endRange : Integer)
	Case of 
		: (Count parameters:C259=0)
			WP SELECT:C1348(This:C1470.section)
		: (Count parameters:C259=2)
			WP SELECT:C1348(This:C1470.section; $startRange; $endRange)
	End case 
	