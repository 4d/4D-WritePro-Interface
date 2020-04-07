//%attributes = {"invisible":true}
C_BOOLEAN:C305($apply)
C_LONGINT:C283($page)

C_OBJECT:C1216($styleSheet)
C_OBJECT:C1216($normalStyleSheet)
C_OBJECT:C1216($sampleRange)
C_OBJECT:C1216($item)

C_TEXT:C284($category)

C_COLLECTION:C1488($col)

$styleSheet:=Form:C1466.stylesheet
$normalStyleSheet:=WP Get style sheet:C1656(Form:C1466.stylesheet.owner;"Normal")


  // Sample text at the bottom of the form
Case of 
	: ($styleSheet.type=wk type paragraph:K81:191)
		$sampleRange:=WP Paragraph range:C1346(wpStyleSample)
		
	: ($styleSheet.type=wk type default:K81:190)
		$sampleRange:=wpStyleSample
End case 



WP SET ATTRIBUTES:C1342($sampleRange;wk style sheet:K81:63;"Normal")

For ($page;1;3)
	
	$category:=Choose:C955($page;"bug";"fonts";"paragraphs";"margins")
	
	$col:=Form:C1466.tabs[$category]
	
	For each ($item;$col)
		If (Not:C34(OB Is empty:C1297($item)))
			If ($styleSheet[$item.property]#Null:C1517) & ($item.check=False:C215)
				
				If (Value type:C1509($item.value)=Is real:K8:4)
					If ($item.value#wk mixed:K81:89)
						$apply:=True:C214
					Else 
						$apply:=False:C215
					End if 
				Else 
					$apply:=True:C214
				End if 
				If ($apply)
					WP SET ATTRIBUTES:C1342($sampleRange;$item.property;$item.value)
				End if 
			End if 
		End if 
	End for each 
	
End for 
