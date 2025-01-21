var $path; $target; $format : Text
var $them : Object
var $thems : Collection
var $btnID; $p; $rnd : Integer
var $file : 4D:C1709.File

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.prompt:=""
		OBJECT SET ENABLED:C1123(*; "btnGenerate"; False:C215)
		
		Form:C1466.local:=New object:C1471
		
		Form:C1466.local.tabs:=New object:C1471
		Form:C1466.local.tabs.values:=["Chat"; "Images"]  //; "Vision"; "Moderation"]
		Form:C1466.local.tabs.index:=0
		
		Form:C1466.otherThems:=New object:C1471
		
		$file:=File:C1566("/RESOURCES/4DWP_AI/templateAI.4wp")
		//$path:=File(Folder(fk resources folder).path+"AI/templateAI.4wp").platformPath
		//Form.WPai:=WP Import document($path)
		Form:C1466.WPai:=WP Import document:C1318($file)
		
		
		//Form.timerAction:="UpdateButtons"  //+UpdateotherThems"
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		OBJECT SET ENABLED:C1123(*; "btnGenerate"; (Form:C1466.prompt#""))
		
		Case of 
			: (Form:C1466.timerAction="UpdateButtons@")
				
				If (Form:C1466.local.tabs.index=0)
					Form:C1466.buttonThems:=Form:C1466.aiThems.chatThems.copy()
				Else 
					Form:C1466.buttonThems:=Form:C1466.aiThems.imageThems.copy()
				End if 
				
				While (Form:C1466.buttonThems.length>6)
					$rnd:=Random:C100%Form:C1466.buttonThems.length
					Form:C1466.buttonThems.remove($rnd; 1)
				End while 
				For each ($them; Form:C1466.buttonThems)
					$them.random:=Random:C100
				End for each 
				Form:C1466.buttonThems.orderBy("random asc")
				
				// reformat buttons
				
				$btnID:=1
				For each ($them; Form:C1466.buttonThems)
					
					$target:="btnThem"+String:C10($btnID)
					$format:=$them.title+";path:/RESOURCES/Images/AI/"+$them.icon
					OBJECT SET FORMAT:C236(*; $target; $format)
					
					$btnID+=1
				End for each 
				
				
			: (Form:C1466.timerAction="UpdateotherThems")
				
				var $aiParameters : Object
				
				$aiParameters:=New object:C1471
				
				$aiParameters.apiKey:=Form:C1466.apiKey
				$aiParameters.windowID:=Form:C1466.windowID
				
				$aiParameters.function:="chat"
				$aiParameters.callbackAction:="rebuild thems"
				
				$aiParameters.prompt:=Form:C1466.aiThems.themsPrompt
				
				Form:C1466.answer:=""
				OBJECT SET VISIBLE:C603(*; "waitGears"; True:C214)
				AI Call($aiParameters)
				
				
		End case 
		
		$p:=Position:C15("+"; Form:C1466.timerAction)
		If ($p>0)
			Form:C1466.timerAction:=Substring:C12(Form:C1466.timerAction; $p+1)
			SET TIMER:C645(-1)
		Else 
			Form:C1466.timerAction:=""  // should be already ""
		End if 
		
End case 