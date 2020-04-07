//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_LONGINT:C283($id)
C_POINTER:C301($ptrFormNames)

$id:=$1-1
  //$ptrFormNames:=OBJECT Get pointer(Object named;"_paletteFormName")

  //OBJECT SET SUBFORM(*;"PaletteSubform";$ptrFormNames->{$id};"")
OBJECT SET SUBFORM:C1138(*;"PaletteSubform";oForm.paletteNames[$id];"")

SET TIMER:C645(-1)