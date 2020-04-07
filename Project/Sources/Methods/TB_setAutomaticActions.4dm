//%attributes = {"invisible":true}

C_TEXT:C284($applyTo)

  // read the "applyTo"
Case of 
	: (WP_applyTo=1)
		$applyTo:="section"
	: (WP_applyTo=2)
		$applyTo:="paragraph"
	: (WP_applyTo=3)
		$applyTo:="image"
End case 

  //OBJECT SET ACTION(*;"btnBorderStyleAll";$applyTo+"/outside/borderStyle?value=solid") //bug fix (ACI0100270)
OBJECT SET ACTION:C1259(*;"btnBorderStyleNone";$applyTo+"/outside/borderStyle?value=none")
