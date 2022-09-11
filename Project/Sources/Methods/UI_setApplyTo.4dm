//%attributes = {}

ARRAY TEXT:C222(WP_applyTo; 0)
If ((FORM Get current page:C276(*)=3) | (FORM Get current page:C276(*)=4))
	
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("document"))  //1 v19R5
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("headers"))  //2 v19R5
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("footers"))  //3 v19R5
	
	APPEND TO ARRAY:C911(WP_applyTo; "-")  //4
	
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("sections"))  //5
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("paragraphs"))  //6 *** default value ***
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("pictures"))  //7
	
	//APPEND TO ARRAY(WP_applyTo; Get localized string("textAreas"))  //{8}  (v19R8?) 
	
	APPEND TO ARRAY:C911(WP_applyTo; "-")  //8
	
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("Table"))  //9
	APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("Cell"))  //10
	If (FORM Get current page:C276(*)=4)
		APPEND TO ARRAY:C911(WP_applyTo; Get localized string:C991("Row"))  //11
	End if 
	
	// default value = paragraph
	WP_applyTo:=6
	
End if 