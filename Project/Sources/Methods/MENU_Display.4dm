//%attributes = {"invisible":true}
#DECLARE($content : Text)->$action : Text

//var $1; $content : Text
//var $0 : Text

var $menu; $action; $item : Text
var $_menuItems; $_tables : Collection
var $o : Object

If (Count parameters:C259>=1)
	$content:=$1
Else   // test
	$content:="export"  //"new/import/export"
End if 

$menu:=Create menu:C408  // create IMPORT submenu first

//If ($content="@import@")

//$importMenu:=Create menu

//APPEND MENU ITEM($importMenu; Get localized string("4DWriteProEllipsis"))  //"As .4dwp Document")
//SET MENU ITEM PARAMETER($importMenu; -1; "import4dWritePro")

//APPEND MENU ITEM($importMenu; Get localized string("TextEllipsis"))  //"As .text Document")
//SET MENU ITEM PARAMETER($importMenu; -1; "importText")

//APPEND MENU ITEM($importMenu; Get localized string("4DWriteEllipsis"))  //"As .text Document")
//SET MENU ITEM PARAMETER($importMenu; -1; "import4dWrite")

//End if 

Case of 
	: ($content="export")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("4DWriteProEllipsis"))  //"As .4dwp Document")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "export4dwritePro")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("WordEllipsis"))  //"As .docx document")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "exportDocx")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("HtmlEllipsis"))  //"As .html Document")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "exportHTML")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("HtmlMimeEllipsis"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "exportHTMLmime")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("PdfEllipsis"))  //"As .pdf document")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "exportPDF")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("TextEllipsis"))  //"As .text Document")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "exportText")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("svgEllipsis"))  //"As .svg Document")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "exportSVG")
		
	: ($content="paragraphSettings")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "widowAndOrphanControlEnabled")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "avoidPageBreakInsideEnabled")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "keepWithNext")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; wk line height:K81:51)
		
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("resetFontAttributes"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "ResetCharacterAttributes")
		
		
	: ($content="InsertFormula")
		APPEND MENU ITEM:C411($menu; Get localized string:C991("title"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentTitle")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("author"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentAuthor")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("subject"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentSubject")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("company"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentCompany")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("notes"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentNotes")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("creationDate"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentCreationStamp")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("modificationDate"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "documentModificationStamp")
		
	: ($content="FreezeFormulas")
		APPEND MENU ITEM:C411($menu; Get localized string:C991("FreezeDocument"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "freezeDocument")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("FreezeSelection"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "freezeSelection")
		
		$_tables:=WP_GetTablesWithDataSource
		If ($_tables.length>0)
			APPEND MENU ITEM:C411($menu; Get localized string:C991("FreezeTables"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "freezeTables")
		Else 
			APPEND MENU ITEM:C411($menu; "("+Get localized string:C991("FreezeTables"))
		End if 
		
	: ($content="ComputeFormulas")
		APPEND MENU ITEM:C411($menu; Get localized string:C991("ComputeDocument"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "computeDocument")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("ComputeSelection"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "computeSelection")
		
		$_tables:=WP_GetTablesWithDataSource
		If ($_tables.length>0)
			APPEND MENU ITEM:C411($menu; Get localized string:C991("ComputeTables"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "computeTables")
		Else 
			APPEND MENU ITEM:C411($menu; "("+Get localized string:C991("ComputeTables"))
		End if 
		
		//: ($content="DisplayFormulas")
		
		//APPEND MENU ITEM($menu; ak standard action title)
		//SET MENU ITEM PROPERTY($menu; -1; Associated standard action; ak show reference)
		
		//APPEND MENU ITEM($menu; ak standard action title)
		//SET MENU ITEM PROPERTY($menu; -1; Associated standard action; wk display formula as symbol)
		
	: ($content="ColumnsSettings")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "section/columnSpacing")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "section/columnRuleStyle")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "section/columnRuleWidth")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "section/columnRuleColor")
		
	: ($content="Edit")
		
		$_menuItems:=New collection:C1472(ak undo:K76:51; ak redo:K76:52; "-"; ak cut:K76:53; ak copy:K76:54; ak paste:K76:55; ak clear:K76:56; "-"; ak select all:K76:57)
		
		For each ($item; $_menuItems)
			
			If ($item="-")
				APPEND MENU ITEM:C411($menu; "-")
			Else 
				$o:=Get action info:C1442($item)
				If ($o.enabled)
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; $item)  // <----only when action is possible
				Else 
					APPEND MENU ITEM:C411($menu; $o.title)  // <<<----- Set title (always visible)
					DISABLE MENU ITEM:C150($menu; -1)  // <<<---------- but disable item
				End if 
			End if 
		End for each 
		
		
		
	: ($content="TextBox")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/height")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/width")
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/verticalAlign")
		
		//APPEND MENU ITEM($menu; ak standard action title)
		//SET MENU ITEM PROPERTY($menu; -1; Associated standard action name; "textBox/margin")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/padding")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/borders")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/background")
		
		APPEND MENU ITEM:C411($menu; "-")
		
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/anchoring")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/layer")
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/remove")
		
		
End case 

$action:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)



//$0:=$action
