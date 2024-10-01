//%attributes = {}
#DECLARE($result : Collection; $parameters : Object)
var $answer : Text

$answer:=$result.last().content
CALL FORM:C1391($parameters.windowID; "AI_updateForm"; $answer)
