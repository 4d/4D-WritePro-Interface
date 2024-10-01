var $aiParameters : Object

$aiParameters:=New object:C1471

$aiParameters.apiKey:=Form:C1466.apiKey
$aiParameters.windowID:=Form:C1466.windowID

$aiParameters.function:=Form:C1466.ddownList.values[Form:C1466.ddownList.index]
$aiParameters.prompt:=Form:C1466.prompt

OBJECT SET VISIBLE:C603(*; "waitText"; True:C214)
AI Call($aiParameters)


