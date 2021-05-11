Class constructor
	var $1 : Collection
	var $2 : Text
	
	This:C1470.allButtonNames:=$1  // will never change  ACI0101694
	
	This:C1470.buttonNames:=$1  // Based on visible tabs only
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
	If (Count parameters:C259>=2)
		This:C1470.setContainer($2)
	End if 
	
	This:C1470._alignButtons()
	
	
Function setButtons
	var $1 : Collection
	This:C1470.buttonNames:=$1
	
	This:C1470._alignButtons()
	
	
Function setButtonSizes
	var $1; $2 : Integer
	
	This:C1470.buttonsWidth:=$1
	This:C1470.buttonsHeight:=$2
	
	This:C1470._alignButtons()
	
Function setBestSize
	var $1 : Boolean
	
	This:C1470.bestSize:=$1
	
	This:C1470._alignButtons()
	
Function setButtonMargins
	//left-top-right-bottom
	var $1; $2; $3; $4 : Integer
	
	This:C1470.buttonMargins.left:=$1
	This:C1470.buttonMargins.top:=$2
	This:C1470.buttonMargins.right:=$3
	This:C1470.buttonMargins.bottom:=$4
	
	This:C1470._alignButtons()
	
Function setLabelMargins
	//left-right
	var $1; $2 : Integer
	
	This:C1470.labelMargins.left:=$1
	This:C1470.labelMargins.right:=$2
	
	This:C1470._alignButtons()
	
Function setDirection
	var $1 : Text
	
	This:C1470.direction:=$1
	
	This:C1470._alignButtons()
	
Function setContainer
	var $1 : Text
	
	This:C1470.container:=$1
	OBJECT GET COORDINATES:C663(*; This:C1470.container; $x1; $y1; $x2; $y2)
	This:C1470.rect.left:=$x1
	This:C1470.rect.top:=$y1
	This:C1470.rect.right:=$x2
	This:C1470.rect.bottom:=$y2
	
	This:C1470.maxWidth:=$x2-$x1  // 0= no max width
	This:C1470.maxHeight:=$y2-$y1  // 0= no max height
	
	This:C1470._alignButtons()
	
Function setBestContainer
	var $1 : Text
	This:C1470.bestContainer:=$1
	
	This:C1470._alignButtons()
	
Function setRect
	var $1 : Object
	
	This:C1470.rect:=$1  //.left, .top, .right; .bottom
	
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
			OBJECT GET BEST SIZE:C717(*; $buttonName; $buttonWidth; $buttonHeight)
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
		
		OBJECT SET COORDINATES:C1248(*; $buttonName; $x1; $y1; $x2; $y2)
		
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
	
	
	
	