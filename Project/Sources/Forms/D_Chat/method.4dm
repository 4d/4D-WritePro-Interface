Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.ddownList:=New object:C1471
		
		Form:C1466.ddownList.values:=["Chat"; "Image"; "Vision"; "Moderation"]
		Form:C1466.ddownList.index:=0
		
		Form:C1466.WPai:=WP New:C1317
		WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk font family:K81:65; "Arial"; wk font size:K81:66; "16pt")
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		Case of 
				
			: (Form:C1466.ddownList.index=0)  // "Chat"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; False:C215)
				
				//: (Form.ddownList.index=1)  //"Reset Context"
				//OBJECT SET VISIBLE(*; "Prompt"; False)
				//OBJECT SET VISIBLE(*; "VisionUrl"; False)
				
			: (Form:C1466.ddownList.index=1)  //"Image"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; False:C215)
				
			: (Form:C1466.ddownList.index=2)  //"Vision"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; True:C214)
				
			: (Form:C1466.ddownList.index=3)  //"Moderation"
				OBJECT SET VISIBLE:C603(*; "Prompt"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VisionUrl"; False:C215)
				
		End case 
End case 