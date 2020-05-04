//%attributes = {"invisible":true}
  //WP_StyleFillEditLB

C_LONGINT:C283($1)

C_BOOLEAN:C305($translate)
C_BOOLEAN:C305($forceCheck)

  //C_TEXT($1;$category)

C_OBJECT:C1216($styleSheet)
C_OBJECT:C1216($tempTarget)
C_OBJECT:C1216($item)
C_OBJECT:C1216($temp)
C_OBJECT:C1216($target)
C_OBJECT:C1216($normalStyleSheet)
C_OBJECT:C1216($val_o)
C_COLLECTION:C1488($col)
C_COLLECTION:C1488($val_c)

C_LONGINT:C283($i)

C_REAL:C285($val_r)

C_TEXT:C284($displayStylesheetValue)
C_TEXT:C284($displayNormalValue;$displayStylesheetValue)
C_TEXT:C284($category)
C_TEXT:C284($val_t)

  //------------------------------------------------------------------------------------------

If (Count parameters:C259=0)
	GET LIST ITEM:C378(_StylesheetTabs;*;$page;$text)  //| *;itemRef;itemText{;sublist;expanded})
Else 
	$page:=$1
End if 

$category:=Choose:C955($page;"bug";"fonts";"paragraphs";"margins")


$styleSheet:=Form:C1466.stylesheet
$normalStyleSheet:=WP Get style sheet:C1656(Form:C1466.stylesheet.owner;"Normal")

$col:=Form:C1466.tabs[$category]

If (Count parameters:C259<2)
	$target:=$styleSheet
	$forceCheck:=False:C215
	
Else 
	
	  // read attributes from SELECTION, not from stylesheet !
	
	Case of 
		: ($styleSheet.type=wk type paragraph:K81:191)
			$target:=WP Paragraph range:C1346(Form:C1466.selection)
			
		: ($styleSheet.type=wk type default:K81:190)
			$target:=Form:C1466.selection
	End case 
	
	If ($styleSheet.name#"Normal")
		$forceCheck:=True:C214  // check if different from "Normal"
	End if 
	
End if 




Form:C1466.edit:=$col

  // 1st pass, ONLY to create check boxes and asign true or false
If (Form:C1466.edit[0].check=Null:C1517)
	For each ($item;$col)
		If (Not:C34(OB Is empty:C1297($item)))  // spacers for interface
			If ($styleSheet[$item.property]#Null:C1517) & ($styleSheet.name#"Normal")  // the property exists in the style sheet
				$item.check:=False:C215
			Else   // the property does NOT exist in the style sheet
				$item.check:=True:C214
			End if 
		End if 
	End for each 
End if 


  // Then read values for each property
For each ($item;$col)
	If (Not:C34(OB Is empty:C1297($item)))  // spacers for interface
		
		For ($i;1;2)  // current style sheet, then "Normal" style sheet
			
			If ($i=1)
				$tempTarget:=$target
			Else 
				$tempTarget:=$normalStyleSheet
			End if 
			
			$temp:=New object:C1471
			
			Case of 
				: ($item.valueType=Is text:K8:3)
					WP GET ATTRIBUTES:C1345($tempTarget;$item.property;$val_t)  // read the value in the style sheet
					$temp.value:=$val_t
				: ($item.valueType=Is real:K8:4)
					WP GET ATTRIBUTES:C1345($tempTarget;$item.property;$val_r)  // read the value in the style sheet
					$temp.value:=$val_r
				: ($item.valueType=Is object:K8:27)
					WP GET ATTRIBUTES:C1345($tempTarget;$item.property;$val_o)  // read the value in the style sheet
					$temp.value:=$val_o
				: ($item.valueType=Is collection:K8:32)
					WP GET ATTRIBUTES:C1345($tempTarget;$item.property;$val_c)  // read the value in the style sheet
					$temp.value:=$val_c
			End case 
			
			If ($i=1)
				$item.value:=$temp.value
			Else 
				$item.normalValue:=$temp.value
			End if 
			
		End for 
		
		If ($item.visibleValue=True:C214)
			
			Case of 
					
				: (Value type:C1509($item.value)=Is collection:K8:32) | (Value type:C1509($item.value)=Is object:K8:27)
					$displayStylesheetValue:=JSON Stringify:C1217($item.value)
					$displayNormalValue:=JSON Stringify:C1217($item.normalValue)
					  //: ($item.property=wk font)
					  //$displayStylesheetValue:=$item.value
					  //ST SET ATTRIBUTES($displayStylesheetValue;ST Start text;ST End text;Attribute font name;$item.value)
					
				: ($item.property=wk text color:K81:64) | ($item.property=wk background color:K81:20) | ($item.property=wk text linethrough color:K81:76) | ($item.property=wk text underline color:K81:74) | ($item.property=wk text shadow color:K81:71) | ($item.property=wk border color:K81:34) | ($item.property=wk border color top:K81:37) | ($item.property=wk border color bottom:K81:38) | ($item.property=wk border color right:K81:36) | ($item.property=wk border color left:K81:35)
					$displayStylesheetValue:="●"  //+String($styleSheet[$item.property])+"●"
					ST SET ATTRIBUTES:C1093($displayStylesheetValue;ST Start text:K78:15;ST End text:K78:16;Attribute text color:K65:7;$item.value)
					ST SET ATTRIBUTES:C1093($displayStylesheetValue;ST Start text:K78:15;ST End text:K78:16;Attribute text size:K65:6;16)
					
					$displayNormalValue:="●"
					ST SET ATTRIBUTES:C1093($displayNormalValue;ST Start text:K78:15;ST End text:K78:16;Attribute text color:K65:7;$item.normalValue)
					ST SET ATTRIBUTES:C1093($displayNormalValue;ST Start text:K78:15;ST End text:K78:16;Attribute text size:K65:6;16)
					
				Else 
					$translate:=True:C214
					Case of 
						: ($item.property=wk text underline style:K81:73)
						: ($item.property=wk text linethrough style:K81:75)
						: ($item.property=wk text transform:K81:70)
						: ($item.property=wk text align:K81:49)
							
						: ($item.property=wk border style:K81:29)
						: ($item.property=wk border style top:K81:32)
						: ($item.property=wk border style bottom:K81:33)
						: ($item.property=wk border style right:K81:31)
						: ($item.property=wk border style left:K81:30)
							
						: ($item.property=wk vertical align:K81:9)
						: ($item.property=wk list style type:K81:55)
						Else 
							$translate:=False:C215
					End case 
					
					If ($translate)
						$displayStylesheetValue:=UI_TranslateConstant ($item.property;$item.value)
						$displayNormalValue:=UI_TranslateConstant ($item.property;$item.normalValue)
					Else 
						
						If (Value type:C1509($item.value)=Is real:K8:4)
							If ($item.value#wk mixed:K81:89)
								$displayStylesheetValue:=String:C10($item.value)
							Else 
								$displayStylesheetValue:=".mixed"
							End if 
						Else 
							$displayStylesheetValue:=String:C10($item.value)
						End if 
						
						If (Value type:C1509($item.normalValue)=Is real:K8:4)
							If ($item.normalValue#wk mixed:K81:89)
								$displayNormalValue:=String:C10($item.normalValue)
							Else 
								$displayNormalValue:=".mixed"
							End if 
						Else 
							$displayNormalValue:=String:C10($item.normalValue)
						End if 
						
					End if 
					
					
			End case 
			
			  //$label:=$item.label
			If (Not:C34($item.check))
				  //ST SET ATTRIBUTES($label;ST Start text;ST End text;Attribute text color;"#202020")
				  //ST SET ATTRIBUTES($label;ST Start text;ST End text;Attribute italic style;1)
				
				  //ST SET ATTRIBUTES($displayStylesheetValue;ST Start text;ST End text;Attribute text color;"#808080")
				  //ST SET ATTRIBUTES($value;ST Start text;ST End text;Attribute italic style;1)
			End if 
			
			$item.displayStylesheetValue:=$displayStylesheetValue
			$item.displayNormalValue:=$displayNormalValue
		Else 
			$item.displayStylesheetValue:=""
			$item.displayNormalValue:=""
		End if 
		
		  //$valueType:=Value type($item.value)
		If ($forceCheck)
			
			If ($item.displayNormalValue#$item.displayStylesheetValue)
				$item.check:=False:C215  // false = do NOT use normal
			End if 
			
		End if 
		
	Else 
		  //Form.edit.push(New object)  // spacers for interface
	End if 
	
End for each 


  //For each ($item;$col)
  //If (Not(OB Is empty($item)))  // spacers for interface
  //If ($item.check)  // use NORMAL
  //$item.display:=$item.displayNormalValue
  //Else   // USE STYLE SHEET
  //$item.display:=$item.displayStylesheetValue
  //End if 
  //End if 
  //End for each 
