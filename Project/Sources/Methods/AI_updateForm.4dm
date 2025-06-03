//%attributes = {}
#DECLARE($content : Text; $action : Text; $terminated : Boolean)

var $file : 4D:C1709.File
var $_breaks : Collection
var $tempoThems; $breaks : Collection
var $result; $p : Integer
var $memoRange1; $memoRange2; $promptRange; $answerRange; $breakRange : Object
var $break; $bm; $elem; $range : Object
var $picture; $pictureL; $pictureS : Picture
var $filePath; $prompt : Text
var $newDoc : Object


//WP SELECT($range)

Case of 
		
		//: ($action="")  // error to be managed
		//Form._extra.state:=1  // rub
		
		//ACI0105627
		
	: ($action="Error")  // error to be managed
		Form:C1466._extra.state:=0  // Run
		AI_updateForm($content; "Set Text"; True:C214)
		
		
		
		
	: ($action="Set Text")
		
		If (Not:C34(Undefined:C82(Form:C1466.openAI)))
			
			If (Form:C1466._extra.count=0)
				$prompt:=Form:C1466.prompt
				
				$memoRange1:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)
				WP SET TEXT:C1574(Form:C1466.WPai; $prompt; wk append:K81:179)
				$memoRange2:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)
				
				$promptRange:=WP Text range:C1341(Form:C1466.WPai; $memoRange1.end; $memoRange2.end)
				
				// link paragraphs if more than one in the prompt (transform § breaks into line breaks)
				$breaks:=WP Get breaks:C1768($promptRange; wk paragraph break:K81:259)
				For each ($break; $breaks)
					$range:=WP Text range:C1341(Form:C1466.WPai; $break.start; $break.end)
					WP Insert break:C1413($range; wk line break:K81:186; wk replace:K81:177)
				End for each 
				
				WP SET ATTRIBUTES:C1342($promptRange; wk style sheet:K81:63; "Prompt")
				
				WP Insert break:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk append:K81:179)
				$memoRange1:=WP Text range:C1341(Form:C1466.WPai; wk end text:K81:164; wk end text:K81:164)
				
				Form:C1466._extra.memoStart:=$memoRange1.end
				Form:C1466._extra.memoPrompt:=$prompt
				
			End if 
			
			Form:C1466._extra.answer+=$content
			
			
			If ($terminated) || True:C214  // every time, not only only if ended
				$newDoc:=WP MDtoWP(Form:C1466._extra.answer)
			Else 
				$newDoc:=WP New:C1317
				WP SET TEXT:C1574($newDoc; Form:C1466._extra.answer; wk append:K81:179)
			End if 
			
			$answerRange:=WP Text range:C1341(Form:C1466.WPai; Form:C1466._extra.memoStart; wk end text:K81:164)
			$answerRange:=WP Insert document body:C1411($answerRange; $newDoc; wk replace:K81:177)
			
			If (FORM Get color scheme:C1761="dark")
				WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk text color:K81:64; "white")
			End if 
			
			//If (Not($terminated))
			//WP SET ATTRIBUTES($answerRange; wk style sheet; "Normal")
			//End if 
			
			WP SELECT:C1348(Form:C1466.WPai; $answerRange.end; $answerRange.end)  // To allow the text to scroll "live"
			
			If ($terminated)
				
				WP Insert break:C1413(Form:C1466.WPai; wk paragraph break:K81:259; wk append:K81:179)
				// insert a new bookmark
				
				$bm:=New object:C1471
				$bm.prompt:="• "+Substring:C12(Form:C1466._extra.memoPrompt; 1; 120)
				$bm.promptRange:=$promptRange
				$bm.answerRange:=$answerRange
				$bm.id:=Form:C1466.bookmarks.length+1
				
				Form:C1466.bookmarks.push($bm)
				Form:C1466.bookmarks:=Form:C1466.bookmarks
				
				LISTBOX SELECT ROW:C912(*; "LB_Bookmarks"; $bm.id)
				WP SELECT:C1348(*; "WParea"; $bm.answerRange)
				GOTO OBJECT:C206(*; "WParea")  // to avoid the light grey highlight
				
				Form:C1466._extra.state:=2  // re-run
				
			End if 
			
			Form:C1466._extra.count+=1
			
		Else 
			// the AI_Prompt window has been closed
		End if 
		
	: ($action="Reset Context")
		
		
		$file:=File:C1566("/RESOURCES/4DWP_AI/templateAI.4wp")
		Form:C1466.WPai:=WP Import document:C1318($file)
		WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk background color:K81:20; wk transparent:K81:134)
		
		Form:C1466.bookmarks:=[]
		Form:C1466.prompt:=""
		Form:C1466._extra.state:=-1  // -1 : desabled (run not allowed) 0: "run" / 1: "running" / 2:"rerun"
		Form:C1466._extra.count:=0
		
	: ($action="images")
		
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
		
		
		
	: ($action="icon")
		
		//$result:=HTTP Get($content; $picture)
		//CREATE THUMBNAIL($picture; $pictureL; 256; 256; Scaled to fit proportional)
		//CREATE THUMBNAIL($picture; $pictureS; 128; 128; Scaled to fit proportional)
		
		//$filePath:=File(Folder(fk resources folder).path+"Images/AI/"+$parameters.prompt+"@2x.png").platformPath
		//WRITE PICTURE FILE($filePath; $pictureL; ".png")
		
		//$filePath:=File(Folder(fk resources folder).path+"Images/AI/"+$parameters.prompt+".png").platformPath
		//WRITE PICTURE FILE($filePath; $pictureS; ".png")
		
End case 

SET TIMER:C645(-1)

