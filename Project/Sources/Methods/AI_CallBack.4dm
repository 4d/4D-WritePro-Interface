//%attributes = {}
#DECLARE($result : cs:C1710.AIKit.OpenAIChatCompletionsResult; $parameters : Object)

var $answer : Text

If ($result.success)
	
	$answer:=$result.choice.delta.text
	If ($answer#"") || ($result.terminated)
		AI_updateForm($answer; "Set Text"; $result.terminated)
	End if 
	
Else 
	// Alert($result.errors.formula(Formula(JSON Stringify($1))).join("\n"))
	
	AI_updateForm(""; "")  // just change state
	
End if 


