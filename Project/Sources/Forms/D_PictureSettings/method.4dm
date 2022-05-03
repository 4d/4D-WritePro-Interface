

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_displayFormatLabels; 0)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=scaledToFit").title)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=truncated").title)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=truncatedCentered").title)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=proportional").title)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=proportionalCentered").title)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=replicated").title)
		APPEND TO ARRAY:C911(_displayFormatLabels; Get action info:C1442("image/scalingMode?value=replicatedCentered").title)
		
		ARRAY TEXT:C222(_displayFormatValues; 0)
		APPEND TO ARRAY:C911(_displayFormatValues; wk scaled to fit:K81:342)  //"scaledToFit")  //wk scaled to fit
		APPEND TO ARRAY:C911(_displayFormatValues; wk truncated:K81:343)  //"truncated")  //wk truncated
		APPEND TO ARRAY:C911(_displayFormatValues; wk truncated centered:K81:344)  // "truncatedCentered")  //wk truncated centered
		APPEND TO ARRAY:C911(_displayFormatValues; wk proportional:K81:345)  //"proportional")  //wk proportional
		APPEND TO ARRAY:C911(_displayFormatValues; wk proportional centered:K81:346)  //"proportionalCentered")  //wk proportional centered)
		APPEND TO ARRAY:C911(_displayFormatValues; wk replicated:K81:347)  //"replicated")  //wk replicated)
		APPEND TO ARRAY:C911(_displayFormatValues; wk replicated centered:K81:348)  //"replicatedCentered")  //wk replicated centered
		
		WP_GetPictureSettings
		
		
		If (Form:C1466.pictSettings.anchored=True:C214)
			
			Form:C1466.display[wk anchor page:K81:231]:=1  // default values
			Form:C1466.display[wk anchor section:K81:228]:=1  // default values
			
			ARRAY TEXT:C222(_anchorHorizontalAlign; 3)
			ARRAY TEXT:C222(_anchorVerticalAlign; 3)
			ARRAY TEXT:C222(_anchorOrigin; 3)
			ARRAY TEXT:C222(_anchorPage; 5)  // 6 ?
			
			ARRAY TEXT:C222(_anchorLayout; 2)
			
			
			_anchorHorizontalAlign{1}:=Get action info:C1442("anchorHorizontalAlign?value=left").title  // "Left"
			_anchorHorizontalAlign{2}:=Get action info:C1442("anchorHorizontalAlign?value=right").title  //"Right"
			_anchorHorizontalAlign{3}:=Get action info:C1442("anchorHorizontalAlign?value=center").title  //"Center"
			_anchorHorizontalAlign:=Form:C1466.pictSettings.anchorHorizontalAlign+1
			
			_anchorVerticalAlign{1}:=Get action info:C1442("anchorVerticalAlign?value=top").title  // "Top"        //0
			_anchorVerticalAlign{2}:=Get action info:C1442("anchorVerticalAlign?value=bottom").title  // "Bottom"  //1
			_anchorVerticalAlign{3}:=Get action info:C1442("anchorVerticalAlign?value=middle").title  // "Middle"  //2
			_anchorVerticalAlign:=Form:C1466.pictSettings.anchorVerticalAlign+1
			
			_anchorOrigin{1}:=Get action info:C1442("anchorOrigin?value=paper-box").title  //"Paper"
			_anchorOrigin{2}:=Get action info:C1442("anchorOrigin?value=header-box").title  //"Header"
			_anchorOrigin{3}:=Get action info:C1442("anchorOrigin?value=footer-box").title  //"Footer"
			
			Case of 
				: (Form:C1466.pictSettings[wk anchor origin:K81:235]=wk paper box:K81:215)  //3
					_anchorOrigin:=1
					
				: (Form:C1466.pictSettings[wk anchor origin:K81:235]=wk header box:K81:243)  //0
					_anchorOrigin:=2
					
				: (Form:C1466.pictSettings[wk anchor origin:K81:235]=wk footer box:K81:244)  //1
					_anchorOrigin:=3
			End case 
			
			
			//*************************************
			
			_anchorPage{1}:=Get action info:C1442("anchorPage?value=all").title  //"All_f"  // wk anchor all-anchors an image to all pages of the section(s)defined by wk anchor section
			_anchorPage{2}:=Get localized string:C991("FirstPage")  // wk anchor first page-anchors an image to the first page subsection of the section(s)defined by wk anchor section
			_anchorPage{3}:=Get localized string:C991("LeftPages")  // wk anchor left page-anchors an image to the left pages subsection of the section(s)defined by wk anchor section
			_anchorPage{4}:=Get localized string:C991("RightPages")  // wk anchor right page-anchors an image to the right pages subsection of the section(s)defined by wk anchor section
			_anchorPage{5}:=Get localized string:C991("PageNumber")  // a number(Longint>=0)indicating which page to anchor the image to.In this case, wk anchor section=wk anchor all.Section anchoring is ignored if an image is anchored to a single page.
			
			
			Case of 
				: (Form:C1466.pictSettings[wk anchor page:K81:231]=wk anchor all:K81:229)
					_anchorPage:=1
				: (Form:C1466.pictSettings[wk anchor page:K81:231]=wk anchor first page:K81:232)
					_anchorPage:=2
				: (Form:C1466.pictSettings[wk anchor page:K81:231]=wk anchor left page:K81:233)
					_anchorPage:=3
				: (Form:C1466.pictSettings[wk anchor page:K81:231]=wk anchor right page:K81:234)
					_anchorPage:=4
				Else 
					_anchorPage:=5
			End case 
			Form:C1466.display.anchorPage:=Form:C1466.pictSettings[wk anchor page:K81:231]  // display (negative = invisible in form)
			
			If (Form:C1466.pictSettings[wk anchor section:K81:228]#wk anchor embedded:K81:230)
				ARRAY TEXT:C222(_anchorSection; 2)
				_anchorSection{1}:=Get action info:C1442("anchorSection?value=all").title  // "All"  // wk anchor all(default)-anchors an image to all sections in a document(image is only visible in page mode)
				_anchorSection{2}:=Get localized string:C991("SectionNumber")  // "Section number"  // a number(Longint>=1)indicating the section to anchor the image to.(image is only visible in page mode)
				
				Case of 
					: (Form:C1466.pictSettings[wk anchor section:K81:228]=wk anchor all:K81:229)
						_anchorSection:=1
					Else 
						_anchorSection:=2
				End case 
				Form:C1466.display.anchorSection:=Form:C1466.pictSettings[wk anchor section:K81:228]
				
			Else 
				ARRAY TEXT:C222(_anchorSection; 0)
				_anchorSection:=0
			End if 
			
			_anchorLayout{1}:=Get action info:C1442("anchorLayout?value=behind").title  // "Behind the text"
			_anchorLayout{2}:=Get action info:C1442("anchorLayout?value=front").title  // "In front of the text"
			
			Case of 
				: (Form:C1466.pictSettings[wk anchor layout:K81:227]=wk behind text:K81:240)  // wk behind text-image is anchored, behind the text
					_anchorLayout:=1
				: (Form:C1466.pictSettings[wk anchor layout:K81:227]=wk in front of text:K81:241)  // wk in front of text - image is anchored, in front of the text
					_anchorLayout:=2
			End case 
			
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
