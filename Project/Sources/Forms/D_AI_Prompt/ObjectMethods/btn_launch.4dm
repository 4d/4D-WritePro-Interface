var $aiParameters : Object
var $text : Text

$aiParameters:={}
$aiParameters.function:="Text"
$aiParameters.callbackAction:="Text"

Case of 
	: (Form:C1466.radio.opt1=True:C214)
		$aiParameters.prompt:=Form:C1466.prompt
		
	: (Form:C1466.radio.opt2=True:C214)
		$text:=WP Get text:C1575(Form:C1466.wpSelection)
		$aiParameters.prompt:=Form:C1466.prompt
		$aiParameters.prompt+=". Here is the text : "+$text
		
	: (Form:C1466.radio.opt3=True:C214)
		$text:=WP Get text:C1575(Form:C1466.wpSelection.owner; wk expressions as value:K81:255)
		
		$aiParameters.prompt:=Form:C1466.prompt
		$aiParameters.prompt+=". Here is the text : "+$text
End case 

//$aiParameters.size:="1024x1024"  // for pictures only

Form:C1466._extra.state:=1  // running
AI Call($aiParameters)

SET TIMER:C645(-1)

