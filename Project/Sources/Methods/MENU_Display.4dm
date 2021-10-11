//%attributes = {"invisible":true}
var $1; $content : Text
var $0 : Text

var $ptr : Pointer
var $menu; $action : Text



If (Count parameters:C259>=1)
	$content:=$1
Else   // test
	$content:="export"  //"new/import/export"
End if 


If (OB Is defined:C1231(Form:C1466; "areaPointer"))
	
	$ptr:=Form:C1466.areaPointer
	If (Not:C34(Is nil pointer:C315($ptr)))
		
		
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
		
		If ($content="export")
			
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
			
			APPEND MENU ITEM:C411($menu; Get localized string:C991("svgEllipsis"))  //"As .text Document")
			SET MENU ITEM PARAMETER:C1004($menu; -1; "exportSVG")
			
		End if 
		
		$action:=Dynamic pop up menu:C1006($menu)
		RELEASE MENU:C978($menu)
		
	Else 
		ALERT:C41(Get localized string:C991("nilPointer"))
	End if 
Else 
	ALERT:C41(Get localized string:C991("missingPointer"))
End if 


$0:=$action
