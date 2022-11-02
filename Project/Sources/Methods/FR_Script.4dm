//%attributes = {"invisible":true}
var $1; $action : Text

var $options; $nbOccurences : Integer
var $range; $target : Object
var $rangeCollection : Collection


var $0 : Integer  // nb of occurences found


$action:=$1
$options:=0

If (Not:C34(oForm.FR.caseSensitive))
	$options:=$options+wk case insensitive:K81:329
End if 

If (Not:C34(oForm.FR.diacriticSensitive))
	$options:=$options+wk diacritic insensitive:K81:330
End if 

If (Not:C34(oForm.FR.kanaSensitive))
	$options:=$options+wk kana insensitive:K81:331
End if 

If (Not:C34(oForm.FR.widthSensitive))
	$options:=$options+wk width insensitive:K81:332
End if 

If (oForm.FR.fullWord)
	$options:=$options+wk whole word:K81:333  //ak whole word (32) 
End if 

If (oForm.FR.keepCharStyle=True:C214)
	$options:=$options+wk keep character style:K81:337  //wk keep character style (262144)
End if 

If (oForm.FR.keyboardBased)
	$options:=$options+wk use keyboard language:K81:338
End if 

// TARGET

If (oForm.FR.includeHeadersAndFooters=True:C214)  // full document
	$target:=Form:C1466.document
Else 
	$target:=Form:C1466.body
End if 


Case of 
		
	: ($action="findAll")  // only for occurences info
		
		$rangeCollection:=WP Find all:C1755($target; oForm.FR.find; $options)
		$nbOccurences:=$rangeCollection.length
		
	: ($action="find@")
		
		Case of 
				
			: ($action="findNext")
				$range:=WP Find next:C1764($target; Form:C1466.selection; oForm.FR.find; $options)
				
			: ($action="findPrevious")
				$range:=WP Find previous:C1765($target; Form:C1466.selection; oForm.FR.find; $options)
				
		End case 
		
		If ($range#Null:C1517)
			CALL FORM:C1391(Current form window:C827; "WP_SelectText"; Form:C1466.areaName; $range)  //Form.selection.start; Form.selection.end)
			Form:C1466.selection:=$range
		Else 
			BEEP:C151
		End if 
		
	: ($action="replaceAll")
		
		$rangeCollection:=WP Find all:C1755($target; oForm.FR.find; $options; oForm.FR.replace)
		
		oForm.FR.replacements:=$rangeCollection.length
		oForm.FR.displayReplacements:=True:C214
		
	: ($action="replace")
		
		//$range:=WP Text range(Form.body; Form.selection.start; Form.selection.end)  // current selection otherwise "replace" is dimmed
		
		$rangeCollection:=WP Find all:C1755(Form:C1466.selection; oForm.FR.find; $options)
		If ($rangeCollection.length>0)
			$range:=$rangeCollection[0]
			$range:=WP Find all:C1755($range; oForm.FR.find; $options; oForm.FR.replace)[0]
			
			CALL FORM:C1391(Current form window:C827; "WP_SelectText"; Form:C1466.areaName; $range)
			Form:C1466.selection:=$range
			
		Else 
			BEEP:C151
		End if 
		
		oForm.FR.replacements:=$rangeCollection.length
		oForm.FR.displayReplacements:=True:C214
End case 

$0:=$nbOccurences

