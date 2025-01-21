//%attributes = {}
#DECLARE($content : Text; $parameters : Object)

var $_breaks : Collection
var $tempoThems : Collection
var $result; $p : Integer
var $memoRange1; $memoRange2; $promptRange; $answerRange; $breakRange : Object
var $break; $bm; $elem : Object
var $picture; $pictureL; $pictureS : Picture
var $filePath; $prompt : Text



// insert the prompt (before)
WP Insert break:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk append:K81:179)

$prompt:=Form:C1466.prompt

$memoRange1:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)
WP SET TEXT:C1574(Form:C1466.WPai; $prompt; wk append:K81:179)
$memoRange2:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)

$promptRange:=WP Text range:C1341(Form:C1466.WPai; $memoRange1.end; $memoRange2.end)
WP SET ATTRIBUTES:C1342($promptRange; wk style sheet:K81:63; "Prompt")

//WP SELECT($range)

Case of 
		
	: ($parameters.callbackAction="text")
		
		//$content:=Replace string($content; "**"; "")
		
		// insert the answer at the end
		WP Insert break:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk append:K81:179)
		
		$memoRange1:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)
		WP SET TEXT:C1574(Form:C1466.WPai; $content; wk append:K81:179)
		$memoRange2:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)
		
		$answerRange:=WP Text range:C1341(Form:C1466.WPai; $memoRange1.end; $memoRange2.end)
		WP SET ATTRIBUTES:C1342($answerRange; wk style sheet:K81:63; "Answer")
		
		
		//$_breaks:=WP Get breaks($answerRange; wk paragraph break)
		//For each ($break; $_breaks)
		//$breakRange:=WP Text range(Form.WPai; $break.start; $break.end)
		//WP Insert break($breakRange; wk line break; wk replace)
		//End for each 
		
		
		//Form.answer:=$content
		
	: ($parameters.callbackAction="images")
		
		//$result:=HTTP Get($content; $picture)
		//Form.image:=$picture
		
		//// insert the answer at the beginning
		//WP Insert break(Form.WPai; wk paragraph break; wk prepend)
		//WP Insert picture(Form.WPai; $picture; wk prepend)
		
		//$range:=WP Text range(Form.WPai; 1; 1)
		//WP SET ATTRIBUTES($range; wk style sheet; "Picture")
		
		//$range:=WP Text range(Form.WPai; 1; 2)
		//$elem:=WP Get elements($range; wk type image)[0]
		//WP SET ATTRIBUTES($elem; wk width; "16cm")
		
		
	: ($parameters.callbackAction="rebuild thems")
		
		//$p:=Position("["; $content)
		//If ($p>0)
		//$content:=Substring($content; $p)
		//$p:=Position("]"; $content)
		//If ($p>0)
		//$content:=Substring($content; 1; $p)
		//End if 
		
		//// TEMP
		///*
		//Form.prompt:=Form.aiThems.themsPrompt
		//			
		//// insert the answer at the beginning
		//WP INSERT BREAK(Form.WPai; wk paragraph break; wk prepend)
		//WP SET TEXT(Form.WPai; $content; wk prepend)
		//			
		//$range:=WP Text range(Form.WPai; 1; Length($content))
		//WP SET ATTRIBUTES($range; wk style sheet; "Answer")
		//			
		//			
		//$_breaks:=WP Get breaks($range; wk paragraph break)
		//For each ($break; $_breaks)
		//$range:=WP Text range(Form.WPai; $break.start; $break.end)
		//WP INSERT BREAK($range; wk line break; wk replace)
		//End for each 
		//*/
		
		//Try
		//$tempoThems:=JSON Parse($content)
		//Form.otherThems:=CollectionToDropDown($tempoThems)
		//Catch
		//ALERT("More themes generation failed")
		//End try
		
		//End if 
		
	: ($parameters.callbackAction="icon")
		
		//$result:=HTTP Get($content; $picture)
		//CREATE THUMBNAIL($picture; $pictureL; 256; 256; Scaled to fit proportional)
		//CREATE THUMBNAIL($picture; $pictureS; 128; 128; Scaled to fit proportional)
		
		//$filePath:=File(Folder(fk resources folder).path+"Images/AI/"+$parameters.prompt+"@2x.png").platformPath
		//WRITE PICTURE FILE($filePath; $pictureL; ".png")
		
		//$filePath:=File(Folder(fk resources folder).path+"Images/AI/"+$parameters.prompt+".png").platformPath
		//WRITE PICTURE FILE($filePath; $pictureS; ".png")
		
		
End case 

// insert a new bookmark
$bm:=New object:C1471
$bm.prompt:="• "+$prompt
$bm.promptRange:=$promptRange
$bm.answerRange:=$answerRange

Form:C1466.bookmarks.push($bm)
Form:C1466.bookmarks:=Form:C1466.bookmarks

OBJECT SET VISIBLE:C603(*; "waitGears"; False:C215)

