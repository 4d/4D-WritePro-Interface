//%attributes = {"invisible":true}
C_TEXT:C284($applyTo)

// read the "applyTo"
$applyTo:=UI_GetApplyTo

// page 3
OBJECT SET ACTION:C1259(*; "popMarginLeft"; $applyTo+"/marginLeft")
OBJECT SET ACTION:C1259(*; "popMarginRight"; $applyTo+"/marginRight")
OBJECT SET ACTION:C1259(*; "popMarginTop"; $applyTo+"/marginTop")
OBJECT SET ACTION:C1259(*; "popMarginBottom"; $applyTo+"/marginBottom")

OBJECT SET ACTION:C1259(*; "popPaddingLeft"; $applyTo+"/paddingLeft")
OBJECT SET ACTION:C1259(*; "popPaddingRight"; $applyTo+"/paddingRight")
OBJECT SET ACTION:C1259(*; "popPaddingTop"; $applyTo+"/paddingTop")
OBJECT SET ACTION:C1259(*; "popPaddingBottom"; $applyTo+"/paddingBottom")


// page 4

OBJECT SET ACTION:C1259(*; "btnBorderStyleNone"; $applyTo+"/borderStyle?value=none")
OBJECT SET ACTION:C1259(*; "popRadius"; $applyTo+"/borderRadius")  // v19R5