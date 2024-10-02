var $path : Text
var $them : Object
var $thems : Collection
var $btnID : Integer
var $target : Text
var $format : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.ddownList:=New object:C1471
		
		Form:C1466.ddownList.values:=["Chat"; "Images"]  //; "Vision"; "Moderation"]
		Form:C1466.ddownList.index:=0
		
		$path:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"AI/templateAI.4wp").platformPath
		Form:C1466.WPai:=WP Import document:C1318($path)
		
		Form:C1466.aiThems:=JSON Parse:C1218(File:C1566(Folder:C1567(fk resources folder:K87:11).path+"AI/aiThems.json").getText())
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		Case of 
				
			: (Form:C1466.ddownList.index=0)  // "Chat"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "WParea"; True:C214)
				//OBJECT SET VISIBLE(*; "ImageArea"; False)
				//OBJECT SET VISIBLE(*; "VisionUrl"; False)
				
				//: (Form.ddownList.index=1)  //"Reset Context"
				//OBJECT SET VISIBLE(*; "Prompt"; False)
				//OBJECT SET VISIBLE(*; "VisionUrl"; False)
				
			: (Form:C1466.ddownList.index=1)  //"Image"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				//OBJECT SET VISIBLE(*; "WParea"; False)
				//OBJECT SET VISIBLE(*; "ImageArea"; True)
				
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; False:C215)
				
			: (Form:C1466.ddownList.index=2)  //"Vision"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; True:C214)
				
			: (Form:C1466.ddownList.index=3)  //"Moderation"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; False:C215)
				
		End case 
		
		
		If (Form:C1466.ddownList.index=0)
			$thems:=Form:C1466.aiThems.chatThems
		Else 
			$thems:=Form:C1466.aiThems.imageThems
		End if 
		
		// reformat buttons
		
		$btnID:=1
		For each ($them; $thems)
			
			$target:="btnThem"+String:C10($btnID)
			$format:=$them.title+";path:/RESOURCES/Images/AI/"+$them.icon
			OBJECT SET FORMAT:C236(*; $target; $format)
			
			$btnID+=1
		End for each 
		
		
		
		
		
End case 