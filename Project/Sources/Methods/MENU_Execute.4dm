//%attributes = {"invisible":true}
#DECLARE($action : Text)

var $exportType; $win; $i; $n; $start; $end : Integer
var $collection; $_attributes; $_tables : Collection

var $file; $options : Object
var $newDocument; $range : Object
var $position; $attribute : Object
var $formula; $table : Object
var $area : Object

var $ptr : Pointer

var $prompt; $path; $action; $rawText; $extension; $form; $memoErrorMethod; $formName : Text
var $title; $docName; $folderPath; $propertyName : Text


If (OB Is defined:C1231(Form:C1466; "areaPointer")) && (OB Is defined:C1231(Form:C1466; "area"))
	
	$ptr:=Form:C1466.areaPointer  // used for new, clear, new… clear…
	
	$area:=Form:C1466.area
	
	//If (Not(Is nil pointer($ptr)))
	
	If ($action#"")
		
		Case of 
				
			: ($action="new…") | ($action="clear…")
				
				CONFIRM:C162(Get localized string:C991("ConfirmClear"); Get localized string:C991("cancel"); Get localized string:C991("Clear"))  //"Are you sure?")
				If (ok=0)  // OK = 1 = Cancel
					$ptr->:=WP New:C1317
				End if 
				
			: ($action="new") | ($action="clear")
				
				$ptr->:=WP New:C1317
				
			: ($action="import@")
				
				$options:=New object:C1471
				
				If (False:C215)  ///  ∆∆∆   FALSE    ∆∆∆
					$options.beforeDocument:=False:C215
					$options.newDocument:=True:C214
					$options.afterDocument:=False:C215
					$options.cursorPosition:=False:C215
					$options.extension:=$extension
					
					$form:="D_Import"
					$win:=Open form window:C675($form; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
					DIALOG:C40($form; $options)
					
				Else 
					$options.newDocument:=True:C214
					ok:=1
				End if 
				
				If (ok=1)
					
					$prompt:=Get localized string:C991("SelectDocumentOfType")
					$extension:="txt;text;4w7;4wp;rtf;docx"
					
					$path:=Select document:C905(""; $extension; $prompt; 0)  //;.4w7;.4wt //"Select a 4D Write document"
					
					If (ok=1)
						$path:=document
						$file:=Path to object:C1547($path; fk platform path:K87:2)
						
						
						$memoErrorMethod:=Method called on error:C704
						ON ERR CALL:C155("WP_IgnoreError")
						
						Case of 
							: ($file.extension=".4wp") | ($file.extension=".4w7") | ($file.extension=".rtf")
								
								$newDocument:=WP Import document:C1318(document)
								
							: ($file.extension=".txt") | ($file.extension=".text")
								
								$rawText:=Document to text:C1236(document; "UTF-8")
								
								$newDocument:=WP New:C1317
								WP SET TEXT:C1574($newDocument; $rawText; wk replace:K81:177)
								
							: ($file.extension=".docx")  // MAIN ONLY
								$newDocument:=WP Import document:C1318(document)
								If ($newDocument.importLog#Null:C1517)
									CONFIRM:C162(Get localized string:C991("BrowseTheImportLog"); Get localized string:C991("Yes"); Get localized string:C991("No"))
									
									If (ok=1)
										$win:=Open form window:C675("D_LogDisplay"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
										DIALOG:C40("D_LogDisplay"; $newDocument.importLog)
										CLOSE WINDOW:C154($win)
									End if 
									
								End if 
								
							Else 
								// this should NEVER append
								ALERT:C41(Get localized string:C991("thisTypeOfDocumentCantBeImported"))
						End case 
						
						ON ERR CALL:C155($memoErrorMethod)
						
						Case of 
							: ($options.beforeDocument)
								$range:=WP Text range:C1341($area; wk start text:K81:165; wk start text:K81:165)
								WP INSERT DOCUMENT:C1411($range; $newDocument; wk replace:K81:177)
								
							: ($options.newDocument)
								$ptr->:=$newDocument  // including hearder, footers, etc…
								
							: ($options.afterDocument)
								$range:=WP Text range:C1341($area; wk end text:K81:164; wk start text:K81:165)
								WP INSERT DOCUMENT:C1411($range; $newDocument; wk replace:K81:177)
								
							: ($options.cursorPosition)
								$range:=WP Selection range:C1340($area)
								WP INSERT DOCUMENT:C1411($range; $newDocument; wk replace:K81:177)
								
						End case 
						
					End if 
				End if 
				
			: ($action="export@")
				
				Case of 
						
					: ($action="exportText")
						
						$extension:="txt"
						$exportType:=-9999  // Special case, see below
						
						$options:=New object:C1471
						$options.extra:=New object:C1471
						$options.extra.extension:=$extension
						$options.extra.windowTitle:=Get localized string:C991("TextExport")
						$options.extra.form:="D_Export"
						
					: ($action="exportHTML")
						
						$extension:="html"
						$exportType:=wk web page complete:K81:2
						
						$options:=New object:C1471
						$options.extra:=New object:C1471
						$options.extra.windowTitle:=Get localized string:C991("HTMLExport")
						$options.extra.extension:=$extension
						$options.extra.form:="D_Export"
						
						//$options[wk recompute formulas]:=True
						$options[wk optimized for:K81:317]:=wk screen:K81:319
						$options[wk max picture DPI:K81:316]:=96
						$options[wk visible empty images:K81:369]:=True:C214  // new 19R6 (TRUE by default)
						
					: ($action="exportHTMLmime")
						
						$extension:="mht"
						$exportType:=wk mime html:K81:1
						
						$options:=New object:C1471
						$options.extra:=New object:C1471
						$options.extra.windowTitle:=Get localized string:C991("HTMLMimeExport")
						$options.extra.extension:=$extension
						$options.extra.form:="D_Export"
						
						$options[wk HTML pretty print:K81:322]:=False:C215
						$options[wk visible empty images:K81:369]:=True:C214  // new 19R6 (TRUE by default)
						
						$options[wk optimized for:K81:317]:=wk screen:K81:319
						$options[wk max picture DPI:K81:316]:=96
						
						//$options[wk CID host domain name]:="" // only for variables
						
					: ($action="export4dwritePro")  // Write PRO
						
						$extension:="4wp"
						$exportType:=wk 4wp:K81:4
						
					: ($action="exportDocx")  // WORD
						
						$extension:="docx"
						$exportType:=wk docx:K81:277
						
						$options:=New object:C1471
						$options[wk visible empty images:K81:369]:=False:C215  // new 19R6 (false by default)
						
						$options.extra:=New object:C1471
						$options.extra.windowTitle:=Get localized string:C991("WordExport")
						$options.extra.extension:=$extension
						$options.extra.form:="D_Export"
						
					: ($action="exportPDF")  // PDF
						$extension:="pdf"
						$exportType:=wk pdf:K81:315
						
						$options:=New object:C1471
						$options.extra:=New object:C1471
						$options.extra.windowTitle:=Get localized string:C991("PDFExport")
						$options.extra.extension:=$extension
						$options.extra.form:="D_Export"
						
						$options[wk visible background and anchored elements:K81:289]:=True:C214
						$options[wk visible headers:K81:287]:=True:C214
						$options[wk visible footers:K81:288]:=True:C214
						$options[wk visible empty images:K81:369]:=False:C215  // new 19R6 (false by default)
						//$options[wk recompute formulas]:=True
						$options[wk optimized for:K81:317]:=wk screen:K81:319
						$options[wk max picture DPI:K81:316]:=192
						
						
					: ($action="exportSVG")  //SVG
						
						$extension:="svg"
						$exportType:=8  // wk svg  //8
						
						$options:=New object:C1471
						$options.extra:=New object:C1471
						$options.extra.windowTitle:=Get localized string:C991("SVGExport")
						$options.extra.extension:=$extension
						$options.extra.form:="D_Export"
						
						$options[wk visible background and anchored elements:K81:289]:=True:C214
						$options[wk visible headers:K81:287]:=True:C214
						$options[wk visible footers:K81:288]:=True:C214
						$options[wk visible empty images:K81:369]:=False:C215  // new 19R6 (false by default)
						
						//$options[wk recompute formulas]:=True
						$options[wk optimized for:K81:317]:=wk screen:K81:319
						$options[wk max picture DPI:K81:316]:=192
						
						// how many pages in the document ?
						$range:=WP Text range:C1341($area; wk end text:K81:164; wk end text:K81:164)
						$position:=WP Get position:C1577($range)
						
						$options.pageIndexFrom:=1
						$options.pageIndexTo:=$position.page
						
						$options.embeddedPictures:=True:C214  //[wk embedded pictures]
						$options.googleFontsTag:=False:C215  //[wk google fonts tag]
						
						//$options folder
						//$option page
						
						
				End case 
				
				
				If ($options#Null:C1517)
					
					$options.extra.defaultPrintDPI:=300
					$options.extra.defaultScreenDPI:=192
					
					$formName:=$options.extra.form
					$win:=Open form window:C675($formName; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
					DIALOG:C40($options.extra.form; $options)
					
					OB REMOVE:C1226($options; "extra")
					
				Else 
					ok:=1
				End if 
				
				
				If (ok=1)
					
					If ($action="exportSVG")
						$title:=Get localized string:C991("FolderNamePrompt")
					Else 
						$title:=Get localized string:C991("FileNamePrompt")
					End if 
					
					$docName:=Select document:C905(""; ""; $title; File name entry:K24:17)
					
					If (ok=1) & ($docName#"")
						
						
						If ($action="exportSVG")
							
							$folderPath:=document  // ACI0102385 
							
							//$folderPath:=$file.name+"."+$file.extension
							If (Test path name:C476($folderPath)=Is a folder:K24:2)
								DELETE FOLDER:C693($folderPath; Delete with contents:K24:24)
							End if 
							CREATE FOLDER:C475($folderPath)  // if path exists, finder manages and request 
							
							If (Substring:C12($folderPath; Length:C16($folderPath); 1)#Folder separator:K24:12)
								$folderPath:=$folderPath+Folder separator:K24:12
							End if 
							
							//If (False)
							//$p:=Position("."; $docName)
							//If ($p>0)
							//$docName:=Substring($docName; 1; $p-1)
							//End if 
							//End if 
							
							For ($i; $options.pageIndexFrom; $options.pageIndexTo)
								$options.pageIndex:=$i  //[wk page index]
								$path:=$folderPath+$docName+String:C10($i)
								WP EXPORT DOCUMENT:C1337($area; $path; $exportType; $options)
							End for 
							
						Else   // other exports
							
							$path:=document  // ACI0102385 
							$file:=Path to object:C1547($path; fk platform path:K87:2)
							$file.extension:=$extension
							$path:=$file.name+"."+$file.extension
							
							If ($exportType=-9999)
								$rawText:=WP Get text:C1575($area; wk expressions as value:K81:255)
								TEXT TO DOCUMENT:C1237($path; $rawText)
							Else 
								WP EXPORT DOCUMENT:C1337($area; $path; $exportType; $options)  // even if $options = null
							End if 
							
						End if 
						
						
					Else 
						
						// user canceled
						
					End if 
				End if 
				
				
			: ($action="ResetCharacterAttributes")
				
				$range:=WP Paragraph range:C1346(Form:C1466.selection)
				
				$collection:=WP Get elements:C1550($range; wk type paragraph:K81:191)
				$n:=$collection.length
				
				// 1st remove ALL character attributes in the extended range
				If ($n>0)
					
					$start:=WP Paragraph range:C1346($collection[0]).start
					$end:=WP Paragraph range:C1346($collection[$n-1]).end
					$range:=WP Text range:C1341($range.owner; $start; $end)
					
					$_attributes:=WP_GetStyleAttributesByType(wk type character:K81:296)  // all possible attributes for this type of style sheet
					
					For each ($attribute; $_attributes)
						For each ($propertyName; $attribute.properties)
							WP RESET ATTRIBUTES:C1344($range; $propertyName)
						End for each 
					End for each 
					WP RESET ATTRIBUTES:C1344($range; wk style sheet:K81:63)  //"styleSheet") (character style sheet)
				End if 
				
				
				// 2nd re-apply paragraph style sheet for each paragraph
				// For each ($paragraph; $collection)
				// WP GET ATTRIBUTES($paragraph; wk style sheet; $styleSheet)
				// WP SET ATTRIBUTES($paragraph; wk style sheet; $styleSheet)
				// End for each 
				
			: ($action="document@")
				
				
				Case of 
					: ($action="documentTitle")
						$formula:=Formula:C1597(This:C1470.title)
						
					: ($action="documentAuthor")
						$formula:=Formula:C1597(This:C1470.author)
						
					: ($action="documentSubject")
						$formula:=Formula:C1597(This:C1470.subject)
						
					: ($action="documentCompany")
						$formula:=Formula:C1597(This:C1470.company)
						
					: ($action="documentNotes")
						$formula:=Formula:C1597(This:C1470.notes)
						
					: ($action="documentCreationStamp")
						$formula:=Formula:C1597(This:C1470.dateCreation)
						
					: ($action="documentModificationStamp")
						$formula:=Formula:C1597(This:C1470.dateModified)
						
				End case 
				
				WP INSERT FORMULA:C1703(Form:C1466.selection; $formula; wk replace:K81:177)
				
			: ($action="freeze@")
				Case of 
					: ($action="freezeDocument")
						WP FREEZE FORMULAS:C1708(Form:C1466.document; wk do not recompute expressions:K81:312)
						
					: ($action="freezeSelection")
						WP FREEZE FORMULAS:C1708(Form:C1466.selection; wk do not recompute expressions:K81:312)
						
					: ($action="freezeTables")
						
						$_tables:=WP_GetTablesWithDataSource
						For each ($table; $_tables)
							WP FREEZE FORMULAS:C1708($table; wk do not recompute expressions:K81:312)
						End for each 
						
				End case 
				
			: ($action="compute@")
				Case of 
					: ($action="computeDocument")
						WP COMPUTE FORMULAS:C1707(Form:C1466.document)
						
					: ($action="computeSelection")
						WP COMPUTE FORMULAS:C1707(Form:C1466.selection)
						
					: ($action="computeTables")
						
						$_tables:=WP_GetTablesWithDataSource
						For each ($table; $_tables)
							WP COMPUTE FORMULAS:C1707($table)
						End for each 
						
				End case 
		End case 
		
	Else 
		// no action ?
	End if 
	
	//Else 
	//ALERT(Get localized string("nilPointer"))
	//End if 
	
Else 
	ALERT:C41(Get localized string:C991("missingPointer"))
End if 
