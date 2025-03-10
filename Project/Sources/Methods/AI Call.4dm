//%attributes = {"invisible":true,"shared":true}


#DECLARE($aiParameters : Object)

var $messages : Collection
var $function : Text
var $options : Object

$function:=$aiParameters.function

Case of 
		
		//: ($function="Text")  // TEXT -----------------------------------------------------------------
		
		//If (Form.chat=Null)
		//Form.chat:=Form.openAI.chat.create(""; {formula: Formula(AI_CallBack($1))})
		//Form.chat.numberOfMessages:=10
		//End if 
		//Form.chat.prompt($aiParameters.prompt)
		
		
	: ($function="Text")  // TEXT -----------------------------------------------------------------
		
		
		If (Form:C1466.chat=Null:C1517)
			$options:={}
			$options.stream:=True:C214
			$options.onData:=Formula:C1597(AI_CallBack($1))
			$options.onTerminate:=Formula:C1597(AI_CallBack($1))
			
			Form:C1466.chat:=Form:C1466.openAI.chat.create(""; $options)
			Form:C1466.chat.numberOfMessages:=10
		End if 
		
		Form:C1466._extra.count:=0  // used to detect first answer
		Form:C1466._extra.answer:=""  // use to cumulate answer
		
		Form:C1466.chat.prompt($aiParameters.prompt)
		
		//$messages:=[]
		//$messages.push({role: "system"; content: "You are a helpful assistant."})
		//$messages.push({role: "user"; content: $aiParameters.prompt})
		//Form.openAI.chat.completions.create($messages; {formula: Formula(AI_CallBack2($1))})
		
		
	: ($function="Reset Context")  // RESET CHAT CONTEXT -----------------------------------------------------------------
		
		OB REMOVE:C1226(Form:C1466; "chat")  // reset chat oject
		AI_updateForm(""; "Reset Context")
		
		//$openAI.resetTextGenerationContext(Formula(AI_CallBack(""; $aiParameters)))
		
	: ($function="Images")  //IMAGE -----------------------------------------------------------------
		
		//$imageGenerationParam:=New object
		//$imageGenerationParam.userPrompt:=$aiParameters.prompt
		//$imageGenerationParam.size:=$aiParameters.size
		//$imageGenerationParam.model:="dall-e-3"  // or "dall-e-2"
		//$imageGenerationParam.quantity:=1
		//$imageGenerationParam.downloadImage:=False
		
		//$openAI.imageGeneration($imageGenerationParam; Formula(AI_CallBack($1.join(" || "); $aiParameters)))
		
	: ($function="Vision")  //VISION -----------------------------------------------------------------
		
		//$visionParam:=New object(\
			"pictureUrl"; $formVisionUrl; \
			"userPrompt"; $formPrompt; \
			"model"; ""; \
			"detail"; "")
		//$openAI.visionGeneration($visionParam; Formula(ALERT($1)))
		
	: ($function="Moderation")  //MODERATION -----------------------------------------------------------------
		
		//$openAI.textModeration($formPrompt; Formula(ALERT("Sensitive content: "+String($1[0].isFlagged)+"\n"+String($1[1].flaggedCategories.join(", ")))))
		
End case 



