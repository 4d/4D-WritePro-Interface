var $index : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.displayFormat:=New object:C1471
		Form:C1466.displayFormat.values:=New collection:C1472
		Form:C1466.displayFormat.formatValues:=New collection:C1472
		
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=scaledToFit").title)
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=truncated").title)
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=truncatedCentered").title)
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=proportional").title)
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=proportionalCentered").title)
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=replicated").title)
		Form:C1466.displayFormat.values.push(Get action info:C1442("image/scalingMode?value=replicatedCentered").title)
		
		Form:C1466.displayFormat.formatValues.push(wk scaled to fit:K81:342)
		Form:C1466.displayFormat.formatValues.push(wk truncated:K81:343)
		Form:C1466.displayFormat.formatValues.push(wk truncated centered:K81:344)
		Form:C1466.displayFormat.formatValues.push(wk proportional:K81:345)
		Form:C1466.displayFormat.formatValues.push(wk proportional centered:K81:346)
		Form:C1466.displayFormat.formatValues.push(wk replicated:K81:347)
		Form:C1466.displayFormat.formatValues.push(wk replicated centered:K81:348)
		
		WP_GetPictureSettings  // before next line of code otherwise Form.pictSettings[wk image display mode] is undefined
		
		Form:C1466.displayFormat.index:=Form:C1466.displayFormat.formatValues.indexOf(Form:C1466.pictSettings[wk image display mode:K81:340])
		
		
		If (Form:C1466.pictSettings.anchored=True:C214)
			
			Form:C1466.display[wk anchor page:K81:231]:=1  // default values
			Form:C1466.display[wk anchor section:K81:228]:=1  // default values
			
			
			//*** 
			
			Form:C1466.anchorPage:=New object:C1471
			Form:C1466.anchorPage.values:=New collection:C1472
			Form:C1466.anchorPage.anchorValues:=New collection:C1472
			
			Form:C1466.anchorPage.values.push(Get action info:C1442("anchorPage?value=all").title)
			Form:C1466.anchorPage.values.push(Get localized string:C991("FirstPage"))  // wk anchor first page-anchors an image to the first page subsection of the section(s)defined by wk anchor section
			Form:C1466.anchorPage.values.push(Get localized string:C991("LeftPages"))  // wk anchor left page-anchors an image to the left pages subsection of the section(s)defined by wk anchor section
			Form:C1466.anchorPage.values.push(Get localized string:C991("RightPages"))  // wk anchor right page-anchors an image to the right pages subsection of the section(s)defined by wk anchor section
			Form:C1466.anchorPage.values.push(Get localized string:C991("PageNumber"))  // a number(Longint>=0)indicating which page to anchor the image to.In this case, wk anchor section=wk anchor all.Section anchoring is ignored if an image is anchored to a single page.
			
			Form:C1466.anchorPage.anchorValues.push(wk anchor all:K81:229)
			Form:C1466.anchorPage.anchorValues.push(wk anchor first page:K81:232)
			Form:C1466.anchorPage.anchorValues.push(wk anchor left page:K81:233)
			Form:C1466.anchorPage.anchorValues.push(wk anchor right page:K81:234)
			
			$index:=Form:C1466.anchorPage.anchorValues.indexOf(Form:C1466.pictSettings[wk anchor page:K81:231])
			If ($index>=0)
				Form:C1466.anchorPage.index:=$index
			Else 
				Form:C1466.anchorPage.index:=4
			End if 
			
			Form:C1466.display.anchorPage:=Form:C1466.pictSettings[wk anchor page:K81:231]  // display (negative = invisible in form)
			
			//***
			
			Form:C1466.anchorSection:=New object:C1471
			Form:C1466.anchorSection.values:=New collection:C1472
			
			If (Form:C1466.pictSettings[wk anchor section:K81:228]#wk anchor embedded:K81:230)
				Form:C1466.anchorSection.values.push(Get action info:C1442("anchorSection?value=all").title)  // "All"  // wk anchor all(default)-anchors an image to all sections in a document(image is only visible in page mode)
				Form:C1466.anchorSection.values.push(Get localized string:C991("SectionNumber"))  // "Section number"  // a number(Longint>=1)indicating the section to anchor the image to.(image is only visible in page mode)
				If (Form:C1466.pictSettings[wk anchor section:K81:228]=wk anchor all:K81:229)
					Form:C1466.anchorSection.index:=0
				Else 
					Form:C1466.anchorSection.index:=1
				End if 
				Form:C1466.display.anchorSection:=Form:C1466.pictSettings[wk anchor section:K81:228]
			Else 
				Form:C1466.anchorSection.index:=0
			End if 
			
			
			
			//***
			Form:C1466.anchorHorizontalAlign:=New object:C1471  // used as dropdown in the dialog
			Form:C1466.anchorHorizontalAlign.values:=New collection:C1472()
			
			Form:C1466.anchorHorizontalAlign.values.push(Get action info:C1442("anchorHorizontalAlign?value=left").title)  // "Left"
			Form:C1466.anchorHorizontalAlign.values.push(Get action info:C1442("anchorHorizontalAlign?value=right").title)  //"Right"
			Form:C1466.anchorHorizontalAlign.values.push(Get action info:C1442("anchorHorizontalAlign?value=center").title)  //"Center"
			Form:C1466.anchorHorizontalAlign.index:=Form:C1466.pictSettings.anchorHorizontalAlign
			
			//***
			Form:C1466.anchorVerticalAlign:=New object:C1471  // used as dropdown in the dialog
			Form:C1466.anchorVerticalAlign.values:=New collection:C1472()
			
			Form:C1466.anchorVerticalAlign.values.push(Get action info:C1442("anchorVerticalAlign?value=top").title)  // "top"
			Form:C1466.anchorVerticalAlign.values.push(Get action info:C1442("anchorVerticalAlign?value=bottom").title)  //"bottom"
			Form:C1466.anchorVerticalAlign.values.push(Get action info:C1442("anchorVerticalAlign?value=middle").title)  //"middle"
			Form:C1466.anchorVerticalAlign.index:=Form:C1466.pictSettings.anchorVerticalAlign
			
			
			//***
			Form:C1466.anchorLayout:=New object:C1471  // used as dropdown in the dialog
			Form:C1466.anchorLayout.values:=New collection:C1472
			Form:C1466.anchorLayout.anchorValues:=New collection:C1472
			
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=behind").title)
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=front").title)
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=wrapTopBottom").title)
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=wrapSquareLeft").title)
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=wrapSquareRight").title)
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=wrapSquare").title)
			Form:C1466.anchorLayout.values.push(Get action info:C1442("anchorLayout?value=wrapSquareLargest").title)
			
			Form:C1466.anchorLayout.anchorValues.push(wk behind text:K81:240)
			Form:C1466.anchorLayout.anchorValues.push(wk in front of text:K81:241)
			Form:C1466.anchorLayout.anchorValues.push(wk text wrap top bottom:K81:379)
			Form:C1466.anchorLayout.anchorValues.push(wk text wrap square left:K81:382)
			Form:C1466.anchorLayout.anchorValues.push(wk text wrap square right:K81:383)
			Form:C1466.anchorLayout.anchorValues.push(wk text wrap square:K81:380)
			Form:C1466.anchorLayout.anchorValues.push(wk text wrap square largest:K81:384)
			
			Form:C1466.anchorLayout.index:=Form:C1466.anchorLayout.anchorValues.indexOf(Form:C1466.pictSettings[wk anchor layout:K81:227])
			
			
			//***
			Form:C1466.anchorOrigin:=New object:C1471
			Form:C1466.anchorOrigin.values:=New collection:C1472
			Form:C1466.anchorOrigin.originValues:=New collection:C1472
			
			Form:C1466.anchorOrigin.values.push(Get action info:C1442("anchorOrigin?value=paper-box").title)  //"Paper"
			Form:C1466.anchorOrigin.values.push(Get action info:C1442("anchorOrigin?value=header-box").title)  //"Header"
			Form:C1466.anchorOrigin.values.push(Get action info:C1442("anchorOrigin?value=footer-box").title)  //"Footer"
			
			Form:C1466.anchorOrigin.originValues.push(wk paper box:K81:215)  //3
			Form:C1466.anchorOrigin.originValues.push(wk header box:K81:243)  //0
			Form:C1466.anchorOrigin.originValues.push(wk footer box:K81:244)  //1
			
			Form:C1466.anchorOrigin.index:=Form:C1466.anchorOrigin.originValues.indexOf(Form:C1466.pictSettings[wk anchor origin:K81:235])
			
			
		End if 
		
		If (Form:C1466.pictSettings[wk width:K81:45]#0) & (Form:C1466.pictSettings[wk height:K81:46]#0)
			Form:C1466.display.pictureRatioLocked:=False:C215
		Else 
			Form:C1466.display.pictureRatioLocked:=True:C214
		End if 
		
		GOTO OBJECT:C206(*; "")
		
		WP_PictureSaveSettings("save")
		
		Form:C1466.display.UI_WindowResized:=False:C215
		UI_PictureSettings
		//SET TIMER(-1)
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		UI_PictureSettings
		WP_ApplyPictureSettings
		
	: (Form event code:C388=On Data Change:K2:15)
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Validate:K2:3)
		
		WP_ApplyPictureSettings
		
End case 
