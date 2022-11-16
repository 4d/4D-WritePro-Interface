var $label : Object

var $prefix : Text

var $i : Integer

var $menuDocument : Text
var $menuDocumentMargins : Text
var $menuDocumentPadding : Text
var $menuDocumentBorders : Text
var $menuDocumentBackground : Text

var $menuParagraph : Text
var $menuParagraphMargins : Text
var $menuParagraphPadding : Text
var $menuParagraphBorders : Text
var $menuParagraphBackground : Text

var $menuImage : Text

var $menuSection : Text
var $menuSectionMargins : Text
var $menuSectionPadding : Text
var $menuSectionBorders : Text
var $menuSectionColumns : Text
var $menuSectionBackground : Text

var $menuStyle : Text

var $menuTable : Text
var $menuTableRow : Text
var $menuTableColumn : Text
var $menuTableCell : Text

var $mainMenu : Text
var $result : Text

// prepare localised labels for main menu items (not standard actions, but with detailed submenus)

$label:=New object:C1471()
$label.color:=Get action info:C1442("borderColor").title
$label.style:=Get action info:C1442("borderStyle").title
$label.width:=Get action info:C1442("borderWidth").title

$label.top:=Get action info:C1442("marginTop").title
$label.bottom:=Get action info:C1442("marginBottom").title
$label.left:=Get action info:C1442("marginLeft").title
$label.right:=Get action info:C1442("marginRight").title
$label.topBottom:=Get action info:C1442("marginTopBottom").title
$label.leftRight:=Get action info:C1442("marginLeftRight").title


$label.margins:=Get action info:C1442("margin").title
$label.paddings:=Get action info:C1442("padding").title
$label.borders:=Get action info:C1442("borders").title
$label.background:=Get action info:C1442("background").title

$label.document:=Get action info:C1442("doc").title
$label.paragraph:=Get action info:C1442("paragraph").title
$label.table:=Get action info:C1442("table").title
$label.row:=Get action info:C1442("table/row").title
$label.column:=Get action info:C1442("table/column").title
$label.cell:=Get action info:C1442("table/cell").title

$label.section:=Get action info:C1442("section").title
$label.columns:=Get action info:C1442("section/columns").title
If ($label.columns="")  // bug shall be fixed
	$label.columns:="Columns"
End if 
$label.image:=Get action info:C1442("image").title


//--------------------------------------------- D O C U M E N T ---------------------------------------------------------------------

If (True:C214)
	
	$menuDocumentMargins:=Create menu:C408  // used in $menuDocument (available in draft and embedded mode only)
	$prefix:="doc/"
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"marginTop")
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"marginRight")
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"marginBottom")
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"marginLeft")
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"marginTopBottom")
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"marginLeftRight")
	APPEND MENU ITEM:C411($menuDocumentMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentMargins; -1; Associated standard action:K56:1; $prefix+"margin")
	
	//------------------------------------------------------------------------------------------------------------------
	
	$menuDocumentPadding:=Create menu:C408  // used in $menuDocument
	$prefix:="doc/"
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"paddingTop")
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"paddingRight")
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"paddingBottom")
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"paddingLeft")
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"paddingLeftRight")
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"paddingTopBottom")
	APPEND MENU ITEM:C411($menuDocumentPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentPadding; -1; Associated standard action:K56:1; $prefix+"padding")
	
	
	//------------------------------------------------------------------------------------------------------------------
	
	$menuDocumentBorders:=Create menu:C408  // used in $menuDocument
	$prefix:="doc/"
	
	APPEND MENU ITEM:C411($menuDocumentBorders; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentBorders; -1; Associated standard action:K56:1; $prefix+"borderStyle")
	
	APPEND MENU ITEM:C411($menuDocumentBorders; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentBorders; -1; Associated standard action:K56:1; $prefix+"borderColor")
	
	APPEND MENU ITEM:C411($menuDocumentBorders; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentBorders; -1; Associated standard action:K56:1; $prefix+"borderWidth")
	
	
	//------------------------------------------------------------------------------------------------------------------
	$menuDocumentBackground:=Create menu:C408  // used in $menuDocument
	$prefix:="doc/"
	APPEND MENU ITEM:C411($menuDocumentBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocumentBackground; -1; Associated standard action:K56:1; $prefix+"backgroundColor")
	
	
	
	//-----------------------------------------------  !! $menuDocument !! -------------------------------------------------
	$menuDocument:=Create menu:C408
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "zoom")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "dpi")
	
	APPEND MENU ITEM:C411($menuDocument; "-")
	
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "pageMode")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "pageSize")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "pageOrientation")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "print")
	
	APPEND MENU ITEM:C411($menuDocument; "-")
	
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "htmlWYSIWYGEnabled")  // wk visible HTML WYSIWYG)
	
	
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleHiddenChars")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visiblePageFrames")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleHeaders")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleFooters")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleBackground")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleEmptyImages")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleReferences")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "displayFormulaAsSymbol")
	
	
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "formulaHighlight")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "formulaHighlightColor")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleHorizontalRuler")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "visibleVerticalRuler")
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "userUnit")
	
	APPEND MENU ITEM:C411($menuDocument; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuDocument; -1; Associated standard action:K56:1; "computeExpressions")
	
	
	APPEND MENU ITEM:C411($menuDocument; $label.margins; $menuDocumentMargins)
	APPEND MENU ITEM:C411($menuDocument; $label.paddings; $menuDocumentPadding)
	APPEND MENU ITEM:C411($menuDocument; $label.borders; $menuDocumentBorders)
	APPEND MENU ITEM:C411($menuDocument; $label.background; $menuDocumentBackground)
	
End if 

//-----------------------------------------P A R A G R A P H-------------------------------------------------------------------------

If (True:C214)
	$prefix:="paragraph/"
	
	$menuParagraphMargins:=Create menu:C408
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"marginTop")
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"marginRight")
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"marginBottom")
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"marginLeft")
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"marginTopBottom")
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"marginLeftRight")
	APPEND MENU ITEM:C411($menuParagraphMargins; ak standard action title:K76:83)  // displays "Margins" instead of "All"
	SET MENU ITEM PROPERTY:C973($menuParagraphMargins; -1; Associated standard action:K56:1; $prefix+"margin")
	
	$menuParagraphPadding:=Create menu:C408
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"paddingTop")
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"paddingRight")
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"paddingBottom")
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"paddingLeft")
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"paddingTopBottom")
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"paddingLeftRight")
	APPEND MENU ITEM:C411($menuParagraphPadding; ak standard action title:K76:83)  // displays "Paddings" instead of "All"
	SET MENU ITEM PROPERTY:C973($menuParagraphPadding; -1; Associated standard action:K56:1; $prefix+"padding")
	
	$menuParagraphBorders:=Create menu:C408
	
	ARRAY TEXT:C222($_paragraphBordersSubmenu; 8)
	ARRAY TEXT:C222($_paragraphBordersSubmenuTargets; 8)
	$_paragraphBordersSubmenuTargets{1}:="Top"
	$_paragraphBordersSubmenuTargets{2}:="Right"
	$_paragraphBordersSubmenuTargets{3}:="Bottom"
	$_paragraphBordersSubmenuTargets{4}:="Left"
	$_paragraphBordersSubmenuTargets{5}:="TopBottom"
	$_paragraphBordersSubmenuTargets{6}:="LeftRight"
	$_paragraphBordersSubmenuTargets{7}:=""  // all
	
	For ($i; 1; 7)
		$_paragraphBordersSubmenu{$i}:=Create menu:C408
		
		APPEND MENU ITEM:C411($_paragraphBordersSubmenu{$i}; $label.style)
		SET MENU ITEM PROPERTY:C973($_paragraphBordersSubmenu{$i}; -1; Associated standard action:K56:1; $prefix+"borderStyle"+$_paragraphBordersSubmenuTargets{$i})
		
		APPEND MENU ITEM:C411($_paragraphBordersSubmenu{$i}; $label.color)
		SET MENU ITEM PROPERTY:C973($_paragraphBordersSubmenu{$i}; -1; Associated standard action:K56:1; $prefix+"borderColor"+$_paragraphBordersSubmenuTargets{$i})
		
		APPEND MENU ITEM:C411($_paragraphBordersSubmenu{$i}; $label.width)
		SET MENU ITEM PROPERTY:C973($_paragraphBordersSubmenu{$i}; -1; Associated standard action:K56:1; $prefix+"borderWidth"+$_paragraphBordersSubmenuTargets{$i})
		
	End for 
	
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.top; $_paragraphBordersSubmenu{1})
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.right; $_paragraphBordersSubmenu{2})
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.bottom; $_paragraphBordersSubmenu{3})
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.left; $_paragraphBordersSubmenu{4})
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.topBottom; $_paragraphBordersSubmenu{5})
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.leftRight; $_paragraphBordersSubmenu{6})
	APPEND MENU ITEM:C411($menuParagraphBorders; $label.borders; $_paragraphBordersSubmenu{7})
	
	//------------------------------------------------------------------------------------------------------------------
	
	$menuParagraphBackground:=Create menu:C408
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundColor")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundImage?value=showDialog")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundImage?value=none")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundDisplayMode")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundPositionH")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundPositionV")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundRepeat")
	
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundClip")
	//origin
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundOrigin")
	//width
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundSizeH")  //  
	//height
	APPEND MENU ITEM:C411($menuParagraphBackground; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraphBackground; -1; Associated standard action:K56:1; $prefix+"backgroundSizeV")  // 
	
	// --- paragraph menu ---
	
	$menuParagraph:=Create menu:C408  // used in $menuDocument
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "textAlign")
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "lineHeight")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "direction")
	
	//APPEND MENU ITEM($menuParagraph; " ??? tab stop offset ???")
	//APPEND MENU ITEM($menuParagraph; " ??? tab stop type ???")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "listStyleType")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "merge")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "split")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; $prefix+"styleSheets")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "widowAndOrphanControlEnabled")
	
	APPEND MENU ITEM:C411($menuParagraph; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuParagraph; -1; Associated standard action:K56:1; "keepWithNext")
	
	APPEND MENU ITEM:C411($menuParagraph; "-")
	
	APPEND MENU ITEM:C411($menuParagraph; $label.margins; $menuParagraphMargins)
	APPEND MENU ITEM:C411($menuParagraph; $label.paddings; $menuParagraphPadding)
	APPEND MENU ITEM:C411($menuParagraph; $label.borders; $menuParagraphBorders)
	APPEND MENU ITEM:C411($menuParagraph; $label.background; $menuParagraphBackground)
	
End if 

//----------------------------------------- I M A G E -------------------------------------------------------------------------

If (True:C214)
	$prefix:="image/"
	
	$menuImage:=Create menu:C408
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"styleSheet")
	
	APPEND MENU ITEM:C411($menuImage; "-")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"margin")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"padding")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"width")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"height")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"borders")  // TWO submenus
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"displayMode")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"anchorLayout")
	
	APPEND MENU ITEM:C411($menuImage; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuImage; -1; Associated standard action:K56:1; $prefix+"background")  // TWO submenus
	
End if 

//----------------------------------------- T A B L E-------------------------------------------------------------------------

If (True:C214)
	
	//------------ T A B L E  R O W ------------
	$menuTableRow:=Create menu:C408
	$prefix:="row/"
	APPEND MENU ITEM:C411($menuTableRow; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableRow; -1; Associated standard action:K56:1; $prefix+"height")
	
	APPEND MENU ITEM:C411($menuTableRow; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableRow; -1; Associated standard action:K56:1; $prefix+"verticalAlign")
	
	APPEND MENU ITEM:C411($menuTableRow; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableRow; -1; Associated standard action:K56:1; $prefix+"background")
	
	APPEND MENU ITEM:C411($menuTableRow; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableRow; -1; Associated standard action:K56:1; $prefix+"borders")  // simplified  version compared to paragraph and section
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"avoidPageBreakInside")
	
	//------------ T A B L E  C O L U M N ------------
	$menuTableColumn:=Create menu:C408
	$prefix:="column/"
	
	APPEND MENU ITEM:C411($menuTableColumn; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableColumn; -1; Associated standard action:K56:1; $prefix+"width")
	
	APPEND MENU ITEM:C411($menuTableColumn; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableColumn; -1; Associated standard action:K56:1; $prefix+"verticalAlign")
	
	APPEND MENU ITEM:C411($menuTableColumn; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableColumn; -1; Associated standard action:K56:1; $prefix+"background")
	
	APPEND MENU ITEM:C411($menuTableColumn; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableColumn; -1; Associated standard action:K56:1; $prefix+"borders")  // simplified  version compared to paragraph and section
	
	
	//------------ T A B L E   C E L L ------------
	$menuTableCell:=Create menu:C408
	$prefix:="cell/"
	
	APPEND MENU ITEM:C411($menuTableCell; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableCell; -1; Associated standard action:K56:1; $prefix+"verticalAlign")
	
	APPEND MENU ITEM:C411($menuTableCell; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableCell; -1; Associated standard action:K56:1; $prefix+"background")
	
	APPEND MENU ITEM:C411($menuTableCell; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTableCell; -1; Associated standard action:K56:1; $prefix+"borders")  // simplified  version compared to paragraph and section
	
	
	//------------    T  A  B  L  E   ------------
	$prefix:="table/"
	$menuTable:=Create menu:C408
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"tableAlign")
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"margins")
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"background")
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"borders")  // simplified  version compared to paragraph and section
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"avoidPageBreakInside")
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"headerRowCount")
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"headerRowCount")
	
	APPEND MENU ITEM:C411($menuTable; $label.row; $menuTableRow)
	APPEND MENU ITEM:C411($menuTable; $label.column; $menuTableColumn)
	APPEND MENU ITEM:C411($menuTable; $label.cell; $menuTableCell)
	
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"insertRowAbove")
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"insertRowBelow")
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"insertColumnToTheLeft")
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"insertColumnToTheRight")
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"deleteRows")
	APPEND MENU ITEM:C411($menuTable; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuTable; -1; Associated standard action:K56:1; $prefix+"deleteColumns")
	
End if 

//-----------------------------------------S E C T I O N-------------------------------------------------------------------------

If (True:C214)
	
	$prefix:="section/"
	
	$menuSectionMargins:=Create menu:C408
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"marginTop")
	
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"marginRight")
	
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"marginBottom")
	
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"marginLeft")
	
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"marginTopBottom")
	
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"marginLeftRight")
	
	APPEND MENU ITEM:C411($menuSectionMargins; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionMargins; -1; Associated standard action:K56:1; $prefix+"margin")
	
	
	
	$menuSectionPadding:=Create menu:C408
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"paddingTop")
	
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"paddingRight")
	
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"paddingBottom")
	
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"paddingLeft")
	
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"paddingTopBottom")
	
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"paddingLeftRight")
	
	APPEND MENU ITEM:C411($menuSectionPadding; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionPadding; -1; Associated standard action:K56:1; $prefix+"padding")
	
	$menuSectionBorders:=Create menu:C408
	ARRAY TEXT:C222($_sectionBordersSubmenu; 8)
	ARRAY TEXT:C222($_sectionBordersSubmenuTargets; 8)
	$_sectionBordersSubmenuTargets{1}:="Top"
	$_sectionBordersSubmenuTargets{2}:="Right"
	$_sectionBordersSubmenuTargets{3}:="Bottom"
	$_sectionBordersSubmenuTargets{4}:="Left"
	$_sectionBordersSubmenuTargets{5}:="TopBottom"
	$_sectionBordersSubmenuTargets{6}:="LeftRight"
	$_sectionBordersSubmenuTargets{7}:=""  // all
	
	For ($i; 1; 7)
		$_sectionBordersSubmenu{$i}:=Create menu:C408
		APPEND MENU ITEM:C411($_sectionBordersSubmenu{$i}; $label.style)
		SET MENU ITEM PROPERTY:C973($_sectionBordersSubmenu{$i}; -1; Associated standard action:K56:1; $prefix+"borderStyle"+$_sectionBordersSubmenuTargets{$i})
		
		APPEND MENU ITEM:C411($_sectionBordersSubmenu{$i}; $label.color)
		SET MENU ITEM PROPERTY:C973($_sectionBordersSubmenu{$i}; -1; Associated standard action:K56:1; $prefix+"borderColor"+$_sectionBordersSubmenuTargets{$i})
		
		APPEND MENU ITEM:C411($_sectionBordersSubmenu{$i}; $label.width)
		SET MENU ITEM PROPERTY:C973($_sectionBordersSubmenu{$i}; -1; Associated standard action:K56:1; $prefix+"borderWidth"+$_sectionBordersSubmenuTargets{$i})
	End for 
	
	APPEND MENU ITEM:C411($menuSectionBorders; $label.top; $_sectionBordersSubmenu{1})
	APPEND MENU ITEM:C411($menuSectionBorders; $label.right; $_sectionBordersSubmenu{2})
	APPEND MENU ITEM:C411($menuSectionBorders; $label.bottom; $_sectionBordersSubmenu{3})
	APPEND MENU ITEM:C411($menuSectionBorders; $label.left; $_sectionBordersSubmenu{4})
	APPEND MENU ITEM:C411($menuSectionBorders; $label.topBottom; $_sectionBordersSubmenu{5})
	APPEND MENU ITEM:C411($menuSectionBorders; $label.leftRight; $_sectionBordersSubmenu{6})
	APPEND MENU ITEM:C411($menuSectionBorders; $label.paddings; $_sectionBordersSubmenu{7})
	
	
	$menuSectionColumns:=Create menu:C408
	APPEND MENU ITEM:C411($menuSectionColumns; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionColumns; -1; Associated standard action:K56:1; $prefix+"columnCount")
	APPEND MENU ITEM:C411($menuSectionColumns; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionColumns; -1; Associated standard action:K56:1; $prefix+"columnSpacing")
	APPEND MENU ITEM:C411($menuSectionColumns; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionColumns; -1; Associated standard action:K56:1; $prefix+"columnRuleStyle")
	APPEND MENU ITEM:C411($menuSectionColumns; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionColumns; -1; Associated standard action:K56:1; $prefix+"columnRuleColor")
	APPEND MENU ITEM:C411($menuSectionColumns; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSectionColumns; -1; Associated standard action:K56:1; $prefix+"columnRuleWidth")
	
	
	$menuSectionBackground:=Create menu:C408
	
	
	$menuSection:=Create menu:C408
	
	
	//APPEND MENU ITEM($sectionMenu; ak standard action title) // does not show "Rename…"
	//APPEND MENU ITEM($menuSection; "Rename…")  // marche pô :-/
	//SET MENU ITEM PROPERTY($sectionMenu; -1; Associated standard action; "section/name/showDialog")  // marche pô :-/
	
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; $prefix+"pageOrientation")
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; $prefix+"differentFirstPage")
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; $prefix+"differentLeftRightPages")
	
	//APPEND MENU ITEM($menuSection; ak standard action title)  // "4D Action title" au lieu de "Columns"
	//SET MENU ITEM PROPERTY($menuSection; -1; Associated standard action; $prefix+"columns")
	APPEND MENU ITEM:C411($menuSection; "•Columns"; $menuSectionColumns)
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; "header")  // BUG affiche Remove header/Margins/Background/Borders AU LIEU DE margins/borders/padding/background
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; "header/remove")
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; "footer")  // BUG affiche Remove footer/(separateur)/Margins/Background/Borders AU LIEU DE margins/borders/padding/background
	
	APPEND MENU ITEM:C411($menuSection; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuSection; -1; Associated standard action:K56:1; "footer/remove")
	
	
	APPEND MENU ITEM:C411($menuSection; $label.margins; $menuSectionMargins)
	APPEND MENU ITEM:C411($menuSection; $label.paddings; $menuSectionPadding)
	APPEND MENU ITEM:C411($menuSection; $label.borders; $menuSectionBorders)
	APPEND MENU ITEM:C411($menuSection; $label.background; $menuSectionBackground)
	
End if 

//----------------------------------------- S T Y L E -------------------------------------------------------------------------

If (True:C214)
	
	$menuStyle:=Create menu:C408
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action:K56:1; "fontBold")
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action:K56:1; "fontItalic")
	
	//APPEND MENU ITEM($menuStyle; ak standard action title)
	//SET MENU ITEM PROPERTY($menuStyle; -1; Associated standard action; "fontUnderline")  // OR more details below if needed
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action:K56:1; wk text underline style:K81:73)
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action:K56:1; wk text underline color:K81:74)
	
	//APPEND MENU ITEM($menuStyle; ak standard action title)
	//SET MENU ITEM PROPERTY($menuStyle; -1; Associated standard action; "fontLinethrough") // OR more details below if needed
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action:K56:1; wk text linethrough style:K81:75)
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action:K56:1; wk text linethrough color:K81:76)
	
	
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "fontSubscript")
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "fontSuperscript")
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textShadowColor")
	
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textShadowOffset")
	
	
	APPEND MENU ITEM:C411($menuStyle; "(—Transform—")
	
	//APPEND MENU ITEM($menuRef; Get localized string("TextTransformNone"))
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textTransform?value=none")
	
	//APPEND MENU ITEM($menuStyle; Get localized string("Uppercase"))
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textTransform?value=uppercase")
	
	//APPEND MENU ITEM($menuStyle; Get localized string("Lowercase"))
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textTransform?value=lowercase")
	
	//APPEND MENU ITEM($menuStyle; Get localized string("Capitalize"))
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textTransform?value=capitalize")
	
	//APPEND MENU ITEM($menuStyle; Get localized string("SmallUppercase"))
	APPEND MENU ITEM:C411($menuStyle; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuStyle; -1; Associated standard action name:K28:8; "textTransform?value=small-uppercase")
	
	
	
End if 


//------------------------------------------M A I N ------------------------------------------------------------------------


$mainMenu:=Create menu:C408

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; ak cut:K76:53)

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; ak copy:K76:54)

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; ak paste:K76:55)

APPEND MENU ITEM:C411($mainMenu; "-")


APPEND MENU ITEM:C411($mainMenu; $label.document; $menuDocument)
APPEND MENU ITEM:C411($mainMenu; $label.paragraph; $menuParagraph)
APPEND MENU ITEM:C411($mainMenu; $label.image; $menuImage)
APPEND MENU ITEM:C411($mainMenu; $label.table; $menuTable)
APPEND MENU ITEM:C411($mainMenu; $label.section; $menuSection)

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)  // refresh image
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "refreshImages")
APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)  // refresh image
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "insertTextbox")  //wk text box

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)  // insertPageBreak
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "insertPageBreak")
APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)  // insertColumnBreak
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "insertColumnBreak")
APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)  // insertSectionBreak
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "insertSectionBreak")
APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)  // insertContinuousSectionBreak
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "insertContinuousSectionBreak")
APPEND MENU ITEM:C411($mainMenu; "-")

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "font/showDialog")

//APPEND MENU ITEM($mainMenu; ak standard action title)
//SET MENU ITEM PROPERTY($mainMenu; -1; Associated standard action; "fontStyle")

APPEND MENU ITEM:C411($mainMenu; $label.style; $menuStyle)

APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "fontSize")
APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "color")
APPEND MENU ITEM:C411($mainMenu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($mainMenu; -1; Associated standard action:K56:1; "backgroundColor")


$result:=Dynamic pop up menu:C1006($mainMenu)


// ------------------------   Realease ALL (!) menus to avoid memory leaks   ------------------------

RELEASE MENU:C978($menuDocument)
RELEASE MENU:C978($menuDocumentMargins)
RELEASE MENU:C978($menuDocumentPadding)
RELEASE MENU:C978($menuDocumentBorders)
RELEASE MENU:C978($menuDocumentBackground)

RELEASE MENU:C978($menuParagraph)
RELEASE MENU:C978($menuParagraphMargins)
RELEASE MENU:C978($menuParagraphPadding)
RELEASE MENU:C978($menuParagraphBorders)
RELEASE MENU:C978($menuParagraphBackground)

RELEASE MENU:C978($menuTable)
RELEASE MENU:C978($menuTableRow)
RELEASE MENU:C978($menuTableColumn)
RELEASE MENU:C978($menuTableCell)


RELEASE MENU:C978($menuSection)
RELEASE MENU:C978($menuSectionMargins)
RELEASE MENU:C978($menuSectionPadding)
RELEASE MENU:C978($menuSectionBorders)
RELEASE MENU:C978($menuSectionColumns)
RELEASE MENU:C978($menuSectionBackground)


RELEASE MENU:C978($menuStyle)
RELEASE MENU:C978($menuTable)

For ($i; 1; 7)
	RELEASE MENU:C978($_paragraphBordersSubmenu{$i})
	RELEASE MENU:C978($_sectionBordersSubmenu{$i})
End for 

RELEASE MENU:C978($mainMenu)


