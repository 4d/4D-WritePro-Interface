//%attributes = {"invisible":true}
C_OBJECT:C1216(${1})
C_LONGINT:C283($i)
C_BOOLEAN:C305($0;$result)

$result:=True:C214
$i:=1
Repeat 
	$result:=$result & (${$i}.call())
	$i:=$i+1
Until ($i>Count parameters:C259) | ($result=False:C215)

$0:=$result
