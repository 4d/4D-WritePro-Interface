C_OBJECT:C1216($document)


  //C_POINTER($ptr)
  //$ptr:=OBJECT Get pointer(Object subform container)
  //If (Not(Is nil pointer($ptr)))
  //$o:=$ptr->





  //If (OB Is defined($o;"areaPointer"))
  //$ptr:=OB Get($ptr->;"areaPointer")
  //WP PRINT($ptr->)
  //End if 

  //End if 

$document:=Form:C1466.selection[wk owner:K81:168]
If ($document#Null:C1517)
	WP PRINT:C1343($document)
End if 