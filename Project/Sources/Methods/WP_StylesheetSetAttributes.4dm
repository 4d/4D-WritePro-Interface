//%attributes = {"invisible":true}
#DECLARE($o : Object)

If (Form:C1466.document=Null:C1517)
	
	return 
	
End if 

var $source : Object:=$o.from
var $target : Object:=$o.to
var $removeFromSource : Boolean:=$o.remove#Null:C1517 ? $o.remove : False:C215
var $checkNormal : Boolean:=($target.name#"Normal")

// var $normal:=WP Get style sheet(Form.document; "Normal")
var $normal:=cs:C1710._ui.me.normalStyleShet

var $updateList:=[]  // Global list of objects (attributes + values) to update into the target style sheet

var $item : Object
For each ($item; $o.list)  // Only contains attribute NAMES, VALUES will be added (or not)
	
	var $stackList:=[]  // Sublist of attributes
	var $exit:=False:C215
	var $sameAsNormal:=True:C214  // Assume all properties have same values as in "Normal"
	
	var $property : Text
	For each ($property; $item.properties) While (Not:C34($exit))  // Collection of properties
		
		var $stackItem:={\
			action: ""; \
			property: $property}
		
		If ($checkNormal)
			
			var $checkValue:=False:C215  // To avoid mixed or empty values
			
			If ($source[$property]#Null:C1517)  // Does the property exist in "Source" ?
				
				If ($normal[$property]#Null:C1517)  // Does the property exist in "Normal" ?
					
					// Is comparaison possible ?
					$stackItem.value:=$source[$property]
					
					// Exception for wk background color ********* exception **********
					If ($property=wk background color:K81:20)
						
						If ($stackItem.value=-1)  // Transparent
							
							var $paragraph:=WP Paragraph range:C1346($source)
							$stackItem.value:=$paragraph[$property]
							
						End if 
					End if 
					
					var $type:=Value type:C1509($normal[$property])
					
					Case of 
							
							// ________________________________________________________________________________
						: ($type=Is real:K8:4)\
							 || ($type=Is text:K8:3)\
							 || ($type=Is boolean:K8:9)  // Let's compare text and numeric
							
							If ($stackItem.value#$normal[$property])
								
								$sameAsNormal:=False:C215
								$checkValue:=True:C214
								
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
							
							// Should never happend
							// ? what other type cases ?
							
							// ________________________________________________________________________________
					End case 
					
				Else 
					
					// The property does NOT exist in "normal"
					// This may hapend with background image
					If ($stackItem.property=wk background image:K81:21)
						
						$sameAsNormal:=False:C215
						$checkValue:=False:C215
						$stackItem.value:=$source[$property]
						
					End if 
					
					// It may also hapend with keep with next
					If ($stackItem.property=wk keep with next:K81:366)
						
						$sameAsNormal:=False:C215  // •••
						$checkValue:=False:C215
						$stackItem.value:=$source[$property]
						
					End if 
				End if 
				
			Else 
				
				// Should never happend, the source SHOULD have this property
				// Anyway if the source does not have it, the style sheet won't have it either
				
			End if 
			
		Else   // NO (don't compare with "Normal")
			
			$sameAsNormal:=False:C215
			$stackItem.value:=$source[$property]
			$checkValue:=True:C214
			
		End if 
		
		If ($checkValue)
			
			Case of 
					
					// ________________________________________________________________________________
				: (Value type:C1509($stackItem.value)=Is real:K8:4) && ($stackItem.value=wk mixed:K81:89)
					
					$exit:=True:C214
					
					// ________________________________________________________________________________
				: (Value type:C1509($stackItem.value)=Is text:K8:3) && (Length:C16($stackItem.value)=0)
					
					$exit:=True:C214
					
					// ________________________________________________________________________________
				: ($stackItem.value#Null:C1517)
					
					// <NOTHING MORE TO DO>
					
					// ________________________________________________________________________________
				Else 
					
					// Should NOT happend either
					// Forgotten type ?
					TRACE:C157
					
					// ________________________________________________________________________________
			End case 
		End if 
		
		$stackList.push($stackItem)  // May never be used if everything is equal
		
	End for each 
	
	If ($exit)  // Some wk mixed found, do nothing
		
		continue
		
	End if 
	
	var $action:=$sameAsNormal ? "remove" : "add"
	
	For each ($item; $stackList)
		
		$item.action:=$action
		
	End for each 
	
	// Push $stackList into $updateList
	$updateList.combine($stackList)
	
End for each 

// MARK:- Apply in style sheet
For each ($item; $updateList)
	
	Case of 
			
			// ________________________________________________________________________________
		: ($item.action="add")  // Must add or update in the style sheet
			
			If (Not:C34(Undefined:C82($item.value)))
				
				If ($target.name="normal")\
					 && ($item.property=wk keep with next:K81:366)
					
					// Wk keep with next can NOT be aoosciated with "normal" style sheet
					
				Else 
					
					Try
						
						WP SET ATTRIBUTES:C1342($target; $item.property; $item.value)
						
					Catch
						
						ASSERT:C1129(Structure file:C489#Structure file:C489(*))
						
					End try
				End if 
				
				If ($removeFromSource)
					
					Try
						
						WP RESET ATTRIBUTES:C1344($source; $item.property)  // Remove from character source
						
					Catch
						
						ASSERT:C1129(Structure file:C489#Structure file:C489(*))
						
					End try
					
					If ($target.type=wk type paragraph:K81:191)
						
						Try
							
							WP RESET ATTRIBUTES:C1344(WP Paragraph range:C1346($source); $item.property)  // Extend to § to remove attribute from paragraph too
							
						Catch
							
							ASSERT:C1129(Structure file:C489#Structure file:C489(*))
							
						End try
					End if 
				End if 
			End if 
			
			// ________________________________________________________________________________
		: ($item.action="remove")
			
			Try
				
				WP RESET ATTRIBUTES:C1344($target; $item.property)
				
			Catch
				
				ASSERT:C1129(Structure file:C489#Structure file:C489(*))
				
			End try
			
			// ________________________________________________________________________________
	End case 
End for each 