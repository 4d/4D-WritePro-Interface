Class constructor($formName : Text)
	
	var $file : 4D:C1709.File
	var $lang : Text
	var $dictionnary : Object
	var $validated : Boolean
	
	// DICTIONNARY files
	// get localized names for tables and fields (if any)
	$lang:=Get database localization:C1009(Current localization:K5:22; *)
	$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"4DWP_Wizard/Translations/"+$lang+".json"; *)
	If (Not:C34($file.exists))
		$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"4DWP_Wizard/Translations/en.json"; *)
	End if 
	
	If ($file.exists)
		
		// TEST JSON
		$validated:=This:C1470.JSONvalidate("translate"; New collection:C1472($file))
		
		If ($validated)
			$dictionnary:=JSON Parse:C1218($file.getText())
			
			This:C1470.tables:=$dictionnary.tables.extract("original")
			This:C1470.tablesTranslated:=$dictionnary.tables.extract("translation")
			
			This:C1470.attributes:=$dictionnary.fields.extract("original")
			This:C1470.attributesTranslated:=$dictionnary.fields.extract("translation")
			
			This:C1470.formulas:=$dictionnary.formulas.extract("original")
			This:C1470.formulasTranslated:=$dictionnary.formulas.extract("translation")
			
			This:C1470.fileNames:=$dictionnary.fileNames.extract("original")
			This:C1470.fileNamesTranslated:=$dictionnary.fileNames.extract("translation")
		End if 
	End if 
	
	
	// TEMPLATE files based on existing json files (if any)
	This:C1470.templateFiles:=This:C1470.templateGetList()
	
	// THEME files based on existing json files (if any)
	This:C1470.themeFiles:=This:C1470.themeGetList()
	
Function translate($type : Text; $name : Text; $keepOriginal : Boolean)->$translation : Text
	
	var $p : Integer
	
	Case of 
		: ($type="DataClass")
			
			If (Not:C34(Undefined:C82(This:C1470.tables)))
				$p:=This:C1470.tables.indexOf($name)  // check if localised / not filtered
				If ($p>=0)
					$translation:=This:C1470.tablesTranslated[$p]
				End if 
			Else 
				$translation:=$name
			End if 
			
		: ($type="attribute")
			
			If (Not:C34(Undefined:C82(This:C1470.attributes)))
				$p:=This:C1470.attributes.indexOf($name)  // check if localised / not filtered
				If ($p>=0)
					$translation:=This:C1470.attributesTranslated[$p]
				End if 
			Else 
				$translation:=$name
			End if 
			
		: ($type="formula")
			
			If (Not:C34(Undefined:C82(This:C1470.formulas)))
				$p:=This:C1470.formulas.indexOf($name)  // check if localised / not filtered
				If ($p>=0)
					$translation:=This:C1470.formulasTranslated[$p]
				End if 
			Else 
				$translation:=$name
			End if 
			
		: ($type="fileName")
			
			If (Not:C34(Undefined:C82(This:C1470.fileNames)))
				$p:=This:C1470.fileNames.indexOf($name)  // check if localised / not filtered
				If ($p>=0)
					$translation:=This:C1470.fileNamesTranslated[$p]
				End if 
			Else 
				$translation:=$name
			End if 
			
	End case 
	
	If ($translation="") && ($keepOriginal)
		$translation:=$name  // NOT translated
	End if 
	
	
	
	
	
	
	
Function formulaUI($action : Text; $formatType : Integer; $insert : Object)
	
	var $visible : Boolean
	var $range : Object
	var $json : Text
	
	//For ($i; 0; Form.selectFormat.length-1)
	//Form.selectFormat[$i]:=0
	//End for 
	////OBJECT SET VISIBLE(*; "formatSample@"; False)
	
	//Form.selectFormat[$formatType]:=1
	
	//Form.local.formatSample:=""
	
	Form:C1466.formats:=New collection:C1472
	
	Case of 
		: ($action="init")
			
			Case of 
				: ($formatType=Is date:K8:7)
					Form:C1466.local.displayedFormats:=Form:C1466.local.dateFormats
					
				: ($formatType=Is time:K8:8)
					Form:C1466.local.displayedFormats:=Form:C1466.local.timeFormats
					
				: ($formatType=Is real:K8:4)
					Form:C1466.local.displayedFormats:=Form:C1466.local.numberFormats
					
				: ($formatType=Is text:K8:3)
					Form:C1466.local.displayedFormats:=Form:C1466.local.textFormats
					
				: ($formatType=Is picture:K8:10)
					Form:C1466.local.displayedFormats:=Form:C1466.local.pictureFormats
					
				: ($formatType=Is boolean:K8:9)
					Form:C1466.local.displayedFormats:=Form:C1466.local.booleanFormats
					
				: ($formatType=Is integer:K8:5)  // TIME OR NUMERIC for static contexts
					Form:C1466.local.displayedFormats:=Form:C1466.local.numberAndTimeFormats
					
			End case 
			
			Form:C1466.fullFormat:=Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index]
			
			This:C1470.formulaUI("sample"; Form:C1466.local.displayedFormats.type)  // one level recursive
			
			
			
		: ($action="sample")
			
			OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; False:C215)
			
			
			Case of 
				: ($formatType=Is date:K8:7)
					Form:C1466.local.formatSample:=String:C10(Current date:C33; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
					
				: ($formatType=Is time:K8:8)
					Form:C1466.local.formatSample:=String:C10(Current time:C178; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
					
				: ($formatType=Is real:K8:4) | (($formatType=Is integer:K8:5) & (Value type:C1509(Form:C1466.fullFormat)=Is text:K8:3))
					
					If (Position:C15("%"; Form:C1466.fullFormat)>0)
						Form:C1466.local.formatSample:=String:C10(4.567; Form:C1466.fullFormat)
					Else 
						Form:C1466.local.formatSample:=String:C10(123456.789; Form:C1466.fullFormat)
					End if 
					
					OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; True:C214)
					OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; True:C214)
					
				: ($formatType=Is text:K8:3)
					
					Form:C1466.local.formatSample:=String:C10("ABCDEFGHIJKLMNOP"; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
					
					OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; True:C214)
					OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; True:C214)
					
					
				: ($formatType=Is picture:K8:10)
					Form:C1466.local.formatSample:=""
					
				: ($formatType=Is boolean:K8:9)
					Form:C1466.local.formatSample:=""
					
					OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; True:C214)
					OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; True:C214)
					
				: ($formatType=Is integer:K8:5)  // must be a TIME; (static contexts). Numeric cases have been managed with "is real" above
					
					Form:C1466.local.formatSample:=String:C10(Current time:C178; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
					OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; False:C215)
					OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; False:C215)
					
			End case 
			
			
			This:C1470.formulaUI("cleanup")  // one level recursive
			
		: ($action="cleanup")
			
			$visible:=(Form:C1466.formulaSource#"") && ((Form:C1466.local.type=Is real:K8:4) || (Form:C1466.local.type=Is integer:K8:5) || (Form:C1466.local.type=Is text:K8:3) || (Form:C1466.local.type=Is picture:K8:10) || (Form:C1466.local.type=Is date:K8:7) || (Form:C1466.local.type=Is time:K8:8) || (Form:C1466.local.type=Is boolean:K8:9))
			
			OBJECT SET VISIBLE:C603(*; "lbl_StandardFormat"; $visible)
			OBJECT SET VISIBLE:C603(*; "DD_formats"; $visible)
			
			
			Case of 
				: (Form:C1466.formulaSource#"") && ((Form:C1466.local.type=Is real:K8:4) || (Form:C1466.local.type=Is text:K8:3) || (Form:C1466.local.type=Is boolean:K8:9))
					
					$visible:=True:C214
					
				: (Form:C1466.formulaSource#"") && (Form:C1466.local.type=Is integer:K8:5)  // special case : interger means time OR numéric
					
					If (Value type:C1509(Form:C1466.fullFormat)=Is text:K8:3)  // format is text but value is a number
						$visible:=True:C214
					Else   // time
						$visible:=False:C215
					End if 
				Else 
					$visible:=False:C215
			End case 
			
			OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; $visible)
			OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; $visible)
			
			
			OBJECT SET VISIBLE:C603(*; "btn_ClearFilter"; (Form:C1466.local.filter#""))
			OBJECT SET VISIBLE:C603(*; "lbl_sample"; (Form:C1466.local.formatSample#""))
			
			OBJECT SET ENABLED:C1123(*; "btn_OK"; (Form:C1466.formulaSource#""))
			OBJECT SET ENABLED:C1123(*; "btn_Insert"; (Form:C1466.formulaSource#""))
			
			
		: ($action="insertFormula")
			
			
			$range:=WP Selection range:C1340(*; $insert.areaName)
			WP INSERT FORMULA:C1703($range; Formula from string:C1601($insert.source; 1); wk replace:K81:177)  // ∆∆∆ Feature 125
			If ($insert.doNext="insertSpace")
				If (Shift down:C543)
					WP INSERT BREAK:C1413($range; wk paragraph break:K81:259; wk append:K81:179; wk include in range:K81:180)
				Else 
					WP SET TEXT:C1574($range; " "; wk append:K81:179; wk include in range:K81:180)
				End if 
				WP SELECT:C1348(*; $insert.areaName; $range.end; $range.end)
			End if 
			
		: ($action="listUpdated")
			
			GET LIST ITEM PARAMETER:C985(Form:C1466.displayedHList.hlist; *; "JSON"; $json)
			If ($json#"")
				
				Form:C1466.local.data:=JSON Parse:C1218($json)
				
				Form:C1466.local.type:=Form:C1466.local.data.type
				Form:C1466.formulaSource:=Form:C1466.local.data.formulaSource
				Form:C1466.formulaName:=Replace string:C233(Form:C1466.local.data.name; "."; " ")
				Form:C1466.local.formatSample:=""
				
				This:C1470.formulaUI("init"; Form:C1466.local.type)
				
			Else 
				Form:C1466.local.type:=-1
				Form:C1466.formulaSource:=""
				Form:C1466.formulaName:=""
				Form:C1466.local.formatSample:=""
			End if 
			
			This:C1470.formulaUI("cleanup")
			
		: ($action="resetlist")
			
			Form:C1466.displayedHList.clear()  // clear display list
			Form:C1466.displayedHList:=Form:C1466.contextHList.clone()  // clone (again) from original
			
			Form:C1466.local.formatSample:=""
			Form:C1466.formulaSource:=""
			Form:C1466.formulaName:=""
			
	End case 
	
Function formulaBuildStatic($context : Object; $contextName : Text; $formula : Text; $itemRef : Integer)->$hlist : cs:C1710.HList
	
	var $picturePath; $attributeName; $json : Text
	var $subList : cs:C1710.HList
	
	var $type : Integer
	var $o : Object
	var $nextFormula : Text
	
	
	If (Count parameters:C259=1)
		$picturePath:="path:/RESOURCES/Images/HLbullet.png"
		$itemRef:=1000
	End if 
	
	$hlist:=cs:C1710.HList.new()
	
	For each ($attributeName; $context)
		
		If (Value type:C1509($context[$attributeName])=Is object:K8:27)
			
			If ($formula="")
				$nextFormula:=$attributeName
			Else 
				$nextFormula:=$formula+"."+$attributeName
			End if 
			
			$subList:=This:C1470.formulaBuildStatic($context[$attributeName]; $attributeName; $nextFormula; $itemRef+1)
			
			$hlist.append($attributeName; $itemRef; $subList.hlist; False:C215)  //
			$hlist.setParameter($itemRef; Additional text:K28:7; String:C10($itemRef))  // TEMPO FOR DEBUG 
			$HList.setProperties($itemRef; False:C215; Bold:K14:2; $picturePath)
			
			$itemRef:=$itemRef+$subList.countItems()+1
			
		Else 
			// not an object !
			
			$type:=Value type:C1509($context[$attributeName])
			If ($type#Is collection:K8:32)
				
				If ($type=Is real:K8:4)
					$type:=Is integer:K8:5  // means TIME OR NUMERIC for formating
				End if 
				
				$hlist.append($attributeName; $itemRef)
				
				$o:=New object:C1471
				
				$o.type:=$type
				$o.formulaSource:="This.data."+$formula+"."+$attributeName
				$o.name:=$formula+"."+$attributeName
				
				$json:=JSON Stringify:C1217($o; *)  //  ";*" TEMPO FOR DEBUG 
				
				$hlist.setParameter($itemRef; "JSON"; $json)
				$hlist.setParameter($itemRef; "SOURCE"; $o.formulaSource)
				$hlist.setParameter($itemRef; Additional text:K28:7; String:C10($itemRef))  // TEMPO FOR DEBUG 
				
				$itemRef:=$itemRef+1
				
			Else 
				
			End if 
		End if 
	End for each 
	
	If ($formula="")  //end of level 1
		If ($hlist.countItems(False:C215)=1)  // visible only
			$hlist.expandItem(1)
		End if 
	End if 
	
Function formulaBuildDynamic($context : Object; $contextName : Text; $contextNameTranslated : Text; $itemRef : Integer; $linksLevel : Integer)->$hlist : cs:C1710.HList
	
	var $picturePath; $attributeName; $dataClassName; $attributeNameTranslated; $dataClassNameTranslated; $json; $relatedDataClassName; $nextContextName; $nextContextNameTranslated : Text
	
	var $subList : cs:C1710.HList
	
	var $type; $maxLinks : Integer
	var $o : Object
	var $class; $relatedDataClass : Object  //∆∆∆
	var $dataClass : 4D:C1709.DataClass
	var $append : Boolean
	
	
	$hlist:=cs:C1710.HList.new()
	
	Case of 
		: (Count parameters:C259<1)
			ALERT:C41("missing parameters")
			
		: (Count parameters:C259=1)
			
			$picturePath:="path:/RESOURCES/Images/HLbullet.png"
			$itemRef:=1000
			For each ($attributeName; $context)  // driver1, driver2, departureAgency, arrivalAggency
				
				
				If (Value type:C1509($context[$attributeName])=Is object:K8:27)
					
					$class:=OB Class:C1730($context[$attributeName])  // ex : PeopleEntity or CompanyEntity
					If (Not:C34(Undefined:C82($class.superclass))) && ($class.superclass#Null:C1517) && ($class.superclass.name="Entity")
						
						$dataClass:=$context[$attributeName].getDataClass()
						$dataClassName:=$dataClass.getInfo().name  // at this level, container is the context of the dialog
						
						
						$dataClassNameTranslated:=Form:C1466.wizard.translate("dataClass"; $dataClassName; False:C215)
						
						If ($dataClassNameTranslated#"")
							
							// at this level, the presense of attribute (entity) name is not mandatory in the translation file, just used for translation if found
							// ex : "driver1" is a "people" entity and "people" has already been validated above.
							// just check if driver1 is translated too or not.
							// if not, doesn't matter, 
							
							$attributeNameTranslated:=Form:C1466.wizard.translate("dataClass"; $attributeName; True:C214)  // translated or not, does not matter (true means original if no translation)
							
							$subList:=This:C1470.formulaBuildDynamic($dataClass; $attributeName; $attributeNameTranslated; $itemRef+1; 0)
							
							//$subList:=BuildHLContext($dataClass; $attributeName; $attributeNameTranslated; $itemRef+1; 0)  // first call the attribute name may NOT be translated
							//If ($sublist#Null)
							If ($sublist.countItems()>0)
								$hlist.append(" "+$attributeNameTranslated; $itemRef; $subList.hlist; False:C215)  //
								//$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 
								$hlist.setProperties($itemRef; False:C215; Bold:K14:2; $picturePath)
								
								$itemRef:=$itemRef+$subList.countItems()+1
							Else 
								$sublist.clear()  // otherwise memory leaks !
							End if 
							
							//End if 
							
						End if 
					End if 
					
				End if   // not an object !
			End for each 
			
			If ($hlist.countItems()=1)
				$hlist.expandItem(1)
			End if 
			
			
		: (Count parameters:C259>=3)  // dataclass (ex = People) ; $itemRef; $linksLevel
			
			$dataClass:=$context
			$dataClassName:=$dataClass.getInfo().name
			
			// check if there is a filter in the form
			If ((Undefined:C82(Form:C1466.context.allowedTables)) || (Form:C1466.context.allowedTables.length=0) || (Form:C1466.context.allowedTables.indexOf($dataClassName)>=0))\
				 && ((Undefined:C82(Form:C1466.context.hiddenTables)) || (Form:C1466.context.hiddenTables.length=0) || (Form:C1466.context.hiddenTables.indexOf($dataClassName)<0))
				
				//$subList:=cs.HList.new()  // sublist
				
				For each ($attributeName; $dataClass)  // at this level, $context is a dataclass
					
					//If ($attributeName="group") & (Shift down)
					//TRACE
					//End if 
					
					If ($dataClass[$attributeName].kind#"related@")
						
						$o:=New object:C1471
						
						$append:=True:C214
						$type:=$dataClass[$attributeName].fieldType
						Case of 
							: ($type=Is date:K8:7)  // date
								$o.type:=Is date:K8:7  // 4
							: ($type=Is time:K8:8)
								$o.type:=Is time:K8:8  //11
							: ($type=Is real:K8:4) || ($type=Is longint:K8:6)
								$o.type:=Is real:K8:4  // 9 or 1
							: ($type=Is text:K8:3) || ($type=Is string var:K8:2) || ($type=Is alpha field:K8:1)
								$o.type:=Is text:K8:3  //2
							: ($type=Is picture:K8:10)
								$o.type:=Is picture:K8:10  //3
							: ($type=Is boolean:K8:9)
								$o.type:=Is boolean:K8:9  //6
							Else 
								// blob or object
								$append:=False:C215
								//APPEND TO ARRAY(tDefauldFormat; -1)  // automatic
						End case 
						
						If ($append)
							
							
							$o.formulaSource:="This.data."+$contextName+"."+$attributeName
							
							
							$attributeNameTranslated:=Form:C1466.wizard.translate("attribute"; $attributeName; False:C215)
							If ($attributeNameTranslated#"")
								$o.name:=$contextNameTranslated+" "+$attributeNameTranslated  // translated OR NOT
								
								
								$hlist.append($attributeNameTranslated; $itemRef)  // no sublist
								//$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 
								
								$json:=JSON Stringify:C1217($o; *)  //  ";*" TEMPO FOR DEBUG 
								$hlist.setParameter($itemRef; "JSON"; $json)
								$hlist.setParameter($itemRef; "SOURCE"; $o.formulaSource)
								
								$itemRef+=1
								
							End if 
							
						End if 
						
					Else   // related. may launch a recursive call
						
						$maxLinks:=Form:C1466.local.links.index
						
						If ($linksLevel<$maxLinks)
							
							$dataClassName:=$dataClass.getInfo().name
							If (ds:C1482[$dataClassName][$attributeName].kind="relatedEntity")
								
								$append:=True:C214
								
								$attributeNameTranslated:=Form:C1466.wizard.translate("attribute"; $attributeName; False:C215)
								If ($attributeNameTranslated#"")
									
									
									$nextContextName:=$contextName+"."+$attributeName  // NOT TRANSLATED !!! 
									$nextContextNameTranslated:=$contextNameTranslated+" "+$attributeNameTranslated
									$relatedDataClassName:=ds:C1482[$dataClassName][$attributeName].relatedDataClass
									$relatedDataClass:=ds:C1482[$relatedDataClassName]
									
									
									$sublist:=This:C1470.formulaBuildDynamic($relatedDataClass; $nextContextName; $nextContextNameTranslated; $itemRef+1; $linksLevel+1)
									//$sublist:=BuildHLContext($relatedDataClass; $nextContextName; $nextContextNameTranslated; $itemRef+1; $linksLevel+1)
									
									//If ($sublist#Null)
									If ($sublist.countItems()>0)
										$hlist.append($attributeNameTranslated; $itemRef; $sublist.hlist; False:C215)
										//$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 
										$itemRef:=$itemRef+$sublist.countItems()+1
									Else 
										$sublist.clear()  // otherwise memory leaks !
									End if 
									
									//End if 
								End if 
								
							End if   // not a related entity
						End if   // max links reached
					End if   // related or not related
					
				End for each 
				
			End if 
			
			
	End case 
	
Function formulaInsert($insert : Object)  //$json : Text)
	
	//var $insert : Object
	var $range : Object
	
	//$insert:=JSON Parse($json)
	$range:=WP Selection range:C1340(*; $insert.areaName)
	WP INSERT FORMULA:C1703($range; Formula from string:C1601($insert.source; 1); wk replace:K81:177)
	
	If (Shift down:C543)
		WP INSERT BREAK:C1413($range; wk paragraph break:K81:259; wk append:K81:179; wk include in range:K81:180)
	Else 
		WP SET TEXT:C1574($range; " "; wk append:K81:179; wk include in range:K81:180)
	End if 
	WP SELECT:C1348(*; $insert.areaName; $range.end; $range.end)
	
Function templateGetList()->$collection : Collection
	
	var $folder : 4D:C1709.Folder
	
	$folder:=Folder:C1567("/RESOURCES/4DWP_Wizard/Templates/"; *)
	If ($folder.exists)
		$collection:=$folder.files(fk recursive:K87:7+fk ignore invisible:K87:22).orderBy("name asc")
	Else 
		$collection:=New collection:C1472
	End if 
	// TEST JSON
	This:C1470.JSONvalidate("template"; $collection)
	
	
	
Function templateDropDownList()->$dropDownlist : Object
	
	var $col; $colTrans : Collection
	var $dataClassName; $dataClassNameTranslated : Text
	var $i : Integer
	
	$dropDownlist:=New object:C1471()
	
	If (This:C1470.templateFiles.length>0)
		$dropDownlist.values:=This:C1470.templateFiles.extract("name")
		For ($i; 0; $dropDownlist.values.length-1)
			$dropDownlist.values[$i]:=This:C1470.translate("fileName"; $dropDownlist.values[$i]; True:C214)
		End for 
		$dropDownlist.valuesOriginal:=$dropDownlist.values.copy()  // useless here but must be kept sync (see below)
	End if 
	
	// more items, build dynamic
	
	$col:=New collection:C1472()
	$colTrans:=New collection:C1472()
	For each ($dataClassName; ds:C1482)
		
		$dataClassNameTranslated:=Form:C1466.wizard.translate("DataClass"; $DataClassName; False:C215)
		
		If ($dataClassNameTranslated#"")
			$col.push($dataClassName)
			$colTrans.push($dataClassNameTranslated)
		End if 
		
	End for each 
	
	If ($col.length>0)
		If (Undefined:C82($dropDownlist.values))
			$dropDownlist.values:=New collection:C1472
			$dropDownlist.valuesOriginal:=New collection:C1472
		Else 
			$dropDownlist.values.push("-")
			$dropDownlist.valuesOriginal.push("-")
		End if 
		$dropDownlist.values.combine($colTrans)
		$dropDownlist.valuesOriginal.combine($col)
	End if 
	
	$dropDownlist.index:=0
	
Function templateGet($index : Integer)->$template : Object
	
	var $column; $o : Object
	var $dataClassName; $attribute; $attributeTranslated : Text
	var $id : Integer
	
	If ($index<This:C1470.templateFiles.length)  // from template json files
		
		$template:=JSON Parse:C1218(This:C1470.templateFiles[$index].getText())
		If (Not:C34(Undefined:C82($template.columns)))
			$id:=1
			For each ($column; $template.columns)
				$column.header:=Form:C1466.wizard.translate("attribute"; $column.header; True:C214)
				$column.id:=$id
				$id+=1
			End for each 
		End if 
		
	Else   // dynamic 
		
		$dataClassName:=Form:C1466.templateList.valuesOriginal[$index]
		
		
		$template:=New object:C1471
		
		$template.DataClass:=$DataClassName
		$template.tableDataSource:="ds."+$DataClassName+".all()"
		$template.columns:=New collection:C1472
		$id:=1
		For each ($attribute; ds:C1482[$DataClassName])
			
			If (ds:C1482[$DataClassName][$attribute].kind#"related@") && (ds:C1482[$DataClassName][$attribute].type#"blob") && (ds:C1482[$DataClassName][$attribute].type#"object")
				$attributeTranslated:=Form:C1466.wizard.translate("attribute"; $attribute; False:C215)
				
				If ($attributeTranslated#"")
					$o:=New object:C1471
					$o.check:=True:C214
					$o.header:=$attributeTranslated  // To be translated
					$o.source:="This.item."+$attribute
					$o.id:=$id
					$template.columns.push($o)
					
					$id+=1
				End if 
			Else 
				
			End if 
		End for each 
	End if 
	
Function templateUI($action : Text)
	
	var $enterable : Boolean
	var $list : Collection
	var $item : Text
	var $interface : Text
	var $picture : Picture
	
	ARRAY LONGINT:C221($events; 0)
	
	If ($action="init")
		$interface:=Get Application color scheme:C1763(*)
		If ($interface="light")
			READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"drag.png"; $picture)
		Else 
			READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"drag_dark.png"; $picture)
			
			// dark only
			OBJECT SET RGB COLORS:C628(*; "BackgroundA@"; "#141414"; "#141414")  // very dark grey
			OBJECT SET RGB COLORS:C628(*; "BackgroundB@"; "#282828"; "#282828")  // a bit less dark grey
			OBJECT SET RGB COLORS:C628(*; "separator@"; "lightGrey")  // vertical and horizontal lines
			
			OBJECT SET RGB COLORS:C628(*; "RectTableData"; "#141414"; "#656565")  //
			OBJECT SET RGB COLORS:C628(*; "inTableData"; "#D4D4D4")
		End if 
		Form:C1466.dragPicture:=$picture
		
		If (Is Windows:C1573) | (Shift down:C543)
			OBJECT SET CORNER RADIUS:C1323(*; "RectTableData"; 0)
		End if 
		
	End if 
	
	$enterable:=(Form:C1466.displayFormulas=1)
	$list:=New collection:C1472("LB_columns"; "dd_tableHeaders"; "dd_BreakAbove"; "dd_BreakBelow"; "dd_bcor"; "dd_themeList"; "dd_templateList"; "dd_extraRows")
	For each ($item; $list)
		OBJECT SET ENTERABLE:C238(*; $item; $enterable)
		OBJECT SET ENABLED:C1123(*; $item; $enterable)
	End for each 
	
	OBJECT SET ENTERABLE:C238(*; "WParea"; $enterable)  // WParea is NOT enterable but still enabled
	
	// event for listbox on the left
	COLLECTION TO ARRAY:C1562([On Begin Drag Over:K2:44; On Drop:K2:12; On Mouse Enter:K2:33; On Mouse Leave:K2:34; On Mouse Move:K2:35]; $events)
	If ($enterable)
		OBJECT SET EVENTS:C1239(*; "LB_columns"; $events; Enable events others unchanged:K42:38)
	Else 
		OBJECT SET EVENTS:C1239(*; "LB_columns"; $events; Disable events others unchanged:K42:39)
	End if 
	
	// event for sample area
	COLLECTION TO ARRAY:C1562([On Clicked:K2:4]; $events)
	If ($enterable)
		OBJECT SET EVENTS:C1239(*; "WParea"; $events; Enable events others unchanged:K42:38)
	Else 
		OBJECT SET EVENTS:C1239(*; "WParea"; $events; Disable events others unchanged:K42:39)
	End if 
	
	
	$enterable:=(Form:C1466.maxBreaks>0) & (Form:C1466.displayFormulas=1)
	$list:=New collection:C1472("dd_BreakAbove"; "dd_BreakBelow")
	For each ($item; $list)
		OBJECT SET ENTERABLE:C238(*; $item; $enterable)
		OBJECT SET ENABLED:C1123(*; $item; $enterable)
	End for each 
	
	OBJECT SET TITLE:C194(*; "cb_horizontalRuler"; Get action info:C1442("visibleHorizontalRuler").title)
	
	
Function themeGetList()->$collection : Collection
	
	var $folder : 4D:C1709.Folder
	var $o : Object
	var $validated : Boolean
	
	// host database resources first
	$folder:=Folder:C1567("/RESOURCES/4DWP_Wizard/Themes/"; *)
	If ($folder.exists)
		$collection:=$folder.files(fk recursive:K87:7+fk ignore invisible:K87:22).orderBy("name")
		
		// TEST JSON (only for host database)
		$validated:=This:C1470.JSONvalidate("theme"; $collection)
		
		If ($collection.length>0)  // can be an empty folder
			$o:=New object:C1471("name"; "-")  // fake file used as séparator in drop down list
			$collection.push($o)
		End if 
	Else 
		$collection:=New collection:C1472
	End if 
	
	// followed by component resources
	$folder:=Folder:C1567("/RESOURCES/4DWP_Wizard/Themes/")
	If ($folder.exists)  // always unless resources are dammaged
		$collection:=$collection.combine($folder.files(fk recursive:K87:7+fk ignore invisible:K87:22).orderBy("name"))
	End if 
	
	
	
Function themeSave($theme : Object; $fileName : Text)->$index : Integer  //position in the list
	
	var $folder : 4D:C1709.Folder
	var $file : 4D:C1709.File
	
	If ($fileName="")  // New… or Save As…
		Repeat 
			$fileName:=Request:C163("Give a name to the theme.")  //∆∆∆
			If (ok=1)
				If (Position:C15(".json"; $fileName)<=0)
					$fileName:=$fileName+".json"
				End if 
				If (Form:C1466.wizard.themeExists($fileName))
					ALERT:C41("This file already exists.\rPlease use another name.")  //∆∆∆
					ok:=0  // keep in loop
				End if 
			Else 
				$fileName:=""
				ok:=1  // exit loop
			End if 
		Until (ok=1)
	End if 
	
	If ($fileName#"")
		$folder:=Folder:C1567("/RESOURCES/4DWP_Wizard/Themes/")
		If (Not:C34($folder.exists))
			$folder.create()
		End if 
		
		$file:=File:C1566($folder.path+$fileName)
		$file.setText(JSON Stringify:C1217($theme; *))
		
		// update the themeFiles collection
		This:C1470.themeFiles:=Form:C1466.wizard.themeGetList()
		$index:=This:C1470.themeFiles.findIndex(Formula:C1597($1.value.fullName=$2); $fileName)
		
	End if 
	
Function themeFillMissing($fillMe : Object; $reference : Object)
	
	var $hardCoded : Object
	var $fillWith : Object
	var $attribute : Text
	
	If (Count parameters:C259=1)
		
		$hardCoded:=New object:C1471
		$hardCoded.alignment:=wk default:K81:160
		$hardCoded.backgroundColor:="transparent"  //"white"
		$hardCoded.borderColor:="black"
		$hardCoded.borderStyle:=1
		$hardCoded.borderWidth:="0.5pt"
		$hardCoded.font:="Arial"
		$hardCoded.fontFamily:="Arial"
		$hardCoded.color:="black"
		$hardCoded.fontSize:="12pt"
		$hardCoded.padding:="2pt"
		
		$fillWith:=$hardCoded
	Else 
		$fillWith:=$reference
	End if 
	
	
	
	For each ($attribute; $fillWith)
		If (Undefined:C82($fillMe[$attribute]))
			$fillMe[$attribute]:=$fillWith[$attribute]
		End if 
	End for each 
	
Function themeDropDownList($translate)->$dropDownList : Object
	
	var $i : Integer
	$dropDownlist:=New object:C1471()
	If (This:C1470.themeFiles.length>0)
		$dropDownlist.values:=This:C1470.themeFiles.extract("name")
		If ($translate)
			For ($i; 0; $dropDownlist.values.length-1)
				$dropDownlist.values[$i]:=This:C1470.translate("fileName"; $dropDownlist.values[$i]; True:C214)
			End for 
		End if 
	Else 
		$dropDownlist.values:=New collection:C1472("Default")
	End if 
	$dropDownlist.index:=0
	
Function themeNormalize($theme : Object)
	
	var $defaultValues : Object  // used localy to fill gaps when default attributes are missing
	var $mustHave : Collection
	var $must; $type : Text
	
	If (Not:C34(Undefined:C82($theme.default)))
		$defaultValues:=$theme.default
	Else 
		$defaultValues:=New object:C1471
	End if 
	This:C1470.themeFillMissing($defaultValues)  // fill missing attributes (if any are missing) in $theme.default
	
	
	$mustHave:=New collection:C1472("default"; "table"; "header1"; "break1"; "data"; "bcor"; "extra")
	For each ($must; $mustHave)
		If (Undefined:C82($theme[$must]))
			$theme[$must]:=New object:C1471
		End if 
	End for each 
	
	
	For each ($type; $theme)
		This:C1470.themeFillMissing($theme[$type]; $defaultValues)
	End for each 
	
Function themeGetDefault($theme : Object; $attribute : Text)->$value : Variant
	var $ref : Object
	
	If (Not:C34(Undefined:C82($theme.default))) && (Not:C34(Undefined:C82($theme.default[$attribute])))  // first search in given them object
		$value:=$theme.default[$attribute]
	Else   // second search in hard coded reference object
		$ref:=New object:C1471
		This:C1470.themeFillMissing($ref)
		If (Not:C34(Undefined:C82($ref[$attribute])))
			$value:=$ref[$attribute]
		End if 
	End if 
	
Function themeToCollection($theme : Object; $listboxName : Text)->$collection : Collection
	
	
	var $_types : Collection
	var $type; $atribute : Text
	var $o : Object
	
	$_types:=New collection:C1472("default"; "table"; "rows"; "cells"; "header1"; "header2"; "header3"; "header4"; "header5"; "data"; "break1"; "break2"; "break3"; "break4"; "break5"; "bcor")
	
	//1st call, build collection
	
	$collection:=New collection:C1472
	
	For each ($type; $_types)
		$o:=New object:C1471()
		$o.type:=$type
		
		If (Not:C34(Undefined:C82(Form:C1466.theme[$type])))
			$o.check:=True:C214
		Else 
			$o.check:=False:C215
		End if 
		$o.arrow:="➞"  //➡️
		
		If (Not:C34(Undefined:C82($theme[$type])))
			For each ($atribute; $theme[$type])
				$o[$atribute]:=$theme[$type][$atribute]
			End for each 
		End if 
		
		$collection.push($o)
	End for each 
	
	LISTBOX SELECT ROW:C912(*; $listboxName; 1; lk replace selection:K53:1)
	
Function themeFromCollection($collection : Collection)->$theme : Object
	
	var $o; $row : Object
	var $attribute : Text
	
	$theme:=New object:C1471
	
	// next calls, just update
	For each ($row; $collection)
		
		$o:=New object:C1471
		
		If ($row.type="default")
			$theme.default:=OB Copy:C1225($row)
			OB REMOVE:C1226($theme.default; "type")
			OB REMOVE:C1226($theme.default; "check")
			OB REMOVE:C1226($theme.default; "arrow")
		Else 
			If ($row.check=True:C214)
				
				For each ($attribute; $row)
					
					Case of 
						: ($attribute="type")
						: ($attribute="check")
						: ($attribute="arrow")
							
						Else 
							
							Case of 
								: (Value type:C1509($row[$attribute])#Value type:C1509($theme.default[$attribute]))
									$o[$attribute]:=$row[$attribute]
									
								: ($row[$attribute]#$theme.default[$attribute])
									$o[$attribute]:=$row[$attribute]
									
								Else 
									
							End case 
					End case 
					
				End for each 
				
				If (Not:C34(OB Is empty:C1297($o)))
					$theme[$row.type]:=$o
				End if 
				
			End if 
		End if 
		
	End for each 
	
Function themeExists($name : Text)->$exists : Boolean
	
	var $p : Integer
	$p:=This:C1470.themeFiles.findIndex(Formula:C1597($1.value.fullName=$2); $name)
	$exists:=$p>=0
	
Function themeMeta($row)->$meta : Object
	
	
	$meta:=New object:C1471
	$meta.cell:=New object:C1471()
	If ($row.type=Form:C1466.currentRow.type)
		$meta.cell.colType:=New object:C1471("stroke"; "#09399B"; "fontWeight"; "bold")
		$meta.cell.colArrow:=New object:C1471("stroke"; "#09399B"; "fontWeight"; "bold")
	Else 
		$meta.cell.colType:=New object:C1471("stroke"; "black"; "fontWeight"; "normal")
		$meta.cell.colArrow:=New object:C1471("stroke"; "transparent")
	End if 
	
	$meta.disabled:=($row.type="default")  // || (This.type="data")
	
Function themeApply($area : Object; $areaName : Text)
	
	var $apply : Boolean
	var $i; $nbColumns; $row; $tableWidth : Integer
	var $tables; $targetNames; $attributes : Collection
	var $table; $rows; $columns; $cells; $target : Object
	var $description; $targetName; $attribute : Text
	
	$tables:=WP Get elements:C1550($area; wk type table:K81:222)
	If ($tables.length>0)
		
		$table:=$tables[0]
		$rows:=WP Table get rows:C1475($table; 1; MAXLONG:K35:2)
		$cells:=WP Table get cells:C1477($table; 1; 1; MAXLONG:K35:2; MAXLONG:K35:2)
		
		//$maxPadding:=0
		
		//  --------------------- APPLY DEFAULT/TABLE/ROWS/CELLS SETTINGS FIRST ---------------------
		
		$targetNames:=["default"; "table"; "rows"; "cells"]
		$attributes:=[wk font:K81:69; wk font size:K81:66; wk text color:K81:64; wk text align:K81:49; wk background color:K81:20; wk border width:K81:39; wk border color:K81:34; wk border style:K81:29; wk padding:K81:15]
		
		For each ($targetName; $targetNames)
			
			If (Not:C34(Undefined:C82(Form:C1466.theme[$targetName])))
				
				Case of 
					: ($targetName="default")
						$target:=$table
					: ($targetName="table")
						$target:=$table
					: ($targetName="rows")
						$target:=$rows
					: ($targetName="cells")
						$target:=$cells
				End case 
				
				
				For each ($attribute; $attributes)
					
					If (Not:C34(Undefined:C82(Form:C1466.theme[$targetName][$attribute])))
						WP SET ATTRIBUTES:C1342($target; $attribute; Form:C1466.theme[$targetName][$attribute])
					End if 
					
				End for each 
				
				//If (Not(Undefined(Form.theme[$targetName].padding)))
				//$paddingNum:=Num(Form.theme[$targetName].padding)
				//If ($paddingNum>$maxPadding)
				//$maxPadding:=$paddingNum
				//End if 
				//End if 
				
			End if 
		End for each 
		
		
		//$themeTarget:="table"
		
		//WP SET ATTRIBUTES($target; wk text align; Form.theme[$themeTarget].alignment)
		//WP SET ATTRIBUTES($target; wk background color; Form.theme[$themeTarget].backgroundColor)
		//WP SET ATTRIBUTES($target; wk border color; Form.theme[$themeTarget].borderColor)
		//WP SET ATTRIBUTES($target; wk border style; Form.theme[$themeTarget].borderStyle)
		//WP SET ATTRIBUTES($target; wk border width; Form.theme[$themeTarget].borderWidth)
		
		//WP SET ATTRIBUTES($target; wk font; Form.theme[$themeTarget].font)
		//WP SET ATTRIBUTES($target; wk text color; Form.theme[$themeTarget].color)
		//WP SET ATTRIBUTES($target; wk font family; Form.theme[$themeTarget].fontFamily)
		//WP SET ATTRIBUTES($target; wk font size; Form.theme[$themeTarget].fontSize)
		//WP SET ATTRIBUTES($target; wk padding; Form.theme[$themeTarget].padding)
		
		//  --------------------- THEN APPLY THEME SETTINGS FOR EACH ROW ---------------------
		
		$row:=1
		
		For each ($description; Form:C1466.description)
			$target:=WP Table get rows:C1475($table; $row; 1)
			$apply:=True:C214
			Case of 
					
				: ($description="header@")  // header(s)
					$targetName:=$description
					If (Undefined:C82(Form:C1466.theme[$targetName]))  // header'X' undefined, lets find header'X-1'
						For ($i; Num:C11($targetName)-1; 1; -1)
							$targetName:="header"+String:C10($i)
							If (Not:C34(Undefined:C82(Form:C1466.theme[$targetName])))
								$i:=0  // exit loop
							End if 
						End for 
					End if 
					If (Undefined:C82(Form:C1466.theme[$targetName]))  // in the worts case, if header1 is undefined, lets take header
						$targetName:="headers"
					End if 
					//$headerStart+=1
					
				: ($description="break@")  // breaks(s)
					$targetName:=$description
					If (Undefined:C82(Form:C1466.theme[$targetName]))  // break'X' undefined, lets find break'X-1'
						For ($i; Num:C11($targetName)-1; 1; -1)
							$targetName:="break"+String:C10($i)
							If (Not:C34(Undefined:C82(Form:C1466.theme[$targetName])))
								$i:=0  // exit loop
							End if 
						End for 
					End if 
					If (Undefined:C82(Form:C1466.theme[$targetName]))  // in the worts case, if break1 is undefined, lets take break
						$targetName:="breaks"
					End if 
					
				: ($description="data")  // data
					$targetName:="data"
					
				: ($description="bcor")  // bcor
					$targetName:="bcor"
					
				: ($description="placeholder")  // placeholder
					$targetName:="placeholder"
					
				Else 
					$apply:=False:C215
			End case 
			
			If ($apply)
				For each ($attribute; $attributes)
					If (Not:C34(Undefined:C82(Form:C1466.theme[$targetName][$attribute])))
						WP SET ATTRIBUTES:C1342($target; $attribute; Form:C1466.theme[$targetName][$attribute])
					End if 
				End for each 
				
				//If (Not(Undefined(Form.theme[$targetName].padding)))
				//$paddingNum:=Num(Form.theme[$targetName].padding)
				//If ($paddingNum>$maxPadding)
				//$maxPadding:=$paddingNum
				//End if 
				//End if 
				
			End if 
			
			//WP SET ATTRIBUTES($target; wk text align; Form.theme[$themeTarget].alignment)
			//WP SET ATTRIBUTES($target; wk background color; Form.theme[$themeTarget].backgroundColor)
			//WP SET ATTRIBUTES($target; wk border color; Form.theme[$themeTarget].borderColor)
			//WP SET ATTRIBUTES($target; wk border style; Form.theme[$themeTarget].borderStyle)
			//WP SET ATTRIBUTES($target; wk border width; Form.theme[$themeTarget].borderWidth)
			
			//WP SET ATTRIBUTES($target; wk font; Form.theme[$themeTarget].font)
			//WP SET ATTRIBUTES($target; wk text color; Form.theme[$themeTarget].color)
			//WP SET ATTRIBUTES($target; wk font family; Form.theme[$themeTarget].fontFamily)
			//WP SET ATTRIBUTES($target; wk font size; Form.theme[$themeTarget].fontSize)
			//WP SET ATTRIBUTES($target; wk padding; Form.theme[$themeTarget].padding)
			
			
			$row:=$row+1
			
		End for each 
		
		$columns:=WP Table get columns:C1476($table; 1; MAXLONG:K35:2)
		$nbColumns:=Form:C1466.template.columns.query("check=true").length  // based on formdata
		
		
		//***** *****
		
		$tableWidth:=Form:C1466.local.tableWidth
		WP SET ATTRIBUTES:C1342($columns; wk width:K81:45; String:C10(Int:C8($tableWidth/$nbColumns)-2)+"pt")  // 20CM WIDE 508pt
		
		WP SELECT:C1348(*; $areaName; 1; 1)
	End if 
	
Function themeGet($index : Integer)->$theme : Object
	
	
	If (This:C1470.themeFiles.length=0) || ($index>This:C1470.themeFiles.length)
		// no theme file (this IS possible) OR index too hight (this should never happend)
		$theme:=New object:C1471
		$theme.default:=New object:C1471
		This:C1470.themeFillMissing($theme.default)
		
	Else 
		$theme:=JSON Parse:C1218(This:C1470.themeFiles[$index].getText())
	End if 
	
Function themeEdit($theme : Object)
	
	var $inherit : Text
	var $p : Integer
	
	$inherit:=Form:C1466.inheritSymbol
	
	Form:C1466.type:=$theme.type  // title above the editor
	
	If (Not:C34(Undefined:C82($theme.fontFamily)))
		$p:=Form:C1466.fontFamily.values.indexOf($theme.fontFamily)
		If ($p>=0)
			Form:C1466.fontFamily.index:=$p
			
			This:C1470.themeGetFont(Form:C1466.fontFamily.values[Form:C1466.fontFamily.index])
			
		Else   // not found in the font list
			Form:C1466.fontFamily.currentValue:=$theme.fontFamily
			Form:C1466.fontFamily.index:=-1
		End if 
		
	Else   // no font family 
		Form:C1466.fontFamily.index:=-1
		Form:C1466.fontFamily.currentValue:=$inherit
	End if 
	
	If (Not:C34(Undefined:C82($theme.font)))
		
		$p:=Form:C1466.font.fontNames.indexOf($theme.font)
		If ($p>=0)
			Form:C1466.font.index:=$p
		Else   // not found in the font names
			Form:C1466.font.currentValue:=$theme.font
			Form:C1466.font.index:=-1
		End if 
		
	Else   // no font name 
		Form:C1466.font.index:=-1
		Form:C1466.font.currentValue:=$inherit
	End if 
	
	
	// num or strings
	
	If (Not:C34(Undefined:C82($theme.fontSize)))
		If (Value type:C1509($theme.fontSize)=Is text:K8:3)
			Form:C1466.fontSize:=Num:C11($theme.fontSize; ".")
		Else 
			Form:C1466.fontSize:=$theme.fontSize
		End if 
	Else 
		Form:C1466.fontSize:=-1
	End if 
	
	If (Not:C34(Undefined:C82($theme.borderWidth)))
		If (Value type:C1509($theme.borderWidth)=Is text:K8:3)
			Form:C1466.borderWidth:=Num:C11($theme.borderWidth; ".")
		Else 
			Form:C1466.borderWidth:=$theme.borderWidth
		End if 
	Else 
		Form:C1466.borderWidth:=-1
	End if 
	
	
	If (Not:C34(Undefined:C82($theme.padding)))
		If (Value type:C1509($theme.padding)=Is text:K8:3)
			Form:C1466.padding:=Num:C11($theme.padding; ".")
		Else 
			Form:C1466.padding:=$theme.padding
		End if 
		
		Case of 
			: (Position:C15("pt"; $theme.padding)>0)
				Form:C1466.unit.index:=0
			: (Position:C15("mm"; $theme.padding)>0)
				Form:C1466.unit.index:=1
			: (Position:C15("cm"; $theme.padding)>0)
				Form:C1466.unit.index:=2
			: (Position:C15("in"; $theme.padding)>0)
				Form:C1466.unit.index:=3
			Else 
				// wrong value! : fix-> back to default
				OB REMOVE:C1226($theme; "padding")
		End case 
		
	Else 
		Form:C1466.padding:=-1
	End if 
	
	
	If (Not:C34(Undefined:C82($theme.color)))
		Form:C1466.color:=$theme.color
		Form:C1466.font_color:=cs:C1710.color.new($theme.color)  //***
	Else 
		
	End if 
	
	If (Not:C34(Undefined:C82($theme.backgroundColor)))
		Form:C1466.backgroundColor:=$theme.backgroundColor
		Form:C1466.background_color:=cs:C1710.color.new($theme.backgroundColor)  //***
	Else 
		
	End if 
	
	If (Not:C34(Undefined:C82($theme.borderColor)))
		Form:C1466.borderColor:=$theme.borderColor
		Form:C1466.border_color:=cs:C1710.color.new($theme.borderColor)
	Else 
		
	End if 
	
	
	If (Not:C34(Undefined:C82($theme.borderStyle)))
		If ($theme.borderStyle<=Form:C1466.borderStyle.values.length)
			Form:C1466.borderStyle.index:=$theme.borderStyle
		Else 
			// wrong value! : fix-> back to default
			OB REMOVE:C1226($theme; "borderStyle")
		End if 
	Else 
		
	End if 
	
	
	If (Not:C34(Undefined:C82($theme.alignment)))
		
		If ($theme.alignment#0) & ($theme.alignment#1) & ($theme.alignment#2)
			OB REMOVE:C1226($theme; "alignment")
		Else 
			Form:C1466.alignment:=$theme.alignment
		End if 
	Else 
		
	End if 
	
Function themeUI()
	
	var $inherit : Text
	$inherit:="⇩"
	
	// inputs
	
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.fontSize)))  // NOT the default value
		OBJECT SET RGB COLORS:C628(*; "InputFontSize"; 0; Background color:K23:2)
		//OBJECT SET ENTERABLE(*; "InputFontSize"; True)
		OBJECT SET VISIBLE:C603(*; "btn_defaultFontSize"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_fontSize"; Bold:K14:2)
	Else 
		OBJECT SET RGB COLORS:C628(*; "InputFontSize"; 0x00FFFFFF; 0x00D0D0D0)
		//OBJECT SET ENTERABLE(*; "InputFontSize"; False)
		OBJECT SET VISIBLE:C603(*; "btn_defaultFontSize"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_fontSize"; Plain:K14:1)
		Form:C1466.fontSize:=$inherit
	End if 
	
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.borderWidth)))  // NOT the default value
		OBJECT SET RGB COLORS:C628(*; "InputBorderWidth"; 0; Background color:K23:2)
		//OBJECT SET ENTERABLE(*; "InputBorderWidth"; True)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBorderWidth"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_borderWidth"; Bold:K14:2)
	Else 
		OBJECT SET RGB COLORS:C628(*; "InputBorderWidth"; 0x00FFFFFF; 0x00D0D0D0)
		//OBJECT SET ENTERABLE(*; "InputBorderWidth"; False)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBorderWidth"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_borderWidth"; Plain:K14:1)
		Form:C1466.borderWidth:=$inherit
	End if 
	
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.padding)))  // NOT the default 
		OBJECT SET RGB COLORS:C628(*; "InputPadding"; 0; Background color:K23:2)
		//OBJECT SET ENTERABLE(*; "InputPadding"; True)
		OBJECT SET VISIBLE:C603(*; "btn_defaultPadding"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_padding"; Bold:K14:2)
	Else 
		OBJECT SET RGB COLORS:C628(*; "InputPadding"; 0x00A0A0A0; Background color:K23:2)
		//OBJECT SET ENTERABLE(*; "InputPadding"; False)
		OBJECT SET VISIBLE:C603(*; "btn_defaultPadding"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_padding"; Plain:K14:1)
		Form:C1466.padding:=$inherit
	End if 
	
	
	
	
	// font familly
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.fontFamily)))
		OBJECT SET VISIBLE:C603(*; "btn_defaultFontFamily"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_fontFamily"; Bold:K14:2)
	Else 
		OBJECT SET VISIBLE:C603(*; "btn_defaultFontFamily"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_fontFamily"; Plain:K14:1)
	End if 
	
	// font
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.font)))
		OBJECT SET VISIBLE:C603(*; "btn_defaultFont"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_font"; Bold:K14:2)
	Else 
		OBJECT SET VISIBLE:C603(*; "btn_defaultFont"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_font"; Plain:K14:1)
	End if 
	
	//dropdownBorderStyle
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.borderStyle)))  // NOT the default value
		OBJECT SET RGB COLORS:C628(*; "dropdownBorderStyle"; 0; Background color:K23:2)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBorderStyle"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_borderStyle"; Bold:K14:2)
	Else 
		OBJECT SET RGB COLORS:C628(*; "dropdownBorderStyle"; 0; Background color:K23:2)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBorderStyle"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_borderStyle"; Plain:K14:1)
		Form:C1466.borderStyle.index:=-1
		Form:C1466.borderStyle.currentValue:=$inherit
	End if 
	
	
	
	
	
	// color buttons
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.color))) && (Form:C1466.currentRow.color#"transparent")  // NOT the default value
		OBJECT SET RGB COLORS:C628(*; "btn_fontColor"; 0; Form:C1466.font_color.css.hexLong)
		OBJECT SET VISIBLE:C603(*; "btn_defaultFontColor"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_fontColor"; Bold:K14:2)
		OBJECT SET TITLE:C194(*; "btn_fontColor"; "")
	Else 
		OBJECT SET RGB COLORS:C628(*; "btn_fontColor"; 0x00FFFFFF; 0x00D0D0D0)
		OBJECT SET VISIBLE:C603(*; "btn_defaultFontColor"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_fontColor"; Plain:K14:1)
		OBJECT SET TITLE:C194(*; "btn_fontColor"; $inherit)
	End if 
	
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.backgroundColor))) && (Form:C1466.currentRow.backgroundColor#"transparent")  // NOT the default value
		OBJECT SET RGB COLORS:C628(*; "btn_backgroundColor"; 0; Form:C1466.background_color.css.hexLong)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBackground"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_background"; Bold:K14:2)
		OBJECT SET TITLE:C194(*; "btn_backgroundColor"; "")
	Else 
		OBJECT SET RGB COLORS:C628(*; "btn_backgroundColor"; 0x00FFFFFF; 0x00D0D0D0)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBackground"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_background"; Plain:K14:1)
		OBJECT SET TITLE:C194(*; "btn_backgroundColor"; $inherit)
	End if 
	
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.borderColor))) && (Form:C1466.currentRow.borderColor#"transparent")  // NOT the default value
		OBJECT SET RGB COLORS:C628(*; "btn_borderColor"; 0; Form:C1466.border_color.css.hexLong)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBorderColor"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_borderColor"; Bold:K14:2)
		OBJECT SET TITLE:C194(*; "btn_borderColor"; "")
	Else 
		OBJECT SET RGB COLORS:C628(*; "btn_borderColor"; 0x00FFFFFF; 0x00D0D0D0)
		OBJECT SET VISIBLE:C603(*; "btn_defaultBorderColor"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_borderColor"; Plain:K14:1)
		OBJECT SET TITLE:C194(*; "btn_borderColor"; $inherit)
	End if 
	
	
	Form:C1466.align_0:=0
	Form:C1466.align_1:=0
	Form:C1466.align_2:=0
	
	If (Not:C34(Undefined:C82(Form:C1466.currentRow.alignment)))  // NOT the default value
		
		Case of 
			: (Form:C1466.currentRow.alignment=0)
				Form:C1466.align_0:=1
			: (Form:C1466.currentRow.alignment=1)
				Form:C1466.align_1:=1
			: (Form:C1466.currentRow.alignment=2)
				Form:C1466.align_2:=1
		End case 
		
		OBJECT SET VISIBLE:C603(*; "btn_defaultAlignment"; True:C214)
		OBJECT SET FONT STYLE:C166(*; "lbl_alignment"; Bold:K14:2)
		
	Else 
		
		OBJECT SET VISIBLE:C603(*; "btn_defaultAlignment"; False:C215)
		OBJECT SET FONT STYLE:C166(*; "lbl_alignment"; Plain:K14:1)
		
	End if 
	
Function themeGetFontFamily()->$fontFamilly : Object
	
	
	C_OBJECT:C1216($o; $wp)
	C_LONGINT:C283($i)
	
	ARRAY TEXT:C222($_fontFamily; 0)
	FONT LIST:C460($_fontFamily)  // no enough for japaneese! check below
	$o:=Get system info:C1571
	If ($o.osLanguage="ja")
		$wp:=WP New:C1317
		For ($i; 1; Size of array:C274($_fontFamily))
			WP SET ATTRIBUTES:C1342($wp; wk font family:K81:65; $_fontFamily{$i})
			WP GET ATTRIBUTES:C1345($wp; wk font family:K81:65; $_fontFamily{$i})
		End for 
	End if 
	
	$fontFamilly:=New object:C1471
	$fontFamilly.values:=New collection:C1472()
	ARRAY TO COLLECTION:C1563($fontFamilly.values; $_fontFamily)
	$fontFamilly.index:=0
	
Function themeGetFont($fontFamily : Text)->$font : Object
	
	ARRAY TEXT:C222($_styleList; 0)
	ARRAY TEXT:C222($_nameList; 0)
	
	FONT STYLE LIST:C1362($fontFamily; $_styleList; $_nameList)
	
	$font:=New object:C1471
	$font.values:=New collection:C1472()
	$font.fontNames:=New collection:C1472()
	ARRAY TO COLLECTION:C1563($font.values; $_styleList)
	ARRAY TO COLLECTION:C1563($font.fontNames; $_nameList)
	
	$font.index:=0
	
	
	
Function WP_BuildAll($resetBreaks : Boolean)  // true when template changes
	
	var $i : Integer
	
	If ($resetBreaks)
		
		// When the report changes
		If (Undefined:C82(Form:C1466.template.breaks))
			Form:C1466.maxBreaks:=0
		Else 
			Form:C1466.maxBreaks:=Form:C1466.template.breaks.length
		End if 
		
		Form:C1466.tableBreakAbove:=New object:C1471
		Form:C1466.tableBreakAbove.values:=New collection:C1472()
		Form:C1466.tableBreakAbove.index:=0
		
		Form:C1466.tableBreakBelow:=New object:C1471
		Form:C1466.tableBreakBelow.values:=New collection:C1472()
		Form:C1466.tableBreakBelow.index:=Form:C1466.maxBreaks
		
		For ($i; 0; Form:C1466.maxBreaks)
			Form:C1466.tableBreakBelow.values.push($i)
			Form:C1466.tableBreakAbove.values.push($i)
		End for 
		
		Form:C1466.memoCells:=New collection:C1472
		
	Else 
		
		This:C1470.WP_MemoTableContent()  // memo previous content (if any) before building
		
	End if 
	
	Form:C1466.wp:=This:C1470.WP_BuildTable()
	This:C1470.themeApply(Form:C1466.wp; "WParea")
	
	
Function WP_BuildTable()->$area : Object
	
	
	var $breakBefore; $labelHeader : Boolean
	var $o; $previousContent : Object
	var $table; $rows; $cols; $cells; $row; $range : Object
	var $i; $id; $nbColumns; $nbRows; $rowStart; $colStart; $tableWidth : Integer
	var $insertedText; $description : Text
	
	
	$area:=WP New:C1317
	
	$nbColumns:=Form:C1466.template.columns.query("check=true").length
	If ($nbColumns>0)
		
		WP SET TEXT:C1574($area; "\r"; wk append:K81:179)  // otherwise the ƒ is not visible above the table
		
		// transparency and margins for INTERFACE
		WP SET ATTRIBUTES:C1342($area; wk background color:K81:20; wk transparent:K81:134)
		WP SET ATTRIBUTES:C1342($area; wk margin left:K81:11; "0cm"; wk margin right:K81:12; "0cm"; wk margin top:K81:13; "1cm")
		// visible references by default
		$o:=New object:C1471
		$o[wk visible references:K81:286]:=True:C214
		WP SET VIEW PROPERTIES:C1648(*; "WParea"; $o)
		
		
		Form:C1466.columnIDs:=Form:C1466.template.columns.query("check=true").extract("id")  // used to memorize position of contend added by contextual menu.
		
		
		// BUILD DESCRIPTION COLLECTION 
		Form:C1466.description:=New collection:C1472
		For ($i; 1; Form:C1466.tableHeaders.index)
			Form:C1466.description.push("header"+String:C10($i))  // Header(s)"
		End for 
		
		For ($i; 1; Form:C1466.tableBreakAbove.index)
			Form:C1466.description.push("break"+String:C10($i))  // break(s) above  // S1 S2 S3
		End for 
		
		Form:C1466.description.push("data")  // data row
		
		For ($i; 1; Form:C1466.tableBreakBelow.index)
			$id:=Form:C1466.tableBreakAbove.index+Form:C1466.tableBreakBelow.index+1-$i  //s6 s5 s4
			Form:C1466.description.push("break"+String:C10($id))  // break(s) below
		End for 
		
		If (Form:C1466.tableBCOR.index>0)
			Form:C1466.description.push("bcor")  // bottom carry over
		End if 
		
		If (Form:C1466.tablePlaceholder.index=3)
			Form:C1466.description.push("placeholder")  // bottom carry over
		End if 
		
		For ($i; 1; Form:C1466.tableExtraRows.index)
			Form:C1466.description.push("extra"+String:C10($i))  // extra rows
		End for 
		$nbRows:=Form:C1466.description.length
		// END BUILD DESCRIPTION COLLECTION 
		
		
		$table:=WP Insert table:C1473($area; wk append:K81:179)
		//WP SET TEXT($area; "\r"; wk append)
		WP SET ATTRIBUTES:C1342($table; wk table align:K81:200; wk center:K81:99)
		// INSERT COLUMNS
		
		$rows:=WP Table insert rows:C1691($table; 1; $nbRows)
		If ($nbColumns>1)  // insert rows (above) has inserted 1 column.
			$cols:=WP Table insert columns:C1692($table; 1; $nbColumns-1)
		End if 
		
		$cols:=WP Table get columns:C1476($table; 1; MAXLONG:K35:2)
		$tableWidth:=Form:C1466.local.tableWidth
		WP SET ATTRIBUTES:C1342($cols; wk width:K81:45; String:C10(Int:C8($tableWidth/$nbColumns)-2)+"pt")  // 20CM WIDE 508pt
		
		
		//  table attributes
		If (Form:C1466.template.tableDataSource#Null:C1517)
			WP SET ATTRIBUTES:C1342($table; wk datasource:K81:367; Formula from string:C1601(Form:C1466.template.tableDataSource; 1))  // ∆∆∆ Feature 125
		Else 
			WP RESET ATTRIBUTES:C1344($table; wk datasource:K81:367)
		End if 
		
		WP SET ATTRIBUTES:C1342($table; wk header row count:K81:364; Form:C1466.tableHeaders.index)  // number of row HEADERS are already known
		WP SET ATTRIBUTES:C1342($table; wk bottom carry over row:K81:371; Form:C1466.tableBCOR.index)  // 1 = wk true, 0 = wk false
		
		WP SET ATTRIBUTES:C1342($table; "emptyDatasource"; Form:C1466.tablePlaceholder.attributeValues[Form:C1466.tablePlaceholder.index])
		
		
		If (True:C214)
			
			$nbColumns:=Form:C1466.template.columns.length  // will test .check in the loop
			
			$breakBefore:=True:C214
			$labelHeader:=True:C214
			
			$colStart:=1
			For ($i; 0; $nbColumns-1)  // columns of the template, not of the 4DWP table
				If (Form:C1466.template.columns[$i].check)  // CHECKED or not ???
					
					
					$rowStart:=1
					For each ($description; Form:C1466.description)
						$row:=WP Table get rows:C1475($table; $rowStart; 1)
						//WP SET ATTRIBUTES($row; "id"; Form.description)
						
						$cells:=WP Table get cells:C1477($table; $colStart; $rowStart; 1; 1)
						$range:=WP Text range:C1341($cells; wk start text:K81:165; wk end text:K81:164)
						$previousContent:=This:C1470.WP_GetPreviousContent($description; Form:C1466.columnIDs[$colStart-1])
						
						Case of 
								
							: ($description="header@")
								
								If ($previousContent#Null:C1517)
									WP INSERT DOCUMENT:C1411($range; $previousContent; wk replace:K81:177)
								Else 
									If ($description="header1")  // 1st header row has default value (title)
										$insertedText:=Form:C1466.wizard.translate("attribute"; Form:C1466.template.columns[$i].header; True:C214)
										WP SET TEXT:C1574($range; $insertedText; wk replace:K81:177)
									End if 
								End if 
								
							: ($description="data")  //  Data
								
								If ($previousContent#Null:C1517)
									WP INSERT DOCUMENT:C1411($range; $previousContent; wk replace:K81:177)
								Else 
									WP INSERT FORMULA:C1703($range; Formula from string:C1601(Form:C1466.template.columns[$i].source; 1); wk replace:K81:177)  // ∆∆∆ Feature 125
								End if 
								
							: ($description="break@")  // break
								
								$id:=Num:C11($description)-1
								WP SET ATTRIBUTES:C1342($row; "breakFormula"; Formula from string:C1601(Form:C1466.template.breaks[$id].source; 1))  //wk break formula  // ∆∆∆ Feature 125
								
								If ($previousContent#Null:C1517)
									WP INSERT DOCUMENT:C1411($range; $previousContent; wk replace:K81:177)
								End if 
								
								
							: ($description="bcor")  // bottom carry over row
								If ($previousContent#Null:C1517)
									WP INSERT DOCUMENT:C1411($range; $previousContent; wk replace:K81:177)
								End if 
								
							: ($description="extra@")  // extra rows
								If ($previousContent#Null:C1517)
									WP INSERT DOCUMENT:C1411($range; $previousContent; wk replace:K81:177)
								End if 
								
							: ($description="placeholder")  // placeholder
								If ($previousContent#Null:C1517)
									WP INSERT DOCUMENT:C1411($range; $previousContent; wk replace:K81:177)
								End if 
								
						End case 
						$rowStart:=$rowStart+1
					End for each 
					
					$colStart:=$colStart+1
				Else   // NOT CHECKED
					
				End if 
			End for 
			
		End if 
		
	End if 
	
Function WP_BuildThemeSample($template : Collection; $areaName : Text)->$document : Object
	
	
	var $o : Object
	var $attribute : Text
	var $nbColumns; $nbRows; $rowStart : Integer
	var $table; $rows; $cols; $cells; $style; $tempStyle; $target : Object
	var $attributes : Collection
	
	$document:=WP New:C1317
	
	// transparency and margins for interface
	WP SET ATTRIBUTES:C1342($document; wk background color:K81:20; wk transparent:K81:134)
	WP SET ATTRIBUTES:C1342($document; wk margin left:K81:11; "0cm"; wk margin right:K81:12; "0cm"; wk margin top:K81:13; "0.5cm")
	
	// visible references by default
	$o:=New object:C1471
	$o[wk visible references:K81:286]:=True:C214
	WP SET VIEW PROPERTIES:C1648(*; $areaName; $o)
	
	$nbColumns:=1
	$nbRows:=$template.query("check = true").length-1  //
	
	//WP SET TEXT(Form.wp; "\r"; wk append)  // otherwise the ƒ is not visible
	
	// Insert a table with 14 rows and two columns
	$table:=WP Insert table:C1473($document; wk append:K81:179; wk exclude from range:K81:181; 2; 14)
	WP SET ATTRIBUTES:C1342($table; wk table align:K81:200; wk middle:K81:101)
	
	$cols:=WP Table get columns:C1476($table; 1; MAXLONG:K35:2)
	$rows:=WP Table get rows:C1475($table; 1; MAXLONG:K35:2)
	$cells:=WP Table get cells:C1477($table; 1; 1; MAXLONG:K35:2; MAXLONG:K35:2)
	
	WP SET ATTRIBUTES:C1342($cols; wk width:K81:45; "6cm")  // 8cm WIDE
	
	$rowStart:=0
	For each ($style; $template)
		
		If ($style.type="default") || ($style.type="table") || ($style.type="rows") || ($style.type="cells")
			
			Case of 
				: ($style.type="default") && ($style.check)  //checked = true always
					$tempStyle:=OB Copy:C1225($style)
					This:C1470.themeFillMissing($tempStyle)  // filled by default values when missing
					
					//$tempDefault:=OB Copy($tempStyle)  // used in the three cases below
					
					$target:=$table
					
				: ($style.type="table") && ($style.check)
					//$tempStyle:=$style  // same style, not a copy
					$tempStyle:=OB Copy:C1225($style)
					This:C1470.themeFillMissing($tempStyle)  //; $tempDefault)
					$target:=$table
					
				: ($style.type="rows") && ($style.check)
					//$tempStyle:=$style  // same style, not a copy
					$tempStyle:=OB Copy:C1225($style)
					This:C1470.themeFillMissing($tempStyle)  //; $tempDefault)
					$target:=$rows
					
				: ($style.type="cells") && ($style.check)
					//$tempStyle:=$style  // same style, not a copy
					$tempStyle:=OB Copy:C1225($style)
					This:C1470.themeFillMissing($tempStyle)  //; $tempDefault)
					$target:=$cells
					
			End case 
			
			If ($style.check)
				$attributes:=[wk font:K81:69; wk font size:K81:66; wk text color:K81:64; wk text align:K81:49; wk background color:K81:20; wk border width:K81:39; wk border color:K81:34; wk border style:K81:29; wk padding:K81:15]
				
				For each ($attribute; $attributes)
					If (Not:C34(Undefined:C82($tempStyle[$attribute])))
						WP SET ATTRIBUTES:C1342($target; $attribute; $tempStyle[$attribute])
					End if 
				End for each 
				
			End if 
			
		Else 
			
			If ($style.check)
				
				If ($rowStart=0)
					$rowStart:=1
				End if 
				$target:=WP Table get rows:C1475($table; $rowStart; 1)
				
				
				If (Not:C34(Undefined:C82($style.font)))
					WP SET ATTRIBUTES:C1342($target; wk font:K81:69; $style.font)
				End if 
				
				If (Not:C34(Undefined:C82($style.fontSize)))
					WP SET ATTRIBUTES:C1342($target; wk font size:K81:66; $style.fontSize)
				End if 
				
				If (Not:C34(Undefined:C82($style.color)))
					WP SET ATTRIBUTES:C1342($target; wk text color:K81:64; $style.color)
				End if 
				
				If (Not:C34(Undefined:C82($style.alignment)))
					WP SET ATTRIBUTES:C1342($target; wk text align:K81:49; $style.alignment)
				End if 
				
				If (Not:C34(Undefined:C82($style.backgroundColor)))
					WP SET ATTRIBUTES:C1342($target; wk background color:K81:20; $style.backgroundColor)
				End if 
				
				If (Not:C34(Undefined:C82($style.borderWidth)))
					WP SET ATTRIBUTES:C1342($target; wk border width:K81:39; $style.borderWidth)
				End if 
				
				If (Not:C34(Undefined:C82($style.borderColor)))
					WP SET ATTRIBUTES:C1342($target; wk border color:K81:34; $style.borderColor)
				End if 
				
				If (Not:C34(Undefined:C82($style.borderStyle)))
					WP SET ATTRIBUTES:C1342($target; wk border style:K81:29; $style.borderStyle)
				End if 
				
				If (Not:C34(Undefined:C82($style.padding)))
					WP SET ATTRIBUTES:C1342($target; wk padding:K81:15; $style.padding)
				End if 
				
				If ($style.type#"table") && ($style.type#"rows") && ($style.type#"cells")
					WP SET TEXT:C1574($target; $style.type; wk replace:K81:177)
				End if 
				
				$rowStart+=1
			End if 
			
		End if 
		
	End for each 
	
	
	While ($rowStart<=14)
		If ($rowStart=0)
			$rowStart:=1
		End if 
		$target:=WP Table get rows:C1475($table; $rowStart; 1)
		WP SET TEXT:C1574($target; "Default"; wk replace:K81:177)
		$rowStart+=1
	End while 
	
Function WP_MemoTableContent()
	
	var $table; $cell : Object
	var $x; $y; $colID; $index : Integer
	var $description : Text
	var $o; $range : Object
	var $something : Boolean
	var $result : Collection
	
	If (Undefined:C82(Form:C1466.memoCells))
		Form:C1466.memoCells:=New collection:C1472
	End if 
	
	$table:=WP Get elements:C1550(Form:C1466.wp; wk type table:K81:222).first()
	If ($table#Null:C1517)
		
		For ($x; 1; Form:C1466.columnIDs.length)  // currently displayed columns
			For ($y; 1; Form:C1466.description.length)  // currently displayed rows
				
				$colID:=Form:C1466.columnIDs[$x-1]
				$description:=Form:C1466.description[$y-1]
				$cell:=WP Table get cells:C1477($table; $x; $y; 1; 1)
				If ($cell#Null:C1517)  // should never happend
					
					$range:=WP Text range:C1341($cell; wk start text:K81:165; wk end text:K81:164)
					$result:=Form:C1466.memoCells.query("rowType = :1 and column = :2"; $description; $colID)
					$something:=(($range.end-$range.start)>1)
					
					If ($something)  // something in the cell
						
						If ($result.length=0)
							
							$o:=New object:C1471
							$o.rowType:=$description
							$o.column:=$colID
							$o.content:=WP New:C1317($cell)
							Form:C1466.memoCells.push($o)
						Else 
							$result[0].rowType:=$description
							$result[0].column:=$colID
							$result[0].content:=WP New:C1317($cell)
						End if 
						
					Else 
						If ($result.length>0)
							$index:=Form:C1466.memoCells.indexOf($result[0])
							If ($index>=0)  // should be always, just to be safe
								Form:C1466.memoCells.remove($index; 1)
							End if 
						End if 
					End if 
				End if 
			End for 
		End for 
		
	End if 
	
	Form:C1466.memoCells:=Form:C1466.memoCells
	
Function WP_GetPreviousContent($description : Text; $columnID : Integer)->$document : Object
	
	$document:=Form:C1466.memoCells.query("rowType = :1 and column = :2"; $description; $columnID).first().content
	
Function WP_GetMaxTableWidth->$width : Integer
	
	var $left; $right; $orientation : Integer
	var $section; $document : Object
	var $unit : Text
	
	If (Undefined:C82(Form:C1466.range))
		$width:=508  // pt = about 20cm
	Else 
		
		$document:=Form:C1466.range.owner
		WP GET ATTRIBUTES:C1345($document; wk layout unit:K81:78; $unit)  // memo unit
		
		WP SET ATTRIBUTES:C1342($document; wk layout unit:K81:78; wk unit pt:K81:136)
		$section:=WP Get section:C1581(Form:C1466.range)
		
		WP GET ATTRIBUTES:C1345($section; wk page orientation:K81:264; $orientation)
		If ($orientation=0)  // portrait
			WP GET ATTRIBUTES:C1345($document; wk page width:K81:262; $width; wk page margin left:K81:266; $left; wk page margin right:K81:267; $right)
		Else   // landscape
			WP GET ATTRIBUTES:C1345($document; wk page height:K81:263; $width; wk page margin left:K81:266; $left; wk page margin right:K81:267; $right)
		End if 
		$width:=$width-$left-$right
		
		WP SET ATTRIBUTES:C1342($document; wk layout unit:K81:78; $unit)  // back to memo
		
		Case of 
			: ($width<400)
				$width:=400
			: ($width>1000)
				$width:=1000
		End case 
		
	End if 
	
	
	
Function JSONvalidate($type : Text; $files : Collection)->$result : Boolean
	
	var $file : 4D:C1709.File
	var $schema; $parsing; $tempObject : Object
	var $methCurrent; $alert : Text
	var $i : Integer
	
	Case of 
		: ($type="translate")
			$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"4DWP_Wizard/JsonSchemas/schemaTranslate.json")
			
		: ($type="template")
			$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"4DWP_Wizard/JsonSchemas/schemaTemplate.json")
			
		: ($type="theme")
			$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"4DWP_Wizard/JsonSchemas/schemaTheme.json")
			
	End case 
	
	$schema:=JSON Parse:C1218($file.getText())  // always OK (internal file, no need to check)
	
	$result:=True:C214  // lets be ontimistic !
	$i:=$files.length-1
	
	$methCurrent:=Method called on error:C704
	ON ERR CALL:C155("JSONparseError")
	
	For each ($file; $files.reverse()) Until ($result=False:C215)
		
		ok:=1
		$alert:=""
		$tempObject:=JSON Parse:C1218($file.getText())
		If (ok=0)
			$alert:=Get localized string:C991("JSONparseError")
			$files.remove($i; 1)
		Else 
			$parsing:=JSON Validate:C1456($tempObject; $schema)
			
			If (Not:C34($parsing.success))
				$alert:=Get localized string:C991("JSONvalidationError")
				$files.remove($i; 1)
			End if 
		End if 
		
		If ($alert#"")
			$alert:=Replace string:C233($alert; ":1"; $file.fullName)
			ALERT:C41($alert)
			$files.remove($i; 1)
		End if 
		
		$i:=$i-1
		
	End for each 
	
	ON ERR CALL:C155($methCurrent)
	
	
	
	