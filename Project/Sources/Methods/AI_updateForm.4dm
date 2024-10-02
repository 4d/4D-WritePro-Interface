//%attributes = {}
#DECLARE($content : Text; $parameters : Object)

var $range : Object
var $_breaks : Collection
var $break : Object
var $picture : Picture
var $elem : Object
var $result : Integer

Case of 
	: ($parameters.function="chat")
		
		$content:=Replace string:C233($content; "**"; "")
		
		// insert the answer at the beginning
		WP INSERT BREAK:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk prepend:K81:178)
		WP SET TEXT:C1574(Form:C1466.WPai; $content; wk prepend:K81:178)
		
		$range:=WP Text range:C1341(Form:C1466.WPai; 1; Length:C16($content))
		WP SET ATTRIBUTES:C1342($range; wk style sheet:K81:63; "Answer")
		
		
		$_breaks:=WP Get breaks:C1768($range; wk paragraph break:K81:259)
		For each ($break; $_breaks)
			$range:=WP Text range:C1341(Form:C1466.WPai; $break.start; $break.end)
			WP INSERT BREAK:C1413($range; wk line break:K81:186; wk replace:K81:177)
		End for each 
		
		
		Form:C1466.answer:=$content
		
		
	: ($parameters.function="images")
		
		$result:=HTTP Get:C1157($content; $picture)
		Form:C1466.image:=$picture
		
		// insert the answer at the beginning
		WP INSERT BREAK:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk prepend:K81:178)
		WP INSERT PICTURE:C1437(Form:C1466.WPai; $picture; wk prepend:K81:178)
		
		$range:=WP Text range:C1341(Form:C1466.WPai; 1; 1)
		WP SET ATTRIBUTES:C1342($range; wk style sheet:K81:63; "Picture")
		
		$range:=WP Text range:C1341(Form:C1466.WPai; 1; 2)
		$elem:=WP Get elements:C1550($range; wk type image:K81:192)[0]
		WP SET ATTRIBUTES:C1342($elem; wk width:K81:45; "16cm")
		
End case 


// insert the prompt (before)
WP INSERT BREAK:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk prepend:K81:178)
WP SET TEXT:C1574(Form:C1466.WPai; Form:C1466.prompt; wk prepend:K81:178)

$range:=WP Text range:C1341(Form:C1466.WPai; 1; Length:C16(Form:C1466.prompt)+1)
WP SET ATTRIBUTES:C1342($range; wk style sheet:K81:63; "Prompt")

WP SELECT:C1348(Form:C1466.WPai; 1; 1)

OBJECT SET VISIBLE:C603(*; "waitGears"; False:C215)

