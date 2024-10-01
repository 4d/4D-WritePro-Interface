//%attributes = {}
#DECLARE($content : Text)

var $range : Object

$content:=Replace string:C233($content; "**"; "")

// insert the answer at the beginning
WP INSERT BREAK:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk prepend:K81:178)
WP SET TEXT:C1574(Form:C1466.WPai; $content; wk prepend:K81:178)


$range:=WP Text range:C1341(Form:C1466.WPai; 1; Length:C16($content)+1)
WP SET ATTRIBUTES:C1342($range; wk text color:K81:64; "black"; wk text align:K81:49; wk left:K81:95; wk background color:K81:20; "white")

// insert the prompt (before)
WP INSERT BREAK:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk prepend:K81:178)
WP SET TEXT:C1574(Form:C1466.WPai; Form:C1466.prompt; wk prepend:K81:178)

$range:=WP Text range:C1341(Form:C1466.WPai; 1; Length:C16(Form:C1466.prompt)+1)
WP SET ATTRIBUTES:C1342($range; wk text color:K81:64; "Red"; wk text align:K81:49; wk right:K81:96; wk background color:K81:20; "lightgrey")

WP SELECT:C1348(Form:C1466.WPai; 1; 1)

Form:C1466.answer:=$content
OBJECT SET VISIBLE:C603(*; "waitGears"; False:C215)
