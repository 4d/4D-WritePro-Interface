//%attributes = {"invisible":true,"shared":true}


#DECLARE($aiParameters : Object)

var $openAI : cs:C1710.ai.openAI

$openAI:=cs:C1710.ai.openAI.new($aiParameters.apiKey)  // PRIVATE KEY

var $formPrompt : Text
var $formVisionUrl : Text
var $function : Text

var $textGenerationParam : Object
var $imageGenerationParam : Object
var $visionParam : Object
var $assistantCreationParam : Object
var $assistantListParam : Object
var $retrieveListParam : Object

var $moderationResult : Collection
var $moderationFlag : Boolean
var $moderationCategories : Text

var $assistantResult : Text
var $assistantFileUrl : Text

var $alertResult : Text
var $assistant_info : Text

var $threadParam : Object

var $formInupt : Text

//$formPrompt:=Form.prompt
//$formVisionUrl:=Form.url


//$ddList:=Form.tabs

$function:=$aiParameters.function

Case of 
		
	: ($function="Text")  // TEXT -----------------------------------------------------------------
		
		$textGenerationParam:=New object:C1471()
		$textGenerationParam.userPrompt:=$aiParameters.prompt
		$textGenerationParam.systemPrompt:=""
		$textGenerationParam.openAiChatContext:=5
		$textGenerationParam.model:=""  // cheap 4o-mini
		
		$openAI.textGeneration($textGenerationParam; Formula:C1597(AI_CallBack($1.last().content; $aiParameters)))
		
	: ($function="Reset Context")  // RESET CHAT CONTEXT -----------------------------------------------------------------
		
		$openAI.resetTextGenerationContext(Formula:C1597(ALERT:C41($1)))
		
	: ($function="Images")  //IMAGE -----------------------------------------------------------------
		
		$imageGenerationParam:=New object:C1471
		$imageGenerationParam.userPrompt:=$aiParameters.prompt
		$imageGenerationParam.size:=$aiParameters.size
		$imageGenerationParam.model:="dall-e-3"  // or "dall-e-2"
		$imageGenerationParam.quantity:=1
		$imageGenerationParam.downloadImage:=False:C215
		
		$openAI.imageGeneration($imageGenerationParam; Formula:C1597(AI_CallBack($1.join(" || "); $aiParameters)))
		
	: ($function="Vision")  //VISION -----------------------------------------------------------------
		
		$visionParam:=New object:C1471(\
			"pictureUrl"; $formVisionUrl; \
			"userPrompt"; $formPrompt; \
			"model"; ""; \
			"detail"; "")
		$openAI.visionGeneration($visionParam; Formula:C1597(ALERT:C41($1)))
		
	: ($function="Moderation")  //MODERATION -----------------------------------------------------------------
		
		$openAI.textModeration($formPrompt; Formula:C1597(ALERT:C41("Sensitive content: "+String:C10($1[0].isFlagged)+"\n"+String:C10($1[1].flaggedCategories.join(", ")))))
		
End case 



