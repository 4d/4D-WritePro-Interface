var $file : 4D:C1709.File
var $item : Object
var $i : Integer
var $lang : Text

Case of 
	: (Form event code:C388=On Load:K2:1) || (Form:C1466.reset=True:C214)
		
		Form:C1466.reset:=False:C215
		
		Form:C1466._extra:={}
		Form:C1466._extra.expanded:=True:C214
		Form:C1466._extra.state:=-1  // -1 : desabled (run not allowed) 0: "run" / 1: "running" / 2:"rerun"
		
		
		Form:C1466.openAI:=cs:C1710.AIKit.OpenAI.new(oform.aiKey)  // PRIVATE KEY
		
		
		Form:C1466.bookmarks:=[]
		
		$file:=File:C1566("/RESOURCES/4DWP_AI/templateAI.4wp")
		Form:C1466.WPai:=WP Import document:C1318($file)
		WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk background color:K81:20; wk transparent:K81:134)
		
		//If (FORM Get color scheme="dark")
		//WP SET ATTRIBUTES(Form.WPai; wk text color; "white")
		//End if 
		
		If (Macintosh command down:C546 && Macintosh option down:C545)
			Form:C1466.prompt:="Je souhaite un descriptif détaillé de la tour Eiffel"
			Form:C1466._extra.state:=0
		Else 
			Form:C1466.prompt:=""
		End if 
		
		// prompt menu
		
		$lang:=Get database localization:C1009(Current localization:K5:22; *)
		$file:=File:C1566("/RESOURCES/4DWP_AI/Prompts/"+$lang+"/prompts.json")
		If ($file.exists=False:C215)
			$file:=File:C1566("/RESOURCES/4DWP_AI/Prompts/en/prompts.json")
		End if 
		
		Form:C1466.prompts:=JSON Parse:C1218($file.getText())
		
		Form:C1466.promptMenu:=Create menu:C408
		$i:=0
		For each ($item; Form:C1466.prompts)
			APPEND MENU ITEM:C411(Form:C1466.promptMenu; $item.title)
			SET MENU ITEM PARAMETER:C1004(Form:C1466.promptMenu; -1; String:C10($i))
			$i+=1
		End for each 
		
		
		Form:C1466.radio:={opt1: True:C214; opt2: False:C215; opt3: False:C215}
		
		Form:C1466._extra.timer:="init"
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		If (Form:C1466._extra.timer="")
			Form:C1466._extra.timer:="init"
		End if 
		
		Case of 
			: (Form:C1466._extra.timer="init")
				UI_AI_Prompt("timer")
				Form:C1466._extra.timer:=""
				
			: (Form:C1466._extra.timer="copy")
				
				If (FORM Get color scheme:C1761#"dark")
					CLEAR PASTEBOARD:C402
					INVOKE ACTION:C1439(ak copy:K76:54)
				Else 
					
					// set the text to black before sending the content to the pastebaord
					WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk text color:K81:64; "black")
					
					CLEAR PASTEBOARD:C402
					INVOKE ACTION:C1439(ak copy:K76:54)
					// set the text back to white again to match the dark interface
					WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk text color:K81:64; "white")
					
				End if 
				Form:C1466._extra.timer:=""  // if not dark mode, it's over
				
		End case 
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		RELEASE MENU:C978(Form:C1466.promptMenu)
		oForm.aiWindow:=0
		
End case 

