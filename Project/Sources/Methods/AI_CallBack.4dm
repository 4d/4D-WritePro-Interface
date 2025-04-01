//%attributes = {}
#DECLARE($result : cs:C1710.AIKit.OpenAIChatCompletionsResult; $parameters : Object)

var $answer : Text

If ($result.success)
	
	$answer:=$result.choice.delta.text
	If ($answer#"") || ($result.terminated)
		AI_updateForm($answer; "Set Text"; $result.terminated)
	End if 
	
Else 
	
	If ($result.errors.length>0)
		$answer:=""
		$answer+="**"+Localized string:C991("ErrorCodeColon")+"**"
		$answer+=$result.errors[0].code+"\r"
		$answer+="**"+Localized string:C991("ErrorMessageColon")+"**"
		$answer+=$result.errors[0].message
	Else 
		$answer:=Localized string:C991("GlobalError")
	End if 
	AI_updateForm($answer; "Error")  // just change state
	
End if 


