//%attributes = {"invisible":true}
#DECLARE($range : Object)  // $range:  a text range 

var $paragraphFont; $listFont : Text
var $listType : Integer

$range:=WP Paragraph range:C1346($range)  // transform into § range

WP GET ATTRIBUTES:C1345($range; wk font:K81:69; $paragraphFont; wk list font:K81:60; $listFont; wk list style type:K81:55; $listType)


// forcedEventCode is set in the font and font familly dropdows because no "on after edit" event is generated (not standard actions)
If ($paragraphFont#"")\
 && ($listType#0)\
 && ($listFont#$paragraphFont)\
 && ((oForm.eventCode=On After Edit:K2:43) || (oForm.forcedEventCode=On After Edit:K2:43))
	
	// the same font is used in the whole paragraph
	// AND a list type is used
	// AND the font of the list is not the same as the font of the paragraph
	// AND ( the event code is On After Edit *OR* the forced event code is On After Edit)
	
	WP SET ATTRIBUTES:C1342($range; wk list font:K81:60; $paragraphFont)
	
	oform.forcedEventCode:=-1
	
End if 
