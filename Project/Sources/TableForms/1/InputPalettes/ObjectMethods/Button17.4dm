C_COLLECTION:C1488($tabs)

If (Shift down:C543)
	$tabs:=New collection:C1472("Fonts";"Alignments";"tabBtn_Sizes";"Frames";"Backgrounds";"Expressions";"Bookmarks";"Stylesheets";"Sizes";"Tables";"Protection";"Tabulations")
	
Else 
	$tabs:=New collection:C1472(\
		"Fonts";\
		"Alignments";\
		"Tabulations";\
		"Stylesheets";\
		"Protection")
End if 

WP SetTabs ("WPwidget";$tabs)

/* possible values inside collection

"Fonts"
"Alignments"
"Tabulations"
"tabBtn_Sizes"
"Frames"
"Sizes"
"Backgrounds"
"Expressions"
"Bookmarks"
"Stylesheets"
"Tables"
"Protection"
*/
