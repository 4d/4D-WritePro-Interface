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
	: (WP_applyTo=4)
		$applyTo:="table"
	: (WP_applyTo=5)
		$applyTo:="cell"
	: (WP_applyTo=6)
		$applyTo:="row"
End case 


  // page 3
OBJECT SET ACTION:C1259(*;"popMarginLeft";$applyTo+"/marginLeft")
OBJECT SET ACTION:C1259(*;"popMarginRight";$applyTo+"/marginRight")
OBJECT SET ACTION:C1259(*;"popMarginTop";$applyTo+"/marginTop")
OBJECT SET ACTION:C1259(*;"popMarginBottom";$applyTo+"/marginBottom")

OBJECT SET ACTION:C1259(*;"popPaddingLeft";$applyTo+"/paddingLeft")
OBJECT SET ACTION:C1259(*;"popPaddingRight";$applyTo+"/paddingRight")
OBJECT SET ACTION:C1259(*;"popPaddingTop";$applyTo+"/paddingTop")
OBJECT SET ACTION:C1259(*;"popPaddingBottom";$applyTo+"/paddingBottom")

  // page 4
  //OBJECT SET ACTION(*;"btnBorderStyleNone";$applyTo+"/outside/borderStyle?value=none")

OBJECT SET ACTION:C1259(*;"btnBorderStyleNone";$applyTo+"/borderStyle?value=none")
