//%attributes = {"invisible":true,"shared":true}

  // this method is executed in the main form context

C_TEXT:C284($1;$widgetName)
C_POINTER:C301($p)
If (Count parameters:C259>=1)
	$widgetName:=$1
	$p:=OBJECT Get pointer:C1124(Object named:K67:5;$widgetName)
	If (Not:C34(Is nil pointer:C315($p)))
		$p->:=$p->
	End if 
End if 

