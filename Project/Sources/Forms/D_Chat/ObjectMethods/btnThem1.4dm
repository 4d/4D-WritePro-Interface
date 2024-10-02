var $id : Integer
$id:=Num:C11(OBJECT Get name:C1087(Object current:K67:2))
If (Form:C1466.ddownList.index=0)
	Form:C1466.prompt:=Form:C1466.aiThems.chatThems[$id-1].prompt
Else 
	Form:C1466.prompt:=Form:C1466.aiThems.imageThems[$id-1].prompt
End if 