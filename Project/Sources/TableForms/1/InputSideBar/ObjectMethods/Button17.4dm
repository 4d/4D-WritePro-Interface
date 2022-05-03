C_COLLECTION:C1488($tabs)

Case of 
	: (Shift down:C543)
		$tabs:=New collection:C1472("ImportExport"; "Fonts"; "Alignments"; "Tabulations"; "Sizes"; "Frames"; "Backgrounds"; "Expressions"; "Bookmarks"; "Stylesheets"; "Tables"; "Protection"; "FindAndReplace")
		
		//: (Macintosh option down)
		//$tabs:=New collection("All")
		
	Else 
		
		$tabs:=New collection:C1472(\
			"Fonts"; \
			"Alignments"; \
			"xxxxx"; \
			"Alignments"; \
			"Alignments"; \
			"Stylesheets"; \
			"Protection")
		
		//$tabs:=New collection("xxxxx")
		
		//$tabs:=New collection()
End case 

WP ShowTabPages("WPwidget"; $tabs)


