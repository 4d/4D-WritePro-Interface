//%attributes = {"invisible":true}
C_OBJECT:C1216(${1})
C_LONGINT:C283($i)
C_BOOLEAN:C305($0;$result)

$result:=False:C215
$i:=1
Repeat 
	$result:=$result | (${$i}.call())
	$i:=$i+1
Until ($i>Count parameters:C259) | ($result=True:C214)

$0:=$result



