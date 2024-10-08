var $aiParameters : Object

$aiParameters:=New object:C1471

$aiParameters.apiKey:=Form:C1466.apiKey
$aiParameters.windowID:=Form:C1466.windowID

$aiParameters.function:=Form:C1466.local.tabs.values[Form:C1466.local.tabs.index]  // chat or picture
$aiParameters.callbackAction:=$aiParameters.function  //same : chat or picture
$aiParameters.prompt:=Form:C1466.prompt

Form:C1466.answer:=""
OBJECT SET VISIBLE:C603(*; "waitGears"; True:C214)
AI Call($aiParameters)


