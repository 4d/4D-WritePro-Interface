var $mdStyles : Object

If (Shift down:C543)
	
	$mdStyles:={}
	
	$mdStyles.title1:={fontSize: 36; fontFamily: "Optima"; fontBold: 1}
	$mdStyles.title2:={fontSize: 32; fontFamily: "Optima"}
	$mdStyles.title3:={fontSize: 28; fontFamily: "Optima"}
	$mdStyles.title4:={fontSize: 24; fontFamily: "Optima"; fontItalic: 1}
	$mdStyles.title5:={fontSize: 22; fontFamily: "Optima"; fontItalic: 1}
	$mdStyles.title6:={fontSize: 20; fontFamily: "Optima"; fontItalic: 1}
	
	$mdStyles.bold:={fontBold: 1; color: "navy"}
	$mdStyles.italic:={fontItalic: 1; color: "orange"}
	//$mdStyles.boldItalic:={fontBold: 1; fontItalic: 1; color: "red"}
	$mdStyles.lineThrough:={textLinethroughStyle: 1; textLinethroughColor: "green"}
	$mdStyles.monospace:={fontFamily: "courier new"; color: "purple"}
	
	Form:C1466.wp:=WP MDtoWP(Form:C1466.md; $mdStyles)
	
Else 
	
	Form:C1466.wp:=WP MDtoWP(Form:C1466.md)
	
	
End if 