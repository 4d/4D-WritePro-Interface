
Class constructor($allButtonNames : Collection; $container : Text)
	
	
	This:C1470.allButtonNames:=$allButtonNames  // will never change  ACI0101694
	This:C1470.buttonNames:=$allButtonNames  // Based on visible tabs only
	
	This:C1470.buttonsWidth:=80
	This:C1470.buttonsHeight:=20
	
	This:C1470.buttonMargins:=New object:C1471
	This:C1470.buttonMargins.left:=5
	This:C1470.buttonMargins.top:=5
	This:C1470.buttonMargins.right:=5
	This:C1470.buttonMargins.bottom:=5
	
	This:C1470.labelMargins:=New object:C1471
	This:C1470.labelMargins.left:=2
	This:C1470.labelMargins.top:=0
	This:C1470.labelMargins.right:=2
	This:C1470.labelMargins.bottom:=0
	
	This:C1470.direction:="LeftToRight"
	This:C1470.maxWidth:=0  // = no max width
	This:C1470.maxHeight:=0  // = no max height
	
	This:C1470.bestSize:=True:C214
	This:C1470.container:=""
	This:C1470.rect:=New object:C1471("left"; 0; "top"; 0; "right"; 0; "bottom"; 0)
	This:C1470.bestContainer:=""
	This:C1470.bestRect:=New object:C1471("left"; 0; "top"; 0; "right"; 0; "bottom"; 0)
	
	
	If (FORM Get color scheme:C1761="light")
		
		
		This:C1470.fontColor:=0x00101010  // font color
		This:C1470.backgroundColor:=0x00D8D8D8  // background color
		
		This:C1470.separatorFontColor:=0x00383838  // separator font color
		This:C1470.separatorColor:=0x00B0B0B0  //
		
	Else 
		
		This:C1470.fontColor:=0x00F0F0F0
		This:C1470.backgroundColor:=0x00404040
		
		This:C1470.separatorFontColor:=0x00C8C8C8
		This:C1470.separatorColor:=0x00303030  // 
		
	End if 
	
	If (Count parameters:C259>=2)
		This:C1470.setContainer($container)
	End if 
	
	//This._alignButtons()
	
Function setButtons($_buttons : Collection)
	
	var $button : Text
	
	// 1st : disable ALL tabs 
	For each ($button; This:C1470.allButtonNames)
		OBJECT SET ENABLED:C1123(*; "tabBtn_"+$button+"@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "tabBtn_"+$button+"@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "tabRect_"+$button+"@"; False:C215)
	End for each 
	
	// create new collection where will be added known buttons
	// (unknown buttons shall be ignored)
	This:C1470.buttonNames:=New collection:C1472
	For each ($button; $_buttons)
		If (This:C1470.allButtonNames.indexOf($button)>=0)
			This:C1470.buttonNames.push($button)
			OBJECT SET ENABLED:C1123(*; "tabBtn_"+$button+"@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "tabBtn_"+$button+"@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "tabRect_"+$button+"@"; True:C214)
		End if 
	End for each 
	
	This:C1470._alignButtons()
	
Function setButtonSizes($width : Integer; $height : Integer)
	
	This:C1470.buttonsWidth:=$width
	This:C1470.buttonsHeight:=$height
	
	This:C1470._alignButtons()
	
Function setBestSize($bestSize : Boolean)
	
	This:C1470.bestSize:=$bestSize
	
	This:C1470._alignButtons()
	
Function setButtonMargins($left : Integer; $top : Integer; $right : Integer; $bottom : Integer)
	
	This:C1470.buttonMargins.left:=$left
	This:C1470.buttonMargins.top:=$top
	This:C1470.buttonMargins.right:=$right
	This:C1470.buttonMargins.bottom:=$bottom
	
	This:C1470._alignButtons()
	
Function setLabelMargins($left : Integer; $right : Integer)
	
	This:C1470.labelMargins.left:=$left
	This:C1470.labelMargins.right:=$right
	
	This:C1470._alignButtons()
	
Function setDirection($direction : Text)
	
	This:C1470.direction:=$direction  //  "LeftToRight", "RightToLeft", "TopToBottom", "BottomToTop"
	
	This:C1470._alignButtons()
	
Function setContainer($container : Text)
	
	This:C1470.container:=$container
	
	OBJECT GET COORDINATES:C663(*; This:C1470.container; $x1; $y1; $x2; $y2)
	This:C1470.rect.left:=$x1
	This:C1470.rect.top:=$y1
	This:C1470.rect.right:=$x2
	This:C1470.rect.bottom:=$y2
	
	This:C1470.maxWidth:=$x2-$x1  // 0= no max width
	This:C1470.maxHeight:=$y2-$y1  // 0= no max height
	
	This:C1470._alignButtons()
	
Function setBestContainer($bestContainer : Text)
	
	This:C1470.bestContainer:=$bestContainer
	
	This:C1470._alignButtons()
	
Function setRect($rect : Object)
	
	This:C1470.rect:=$rect  //.left, .top, .right; .bottom
	This:C1470._alignButtons()
	
Function setColors($fontColor : Integer; $backgroundColor : Integer; $separatorFontColor : Integer; $separatorColor : Integer)
	
	This:C1470.fontColor:=$fontColor
	This:C1470.backgroundColor:=$backgroundColor
	This:C1470.separatorFontColor:=$separatorFontColor
	This:C1470.separatorColor:=$separatorColor
	
Function activate($btnName : Text)
	
	var $btn : Text
	
	For each ($btn; This:C1470.allButtonNames)
		OBJECT SET FONT STYLE:C166(*; "tabBtn_"+$btn; Plain:K14:1)
		
		OBJECT SET RGB COLORS:C628(*; "tabRect_"+$btn; This:C1470.separatorColor; This:C1470.separatorColor)
		OBJECT SET RGB COLORS:C628(*; "tabBtn_"+$btn; This:C1470.separatorFontColor; This:C1470.separatorFontColor)
	End for each 
	
	//OBJECT SET FONT STYLE(*; "tabBtn_"+$btnName; Bold) //// Removed ACI0103537 - JAPANESE BUG
	
	OBJECT SET RGB COLORS:C628(*; "tabRect_"+$btnName; This:C1470.backgroundColor; This:C1470.backgroundColor)
	OBJECT SET RGB COLORS:C628(*; "tabBtn_"+$btnName; This:C1470.fontColor; This:C1470.fontColor)
	
Function redraw()
	This:C1470._alignButtons()
	
	//////////////////// PRIVATE FUNCTIONS ///////////////////////////
	
Function _alignButtons
	
	
	var $startX; $startY; $limitX; $limitY : Integer
	var $x1; $y1; $x2; $y2 : Integer
	var $buttonWidth; $buttonHeight; $maxButtonWidth : Integer
	var $isFirst : Boolean
	var $buttonName : Text
	
	// Reset best container sizes to weird values
	This:C1470.bestRect:=New object:C1471("left"; MAXLONG:K35:2; "top"; MAXLONG:K35:2; "right"; -MAXLONG:K35:2; "bottom"; -MAXLONG:K35:2)
	
	Case of 
		: (This:C1470.direction="LeftToRight")
			
			$startX:=This:C1470.rect.left
			$startY:=This:C1470.rect.top
			
			$limitX:=This:C1470.rect.right
			
		: (This:C1470.direction="RightToLeft")
			
			//This.buttonNames:=This.buttonNames.reverse()
			$startX:=This:C1470.rect.right
			$startY:=This:C1470.rect.top
			
			$limitX:=This:C1470.rect.left
			
		: (This:C1470.direction="TopToBottom")
			
			//This.buttonNames:=This.buttonNames.reverse()
			$startX:=This:C1470.rect.left
			$startY:=This:C1470.rect.top
			
			$limitY:=This:C1470.rect.bottom
			
		: (This:C1470.direction="BottomToTop")
			
			$startX:=This:C1470.rect.left
			$startY:=This:C1470.rect.bottom
			
			$limitY:=This:C1470.rect.top
	End case 
	
	
	$maxButtonWidth:=0
	$isFirst:=True:C214
	For each ($buttonName; This:C1470.buttonNames)
		
		If (This:C1470.bestSize)
			OBJECT GET BEST SIZE:C717(*; "tabBtn_"+$buttonName; $buttonWidth; $buttonHeight)
		Else 
			$buttonWidth:=This:C1470.buttonsWidth
		End if 
		
		$buttonWidth:=$buttonWidth+This:C1470.labelMargins.left+This:C1470.labelMargins.right
		If ($buttonWidth>$maxButtonWidth)  // used for culumns
			$maxButtonWidth:=$buttonWidth
		End if 
		
		Case of 
			: (This:C1470.direction="LeftToRight")
				
				
				Repeat 
					
					$x1:=$startX+This:C1470.buttonMargins.left
					$x2:=$startX+This:C1470.buttonMargins.left+$buttonWidth
					$y1:=$startY+This:C1470.buttonMargins.top
					$y2:=$startY+This:C1470.buttonMargins.top+This:C1470.buttonsHeight
					
					ok:=1
					If (This:C1470.maxWidth#0)
						If (($x2+This:C1470.buttonMargins.right)>$limitX)
							If (Not:C34($isFirst))
								//create a new row of buttons
								$startX:=This:C1470.rect.left
								$startY:=$startY+This:C1470.buttonMargins.top+This:C1470.buttonsHeight+This:C1470.buttonMargins.bottom
								ok:=0
								$isFirst:=True:C214
							End if 
						End if 
					End if 
					
					$isFirst:=(ok=0)
				Until (ok=1)
				
				
			: (This:C1470.direction="RightToLeft")
				
				
				Repeat 
					
					$x1:=$startX-(This:C1470.buttonMargins.right+$buttonWidth)
					$x2:=$startX-(This:C1470.buttonMargins.right)
					$y1:=$startY+This:C1470.buttonMargins.top
					$y2:=$startY+This:C1470.buttonMargins.top+This:C1470.buttonsHeight
					
					ok:=1
					If (This:C1470.maxWidth#0)
						If (($x1-This:C1470.buttonMargins.left)<$limitX)
							If (Not:C34($isFirst))
								//new row of buttons
								$startX:=This:C1470.rect.right
								$startY:=$startY+This:C1470.buttonMargins.top+This:C1470.buttonsHeight+This:C1470.buttonMargins.bottom
								ok:=0
							End if 
						End if 
					End if 
					
					$isFirst:=(ok=0)
				Until (ok=1)
				
				
			: (This:C1470.direction="TopToBottom")
				
				Repeat 
					
					$x1:=$startX+(This:C1470.buttonMargins.left)
					$x2:=$startX+(This:C1470.buttonMargins.right+$buttonWidth)
					$y1:=$startY+This:C1470.buttonMargins.top
					$y2:=$startY+This:C1470.buttonMargins.top+This:C1470.buttonsHeight
					
					ok:=1
					If (This:C1470.maxHeight#0)
						If (($y2+This:C1470.buttonMargins.bottom)>$limitY)
							If (Not:C34($isFirst))
								//new column of buttons
								$startX:=$startX+This:C1470.buttonMargins.left+$maxButtonWidth+This:C1470.buttonMargins.right
								$startY:=This:C1470.rect.top
								ok:=0
							End if 
						End if 
					End if 
					
					$isFirst:=(ok=0)
				Until (ok=1)
				
			: (This:C1470.direction="BottomToTop")
				
				Repeat 
					
					$x1:=$startX+(This:C1470.buttonMargins.left)
					$x2:=$startX+(This:C1470.buttonMargins.right+$buttonWidth)
					$y1:=$startY-(This:C1470.buttonMargins.bottom+This:C1470.buttonsHeight)
					$y2:=$startY-This:C1470.buttonMargins.bottom
					
					ok:=1
					If (This:C1470.maxHeight#0)
						If (($y1-This:C1470.buttonMargins.top)<$limitY)
							If (Not:C34($isFirst))
								//new column of buttons
								$startX:=$startX+This:C1470.buttonMargins.left+$maxButtonWidth+This:C1470.buttonMargins.right
								$startY:=This:C1470.rect.bottom
								ok:=0
							End if 
						End if 
					End if 
					
					$isFirst:=(ok=0)
				Until (ok=1)
				
		End case 
		
		OBJECT SET COORDINATES:C1248(*; "tabBtn_"+$buttonName; $x1; $y1; $x2; $y2)
		OBJECT SET COORDINATES:C1248(*; "tabRect_"+$buttonName; $x1; $y1; $x2; $y2+6)
		
		If ($x1<This:C1470.bestRect.left)
			This:C1470.bestRect.left:=$x1
		End if 
		If ($y1<This:C1470.bestRect.top)
			This:C1470.bestRect.top:=$y1
		End if 
		If ($x2>This:C1470.bestRect.right)
			This:C1470.bestRect.right:=$x2
		End if 
		If ($y2>This:C1470.bestRect.bottom)
			This:C1470.bestRect.bottom:=$y2
		End if 
		
		
		Case of 
			: (This:C1470.direction="LeftToRight")
				$startX:=$x2+This:C1470.buttonMargins.right
				
			: (This:C1470.direction="RightToLeft")
				$startX:=$x1-This:C1470.buttonMargins.left
				
			: (This:C1470.direction="TopToBottom")
				$startY:=$y2+This:C1470.buttonMargins.bottom
				
			: (This:C1470.direction="BottomToTop")
				$startY:=$y1-This:C1470.buttonMargins.top
				
		End case 
		
	End for each 
	
	This:C1470.bestRect.left:=This:C1470.bestRect.left-This:C1470.buttonMargins.left
	This:C1470.bestRect.top:=This:C1470.bestRect.top-This:C1470.buttonMargins.top
	This:C1470.bestRect.right:=This:C1470.bestRect.right+This:C1470.buttonMargins.right
	This:C1470.bestRect.bottom:=This:C1470.bestRect.bottom+This:C1470.buttonMargins.bottom
	
	If (This:C1470.bestContainer#"")
		OBJECT SET COORDINATES:C1248(*; This:C1470.bestContainer; This:C1470.bestRect.left; This:C1470.bestRect.top; This:C1470.bestRect.right; This:C1470.bestRect.bottom)
	End if 
	