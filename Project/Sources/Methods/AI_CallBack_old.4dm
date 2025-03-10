//%attributes = {}
#DECLARE($result : cs:C1710.AIKit.OpenAIChatCompletionsResult; $parameters : Object)

var $answer : Text

If ($result.success)
	
	$answer:=$result.choice.message.text
	AI_updateForm($answer; "Set Text"; True:C214)
	
Else 
	// Alert($result.errors.formula(Formula(JSON Stringify($1))).join("\n"))
	
	AI_updateForm(""; "")  // just change state
	
End if 


