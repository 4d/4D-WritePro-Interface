var $aiParameters : Object

$aiParameters:=New object:C1471

$aiParameters.apiKey:=Form:C1466.apiKey
$aiParameters.windowID:=Form:C1466.windowID

// $aiParameters.function:=Form.local.tabs.values[Form.local.tabs.index]  // chat or picture

$aiParameters.function:="Text"
$aiParameters.callbackAction:="Text"
$aiParameters.prompt:=Form:C1466.prompt

//$aiParameters.size:="1024x1024"  // for pictures only

Form:C1466.answer:=""
OBJECT SET VISIBLE:C603(*; "waitGears"; True:C214)
AI Call($aiParameters)


