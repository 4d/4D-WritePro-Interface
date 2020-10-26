//%attributes = {"invisible":true}
C_OBJECT:C1216($1; $param)

var $width : Integer

var $NbButton : Integer
var $buttonName; $formObjectName : Text
var $_ObjectNames : Collection

$param:=$1

//$param.formName
//$param.buttonNames

$_ObjectNames:=New collection:C1472

For each ($buttonName; $param.buttonNames)
	$formObjectName:="tabBtn_"+$buttonName  // add prefix for button name
	
	// check if button exists (it might not exist, the collection list is free…)
	OBJECT GET COORDINATES:C663(*; $formObjectName; $x1; $y1; $x2; $y2)
	If (($x1+$y1+$x2+$y2)#0)
		$_ObjectNames.push($formObjectName)
		
		OBJECT SET VISIBLE:C603(*; $formObjectName; True:C214)
		OBJECT SET ENABLED:C1123(*; $formObjectName; True:C214)
		OBJECT SET FONT STYLE:C166(*; $formObjectName; Bold:K14:2)  // tempo to be sure text fits
	End if 
	
End for each 



If ($param.formName="sidebar")
	oForm.SidebarTabs.setButtons($_ObjectNames)
Else   // "toolbar"
	oForm.ToolbarTabs.setButtons($_ObjectNames)
End if 


