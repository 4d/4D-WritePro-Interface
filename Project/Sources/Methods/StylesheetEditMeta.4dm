//%attributes = {"invisible":true}
C_OBJECT:C1216($meta)
$meta:=New object:C1471

If (OB Is empty:C1297(This:C1470))
	$meta.disabled:=True:C214
Else 
	
	If (Not:C34(This:C1470.check))  //((This.value#This.normalValue) |
		$meta.cell:=New object:C1471("colLabel";New object:C1471("fontWeight";"bold");"colStylesheet";New object:C1471("fontWeight";"normal";"stroke";"black");"colNormal";New object:C1471("stroke";"grey"))
	Else 
		$meta.cell:=New object:C1471("colLabel";New object:C1471("fontWeight";"normal");"colStylesheet";New object:C1471("fontWeight";"normal";"stroke";"grey");"colNormal";New object:C1471("stroke";"black"))
	End if 
	
End if 

  //C_TEXT(vMeta)
  //vMeta:=JSON Stringify($meta)

$0:=$meta
