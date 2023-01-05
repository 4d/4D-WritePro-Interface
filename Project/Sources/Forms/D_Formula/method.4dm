var $file : 4D:C1709.File
var $dictionnary; $context; $class : Object
var $dataClassName; $attributeName; $lang : Text
var $i; $p; $count : Integer

Case of 
		
	: (Form event code:C388=On Deactivate:K2:10)
		
		CANCEL:C270
		
	: (Form event code:C388=On Unload:K2:2)
		
		Form:C1466.contextHList.clear()
		Form:C1466.displayedHList.clear()
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(tCol0; 0)
		ARRAY TEXT:C222(tCol1; 0)
		ARRAY TEXT:C222(tCol2; 0)
		ARRAY TEXT:C222(tCol3; 0)
		ARRAY TEXT:C222(tCol4; 0)
		
		Form:C1466.local:=New object:C1471
		
		// get localised names for tables and fields (if any)
		
		// get localised names for tables and fields (if any)
		$lang:=Get database localization:C1009(Current localization:K5:22; *)
		
		$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+$lang+".lproj/structureTranslation.json"; *)
		If (Not:C34($file.exists))
			$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"en.lproj/structureTranslation.json"; *)
			If (Not:C34($file.exists))
				$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).path+"structureTranslation.json"; *)
			End if 
		End if 
		
		If ($file.exists)
			$dictionnary:=JSON Parse:C1218($file.getText())
			
			Form:C1466.local.tables:=$dictionnary.tables.extract("original")
			Form:C1466.local.tablesTranslated:=$dictionnary.tables.extract("translation")
			
			Form:C1466.local.attributes:=$dictionnary.fields.extract("original")
			Form:C1466.local.attributesTranslated:=$dictionnary.fields.extract("translation")
		End if 
		
		
		
		
		
		
		// FORMATS FOR DROP DOWN WIDGETS
		
		Form:C1466.local.dateFormats:=New object:C1471
		Form:C1466.local.dateFormats.values:=New collection:C1472("System date short"; "System date abbreviated"; "System date long"; "Date RFC 1123"; "Internal date abbreviated"; "Internal date short"; "Internal date short special"; "Internal date long"; "iso date"; "Blank if null")
		Form:C1466.local.dateFormats.index:=0
		Form:C1466.local.dateFormats.type:=Is date:K8:7
		Form:C1466.local.dateFormats.apply4D:=New collection:C1472(System date short:K1:1; System date abbreviated:K1:2; System date long:K1:3; Date RFC 1123:K1:11; Internal date abbreviated:K1:6; Internal date short:K1:7; Internal date short special:K1:4; Internal date long:K1:5; ISO date:K1:8; Blank if null date:K1:9)
		
		Form:C1466.local.timeFormats:=New object:C1471
		Form:C1466.local.timeFormats.values:=New collection:C1472("HH MM"; "MM SS"; "HH MM SS"; "HH MM AM PM"; "System time short"; "System time long abbreviated"; "System time long"; "Hour min"; "Min sec"; "Hour min sec"; "ISO time"; "Blank if null time")
		Form:C1466.local.timeFormats.index:=0
		Form:C1466.local.timeFormats.type:=Is time:K8:8
		Form:C1466.local.timeFormats.apply4D:=New collection:C1472(HH MM:K7:2; MM SS:K7:6; HH MM SS:K7:1; HH MM AM PM:K7:5; System time short:K7:9; System time long abbreviated:K7:10; System time long:K7:11; Hour min:K7:4; Min sec:K7:7; Hour min sec:K7:3; ISO time:K7:8; Blank if null time:K7:12)
		
		Form:C1466.local.numberFormats:=New object:C1471
		Form:C1466.local.numberFormats.values:=New collection:C1472("###,##0.00"; "###,##0"; "###,##0.00"; "#####0"; "##0.00%"; "##0%")
		Form:C1466.local.numberFormats.index:=0
		Form:C1466.local.numberFormats.type:=Is real:K8:4
		Form:C1466.local.numberFormats.apply4D:=New collection:C1472("###,###,###,##0.00"; "###,###,###,##0"; "###########0.00"; "###########0"; "###,##0.00%"; "###,##0%")
		
		Form:C1466.local.textFormats:=New object:C1471
		Form:C1466.local.textFormats.values:=New collection:C1472("None"; "##-##-##-##"; "## ## ## ##"; "###-###-###-###"; "### ### ### ###"; "####-####-####-####"; "#### #### #### ####")
		Form:C1466.local.textFormats.index:=0
		Form:C1466.local.textFormats.type:=Is text:K8:3
		Form:C1466.local.textFormats.apply4D:=New collection:C1472(""; "##-##-##-##"; "## ## ## ##"; "###-###-###-###"; "### ### ### ###"; "####-####-####-####"; "#### #### #### ####")
		
		Form:C1466.local.pictureFormats:=New object:C1471
		Form:C1466.local.pictureFormats.values:=New collection:C1472("Scaled to fit"; "Scaled to fit prop centered"; "Scaled to fit proportional"; "Truncated centered"; "Truncated non centered"; "Replicated")
		Form:C1466.local.pictureFormats.index:=0
		Form:C1466.local.pictureFormats.type:=Is picture:K8:10
		Form:C1466.local.pictureFormats.apply4D:=New collection:C1472(Scaled to fit:K6:2; Scaled to fit prop centered:K6:6; Scaled to fit proportional:K6:5; Truncated centered:K6:1; Truncated non centered:K6:4; Replicated:K6:7)
		
		Form:C1466.local.booleanFormats:=New object:C1471
		Form:C1466.local.booleanFormats.values:=New collection:C1472("true;false"; "yes;no"; "Mr;Mz")
		Form:C1466.local.booleanFormats.index:=0
		Form:C1466.local.booleanFormats.type:=Is boolean:K8:9
		Form:C1466.local.booleanFormats.apply4D:=New collection:C1472("true;false"; "yes;no"; "Mr;Mz")
		
		
		Form:C1466.local.links:=New object:C1471
		If (Undefined:C82(Form:C1466.context.linksLevels))
			Form:C1466.local.links.values:=New collection:C1472(0; 1; 2; 3; 4; 5)
			Form:C1466.local.links.index:=0
		Else 
			If (Form:C1466.context.linksLevels>0)
				Form:C1466.local.links.values:=New collection:C1472
				For ($i; 0; Form:C1466.context.linksLevels)
					Form:C1466.local.links.values.push($i)
				End for 
				Form:C1466.local.links.index:=Form:C1466.context.linksLevels
			Else 
				OBJECT SET VISIBLE:C603(*; "lbl_links"; False:C215)
				OBJECT SET VISIBLE:C603(*; "DD_links"; False:C215)
			End if 
		End if 
		
		
		If (Undefined:C82(Form:C1466.context))  // no context at all
			// create one if undefined
			Form:C1466.context:=New object:C1471
			For each ($dataClassName; ds:C1482)
				Form:C1466.context[$dataClassName]:=ds:C1482[$dataClassName].all().first()
			End for each 
			
		Else 
			// check if the context contains entities
			$context:=Form:C1466.context
			$count:=0
			For each ($attributeName; $context)
				If (Value type:C1509($context[$attributeName])=Is object:K8:27)
					$class:=OB Class:C1730($context[$attributeName])  // ex : PeopleEntity or CompanyEntity
					If (Not:C34(Undefined:C82($class.superclass))) && ($class.superclass.name="Entity")
						$count:=$count+1
					End if 
				End if 
			End for each 
			
			If ($count=0)  // the context contains only allowed or hidden table names
				For each ($dataClassName; ds:C1482)
					If ((Undefined:C82(Form:C1466.context.allowedTables)) || (Form:C1466.context.allowedTables.length=0) || (Form:C1466.context.allowedTables.indexOf($dataClassName)>=0))\
						 && ((Undefined:C82(Form:C1466.context.hiddenTables)) || (Form:C1466.context.hiddenTables.length=0) || (Form:C1466.context.hiddenTables.indexOf($dataClassName)<0))
						Form:C1466.context[$dataClassName]:=ds:C1482[$dataClassName].all().first()
					End if 
				End for each 
			End if 
			
		End if 
		
		
		Form:C1466.contextHList:=BuildHLContext(Form:C1466.context)
		Form:C1466.displayedHList:=Form:C1466.contextHList.clone()  //Copy list(Form.contextHList)
		Form:C1466.displayedHList.formObject:="DisplayedHL"
		
		// edit current formula if any
		If (Not:C34(Undefined:C82(Form:C1466.formulaSource)))
			$p:=-1
			
			// special cases first
			Case of 
				: (Form:C1466.formulaSource="current date")
					Form:C1466.formulaName:="current date"
					UI_Formula("init"; Is date:K8:7)
					
				: (Form:C1466.formulaSource="current time")
					Form:C1466.formulaName:="current time"
					UI_Formula("init"; Is time:K8:8)
					
				Else 
					
					Form:C1466.displayedHList.findInParameter("SOURCE"; Form:C1466.formulaSource)
					//$p:=Form.displayedFieldList.findIndex(Formula($1.value.formulaSource=$2); Form.formulaSource)
					//If ($p>=0)
					//$p:=$p+1
					//Else 
					//$p:=-1
					//FORM GOTO PAGE(2)  // direct edit of complex formula
					//End if 
					
			End case 
		Else 
			$p:=0
			Form:C1466.formulaSource:=""
		End if 
		
		//If ($p>0)
		
		//// select item in the listbox
		//LISTBOX SELECT ROW(*; "LB_DisplayFieldList"; $p)
		//OBJECT SET SCROLL POSITION(*; "LB_DisplayFieldList"; $p; *)
		
		//Form.current:=Form.displayedFieldList[$p-1]
		
		//Form.formulaSource:=Form.current.formulaSource
		//Form.formulaName:=Replace string(Form.current.name; "."; " ")
		
		//UI_Formula("init"; Form.current.type)
		
		//Else 
		
		//LISTBOX SELECT ROW(*; "LB_DisplayFieldList"; 0; lk remove from selection)
		
		//End if 
		
		
		Form:C1466.local.filter:=""
		Form:C1466.local.formatSample:=""
		Form:C1466.formulaSource:=""
		
		UI_Formula("cleanup")
		
		// goto nowhere
		GOTO OBJECT:C206(*; "")
		
End case 


