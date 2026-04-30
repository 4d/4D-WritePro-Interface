property _multiLevelListsTemplates : Collection
property _document : Object

property _withSyleSheetsAsCollection:=True:C214

singleton shared Class constructor
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get area() : Object
	
	return Form:C1466.area
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get document() : 4D:C1709.WriteDocument
	
	return Form:C1466.document || This:C1470.selection.owner
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get selection() : cs:C1710._range
	
	return Form:C1466.selection
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get paragraph() : cs:C1710._range
	
	return WP Paragraph range:C1346(This:C1470.selection)
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get isToolbar() : Boolean
	
	return (Current form name:C1298="WP_Toolbar")
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get isPalette() : Boolean
	
	return Not:C34(This:C1470.isToolbar)
	
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
	
	// MARK:- STYLE SHEETS
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get styleSheets() : Collection
	
	return WP Get style sheets:C1655(This:C1470.area; wk type paragraph:K81:191).combine(WP Get style sheets:C1655(This:C1470.area; wk type character:K81:296))
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get orderedStyleSheets() : Collection
	
	return This:C1470.styleSheets.orderBy("name")
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function newStyleSheet($name : Text; $type : Integer; $levelCount : Integer) : Object
	
	If ($levelCount>0)
		
		return WP New style sheet:C1650(This:C1470.document; $type; $name; $levelCount)
		
	Else 
		
		return WP New style sheet:C1650(This:C1470.document; $type; $name)
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function selectedStyleSheetIndex() : Integer
	
	If (This:C1470._withSyleSheetsAsCollection)
		
		return Form:C1466.styleSheets.index
		
	Else 
		
		var $ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5; "LB_StyleSheets")  // In palette
		var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")  // I toolbar
		
		If (Is nil pointer:C315($ptrListbox))  // From toolbar
			
			return $ptrStylesheetNames->
			
		Else   // From palette
			
			return Find in array:C230($ptrListbox->; True:C214)  // Index
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function selectedStyleSheetName() : Text
	
	If (This:C1470._withSyleSheetsAsCollection)
		
		return Form:C1466.styleSheets.currentValue
		
	Else 
		
		var $ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5; "LB_StyleSheets")  // In palette
		var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")  // I toolbar
		
		If (Is nil pointer:C315($ptrListbox))  // From toolbar
			
			var $indx:=$ptrStylesheetNames->
			
		Else   // From palette
			
			$indx:=Find in array:C230($ptrListbox->; True:C214)  // Index
			
		End if 
		
		If ($indx>0)
			
			//%W-533.3
			return $ptrStylesheetNames->{$indx}
			//%W+533.3
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function updateListOfStyleSheets()
	
	var $selectedType:=This:C1470.selectedSyleSheetType()  // 0 = Paragraph, 1 = Font, 6 = List
	var $type:=This:C1470.selectedSyleSheetType(True:C214)
	
	var $c:=$selectedType=1 ? WP Get style sheets:C1655(This:C1470.document; wk type character:K81:296) : WP Get style sheets:C1655(This:C1470.document; $type)
	
	Case of 
			
			// ______________________________________________________
		: ($selectedType=0)  // Paragraph
			
			$c:=$c.query("listLevelCount = 0").orderBy("name")
			
			// ______________________________________________________
		: ($selectedType=6)  // Hierarhical list
			
			$c:=$c.query("listLevelCount != 0").orderBy("name")
			
			// ______________________________________________________
	End case 
	
	If (This:C1470._withSyleSheetsAsCollection)
		
		OBJECT SET VISIBLE:C603(*; "Stylesheet_Names"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Stylesheet_Names1"; True:C214)
		
		
		If (This:C1470.isToolbar)
			
			Form:C1466.styleSheets.data:=$c
			Form:C1466.styleSheets.values:=$c.extract("name")
			Form:C1466.styleSheets.index:=-1
			Form:C1466.styleSheets.currentValue:=""
			
		Else 
			
			Form:C1466.styleSheets:=$c
			
		End if 
		
		//Form.styleSheets:={}
		
		
	Else 
		
		OBJECT SET VISIBLE:C603(*; "Stylesheet_Names1"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Stylesheet_Names"; True:C214)
		
		var $ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
		COLLECTION TO ARRAY:C1562($c; $ptr->; "name")
		
	End if 
	
	//WP_GetStyleSheet
	This:C1470.getCurrentStyleSheet()
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function getCurrentStyleSheet()
	
	var $selectedType:=This:C1470.selectedSyleSheetType()  // 0 = Paragraph, 1 = Font, 6 = List
	var $type:=This:C1470.selectedSyleSheetType(True:C214)
	
	Case of 
			
			// ________________________________________________________________________________
		: ($type=wk type default:K81:190)  // Character
			
			var $range:=This:C1470.selection
			
			// ________________________________________________________________________________
		: ($type=wk type paragraph:K81:191)
			
			$range:=WP Paragraph range:C1346(This:C1470.selection)
			
			// ________________________________________________________________________________
	End case 
	
	If (OB Is empty:C1297($range))
		
		return 
		
	End if 
	
	// MARK:- Update the list of style sheets
	var $c:=WP Get style sheets:C1655(This:C1470.document; $type)
	
	If ($type=wk type paragraph:K81:191)
		
/* 📌 Requirement #21272
		
When the "Paragraph style sheets" button is active 
(which means the "Multi-level style sheets" button is deactivated), 
then the dropdown list shall contain only the paragraph style sheets that are not multi-level style sheets
		
*/
		
		var $isList:=$selectedType=6
		
		If ($isList)  // Keep only list style sheets
			
			$c:=$c.query("listStyleType != null AND name != normal")
			
		Else   // Keep only paragraphe style sheets
			
			If (This:C1470._withSyleSheetsAsCollection)
				
				// Save the "Normal" style 
				var $normal_ : Object:=$c.query("listStyleType = 0").first()
				
			Else 
				
				// Save the name of the "Normal" style sheet
				var $normal : Text:=$c.query("listStyleType = 0").first().name
				
			End if 
			
			$c:=$c.query("listStyleType = null")
			
		End if 
		
		If (This:C1470._withSyleSheetsAsCollection)
			
			$c:=$c.orderBy("name")
			
		Else 
			
			$c:=$c.extract("name").sort
			
		End if 
		
		If ($isList)
			
/* 📌 Requirement #21240
			
In the style sheets dropdown list, there shall be 5 pre-defined multi-level style sheets (templates) 
for the user to choose from
			
*/
			
			var $template:=This:C1470.multiLevelListsTemplates
			
			If ($template.length>0)
				
/*  📌 Requirement #21247
				
In the style sheets dropdown list, the multi-level style sheets shall be divided into 2: 
• the ones defined in the WP document at the top, 
• and the templates at the bottom
				
*/
				
				If ($c.length>0)
					
					If (This:C1470._withSyleSheetsAsCollection)
						
						$c.push({name: "TEMPLATES"; separator: True:C214})
						
					Else 
						
						$c.push("-")
						
					End if 
				End if 
				
				var $o : Object
				
				For each ($o; $template)
					
					If (This:C1470._withSyleSheetsAsCollection)
						
						// /*$c.push({name: " "+$o.name})*/
						$c.push({name: $o.name; template: True:C214})
						
					Else 
						
						$c.push($o.name)
						
					End if 
				End for each 
			End if 
			
		Else 
			
			If (This:C1470._withSyleSheetsAsCollection)
				
				$c.push($normal_)
				
			Else 
				
				$c.push($normal)
				
			End if 
		End if 
		
		If (This:C1470._withSyleSheetsAsCollection)
			
			If (This:C1470.isToolbar)
				
				Form:C1466.styleSheets.data:=$c
				Form:C1466.styleSheets.values:=$c.extract("name")
				
			Else 
				
				Form:C1466.styleSheets:=$c
				
			End if 
			
		Else 
			
			var $stylesheet_Names:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
			COLLECTION TO ARRAY:C1562($c; $stylesheet_Names->)
			
		End if 
	End if 
	
	var $styleSheet : Object
	WP Get attributes:C1345($range; wk style sheet:K81:63; $styleSheet)
	
	If ($styleSheet=Null:C1517)
		
		return   // <NOTHING MORE TO DO>
		
	End if 
	
	// MARK:- Select the current style sheet if ny
	var $name : Text:=$styleSheet.name
	
	If (This:C1470.isToolbar)
		
		If (This:C1470._withSyleSheetsAsCollection)
			
			If ($c.indices("name = :1"; $name).length>0)
				
				Form:C1466.styleSheets.index:=$c.indices("name = :1"; $name).first()
				
			Else 
				
				Form:C1466.styleSheets.index:=-1
				Form:C1466.styleSheets.currentValue:=""
				
			End if 
			
		Else 
			
			var $pos:=Find in array:C230($stylesheet_Names->; $name)
			$pos:=$pos>0 ? $pos : 0
			$stylesheet_Names->:=$pos
			
		End if 
		
	Else 
		
		If (This:C1470._withSyleSheetsAsCollection)
			
			Form:C1466.styleSheets:=Form:C1466.styleSheets
			
			If ($c.indices("name = :1"; $name).length>0)
				
				LISTBOX SELECT ROW:C912(*; "LB_StyleSheets1"; $c.indices("name = :1"; $name).first()+1; lk replace selection:K53:1)
				
			Else 
				
				LISTBOX SELECT ROW:C912(*; "LB_StyleSheets1"; 0; lk remove from selection:K53:3)
				
			End if 
			
		Else 
			
			$pos:=Find in array:C230($stylesheet_Names->; $name)
			$pos:=$pos>0 ? $pos : 0
			LISTBOX SELECT ROW:C912(*; "LB_StyleSheets"; $pos; $pos=0 ? lk remove from selection:K53:3 : lk replace selection:K53:1)
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function selectedSyleSheetType($main : Boolean) : Integer
	
	var $selectedType : Integer:=formData.styleSheet.btnType.indexOf(1)
	
	If ($main)
		
		Case of 
				//______________________________________________________
			: ($selectedType=0)\
				 || ($selectedType=6)
				
				return wk type paragraph:K81:191
				
				//______________________________________________________
			: ($selectedType=1)
				
				return wk type default:K81:190
				
				//______________________________________________________
			Else 
				
				return $selectedType+1
				
				//______________________________________________________
		End case 
		
	Else 
		
		return $selectedType
		
	End if 
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function get normalStyleSheet() : Object
	
	return WP Get style sheet:C1656(This:C1470.document; "Normal")
	
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
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function copyStyleSheetAtributes($source : 4D:C1709.WriteStyleSheet; $target : 4D:C1709.WriteStyleSheet)
	
	cs:C1710._tools.me.copyAttributes($source; $target; \
		["name"; "owner"; "type"; "listLevelCount"; "listLevelIndex"; "listRootStyle"])
	
	// === === === === === === === === === === === === === === === === === === === === === === === === === === === ===
Function styleSheetMetaInfoExpression($item : Object) : Object
	
	
	var $meta:=New object:C1471
	
	If (Bool:C1537($item.template))  //ID is an attribute of collection objects/entities
		
		//$meta.stroke:="purple"
		$meta.cell:=New object:C1471("name"; New object:C1471("stroke"; "orange"))
		
	Else 
		
		$meta.cell:=New object:C1471("name"; New object:C1471("stroke"; "red"))
		
	End if 
	
	
	
/*
var $meta:={stroke: "red"}
	
Case of 
	
//______________________________________________________
: (Bool($item.separator))
	
//$meta.cell.name.disabled:=True
//$meta.unselectable:=True
	
//______________________________________________________
: (Bool($item.template))
	
//$meta.cell.name.fontStyle="italic"
//$meta.cell.name.textDecoration="underline"
	
//______________________________________________________
Else 
	
// A "Case of" statement should never omit "Else"
	
//______________________________________________________
End case 
*/
	
	
	return $meta
	
	
	// MARK:-
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