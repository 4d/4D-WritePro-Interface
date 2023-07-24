
var $context; $class; $ds : Object
var $dataClassName; $attributeName : Text
var $i; $p; $count : Integer
var $static : Boolean


Case of 
		
	: (Form event code:C388=On Deactivate:K2:10)
		
		CANCEL:C270
		
	: (Form event code:C388=On Unload:K2:2)
		
		Form:C1466.contextHList.clear()
		Form:C1466.displayedHList.clear()
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.local:=New object:C1471
		
		Form:C1466.wizard:=cs:C1710.TableWizard.new()
		
		
		// FORMATS FOR DROP DOWN WIDGETS
		
		Form:C1466.local.dateFormats:=New object:C1471
		Form:C1466.local.dateFormats.values:=New collection:C1472("System date short"; "System date abbreviated"; "System date long"; "Date RFC 1123"; "Internal date abbreviated"; "Internal date short"; "Internal date short special"; "Internal date long"; "iso date")
		Form:C1466.local.dateFormats.index:=0
		Form:C1466.local.dateFormats.type:=Is date:K8:7
		Form:C1466.local.dateFormats.apply4D:=New collection:C1472(System date short:K1:1; System date abbreviated:K1:2; System date long:K1:3; Date RFC 1123:K1:11; Internal date abbreviated:K1:6; Internal date short:K1:7; Internal date short special:K1:4; Internal date long:K1:5; ISO date:K1:8)
		
		Form:C1466.local.timeFormats:=New object:C1471
		Form:C1466.local.timeFormats.values:=New collection:C1472("HH MM"; "MM SS"; "HH MM SS"; "HH MM AM PM"; "System time short"; "System time long abbreviated"; "System time long"; "Hour min"; "Min sec"; "Hour min sec"; "ISO time")
		Form:C1466.local.timeFormats.index:=0
		Form:C1466.local.timeFormats.type:=Is time:K8:8
		Form:C1466.local.timeFormats.apply4D:=New collection:C1472(HH MM:K7:2; MM SS:K7:6; HH MM SS:K7:1; HH MM AM PM:K7:5; System time short:K7:9; System time long abbreviated:K7:10; System time long:K7:11; Hour min:K7:4; Min sec:K7:7; Hour min sec:K7:3; ISO time:K7:8)
		
		Form:C1466.local.numberFormats:=New object:C1471
		Form:C1466.local.numberFormats.values:=New collection:C1472("###,##0.00"; "###,##0"; "###,##0.00"; "#####0"; "##0.00%"; "##0%")
		Form:C1466.local.numberFormats.index:=0
		Form:C1466.local.numberFormats.type:=Is real:K8:4
		Form:C1466.local.numberFormats.apply4D:=New collection:C1472("###,###,###,##0.00"; "###,###,###,##0"; "###########0.00"; "###########0"; "###,##0.00%"; "###,##0%")
		
		
		Form:C1466.local.numberAndTimeFormats:=New object:C1471
		Form:C1466.local.numberAndTimeFormats.values:=New collection:C1472(\
			"###,##0.00"; "###,##0"; "###,##0.00"; "#####0"; "##0.00%"; "##0%"; \
			"(-"; \
			"HH MM"; "MM SS"; "HH MM SS"; "HH MM AM PM"; "System time short"; "System time long abbreviated"; "System time long"; "Hour min"; "Min sec"; "Hour min sec"; "ISO time")
		Form:C1466.local.numberAndTimeFormats.index:=0
		Form:C1466.local.numberAndTimeFormats.type:=Is integer:K8:5  // means TIME OR NUMERIC
		Form:C1466.local.numberAndTimeFormats.apply4D:=New collection:C1472(\
			"###,###,###,##0.00"; "###,###,###,##0"; "###########0.00"; "###########0"; "###,##0.00%"; "###,##0%"; \
			"xx"; \
			HH MM:K7:2; MM SS:K7:6; HH MM SS:K7:1; HH MM AM PM:K7:5; System time short:K7:9; System time long abbreviated:K7:10; System time long:K7:11; Hour min:K7:4; Min sec:K7:7; Hour min sec:K7:3; ISO time:K7:8)
		
		
		
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
		
		
		
		Case of 
			: (Undefined:C82(Form:C1466.context)) || (Form:C1466.context=Null:C1517)  // no context at all or Null
				
				// create one if undefined
				Form:C1466.context:=New object:C1471
				For each ($dataClassName; ds:C1482)
					Form:C1466.context[$dataClassName]:=ds:C1482[$dataClassName].all().first()
				End for each 
				$static:=False:C215
				
			: (Not:C34(Undefined:C82(Form:C1466.context.dataStore)))
				
				$ds:=Form:C1466.context.dataStore
				For each ($dataClassName; $ds)
					Form:C1466.context[$dataClassName]:=$ds[$dataClassName].all().first()
				End for each 
				OB REMOVE:C1226(Form:C1466.context; "dataStore")
				$static:=False:C215
				
			: (True:C214)  // there is a context; check what kind of context !
				
				// check if the context contains entities
				
				$context:=Form:C1466.context
				$count:=0
				For each ($attributeName; $context)
					If (Value type:C1509($context[$attributeName])=Is object:K8:27)
						$class:=OB Class:C1730($context[$attributeName])  // ex : PeopleEntity or CompanyEntity
						If (Not:C34(Undefined:C82($class.superclass))) && ($class.superclass#Null:C1517) && ($class.superclass.name="Entity")
							$count:=$count+1
						End if 
					End if 
				End for each 
				
				If ($count=0)
					$static:=True:C214  // use the context "as it" (no entities, use the context as a simple object)
				Else 
					$static:=False:C215  // build list based on ORDA
				End if 
				
				
				//If ($count=0)  // the context contains only allowed or hidden table names
				//For each ($dataClassName; ds)
				//If ((Undefined(Form.context.allowedTables)) || (Form.context.allowedTables.length=0) || (Form.context.allowedTables.indexOf($dataClassName)>=0))\
																																																																																																														 && ((Undefined(Form.context.hiddenTables)) || (Form.context.hiddenTables.length=0) || (Form.context.hiddenTables.indexOf($dataClassName)<0))
				
				//// Add allowed classes to the context
				////Form.context[$dataClassName]:=ds[$dataClassName].all().first()
				
				//End if 
				//End for each 
				//End if 
				
		End case 
		
		
		If ($static)
			
			//Form.contextHList:=cs.HList.new()
			//Form.contextHList.buildStatic(Form.context)  // *** buildStatic is based on the content of a regular object, NOT orda
			
			Form:C1466.contextHList:=Form:C1466.wizard.formulaBuildStatic(Form:C1466.context)
			
			OBJECT SET VISIBLE:C603(*; "lbl_links"; False:C215)
			OBJECT SET VISIBLE:C603(*; "DD_links"; False:C215)
			
		Else 
			
			Form:C1466.local.links:=New object:C1471
			
			If (Undefined:C82(Form:C1466.context.maxRelationLevels))
				Form:C1466.local.links.values:=New collection:C1472(0; 1; 2; 3; 4; 5)
				Form:C1466.local.links.index:=0
			Else 
				
				If (Form:C1466.context.maxRelationLevels>0)
					Form:C1466.local.links.values:=New collection:C1472
					For ($i; 0; Form:C1466.context.maxRelationLevels)
						Form:C1466.local.links.values.push($i)
					End for 
					Form:C1466.local.links.index:=Form:C1466.context.maxRelationLevels
				Else 
					Form:C1466.local.links.values.push(0)
					Form:C1466.local.links.index:=0  // used in BuildHLContext
					
					OBJECT SET VISIBLE:C603(*; "lbl_links"; False:C215)
					OBJECT SET VISIBLE:C603(*; "DD_links"; False:C215)
				End if 
			End if 
			
			//Form.contextHList:=cs.HList.new()
			//Form.contextHList.buildDynamic(Form.context)  // ***
			Form:C1466.contextHList:=Form:C1466.wizard.formulaBuildDynamic(Form:C1466.context)
			
		End if 
		
		Form:C1466.displayedHList:=Form:C1466.contextHList.clone()
		Form:C1466.displayedHList.formObject:="DisplayedHL"
		
		
		
		// edit current formula if any
		If (Not:C34(Undefined:C82(Form:C1466.formulaSource)))
			$p:=-1
			
			// special cases first
			Case of 
				: (Form:C1466.formulaSource="current date")
					Form:C1466.formulaName:="current date"
					Form:C1466.wizard.formulaUI("init"; Is date:K8:7)
					
				: (Form:C1466.formulaSource="current time")
					Form:C1466.formulaName:="current time"
					Form:C1466.wizard.formulaUI("init"; Is time:K8:8)
					
				Else 
					
					Form:C1466.displayedHList.findInParameter("SOURCE"; Form:C1466.formulaSource)
					
			End case 
		Else 
			$p:=0
			Form:C1466.formulaSource:=""
		End if 
		
		
		
		Form:C1466.local.filter:=""
		Form:C1466.local.formatSample:=""
		Form:C1466.formulaSource:=""
		
		Form:C1466.wizard.formulaUI("cleanup")
		
		// goto nowhere
		GOTO OBJECT:C206(*; "")
		
End case 


