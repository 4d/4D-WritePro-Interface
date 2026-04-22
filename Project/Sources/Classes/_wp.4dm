property _multiLevelListsTemplates : Collection
property _document : Object

singleton shared Class constructor
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get doc() : Object
	
	return Form:C1466.area
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get document() : Object
	
	This:C1470._document:=This:C1470._document || Form:C1466.selection.owner
	
	return This:C1470._document
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
shared Function get multiLevelListsTemplates() : Collection
	
/* 📌 Requirement #21274
	
There shall be a json file called “multiLevelStyles.json” available in 4D Write Pro Interface Resources/4DWP_MultiLevel folder, 
that will contain the definition of the pre-defined multi-level lists
	
*/
	
	If (This:C1470._multiLevelListsTemplates#Null:C1517)  // Cache
		
		return This:C1470._multiLevelListsTemplates
		
	End if 
	
	This:C1470._multiLevelListsTemplates:=New shared collection:C1527
	
	var $file:=File:C1566("/RESOURCES/4DWP_MultiLevel/multiLevelStyles.json"; *)
	
	If (Not:C34($file.exists))  // Use the built-in templates
		
		$file:=File:C1566(Localized document path:C1105("multiLevelStyles.json"); fk platform path:K87:2)
		
	End if 
	
	If ($file.exists)
		
		var $mutliLevelStyles : Collection:=JSON Parse:C1218($file.getText()).predefinedMultiLevelLists
		
		If ($mutliLevelStyles#Null:C1517)\
			 && ($mutliLevelStyles.length>0)
			
			var $o : Object
			
			For each ($o; $mutliLevelStyles)
				
				This:C1470._multiLevelListsTemplates.push(OB Copy:C1225($o; ck shared:K85:29; This:C1470))
				
			End for each 
		End if 
	End if 
	
	return This:C1470._multiLevelListsTemplates
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get styleSheets() : Collection
	
	var $doc:=This:C1470.doc
	return WP Get style sheets:C1655($doc; wk type paragraph:K81:191).combine(WP Get style sheets:C1655($doc; wk type character:K81:296))
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function request($title : Text; $value : Text; $labelOk : Text; $labelCancel : Text; $placeHolder : Text) : Text
	
	var $formData:={\
		title: Localized string:C991($title) || $title; \
		value: Localized string:C991($value) || $value; \
		labelOk: Localized string:C991($labelOk) || $labelOk; \
		labelCancel: Localized string:C991($labelCancel) || $labelCancel; \
		placeHolder: Localized string:C991($placeHolder) || $placeHolder\
		}
	
	var $formName:="D_Request"
	
	If (Is macOS:C1572)  //& False
		
		var $winRef:=Open form window:C675($formName; Sheet form window:K39:12)
		
	Else 
		
		var $left; $top; $right; $bottom : Integer
		GET WINDOW RECT:C443($left; $top; $right; $bottom)
		
		var $formWidth:=420
		
/*Horizontaly centered in the main window */$left:=(($left+$right)/2)-Int:C8($formWidth/2)
/* Arbitrary 40 pixels from the top */$top+=40
		
		$winRef:=Open form window:C675($formName; Movable form dialog box:K39:8; $left; $top)
		
	End if 
	
	DIALOG:C40("D_Request"; $formData)
	CLOSE WINDOW:C154($winRef)
	
	If (Bool:C1537(OK))
		
		return $formData.value
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function newStyleSheetName($name : Text; $doc : Object; $type : Integer) : Text
	
	$name:=$name || Localized string:C991("requestPlaceHolder")
	$type:=Count parameters:C259>=3 ? $type : wk type paragraph:K81:191
	
	var $title:=Localized string:C991("requestTitle")
	var $okTitle:=Localized string:C991("requestCreateLabel")
	var $cancelTitle:=Localized string:C991("requestCancelLabel")
	var $placeHolder:=Localized string:C991("StyleSheetPlaceHolder")
	
	Repeat 
		
		$name:=This:C1470.request($title; $name; $okTitle; $cancelTitle; $placeHolder)
		
		If (OK=0)
			
			return 
			
		End if 
		
		var $result:=This:C1470.validateStyleSheetName($name; $doc)
		
		If ($result.success)
			
			return $name
			
		Else 
			
			Case of 
					
					//______________________________________________________
				: ($result.error="exists")
					
					ALERT:C41(Replace string:C233(Localized string:C991("aStylesheetWithThatNameAlreadyExists."); "{name}"; $name))
					
					//______________________________________________________
				: ($result.error="invalid")
					
					ALERT:C41(Localized string:C991("invalidStyleSheetName"))
					
					//______________________________________________________
				: ($result.error="empty")
					
					ALERT:C41(Localized string:C991("nameIsMandatory"))
					
					//______________________________________________________
			End case 
		End if 
	Until ($result.success)
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function validateStyleSheetName($name : Text; $doc : Object; $type : Integer) : Object
	
	Case of 
			
			// ______________________________________________________
		: (Length:C16($name)=0)  // Empty name
			
			return {success: False:C215; error: "empty"}
			
			// ______________________________________________________
		: (Position:C15("section"; $name)=1)\
			 | (Not:C34(This:C1470._styleSheetNameFollowsRules($name)))
			
			return {success: False:C215; error: "invalid"}
			
			// ______________________________________________________
		: ($doc=Null:C1517)  // Just verify the validity
			
			return {success: True:C214}
			
			// ______________________________________________________
		Else 
			
			// Verify for uniqueness in the document regardless of the type
			var $styleSheets:=WP Get style sheets:C1655($doc; Count parameters:C259>=3 ? $type : wk type paragraph:K81:191)
			var $unique:=$styleSheets.query("name= :1"; $name).first()=Null:C1517
			
			return $unique\
				 ? {success: True:C214}\
				 : {success: False:C215; error: "exists"}
			
			// ______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function normalizeStyleSheetName($name : Text; $doc : Object; $type : Integer) : Text
	
/*
	
normalizeStyleSheetName ( name {; doc {; type}} ) -> Text
  -> name: Propsed name
  -> doc : Write Pro document whether it is necessary to ensure that names are unique
  -> type: Type of stylesheet to check (paragraph by default if not specified)
  <- Normalized name (empty name if not compliant)
	
The style sheet name must comply with the following rules:
	
- it must start with a letter
- it can then contain alphanumeric characters, space characters, "-" characters or unicode characters >= 128
- it must be unique in the document regardless of the type
- it must not start with "section", which is reserved
- the "_" is replaced by a space and trailing spaces are removed.
	
*/
	
	// Must not start with "section", which is reserved
	If (Position:C15("section"; $name)=1)\
		 || (Length:C16($name)=0)
		
		return 
		
	End if 
	
	$name:=Trim:C1853($name)
	
	var $normalized:=""
	var $i : Integer
	
	For ($i; 1; Length:C16($name); 1)
		
		var $char:=$name[[$i]]
		var $code:=Character code:C91($char)
		
		If ($i=1)
			
			// First character = letter or Unicode character >= 128
			If ($code>=128)\
				 || Match regex:C1019("[A-Za-z]"; $char; 1; *)
				
				$normalized+=$char
				
			End if 
			
		Else 
			
			// Next: alnum, space, “-”, Unicode >=128
			If ($code>=128)\
				 || Match regex:C1019("[A-Za-z0-9 -]"; $char; 1; *)
				
				$normalized+=$char
				
			End if 
		End if 
	End for 
	
	If ($doc=Null:C1517)
		
		return $normalized
		
	End if 
	
	// The name must be unique within the document
	var $allStyleSheets:=WP Get style sheets:C1655($doc; Count parameters:C259>=3 ? $type : wk type paragraph:K81:191)
	
	While ($allStyleSheets.query("name= :1"; $normalized).first()#Null:C1517)
		
		$normalized:=cs:C1710._tools.me.incrementString($normalized)
		
	End while 
	
	return $normalized
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function _styleSheetNameFollowsRules($name : Text) : Boolean
	
/*
	
The style sheet name must comply with the following rules:
	
- it must start with a letter
- it can then contain alphanumeric characters, space characters, "-" characters or unicode characters >= 128
	
*/
	
	$name:=Trim:C1853($name)
	
	var $i : Integer
	
	For ($i; 1; Length:C16($name); 1)
		
		var $char:=$name[[$i]]
		var $code:=Character code:C91($char)
		
		If ($i=1)
			
			// First character = letter or Unicode character >= 128
			If ($code>=128)\
				 || Match regex:C1019("[A-Za-z]"; $char; 1; *)
				
				continue
				
			Else 
				
				return 
				
			End if 
			
		Else 
			
			// Next: alnum, space, “-”, Unicode >=128
			If ($code>=128)\
				 || Match regex:C1019("[A-Za-z0-9 -]"; $char; 1; *)
				
				continue
				
			Else 
				
				return 
				
			End if 
		End if 
	End for 
	
	return True:C214
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function duplicateStyleSheet($source : Object; $name : Text; $doc : Object)
	
	If ($source=Null:C1517) || ($doc=Null:C1517) || (Length:C16($name)=0)
		
		return 
		
	End if 
	
	If ($source.levels#Null:C1517)  // multiLevelStyles
		
		var $length : Integer:=$source.levels.length
		var $style:=WP New style sheet:C1650($doc; wk type paragraph:K81:191; $name; $length)
		
		var $i : Integer
		For ($i; 0; $length-1; 1)
			
			var $level : Object:=$source.levels[$i]
			
			var $attributeName : Text
			
			For each ($attributeName; $level)
				
				var $attributValue : Variant:=$level[$attributeName]
				
				If (["listStyleType"].includes($attributeName))
					
					If (Value type:C1509($attributValue)=Is text:K8:3)
						
						If (Position:C15("wk "; $attributValue)=0)
							
							$attributValue:="wk "+$attributValue
							
						End if 
						
						$attributValue:=Formula from string:C1601($attributValue).call()
						
					End if 
				End if 
				
				var $targetLevel : Object:=WP Get style sheet:C1656($doc; $name; $i+1)
				WP SET ATTRIBUTES:C1342($targetLevel; $attributeName; $attributValue)
				
			End for each 
		End for 
		
	Else 
		
		// TODO: Other style-sheets
		
	End if 
	
	
	
	
	
	
	
	