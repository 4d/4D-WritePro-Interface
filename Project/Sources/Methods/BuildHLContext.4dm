//%attributes = {}
//#DECLARE($context : Object; $contextName : Text; $linksLevel : Integer)->$returnedContextList : Collection

#DECLARE($context : Object; $contextName : Text; $contextNameTranslated : Text; $itemRef : Integer; $linksLevel : Integer)->$HList : cs:C1710.HList

var $icon : Picture
var $picturePath; $attributeName; $dataClassName; $attributeNameTranslated; $json; $relatedDataClassName; $nextContextName; $nextContextNameTranslated : Text

var $subList : cs:C1710.HList

var $itemRef; $p; $type; $maxLinks : Integer
var $o : Object
var $class; $relatedDataClass : Object  //∆∆∆
var $dataClass : 4D:C1709.DataClass
var $fill; $append : Boolean

Case of 
	: (Count parameters:C259<1)
		ALERT:C41("missing parameters")
		
	: (Count parameters:C259=1)
		
		$picturePath:="path:/RESOURCES/Images/Colors/FrontColor_7.png"
		
		
		$HList:=cs:C1710.HList.new()
		$itemRef:=1000
		For each ($attributeName; $context)  // driver1, driver2, departureAgency, arrivalAggency
			
			If (Value type:C1509($context[$attributeName])=Is object:K8:27)
				$class:=OB Class:C1730($context[$attributeName])  // ex : PeopleEntity or CompanyEntity
				If (Not:C34(Undefined:C82($class.superclass))) && ($class.superclass.name="Entity")
					
					$dataClass:=$context[$attributeName].getDataClass()
					$dataClassName:=$dataClass.getInfo().name  // at this level, container is the context of the dialog
					
					If (Undefined:C82(Form:C1466.local.tables))
						$fill:=True:C214
					Else 
						$p:=Form:C1466.local.tables.indexOf($dataClassName)
						If ($p>=0)
							$fill:=True:C214
						Else 
							$fill:=False:C215
						End if 
					End if 
					
					If ($fill)
						
						// at this level, the presense of attribute (entity) name is not mandatory in the translation file, just used for translation if found
						// ex : "driver1" is a "people" entity and "people" has already been validated above.
						// just check if driver1 is translated too or not.
						// if not, doesn't matter, 
						
						If (Undefined:C82(Form:C1466.local.tables))
							$attributeNameTranslated:=$attributeName  // NO translation/ no filter
						Else 
							$p:=Form:C1466.local.tables.indexOf($attributeName)  // check if translated
							If ($p>=0)
								$attributeNameTranslated:=Form:C1466.local.tablesTranslated[$p]
							Else 
								$attributeNameTranslated:=$attributeName  // NOT fond = not translated (does not matter)
							End if 
						End if 
						
						$subList:=BuildHLContext($dataClass; $attributeName; $attributeNameTranslated; $itemRef+1; 0)  // first call the attribute name may NOT be translated
						
						$HList.append(" "+$attributeNameTranslated; $itemRef; $subList.hlist; False:C215)  //
						//$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 
						$HList.setProperties($itemRef; False:C215; Bold:K14:2; $picturePath)
						
						$itemRef:=$itemRef+$subList.countItems()+1
					End if 
				End if 
				
			End if   // not an object !
		End for each 
		
		If ($HList.countItems()=1)
			$HList.expandItem(1)
		End if 
		
		
	: (Count parameters:C259>=3)  // dataclass (ex = People) ; $itemRef; $linksLevel
		
		$dataClass:=$context
		$dataClassName:=$dataClass.getInfo().name
		
		// check if there is a filter in the form
		If ((Undefined:C82(Form:C1466.context.allowedTables)) || (Form:C1466.context.allowedTables.length=0) || (Form:C1466.context.allowedTables.indexOf($dataClassName)>=0))\
			 && ((Undefined:C82(Form:C1466.context.hiddenTables)) || (Form:C1466.context.hiddenTables.length=0) || (Form:C1466.context.hiddenTables.indexOf($dataClassName)<0))
			
			$HList:=cs:C1710.HList.new()  // sublist
			
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
						
						
						If (Not:C34(Undefined:C82(Form:C1466.local.attributes)))
							
							$p:=Form:C1466.local.attributes.indexOf($attributeName)
							If ($p>=0)
								$attributeNameTranslated:=Form:C1466.local.attributesTranslated[$p]
								$o.name:=$contextNameTranslated+" "+$attributeNameTranslated
							Else 
								$append:=False:C215
							End if 
							
						Else 
							
							$o.name:=$contextName+" "+$attributeName
							$attributeNameTranslated:=$attributeName  // NOT TRANLATED
							
						End if 
						
					End if 
					
					If ($append)
						
						$HList.append($attributeNameTranslated; $itemRef)  // no sublist
						//$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 
						
						$json:=JSON Stringify:C1217($o; *)  //  ";*" TEMPO FOR DEBUG 
						$HList.setParameter($itemRef; "JSON"; $json)
						$HList.setParameter($itemRef; "SOURCE"; $o.formulaSource)
						
						$itemRef:=$itemRef+1
						
					End if 
					
					
				Else   // related. may launch a recursive call
					
					$maxLinks:=Form:C1466.local.links.index
					
					If ($linksLevel<$maxLinks)
						
						$dataClassName:=$dataClass.getInfo().name
						If (ds:C1482[$dataClassName][$attributeName].kind="relatedEntity")
							
							$append:=True:C214
							If (Undefined:C82(Form:C1466.local.attributes))
								
								$attributeNameTranslated:=$attributeName  // NOT translated
								$nextContextName:=$contextName+"."+$attributeName
								$relatedDataClassName:=ds:C1482[$dataClassName][$attributeName].relatedDataClass
								$relatedDataClass:=ds:C1482[$relatedDataClassName]
								
							Else 
								
								$p:=Form:C1466.local.attributes.indexOf($attributeName)  // check if localised / not filtered
								If ($p>=0)
									$attributeNameTranslated:=Form:C1466.local.attributesTranslated[$p]
									$nextContextName:=$contextName+"."+$attributeName  // NOT TRANSLATED !!! $attributeNameTranslated
									
									$nextContextNameTranslated:=$contextNameTranslated+" "+$attributeNameTranslated
									
									$relatedDataClassName:=ds:C1482[$dataClassName][$attributeName].relatedDataClass
									$relatedDataClass:=ds:C1482[$relatedDataClassName]
									
								Else 
									$append:=False:C215
								End if 
							End if 
							
							If ($append)
								
								$sublist:=BuildHLContext($relatedDataClass; $nextContextName; $nextContextNameTranslated; $itemRef+1; $linksLevel+1)
								If ($sublist#Null:C1517)
									If ($sublist.countItems()>0)
										$HList.append($attributeNameTranslated; $itemRef; $sublist.hlist; False:C215)
										//$HList.setParameter($itemRef; Additional text; String($itemRef))  // TEMPO FOR DEBUG 
										$itemRef:=$itemRef+$sublist.countItems()+1
									Else 
										$sublist.clear()  // otherwise memory leaks !
									End if 
									
								End if 
							End if 
							
						End if   // not a related entity
						
					End if   // max links reached
					
				End if 
				
			End for each 
			
			
		End if 
		
		
End case 

//$HList:=$receivedFieldList
