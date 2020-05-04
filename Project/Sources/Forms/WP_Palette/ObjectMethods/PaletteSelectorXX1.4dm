C_OBJECT:C1216($o)
C_POINTER:C301($ptr)
C_TEXT:C284($menu;$subMenuExport;$ref)
C_TEXT:C284($file)

$o:=(OBJECT Get pointer:C1124(Object subform container:K67:4))->
If (OB Is defined:C1231($o;"pointer"))
	$ptr:=OB Get:C1224($o;"pointer";Is pointer:K8:14)
	
	If (Not:C34(Is nil pointer:C315($ptr)))
		
		$subMenuExport:=Create menu:C408  // create submenu first
		APPEND MENU ITEM:C411($subMenuExport;Get localized string:C991("AsHTMLdoc"))  //"As HTML Document")
		SET MENU ITEM PARAMETER:C1004($subMenuExport;-1;"exportHTML")
		  //APPEND MENU ITEM($subMenuExport;"As HTML (mime)";*)
		  //SET MENU ITEM PARAMETER($subMenuExport;-1;"exportHTMLmime")
		APPEND MENU ITEM:C411($subMenuExport;Get localized string:C991("as4DWPdoc"))  //"As 4D WritePro Document")
		SET MENU ITEM PARAMETER:C1004($subMenuExport;-1;"export4dwp")
		
		$menu:=Create menu:C408
		APPEND MENU ITEM:C411($menu;Get localized string:C991("NewEllipsis"))  //"New…"
		SET MENU ITEM PARAMETER:C1004($menu;-1;"new")
		APPEND MENU ITEM:C411($menu;"(-")
		
		APPEND MENU ITEM:C411($menu;Get localized string:C991("ImportEllipsis"))  //"Import…"
		SET MENU ITEM PARAMETER:C1004($menu;-1;"import")
		
		APPEND MENU ITEM:C411($menu;Get localized string:C991("Export");$subMenuExport)  //"Export…"
		  //SET MENU ITEM PARAMETER($menu;-1;"export")
		
		$ref:=Dynamic pop up menu:C1006($menu)
		RELEASE MENU:C978($menu)
		
		Case of 
			: ($ref="new")
				
				CONFIRM:C162(Get localized string:C991("AreYouSure"))  //"Are you sure?")
				If (ok=1)
					$ptr->:=WP New:C1317
				End if 
				
			: ($ref="import")
				
				$file:=Select document:C905("";"";Get localized string:C991("SelectA4DWPdoc");0)  //;.4w7;.4wt //"Select a 4D Write document"
				If (ok=1)
					$ptr->:=WP Import document:C1318(document)
				End if 
				
			: ($ref="export@")
				
				$file:=Select document:C905("";"";Get localized string:C991("SelectADestination");File name entry:K24:17)  //"Select a destination"
				If (ok=1)
					Case of 
						: ($ref="exportHTML")
							If (Shift down:C543)
								WP EXPORT DOCUMENT:C1337($ptr->;document;wk web page complete:K81:2;wk debug format:K81:8)
							Else 
								WP EXPORT DOCUMENT:C1337($ptr->;document;wk web page complete:K81:2)
							End if 
							  //: ($ref="exportHTMLmime")
							  //WP EXPORT DOCUMENT($ptr->;document;wk mime html)
						: ($ref="export4dwp")
							WP EXPORT DOCUMENT:C1337($ptr->;document;wk 4wp:K81:4)
							
					End case 
				End if 
				
		End case 
		
	Else 
		ALERT:C41("The pointer on 4WritePro document is nil")  ///∆∆∆
	End if 
Else 
	ALERT:C41("The pointer on 4WritePro document is missing")  ///∆∆∆
End if 
