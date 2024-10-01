//%attributes = {"invisible":true,"shared":true}
#DECLARE($aiParameters : Object)

var $openAI : cs:C1710.ai.openAI
$openAI:=cs:C1710.ai.openAI.new($aiParameters.apiKey)  // PRIVATE KEY


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

$formPrompt:=Form:C1466.prompt
$formVisionUrl:=Form:C1466.url


//$ddList:=Form.ddownList

$function:=$aiParameters.function

Case of 
		
	: ($function="Chat")  // CHAT -----------------------------------------------------------------
		
		$textGenerationParam:=New object:C1471(\
			"userPrompt"; $formPrompt; \
			"systemPrompt"; ""; \
			"openAiChatContext"; 5; \
			"model"; "")
		$openAI.textGeneration($textGenerationParam; Formula:C1597(AI_CallBack($1; $aiParameters)))
		
	: ($function="Reset Context")  // RESET CHAT CONTEXT -----------------------------------------------------------------
		
		$openAI.resetTextGenerationContext(Formula:C1597(ALERT:C41($1)))
		
	: ($function="Image")  //IMAGE -----------------------------------------------------------------
		
		$imageGenerationParam:=New object:C1471(\
			"userPrompt"; $formPrompt; \
			"model"; "dall-e-3"; \
			"quantity"; 1; \
			"downloadImage"; True:C214; \
			"size"; "")
		$openAI.imageGeneration($imageGenerationParam; Formula:C1597(ALERT:C41($1.join(" || "))))
		
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



