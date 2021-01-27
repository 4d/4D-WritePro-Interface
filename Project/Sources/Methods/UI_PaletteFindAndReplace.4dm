//%attributes = {"invisible":true}
C_TEXT:C284($selectedRawText)

//If (UI_isProtected(False))

//OBJECT SET ENABLED(*; "@"; False)
//OBJECT SET ENTERABLE(*; "@"; False)

//Else 

//If (Form.selection.type=2)
//OBJECT SET ENABLED(*; "@"; False)
//OBJECT SET ENTERABLE(*; "@"; False)

//Else 

OBJECT SET ENABLED:C1123(*; "@"; True:C214)
OBJECT SET ENTERABLE:C238(*; "@"; True:C214)

$selectedRawText:=WP Get text:C1575(Form:C1466.selection)

OBJECT SET ENABLED:C1123(*; "btnFind@"; oForm.FR.find#"")

//OBJECT SET ENABLED(*;"btnreplace@";(oForm.FR.replace#"") & (oForm.FR.find=$selectedRawText))

OBJECT SET ENABLED:C1123(*; "btnReplaceSingle"; (oForm.FR.find=$selectedRawText))
OBJECT SET ENABLED:C1123(*; "btnReplaceAll"; (oForm.FR.find#""))

//End if 

//End if 