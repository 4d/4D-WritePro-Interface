//%attributes = {"invisible":true}
C_OBJECT:C1216($1; $param)

$param:=$1

C_LONGINT:C283($NbButton)
C_POINTER:C301($DummyPtr)
C_TEXT:C284($buttonName; $formObjectName)

ARRAY TEXT:C222($_ObjectNames; 0)

ARRAY LONGINT:C221($_Height; 2)
ARRAY LONGINT:C221($_Margin; 2)
ARRAY LONGINT:C221($_Space; 2)
ARRAY LONGINT:C221($_MinWidth; 2)

Case of 
	: ($param.formName="toolbar")
		$_Height{1}:=20  //win
		$_Height{2}:=20  //mac
		
		$_Margin{1}:=8  //win 
		$_Margin{2}:=8  //mac
		
		$_Space{1}:=3  //win 
		$_Space{2}:=3  //mac
		
		$_MinWidth{1}:=40  // Win
		$_MinWidth{2}:=40  // Mac
		
	: ($param.formName="sidebar")
		
		$_Height{1}:=20  //win
		$_Height{2}:=20  //mac
		
		$_Margin{1}:=0  //win 
		$_Margin{2}:=0  //mac
		
		$_Space{1}:=1  //win 
		$_Space{2}:=1  //mac
		
		$_MinWidth{1}:=20  // Win
		$_MinWidth{2}:=20  // Mac
		
End case 


For each ($buttonName; $param.buttonNames)
	$formObjectName:="tabBtn_"+$buttonName  // add prefix for button name
	
	// check if button exists (it might not exist, the collection list is free…)
	OBJECT GET COORDINATES:C663(*; $formObjectName; $x1; $y1; $x2; $y2)
	If (($x1+$y1+$x2+$y2)#0)
		APPEND TO ARRAY:C911($_ObjectNames; $formObjectName)
		
		OBJECT SET VISIBLE:C603(*; $formObjectName; True:C214)
		OBJECT SET ENABLED:C1123(*; $formObjectName; True:C214)
		OBJECT SET FONT STYLE:C166(*; $formObjectName; Bold:K14:2)  // tempo to be sure text fits
	End if 
	
End for each 

$NbButton:=Size of array:C274($_ObjectNames)
If ($NbButton>0)
	// 1st set the first button at the top left corder of the "TabArea"
	OBJECT GET COORDINATES:C663(*; "TabArea"; $x1; $y1; $x2; $y2)
	OBJECT SET COORDINATES:C1248(*; $_ObjectNames{1}; $x1; $y1; $x2; $y2)  // full rect but will be resized in a sec.
	
	// then call the usual méthod to line up buttons
	TOOL_WPIAlignButtons(->$_ObjectNames; $DummyPtr; On the left:K39:2; At the top:K39:5; "Horizontal"; "Proportional"; 0; ->$_Height; ->$_Margin; ->$_Space; ->$_MinWidth)
End if 
