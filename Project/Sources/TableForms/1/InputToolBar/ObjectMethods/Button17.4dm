C_COLLECTION:C1488($tabs)

If (Shift down:C543)
	$tabs:=New collection:C1472("Home";"Insert";"Margins";"Borders";"Images";"Printing";"Tables";"Spell")
Else 
	$tabs:=New collection:C1472(\
		"Insert";\
		"Margins";\
		"Printing";\
		"Tables";\
		"Spell")
End if 

WP SetTabs ("WPtoolbar";$tabs)

/* possible values inside collection

"Home"
"Insert"
"Margins"
"Borders"
"Images"
"Printing"
"Tables"
"Spell"
*/
