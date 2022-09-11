//%attributes = {}
#DECLARE()->$applyTo : Text

// read the "applyTo"
Case of 
		
	: (WP_applyTo=1)  // v19R5
		$applyTo:="doc"
	: (WP_applyTo=2)  // v19R5
		$applyTo:="header"
	: (WP_applyTo=3)  // v19R5
		$applyTo:="footer"
		
	: (WP_applyTo=4)  // separator
		
	: (WP_applyTo=5)
		$applyTo:="section"
	: (WP_applyTo=6)
		$applyTo:="paragraph"
	: (WP_applyTo=7)
		$applyTo:="image"
		
		//: (WP_applyTo=8)
		//$applyTo:="textArea"  // v19 R8 ?
		
	: (WP_applyTo=8)  // separator
		
	: (WP_applyTo=9)  // "table"
		$applyTo:="table"
	: (WP_applyTo=10)  // "cell"
		$applyTo:="cell"
	: (WP_applyTo=11)  // "row"
		$applyTo:="row"
End case 

