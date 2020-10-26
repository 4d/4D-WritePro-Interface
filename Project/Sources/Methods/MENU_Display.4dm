//%attributes = {"invisible":true}
var $1; $content : Text
var $0 : Text

var $ptr : Pointer
var $menu; $exportMenu; $importMenu; $action : Text



If (Count parameters:C259>=1)
	$content:=$1
Else   // test
	$content:="export"  //"new/import/export"
End if 


If (OB Is defined:C1231(Form:C1466; "areaPointer"))
	
	$ptr:=Form:C1466.areaPointer
	If (Not:C34(Is nil pointer:C315($ptr)))
		
		
		$menu:=Create menu:C408  // create IMPORT submenu first
		
		
		If ($content="@new@")
			
			APPEND MENU ITEM:C411($menu; Get localized string:C991("clearEllipsis"))  //"Import…")
			SET MENU ITEM PARAMETER:C1004($menu; -1; "clear…")  // ellipsis for conformation request
			APPEND MENU ITEM:C411($menu; "-")
			
		End if 
		
		If ($content="@import@")
			
			
			If ($content="import")  // only import
				
				$importMenu:=$menu
				APPEND MENU ITEM:C411($importMenu; "("+Get localized string:C991("Import"); $importMenu)
				
				
				APPEND MENU ITEM:C411($importMenu; Get localized string:C991("4DWriteProEllipsis"))  //"As .4dwp Document")
				SET MENU ITEM PARAMETER:C1004($importMenu; -1; "import4dWritePro")
				
				APPEND MENU ITEM:C411($importMenu; Get localized string:C991("TextEllipsis"))  //"As .text Document")
				SET MENU ITEM PARAMETER:C1004($importMenu; -1; "importText")
				
				APPEND MENU ITEM:C411($importMenu; Get localized string:C991("4DWriteEllipsis"))  //"As .text Document")
				SET MENU ITEM PARAMETER:C1004($importMenu; -1; "import4dWrite")
				
				
			Else   // "import/export/new"
				
				$importMenu:=Create menu:C408
				
				APPEND MENU ITEM:C411($importMenu; Get localized string:C991("4DWriteProEllipsis"))  //"As .4dwp Document")
				SET MENU ITEM PARAMETER:C1004($importMenu; -1; "import4dWritePro")
				
				APPEND MENU ITEM:C411($importMenu; Get localized string:C991("TextEllipsis"))  //"As .text Document")
				SET MENU ITEM PARAMETER:C1004($importMenu; -1; "importText")
				
				APPEND MENU ITEM:C411($importMenu; Get localized string:C991("4DWriteEllipsis"))  //"As .text Document")
				SET MENU ITEM PARAMETER:C1004($importMenu; -1; "import4dWrite")
				
				APPEND MENU ITEM:C411($menu; Get localized string:C991("Import"); $importMenu)
				RELEASE MENU:C978($importMenu)
				
			End if 
			
		End if 
		
		If ($content="@export@")
			
			If ($content="export")  // only export
				$exportMenu:=$menu
				APPEND MENU ITEM:C411($menu; "("+Get localized string:C991("ExportAs"); $exportMenu)
				
				APPEND MENU ITEM:C411($exportMenu; "  "+Get localized string:C991("4DWriteProEllipsis"))  //"As .4dwp Document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "export4dwritePro")
				
				APPEND MENU ITEM:C411($exportMenu; "  "+Get localized string:C991("WordEllipsis"))  //"As .docx document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportDocx")
				
				
				APPEND MENU ITEM:C411($exportMenu; "  "+Get localized string:C991("HtmlEllipsis"))  //"As .html Document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportHTML")
				
				APPEND MENU ITEM:C411($exportMenu; "  "+Get localized string:C991("HtmlMimeEllipsis"))
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportHTMLmime")
				
				APPEND MENU ITEM:C411($exportMenu; "  "+Get localized string:C991("PdfEllipsis"))  //"As .pdf document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportPDF")
				
				
				APPEND MENU ITEM:C411($exportMenu; "  "+Get localized string:C991("TextEllipsis"))  //"As .text Document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportText")
				
			Else   // "import/export/new"
				
				$exportMenu:=Create menu:C408
				
				APPEND MENU ITEM:C411($exportMenu; Get localized string:C991("TextEllipsis"))  //"As .text Document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportText")
				
				APPEND MENU ITEM:C411($exportMenu; Get localized string:C991("HtmlEllipsis"))  //"As .html Document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportHTML")
				
				APPEND MENU ITEM:C411($exportMenu; Get localized string:C991("HtmlMimeEllipsis"))
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportHTMLmime")
				
				APPEND MENU ITEM:C411($exportMenu; Get localized string:C991("4DWriteProEllipsis"))  //"As .4dwp Document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "export4dwritePro")
				
				APPEND MENU ITEM:C411($exportMenu; Get localized string:C991("WordEllipsis"))  //"As .docx document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportDocx")
				
				APPEND MENU ITEM:C411($exportMenu; Get localized string:C991("PdfEllipsis"))  //"As .pdf document")
				SET MENU ITEM PARAMETER:C1004($exportMenu; -1; "exportPDF")
				
				APPEND MENU ITEM:C411($menu; Get localized string:C991("ExportAs"); $exportMenu)
				RELEASE MENU:C978($exportMenu)
				
			End if 
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
