//%attributes = {}
#DECLARE($content : Text; $parameters : Object)

var $_breaks : Collection
var $tempoThems : Collection
var $result; $p : Integer
var $range : Object
var $break : Object
var $elem : Object
var $picture; $pictureL; $pictureS : Picture
var $filePath : Text

Case of 
	: ($parameters.callbackAction="chat")
		
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
		
		
	: ($parameters.callbackAction="images")
		
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
		
		
	: ($parameters.callbackAction="rebuild thems")
		
		$p:=Position:C15("["; $content)
		If ($p>0)
			$content:=Substring:C12($content; $p)
			$p:=Position:C15("]"; $content)
			If ($p>0)
				$content:=Substring:C12($content; 1; $p)
			End if 
			
			// TEMP
/*
Form.prompt:=Form.aiThems.themsPrompt
			
// insert the answer at the beginning
WP INSERT BREAK(Form.WPai; wk paragraph break; wk prepend)
WP SET TEXT(Form.WPai; $content; wk prepend)
			
$range:=WP Text range(Form.WPai; 1; Length($content))
WP SET ATTRIBUTES($range; wk style sheet; "Answer")
			
			
$_breaks:=WP Get breaks($range; wk paragraph break)
For each ($break; $_breaks)
$range:=WP Text range(Form.WPai; $break.start; $break.end)
WP INSERT BREAK($range; wk line break; wk replace)
End for each 
*/
			
			Try
				$tempoThems:=JSON Parse:C1218($content)
				Form:C1466.otherThems:=CollectionToDropDown($tempoThems)
			Catch
				ALERT:C41("More themes generation failed")
			End try
			
		End if 
		
	: ($parameters.callbackAction="icon")
		
		$result:=HTTP Get:C1157($content; $picture)
		CREATE THUMBNAIL:C679($picture; $pictureL; 256; 256; Scaled to fit proportional:K6:5)
		CREATE THUMBNAIL:C679($picture; $pictureS; 128; 128; Scaled to fit proportional:K6:5)
		
		$filePath:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"Images/AI/"+$parameters.prompt+"@2x.png").platformPath
		WRITE PICTURE FILE:C680($filePath; $pictureL; ".png")
		
		$filePath:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"Images/AI/"+$parameters.prompt+".png").platformPath
		WRITE PICTURE FILE:C680($filePath; $pictureS; ".png")
		
		
End case 


// insert the prompt (before)
WP INSERT BREAK:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk prepend:K81:178)
WP SET TEXT:C1574(Form:C1466.WPai; Form:C1466.prompt; wk prepend:K81:178)

$range:=WP Text range:C1341(Form:C1466.WPai; 1; Length:C16(Form:C1466.prompt)+1)
WP SET ATTRIBUTES:C1342($range; wk style sheet:K81:63; "Prompt")

WP SELECT:C1348(Form:C1466.WPai; 1; 1)

OBJECT SET VISIBLE:C603(*; "waitGears"; False:C215)

