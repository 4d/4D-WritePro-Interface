//%attributes = {"invisible":true}
#DECLARE($o : Object)

var $ui:=cs:C1710._ui.me

If ($ui.document=Null:C1517)
	
	return 
	
End if 

var $source : Object:=$o.from
var $target : Object:=$o.to
var $removeFromSource : Boolean:=$o.remove#Null:C1517 ? $o.remove : False:C215
var $checkNormal : Boolean:=($target.name#"Normal")
var $debug:=Structure file:C489#Structure file:C489(*)

// Var $normal:=WP Get style sheet(Form.document; "Normal")
var $normal:=$ui.normalStyleSheet

var $updateList:=[]  // Global list of objects (attributes + values) to update into the target style sheet

var $item : Object

For each ($item; $o.list)  // Only contains attribute NAMES, VALUES will be added (or not)
	
	var $stackList:=[]  // Sublist of attributes
	var $skip:=False:C215
	var $sameAsNormal:=True:C214  // Assume all properties have same values as in "Normal"
	
	var $property : Text
	For each ($property; $item.properties) While (Not:C34($skip))  // Collection of properties
		
		var $stackItem:={\
			action: ""; \
			property: $property}
		
		If ($checkNormal)
			
			var $checkValue:=False:C215  // To avoid mixed or empty values
			
			If ($source[$property]#Null:C1517)  // Does the property exist in "Source" ?
				
				If ($normal[$property]#Null:C1517)  // Does the property exist in "Normal" ?
					
					// Is comparaison possible ?
					$stackItem.value:=$source[$property]
					
					// MARK: Exception for [wk background color] when value is transparent (-1)
					If ($property=wk background color:K81:20)\
						 && ($stackItem.value=-1)  // Transparent
						
						var $paragraph:=WP Paragraph range:C1346($source)
						$stackItem.value:=$paragraph[$property]
						
					End if 
					
					var $type:=Value type:C1509($normal[$property])
					
					Case of 
							
							// ________________________________________________________________________________
						: ($type=Is real:K8:4)\
							 || ($type=Is text:K8:3)\
							 || ($type=Is boolean:K8:9)  // Let's compare text and numeric
							
							If ($property=wk list concat string format:K81:395)
								
								$sameAsNormal:=False:C215
								$checkValue:=False:C215
								$stackItem.value:=$source[$property]
								
							Else 
								
								If ($stackItem.value#$normal[$property])
									
									$sameAsNormal:=False:C215
									$checkValue:=True:C214
									
								End if 
							End if 
							
							// ________________________________________________________________________________
						: ($type=Is object:K8:27)\
							 || ($type=Is collection:K8:32)  // Let's compare objects and collections
							
							var $jsonSource:=JSON Stringify:C1217($source[$property])
							var $jsonNormal:=JSON Stringify:C1217($normal[$property])
							
							If ($jsonSource#$jsonNormal)
								
								$sameAsNormal:=False:C215
								$checkValue:=False:C215
								
							End if 
							
							// ________________________________________________________________________________
						Else 
							
							ASSERT:C1129($debug)  // Should never happend: what other type cases ?
							
							// ________________________________________________________________________________
					End case 
					
				Else 
					
					// The property does NOT exist in "normal"
					// This may hapend with background image or with keep with next
					If ($stackItem.property=wk background image:K81:21)\
						 || ($stackItem.property=wk keep with next:K81:366)
						
						$sameAsNormal:=False:C215
						$checkValue:=False:C215
						$stackItem.value:=$source[$property]
						
					End if 
				End if 
				
			Else 
				
				// MARK: Exception for [wk list concat string] 
				If ($property=wk list concat string format:K81:395)
					
					$sameAsNormal:=False:C215
					$stackItem.value:=$target[$property]
					$checkValue:=True:C214
					
				End if 
			End if 
			
		Else   // NO (don't compare with "Normal")
			
			$sameAsNormal:=False:C215
			$stackItem.value:=$source[$property]
			$checkValue:=True:C214
			
		End if 
		
		Case of 
				
				// ________________________________________________________________________________
			: (Not:C34($checkValue))
				
				// <NOTHING MORE TO DO>
				
				// ________________________________________________________________________________
			: (Value type:C1509($stackItem.value)=Is real:K8:4)\
				 && ($stackItem.value=wk mixed:K81:89)
				
				$skip:=True:C214
				
				// ________________________________________________________________________________
			: (Value type:C1509($stackItem.value)=Is text:K8:3)\
				 && (Length:C16($stackItem.value)=0)
				
				$skip:=True:C214
				
				// ________________________________________________________________________________
			: ($stackItem.value#Null:C1517)
				
				// <NOTHING MORE TO DO>
				
				// ________________________________________________________________________________
			Else 
				
				ASSERT:C1129($debug)  // Should NOT happend either: Forgotten type ?
				
				// ________________________________________________________________________________
		End case 
		
		$stackList.push($stackItem)  // May never be used if everything is equal
		
	End for each 
	
	If ($skip)
		
		continue  // Some wk mixed or ext value empty found, <NOTHING MORE TO DO>
		
	End if 
	
	// MARK: Set action
	var $action:=$sameAsNormal ? "remove" : "add"
	
	For each ($item; $stackList)
		
		$item.action:=$action
		
	End for each 
	
	// Push $stackList into $updateList
	$updateList.combine($stackList)
	
End for each 

// MARK:- Apply in style sheet
For each ($item; $updateList)
	
	Try(IDLE:C311)
	
	Case of 
			
			// ________________________________________________________________________________
		: ($item.action="add")  // Must add or update in the style sheet
			
			If (Undefined:C82($item.value))
				
				continue
				
			End if 
			
			If ($target.name="normal")\
				 && ($item.property=wk keep with next:K81:366)
				
				continue  // Wk keep with next can NOT be aoosciated with "normal" style sheet
				
			End if 
			
			Try(WP SET ATTRIBUTES:C1342($target; $item.property; $item.value))
			
			If ($removeFromSource)  // Remove from character source
				
				Try(WP RESET ATTRIBUTES:C1344($source; $item.property))
				
				If ($target.type=wk type paragraph:K81:191)  // Extend to § to remove attribute from paragraph too
					
					Try(WP RESET ATTRIBUTES:C1344(WP Paragraph range:C1346($source); $item.property))
					
				End if 
			End if 
			
			// ________________________________________________________________________________
		: ($item.action="remove")
			
			Try(WP RESET ATTRIBUTES:C1344($target; $item.property))
			
			// ________________________________________________________________________________
	End case 
End for each 