C_OBJECT:C1216($document)
C_OBJECT:C1216($range)
C_TEXT:C284($newName)

Case of 
		
	: (Form event code:C388=On Before Data Entry:K2:39)
		
		bookmarkMemoName:=Self:C308->{Self:C308->}
		
	: (Form event code:C388=On Data Change:K2:15)
		
		$document:=Form:C1466.selection[wk owner:K81:168]
		$range:=WP Bookmark range:C1416($document;bookmarkMemoName)
		
		$newName:=Self:C308->{Self:C308->}
		$newName:=Replace string:C233($newName;" ";"_")
		WP NEW BOOKMARK:C1415($range;$newName)
		WP DELETE BOOKMARK:C1419($document;bookmarkMemoName)
		
		WP_GetBookmarks 
		
		UI_PaletteBookMarks 
		
End case 