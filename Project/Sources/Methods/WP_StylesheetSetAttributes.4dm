//%attributes = {"invisible":true}
C_OBJECT:C1216($1; $o)

C_BOOLEAN:C305($removeFromSource)
C_BOOLEAN:C305($checkNormal; $checkValue)
C_BOOLEAN:C305($exit)
C_BOOLEAN:C305($sameAsNormal)

C_COLLECTION:C1488($_attributes)
C_COLLECTION:C1488($updateList)
C_COLLECTION:C1488($stackList)

C_LONGINT:C283($type)

C_OBJECT:C1216($item)
C_OBJECT:C1216($source)
C_OBJECT:C1216($paragraph)
C_OBJECT:C1216($target)
C_OBJECT:C1216($document)
C_OBJECT:C1216($normal)
C_OBJECT:C1216($stackItem)

C_TEXT:C284($action)
C_TEXT:C284($property)
C_TEXT:C284($jsonSource; $jsonNormal)

$o:=$1

$_attributes:=$o.list
$source:=$o.from
$target:=$o.to


If ($o.remove#Null:C1517)
	$removeFromSource:=$o.remove
Else 
	$removeFromSource:=False:C215
End if 

$checkNormal:=($target.name#"Normal")

$document:=Form:C1466.document
If (Form:C1466.document#Null:C1517)
	
	$normal:=WP Get style sheet:C1656($document; "Normal")
	
	$updateList:=New collection:C1472  // global list of objects (attributes + values) to update into the target style sheet
	
	//$object:=New object
	For each ($item; $_attributes)  // only contains attribute NAMES, VALUES will be added (or not)
		
		$stackList:=New collection:C1472  //sublist of attributes
		$exit:=False:C215
		
		$sameAsNormal:=True:C214  // assume all properties have same values as in "Normal"
		
		For each ($property; $item.properties) While (Not:C34($exit))  // collection of properties
			
			$stackItem:=New object:C1471
			$stackItem.action:=""
			$stackItem.property:=$property
			
			If ($checkNormal=True:C214)  // & ($property#wk background color)  // YES
				
				$checkValue:=False:C215  // to avoid mixed or empty values
				
				If ($source[$property]#Null:C1517)  // does the property exist in "Source" ?
					If ($normal[$property]#Null:C1517)  // does the property exist in "Normal" ?
						
						// is comparaison possible ?
						$stackItem.value:=$source[$property]
						
						// exception for wk background color   *********  exception  **********
						If ($property=wk background color:K81:20)
							If ($stackItem.value=-1)  // transparent
								$paragraph:=WP Paragraph range:C1346($source)
								$stackItem.value:=$paragraph[$property]
							End if 
						End if 
						
						
						$type:=Value type:C1509($normal[$property])
						
						Case of 
							: ($type=Is real:K8:4) | ($type=Is text:K8:3) | ($type=Is boolean:K8:9)  // let's compare text and numeric
								
								If ($stackItem.value#$normal[$property])
									$sameAsNormal:=False:C215  //••• 
									$checkValue:=True:C214  //••• 
								End if 
								
							: ($type=Is object:K8:27) | ($type=Is collection:K8:32)  // let's compare obejcts and collections
								
								$jsonSource:=JSON Stringify:C1217($source[$property])
								$jsonNormal:=JSON Stringify:C1217($normal[$property])
								If ($jsonSource#$jsonNormal)
									$sameAsNormal:=False:C215  //••• 
									$checkValue:=False:C215
								End if 
								
							Else 
								// should never happend
								// ? what other type cases ?  
						End case 
						
					Else   // the property does NOT exist in "normal"
						
						
						//  this may hapend with background image
						If ($stackItem.property=wk background image:K81:21)
							$sameAsNormal:=False:C215  //••• 
							$checkValue:=False:C215
							$stackItem.value:=$source[$property]
						End if 
						
						// it may also hapend with keep with next
						If ($stackItem.property=wk keep with next:K81:366)
							$sameAsNormal:=False:C215  //••• 
							$checkValue:=False:C215
							$stackItem.value:=$source[$property]
						End if 
						
					End if 
					
				Else 
					
					// should never happend, the source SHOULD have this property
					//anyway if the source does not have it, the style sheet won't have it either
					
				End if 
				
			Else   // NO (don't compare with "Normal")
				
				$sameAsNormal:=False:C215  //••• 
				$stackItem.value:=$source[$property]
				$checkValue:=True:C214
				
			End if 
			
			
			If ($checkValue)
				Case of 
						
					: (Value type:C1509($stackItem.value)=Is real:K8:4)
						If ($stackItem.value=wk mixed:K81:89)
							$exit:=True:C214
						End if 
						
					: (Value type:C1509($stackItem.value)=Is text:K8:3)
						If ($stackItem.value="")
							$exit:=True:C214
						End if 
						
					: ($stackItem.value#Null:C1517)
						// ok
						
					Else 
						// should NOT happend either
						// forgotten type ?
				End case 
				
			End if 
			
			$stackList.push($stackItem)  // may never be used if everything is equal
			
		End for each 
		
		If ($exit=False:C215)
			
			If ($sameAsNormal=True:C214)
				$action:="remove"  // all properties of the sub-collection must be added
			Else 
				$action:="add"  // all properties of the sub-collection must be removed
			End if 
			
			For each ($item; $stackList)
				$item.action:=$action
			End for each 
			
			// push $stackList into $updateList
			$updateList.combine($stackList)
		Else 
			// some wk mixed found, do nothing
		End if 
		
	End for each 
	
	// APPLY in STYLE SHEET
	
	//If ($target.type=wk type paragraph)
	//$removeTarget:=WP Paragraph range($source)  // extend to § to remove attribute
	//Else 
	//$removeTarget:=$source
	//End if 
	
	For each ($item; $updateList)
		
		Case of 
			: ($item.action="Add")  // must add or update in the style sheet
				If (Not:C34(Undefined:C82($item.value)))
					
					If ($target.name="normal") & ($item.property=wk keep with next:K81:366)
						// wk keep with next can NOT be aoosciated with "normal" style sheet
					Else 
						WP SET ATTRIBUTES:C1342($target; $item.property; $item.value)
					End if 
					
					If ($removeFromSource)
						
						//WP RESET ATTRIBUTES($removeTarget;$item.property)  // must be removed from text when in the stylesheet itself 
						
						WP RESET ATTRIBUTES:C1344($source; $item.property)  // remove from character source
						If ($target.type=wk type paragraph:K81:191)
							WP RESET ATTRIBUTES:C1344(WP Paragraph range:C1346($source); $item.property)  // extend to § to remove attribute from paragraph too
						End if 
						
					End if 
				Else 
					
				End if 
				
			: ($item.action="Remove")
				
				WP RESET ATTRIBUTES:C1344($target; $item.property)
				
		End case 
		
	End for each 
	
Else 
	
End if 
