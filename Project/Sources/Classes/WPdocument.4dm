Class constructor($document : Object)  // 4D_WriteDocument)
	
	If (Count parameters:C259=0)
		This:C1470.document:=WP New:C1317
	Else 
		This:C1470.document:=$document
	End if 
	
	//mark:-GET TEXT -- SET TEXT
	
Function getText($expressions : Integer)->$text : Text
	If (Count parameters:C259=0)
		$expressions:=wk expressions as value:K81:255
	End if 
	$text:=WP Get text:C1575(This:C1470.document; $expressions)
	
Function setText($newText : Text; $textPosition : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP SET TEXT:C1574(This:C1470.document; $newText; $textPosition; $rangeUpdate)
	
	
	//mark:-TEXT PARAGRAPH PICTURE TABLE RANGE
	
Function textRange($start : Integer; $end : Integer)->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Text range:C1341(This:C1470.document; $start; $end))
	
Function paragraphRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Paragraph range:C1346(This:C1470.document))
	
Function pictureRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Picture range:C1347(This:C1470.document))
	
Function tableRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Table range:C1553(This:C1470.document))
	
	//mark:-SECTION(S)
	
Function getSection($index)->$section : cs:C1710.WPsection
	$section:=cs:C1710.WPsection.new(WP Get section:C1581(This:C1470.document; $index))
	
Function getSections()->$sections : Collection
	
	var $i; $n : Integer
	$sections:=WP Get sections:C1580(This:C1470.document)
	$n:=$sections.length-1
	For ($i; 0; $n)
		$sections[$i]:=cs:C1710.WPsection.new($sections[$i])
	End for 
	
	
	//mark:-PAGE COUNT  (CALCULATED ATTRIBUTE)
	
Function get pageCount()->$count : Integer
	$count:=WP Get page count:C1412(This:C1470.document)
	
	
Function selectionRange($name : Text)->$range : cs:C1710.WPrange
	If (Count parameters:C259=1)
		$range:=cs:C1710.WPrange.new(WP Selection range:C1340(*; $name))
	End if 
	
	
	//mark:-GET FRAME -- GET FRAME
	
Function getFrame()->$result : Object
	var $frameType : Integer
	var $textBoxID : Text
	
	$frameType:=WP Get frame:C1519(This:C1470.document; textBoxID)
	$result:={frameType: $frameType}
	If (frameType=wk text box:K81:373)
		$result.textBoxID:=$textBoxID
	End if 
	
Function setFrame($frameSelector : Integer; $textBoxID : Text)
	Case of 
		: (Count parameters:C259>=2)
			WP SET FRAME:C1518(This:C1470.document; $frameSelector; $textBoxID)
		: (Count parameters:C259>=1)
			WP SET FRAME:C1518(This:C1470.document; $frameSelector)
	End case 
	
	//mark:-GET LINKS -- SET LINK
	
Function getLinks()->$links : Collection
	$links:=WP Get links:C1643(This:C1470.document)
	
Function setLink($linkObject)
	WP SET LINK:C1642(This:C1470.document; $linkObject)
	
	
	//mark:-NEW TEXT BOX 
	
Function newTextBox($pageNumber : Integer)->$textBox : cs:C1710.WPelement  //∆∆∆
	$textBox:=cs:C1710.WPelement.new(WP New text box:C1797(This:C1470.document; $pageNumber))
	
	//mark:-FORMULAS
	
Function insertFormula($formula : Object; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT FORMULA:C1703(This:C1470.document; $formula; $mode; $rangeUpdate)
	
Function computeFormulas()
	WP COMPUTE FORMULAS:C1707(This:C1470.document)
	
Function freezeFormulas($recompute : Integer)
	If (Count parameters:C259=0)
		$recompute:=wk recompute expressions:K81:311
	End if 
	WP FREEZE FORMULAS:C1708(This:C1470.document; $recompute)
	
Function getFormulas()->$formulas : Collection
	var $i; $n : Integer
	$formulas:=WP Get formulas:C1702(This:C1470.document)
	// REPLACE ALL 4D_WriteRange by cs.WPrange
	$n:=$formulas.length-1
	For ($i; 0; $n)
		$formulas[$i].range:=cs:C1710.WPrange.new($formulas[$i].range)
	End for 
	
	
	//mark:-BREAKS
	
Function getBreaks($breakType : Integer)->$breaks : Collection  //of integers
	var $i; $n : Integer
	Case of 
		: (Count parameters:C259=0)
			$breaks:=WP Get breaks:C1768(This:C1470.document)
		: (Count parameters:C259>=1)
			$breaks:=WP Get breaks:C1768(This:C1470.document; $breakType)
	End case 
	// REPLACE ALL 4D_WriteRange by cs.WPrange
	$n:=$breaks.length-1
	For ($i; 0; $n)
		$breaks[$i]:=cs:C1710.WPrange.new($breaks[$i])
	End for 
	
Function insertBreak($breakType : Integer; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT BREAK:C1413(This:C1470.document; $breakType; $mode; $rangeUpdate)
	
	//mark:-ATTRIBUTES
	
Function resetAttributes($attributeNames : Collection)  // collection of attribute names (strings)
	
	var $attributeName : Text
	For each ($attributeName; $attributeNames)
		WP RESET ATTRIBUTES:C1344(This:C1470.document; $attributeName)
	End for each 
	
	
Function setAttributes($attributes : Object)  //
	
	var $attributeName : Text
	For each ($attributeName; $attributes)
		WP SET ATTRIBUTES:C1342(This:C1470.document; $attributeName; $attributes[$attributeName])
	End for each 
	
Function getAttributes($attributeNames : Collection)->$attributes : Object  // collection of attribute names (strings)
	
	var $attributeName : Text
	var $attributeValue : Variant
	
	$attributes:=New object:C1471
	
	For each ($attributeName; $attributeNames)
		WP GET ATTRIBUTES:C1345(This:C1470.document; $attributeName; $attributeValue)
		$attributes[$attributeName]:=$attributeValue
	End for each 
	
	// GET BODY
	
Function getBody()->$body : cs:C1710.WPelement  // ∆∆∆
	$body:=WP Get body:C1516(This:C1470.document)
	
	
	//mark:-HEADERS AND FOOTERS
	
Function getHeader($sectionIndex : Integer; $subSectionType : Integer)->$header : cs:C1710.WPelement
	var $docHeader : Object  //4D_WriteElement
	Case of 
		: (Count parameters:C259=1)
			$docHeader:=WP Get header:C1503(This:C1470.document; $sectionIndex)
		: (Count parameters:C259=2)
			$docHeader:=WP Get header:C1503(This:C1470.document; $sectionIndex; $subSectionType)
	End case 
	If ($docHeader#Null:C1517)
		$header:=cs:C1710.WPelement.new($docHeader)
	End if 
	
Function getFooter($sectionIndex : Integer; $subSectionType : Integer)->$footer : cs:C1710.WPelement
	var $docFooter : Object  //4D_WriteElement
	Case of 
		: (Count parameters:C259=1)
			$docFooter:=WP Get footer:C1504(This:C1470.document; $sectionIndex)
		: (Count parameters:C259=2)
			$docFooter:=WP Get footer:C1504(This:C1470.document; $sectionIndex; $subSectionType)
	End case 
	If ($docFooter#Null:C1517)
		$footer:=cs:C1710.WPelement.new($docFooter)
	End if 
	
	//mark:- BOOKMARKS
	
Function getBookmarks($withRanges : Boolean)->$bookmarks : Collection  // of texts or objects
	
	var $i : Integer
	var $range : cs:C1710.WPrange
	
	If (Count parameters:C259=0)
		$withRanges:=False:C215
	End if 
	
	ARRAY TEXT:C222($bookmarkNames; 0)
	WP GET BOOKMARKS:C1417(This:C1470.document; $bookmarkNames)
	$bookmarks:=New collection:C1472
	If ($withRanges)
		For ($i; 1; Size of array:C274($bookmarkNames))
			$range:=cs:C1710.WPrange.new(WP Bookmark range:C1416(This:C1470.document; $bookmarkNames{$i}))  // ∆∆∆ transform 4D_WriteRange into cs.WRrange
			$bookmarks.push({name: $bookmarkNames{$i}; range: $range})
		End for 
	Else 
		ARRAY TO COLLECTION:C1563($bookmarks; $bookmarkNames)
	End if 
	
Function newBookmark($range : cs:C1710.WPrange; $name : Text)
	
	WP NEW BOOKMARK:C1415($range.range; $name)
	
	
Function deleteBookmarks($bookmarks : Variant)
	
	var $bookmarkName : Text
	Case of 
		: (Value type:C1509($bookmarks)=Is collection:K8:32)
			For each ($bookmarkName; $bookmarks)
				WP DELETE BOOKMARK:C1419(This:C1470.document; $bookmarkName)
			End for each 
			
		: (Value type:C1509($bookmarks)=Is text:K8:3)
			WP DELETE BOOKMARK:C1419(This:C1470.document; $bookmarks)
	End case 
	
Function bookmarkRange($name)->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Bookmark range:C1416(This:C1470.document; $name))
	
	
	//mark:-FIND ALL - FIND NEXT - FIND PREVIOUS
	
Function findAll($searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$rangeCollection : Collection  //∆∆∆
	var $range : Object
	var $i; $n : Integer
	Case of 
		: (Count parameters:C259=2)
			$rangeCollection:=WP Find all:C1755(This:C1470.document; $searchValue; $searchCondition)
		: (Count parameters:C259=3)
			$rangeCollection:=WP Find all:C1755(This:C1470.document; $searchValue; $searchCondition; $replaceValue)
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
			$result:=WP Find next:C1764(This:C1470.document; $searchAfter; $searchValue; $searchCondition)
		: (Count parameters:C259=4)
			$result:=WP Find next:C1764(This:C1470.document; $searchAfter; $searchValue; $searchCondition; $replaceValue)
	End case 
	// replace 4D_WriteRange by cs.WPrange
	$range:=cs:C1710.WPrange($result)
	
Function findPrevious($searchAfter : Object; $searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$range : cs:C1710.WPrange
	var $result : Object
	If (OB Instance of:C1731($searchAfter; cs:C1710.WPrange))
		$searchAfter:=$searchAfter.range  //cs.WPrange -> 4D_WriteRange
	End if 
	Case of 
		: (Count parameters:C259=3)
			$result:=WP Find previous:C1765(This:C1470.document; $searchAfter; $searchValue; $searchCondition)
		: (Count parameters:C259=4)
			$result:=WP Find previous:C1765(This:C1470.document; $searchAfter; $searchValue; $searchCondition; $replaceValue)
	End case 
	// replace 4D_WriteRange by cs.WPrange
	$range:=cs:C1710.WPrange($result)
	
	//mark:-GET ELEMENTS
	
Function getElementByID($id : Text)->$element : cs:C1710.WPelement
	$element:=WP Get element by ID:C1549(This:C1470.document; $id)
	
Function getElements($elementType : Integer)->$elements : Collection
	var $i; $n : Integer
	Case of 
		: (Count parameters:C259=0)
			$elements:=WP Get elements:C1550(This:C1470.document)
		: (Count parameters:C259=1)
			$elements:=WP Get elements:C1550(This:C1470.document; $elementType)
	End case 
	//replace 4D_WriteElement by cs.WPelement or cs.WPtable
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
	Case of 
		: (Count parameters:C259=0)
			$information:=WP Get position:C1577(This:C1470.document)
		: (Count parameters:C259=1)
			$information:=WP Get position:C1577(This:C1470.document; $layout)
	End case 
	
	
	//mark:-PRINT
	
Function usePageSetup()
	WP USE PAGE SETUP:C1358(This:C1470.document)
	
Function print($printOptions : Integer)
	Case of 
		: (Count parameters:C259=0)
			WP PRINT:C1343(This:C1470.document)
		: (Count parameters:C259=1)
			WP PRINT:C1343(This:C1470.document; $printOptions)
	End case 
	
	//mark:-PICTURE
	
Function insertPicture($picture : Picture; $insertMode : Integer)->$pictureElement : cs:C1710.WPelement
	var $pictElements : Collection
	var $range : Object
	
	WP INSERT PICTURE:C1437(This:C1470.document; $picture; $insertMode)
	
	
	Case of 
		: ($insertMode=wk prepend:K81:178) | ($insertMode=wk replace:K81:177)
			$range:=WP Text range:C1341(This:C1470.document; 1; 2)
			
		: ($insertMode=wk append:K81:179)
			$range:=WP Text range:C1341(This:C1470.document; wk start text:K81:165; wk end text:K81:164)
			$range:=WP Text range:C1341(This:C1470.document; $range.end-1; $range.end)
			
	End case 
	
	$pictureElement:=cs:C1710.WPelement.new(WP Get elements:C1550($range; wk type image:K81:192)[0])
	
	
Function newAnchoredPicture($picture : Variant)->$pictureElement : cs:C1710.WPelement
	
	Case of 
		: (Count parameters:C259=0)
			$pictureElement:=cs:C1710.WPelement.new(WP Add picture:C1536(This:C1470.document))
		: (Count parameters:C259=1)
			$pictureElement:=cs:C1710.WPelement.new(WP Add picture:C1536(This:C1470.document; $picture))
	End case 
	
	//mark:-IMPORT EXPORT INSERT
	
Function exportDocument($filePath : Text; $format : Integer; $option : Object)
	
	Case of 
		: (Count parameters:C259=1)
			WP EXPORT DOCUMENT:C1337(This:C1470.document; $filePath)
			
		: (Count parameters:C259=2)
			WP EXPORT DOCUMENT:C1337(This:C1470.document; $filePath; $format)
			
		: (Count parameters:C259=3)
			WP EXPORT DOCUMENT:C1337(This:C1470.document; $filePath; $format; $option)
			
	End case 
	
Function exportVariable($format : Integer; $option : Object)->$exported : Variant
	
	// if $format = html or SVG, destination shall be TEXT, otherwise it will be BLOB
	var $destination : Variant
	Case of 
			
		: (Count parameters:C259=1)
			WP EXPORT VARIABLE:C1319(This:C1470.document; $destination; $format)
			
		: (Count parameters:C259=2)
			WP EXPORT DOCUMENT:C1337(This:C1470.document; $destination; $format; $option)
			
	End case 
	$exported:=$destination
	
	
Function importDocument($filePath : Text; $option : Variant)
	
	var $importedDoc : Object
	Case of 
		: (Count parameters:C259=1)
			$importedDoc:=WP Import document:C1318($filePath)
			
		: (Count parameters:C259=2)
			$importedDoc:=WP Import document:C1318($filePath; $option)
			
	End case 
	This:C1470.document:=$importedDoc
	
Function insertDocument($wpDoc : Object; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT DOCUMENT:C1411(This:C1470.document; $wpDoc; $mode; $rangeUpdate)
	
	
	//mark:-STYLE SHEET(S)
	
Function newStyleSheet($styleSheetType : Integer; $styleSheetName : Text)->$styleSheet : cs:C1710.WPstyleSheet
	
	$styleSheet:=cs:C1710.WPstyleSheet.new(WP New style sheet:C1650(This:C1470.document; $styleSheetType; $styleSheetName))
	
Function getStyleSheet($styleSheetName : Text)->$styleSheet : cs:C1710.WPstyleSheet
	
	$styleSheet:=cs:C1710.WPstyleSheet.new(WP Get style sheet:C1656(This:C1470.document; $styleSheetName))
	
Function getStyleSheets($styleSheetType : Integer)->$styleSheets : Collection
	
	var $i; $n : Integer
	
	$styleSheets:=WP Get style sheets:C1655(This:C1470.document; $styleSheetType)
	$n:=$styleSheets.length-1
	For ($i; 0; $n)
		$styleSheets[$i]:=cs:C1710.WPstyleSheet.new($styleSheets[$i])
	End for 
	
Function importStyleSheets($sourceDocument : cs:C1710.WPdocument)
	
	WP IMPORT STYLE SHEETS:C1673(This:C1470.document; $sourceDocument)
	
	
	//mark:-TABLES INSERT
	
Function insertTable($mode : Integer; $rangeUpdate : Integer; $nbCols : Integer; $nbRows : Integer)->$table : cs:C1710.WPtable
	
	Case of 
		: (Count parameters:C259=0)
			$mode:=wk append:K81:179
			$rangeUpdate:=wk include in range:K81:180
		: (Count parameters:C259=1)
			$rangeUpdate:=wk include in range:K81:180
	End case 
	$table:=cs:C1710.WPtable.new(WP Insert table:C1473(This:C1470.document; $mode; $rangeUpdate; $nbCols; $nbRows))
	
	//mark:-TABLES DELETE ROWS & COLUMNS
	
Function tableDeleteColumns()  // all tables will be deleted
	WP TABLE DELETE COLUMNS:C1694(This:C1470.document)
	
Function tableDeleteRows()  // all tables will be deleted
	WP TABLE DELETE ROWS:C1693(This:C1470.document)
	
	//mark:-TABLE GET CELLS, ROWS & COLUMNS
	
Function tableGetCells()->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table get cells:C1477(This:C1470.document))
	
Function tableGetColumns()->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table get columns:C1476(This:C1470.document))
	
Function tableGetRows()->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table get rows:C1475(This:C1470.document))
	
	
	//mark:-TABLE INSERT ROWS & COLUMNS
	
Function tableInsertColumns($columnCount : Integer)->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table insert columns:C1692(This:C1470.document; $columnCount))
	
Function tableInsertRows($rowCount : Integer)->$range : cs:C1710.WPrange
	$range:=cs:C1710.WPrange.new(WP Table insert rows:C1691(This:C1470.document; $rowCount))
	
	
	//mark:-TABLE SPLIT & MERGE
	
Function tableSplitCells()
	WP TABLE SPLIT CELLS:C1816(This:C1470.document)  // all tables will be n x n
	
Function tableMergeCells()  // all tables will be 1x1
	WP TABLE MERGE CELLS:C1815(This:C1470.document)
	
	
	
	