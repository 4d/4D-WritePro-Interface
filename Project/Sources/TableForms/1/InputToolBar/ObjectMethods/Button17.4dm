var $tabs : Collection

If (Shift down:C543)
	$tabs:=New collection:C1472(\
		"Home"; \
		"Insert"; \
		"Margins"; \
		"Borders"; \
		"Images"; \
		"Printing"; \
		"Tables"; \
		"Spell"; \
		"Protection"; \
		"ImportExport"; \
		"FindAndReplace")
Else 
	$tabs:=New collection:C1472(\
		"Tables"; \
		"Insert"; \
		"Margins"; \
		"Printing"; \
		"Insert"; \
		"Home"; \
		"Home"; \
		"Spell")
End if 

WP ShowTabPages("WPtoolbar"; $tabs)

//WP ShowTabPages("xxxx"; $tabs)

/* possible values inside collection

"Home"
"Insert"
"Margins"
"Borders"
"Images"
"Printing"
"Tables"
"Spell"
"Protection"
"ImportExport"
*/
