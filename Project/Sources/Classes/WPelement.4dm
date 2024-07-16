Class constructor($element : 4D:C1709.WriteElement)
	This:C1470.element:=$element
	This:C1470.document:=This:C1470.element.owner
	
	//mark:-GET TEXT -- SET TEXT
	
Function getText($expressions : Integer)->$text : Text
	If (Count parameters:C259=0)
		$expressions:=wk expressions as value:K81:255
	End if 
	$text:=WP Get text:C1575(This:C1470.element; $expressions)
	
Function setText($newText : Text; $textPosition : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP SET TEXT:C1574(This:C1470.element; $newText; $textPosition; $rangeUpdate)
	
	//mark:- DELETE
	
Function delete()
	
	var $section : cs:C1710.WPsection
	Case of 
		: (This:C1470.element.type=300)  // textbox
			WP DELETE TEXT BOX:C1798(This:C1470.element)
			
		: (This:C1470.element.type=3)
			
			Case of 
				: (This:C1470.element.styleSheet="@firstHeader")  // first header
					$section:=This:C1470.getSubsection()
					WP DELETE HEADER:C1588($section.section)
				: (This:C1470.element.styleSheet="@leftHeader")  // left header
					$section:=This:C1470.getSubsection()
					WP DELETE HEADER:C1588($section.section)
				: (This:C1470.element.styleSheet="@rightHeader")  // left header
					$section:=This:C1470.getSubsection()
					WP DELETE HEADER:C1588($section.section)
					
				: (This:C1470.element.styleSheet="@firstFooter")  // first header
					$section:=This:C1470.getSubsection()
					WP DELETE FOOTER:C1589($section.section)
				: (This:C1470.element.styleSheet="@leftFooter")  // left header
					$section:=This:C1470.getSubsection()
					WP DELETE FOOTER:C1589($section.section)
				: (This:C1470.element.styleSheet="@rightFooter")  // left header
					$section:=This:C1470.getSubsection()
					WP DELETE FOOTER:C1589($section.section)
					
				: (This:C1470.element.styleSheet="@header")  // header
					$section:=This:C1470.getSection()
					WP DELETE HEADER:C1588($section.section)
				: (This:C1470.element.styleSheet="@footer")  // header
					$section:=This:C1470.getSection()
					WP DELETE FOOTER:C1589($section.section)
					
			End case 
			
	End case 
	
	//mark:-GET LINKS -- SET LINK
	
Function getLinks()->$links : Collection
	$links:=WP Get links:C1643(This:C1470.element)
	
Function setLink($linkObject)
	WP SET LINK:C1642(This:C1470.element; $linkObject)
	
	
	//mark:-FORMULAS
	
Function insertFormula($formula : Object; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT FORMULA:C1703(This:C1470.element; $formula; $mode; $rangeUpdate)
	
Function computeFormulas
	WP COMPUTE FORMULAS:C1707(This:C1470.element)
	
Function freezeFormulas($recompute : Integer)
	If (Count parameters:C259=0)
		$recompute:=wk recompute expressions:K81:311
	End if 
	WP FREEZE FORMULAS:C1708(This:C1470.element; $recompute)
	
Function getFormulas()->$formulas : Collection
	var $i; $n : Integer
	$formulas:=WP Get formulas:C1702(This:C1470.element)
	// REPLACE ALL 4D.WriteRange by cs.WPrange
	$n:=$formulas.length-1
	For ($i; 0; $n)
		$formulas[$i].range:=cs:C1710.WPrange.new($formulas[$i].range)
	End for 
	
	//mark:-BREAKS
	
Function getBreaks($breakType : Integer)->$breaks : Collection
	
	Case of 
		: (Count parameters:C259=0)
			$breaks:=WP Get breaks:C1768(This:C1470.element)
		: (Count parameters:C259>=1)
			$breaks:=WP Get breaks:C1768(This:C1470.element; $breakType)
	End case 
	
Function insertBreak($breakType : Integer; $mode : Integer; $rangeUpdate : Integer)
	If (Count parameters:C259<3)
		$rangeUpdate:=wk include in range:K81:180
	End if 
	WP INSERT BREAK:C1413(This:C1470.element; $mode; $rangeUpdate)
	
	
	//mark:-HEADERS AND FOOTERS
	
Function getHeader()->$header : cs:C1710.WPelement
	$header:=WP Get header:C1503(This:C1470.element)
	
Function getFooter()->$footer : cs:C1710.WPelement
	$footer:=WP Get footer:C1504(This:C1470.element)
	
	
	//mark:-ATTRIBUTES
	
Function resetAttributes($attributeNames : Collection)  // collection of attribute names (strings)
	
	var $attributeName : Text
	For each ($attributeName; $attributeNames)
		WP RESET ATTRIBUTES:C1344(This:C1470.element; $attributeName)
	End for each 
	
	
Function setAttributes($attributes : Object)  //
	
	var $attributeName : Text
	For each ($attributeName; $attributes)
		WP SET ATTRIBUTES:C1342(This:C1470.element; $attributeName; $attributes[$attributeName])
	End for each 
	
Function getAttributes($attributeNames : Collection)->$attributes : Object  // collection of attribute names (strings)
	
	var $attributeName : Text
	var $attributeValue : Variant
	
	$attributes:=New object:C1471
	
	For each ($attributeName; $attributeNames)
		WP GET ATTRIBUTES:C1345(This:C1470.element; $attributeName; $attributeValue)
		$attributes[$attributeName]:=$attributeValue
	End for each 
	
	
	//mark:-TEXT PARAGRAPH PICTURE TABLE RANGE
	
Function textRange($start : Integer; $end : Integer)->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Text range:C1341(This:C1470.element; $start; $end))
	
Function paragraphRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Paragraph range:C1346(This:C1470.element))
	
Function pictureRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Picture range:C1347(This:C1470.element))
	
Function tableRange()->$range : cs:C1710.WPrange  //∆∆∆
	$range:=cs:C1710.WPrange.new(WP Table range:C1553(This:C1470.element))
	
	//mark:-SECTION(S) and SUBSECTION
	
Function getSection()->$section : cs:C1710.WPsection
	$section:=cs:C1710.WPsection.new(WP Get section:C1581(This:C1470.element))
	
Function getSections()->$sections : Collection
	
	var $i; $n : Integer
	$sections:=WP Get sections:C1580(This:C1470.element)
	$n:=$sections.length-1
	For ($i; 0; $n)
		$sections[$i]:=cs:C1710.WPsection.new($sections[$i])
	End for 
	
Function getSubsection()->$subsection : cs:C1710.WPsection
	$subsection:=cs:C1710.WPsection.new(WP Get subsection:C1582(This:C1470.element))
	
	//mark:-FIND ALL - FIND NEXT - FIND PREVIOUS
	
Function findAll($searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$rangeCollection : Collection  //∆∆∆
	var $range : Object
	var $i; $n : Integer
	Case of 
		: (Count parameters:C259=2)
			$rangeCollection:=WP Find all:C1755(This:C1470.element; $searchValue; $searchCondition)
		: (Count parameters:C259=3)
			$rangeCollection:=WP Find all:C1755(This:C1470.element; $searchValue; $searchCondition; $replaceValue)
	End case 
	// REPLACE ALL 4D.WriteRange by cs.WPrange
	$n:=$rangeCollection.length-1
	For ($i; 0; $n)
		$rangeCollection[$i]:=cs:C1710.WPrange.new($rangeCollection[$i])
	End for 
	
Function findNext($searchAfter : Object; $searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$range : cs:C1710.WPrange
	var $result : Object
	If (OB Instance of:C1731($searchAfter; cs:C1710.WPrange))
		$searchAfter:=$searchAfter.range  //cs.WPrange -> 4D.WriteRange
	End if 
	Case of 
		: (Count parameters:C259=3)
			$result:=WP Find next:C1764(This:C1470.element; $searchAfter; $searchValue; $searchCondition)
		: (Count parameters:C259=4)
			$result:=WP Find next:C1764(This:C1470.element; $searchAfter; $searchValue; $searchCondition; $replaceValue)
	End case 
	// replace 4D.WriteRange by cs.WPrange
	$range:=cs:C1710.WPrange($result)
	
Function findPrevious($searchAfter : Object; $searchValue : Text; $searchCondition : Integer; $replaceValue : Text)->$range : cs:C1710.WPrange
	var $result : Object
	If (OB Instance of:C1731($searchAfter; cs:C1710.WPrange))
		$searchAfter:=$searchAfter.range  //cs.WPrange -> 4D.WriteRange
	End if 
	Case of 
		: (Count parameters:C259=3)
			$result:=WP Find previous:C1765(This:C1470.element; $searchAfter; $searchValue; $searchCondition)
		: (Count parameters:C259=4)
			$result:=WP Find previous:C1765(This:C1470.element; $searchAfter; $searchValue; $searchCondition; $replaceValue)
	End case 
	// replace 4D.WriteRange by cs.WPrange
	$range:=cs:C1710.WPrange($result)
	
	//mark:-GET ELEMENTS
	
Function getElements($elementType : Integer)->$elements : Collection
	Case of 
		: (Count parameters:C259=0)
			$elements:=WP Get elements:C1550(This:C1470.element)
		: (Count parameters:C259=1)
			$elements:=WP Get elements:C1550(This:C1470.element; $elementType)
	End case 
	// replace 4D.WriteElement by cs.WPelement
	var $i; $n : Integer
	$n:=$elements.length-1
	For ($i; 0; $n)
		$elements[$i]:=cs:C1710.WPelement.new($elements[$i])
	End for 
	
	//mark:-GET POSITION
	
Function getPosition($layout : Integer)->$information : Object
	Case of 
		: (Count parameters:C259=0)
			$information:=WP Get position:C1577(This:C1470.element)
		: (Count parameters:C259=1)
			$information:=WP Get position:C1577(This:C1470.element; $layout)
	End case 
	
	
	//mark:-PICTURE
	
Function insertPicture($picture : Picture; $insertMode : Integer)->$pictureElement : cs:C1710.WPelement
	
	var $pictElements : Collection
	var $pictCol : Collection
	var $container : Object
	var $range : Object
	
	$range:=WP Text range:C1341(This:C1470.element; wk start text:K81:165; wk end text:K81:164)
	WP INSERT PICTURE:C1437(This:C1470.element; $picture; $insertMode)
	
	$container:=$range.container#Null:C1517 ? $range.container : This:C1470.document
	
	Case of 
		: ($insertMode=wk prepend:K81:178)
			$range:=WP Text range:C1341($container; $range.start; $range.start+1)
			
		: ($insertMode=wk replace:K81:177)  // the range should NOT change)
			$range:=WP Text range:C1341($container; $range.start; $range.end)
			
		: ($insertMode=wk append:K81:179)
			$range:=WP Text range:C1341($container; $range.end; $range.end+1)
			
	End case 
	
	$pictCol:=WP Get elements:C1550($range; wk type image:K81:192)
	ASSERT:C1129($pictCol.length>0)
	If ($pictCol.length>0)
		$pictureElement:=cs:C1710.WPelement.new(WP Get elements:C1550($range; wk type image:K81:192)[0])
	End if 
	
	//mark:-TABLES
	
Function insertTable($mode : Integer; $rangeUpdate : Integer; $nbCols : Integer; $nbRows : Integer)->$table : cs:C1710.WPtable
	
	Case of 
		: (Count parameters:C259=0)
			$mode:=wk append:K81:179
			$rangeUpdate:=wk include in range:K81:180
		: (Count parameters:C259=1)
			$rangeUpdate:=wk include in range:K81:180
	End case 
	
	$table:=cs:C1710.WPtable.new(WP Insert table:C1473(This:C1470.element; $mode; $rangeUpdate; $nbCols; $nbRows))
	