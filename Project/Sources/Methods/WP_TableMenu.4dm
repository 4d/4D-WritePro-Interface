//%attributes = {"invisible":true}
#DECLARE($applyTo : Text)->$choice : Text  // $applyTo = "insertTable", "table", "row"; column or "cell"

var $headerRowCount; $i : Integer
var $range; $table; $folder; $template; $rows; $formula; $wpTable; $breakFormula; $document : Object
var $isTable : Boolean
var $files; $_templates; $_icons; $tables : Collection
var $4Dtable : Pointer
var $path; $menu; $where; $formulaSource : Text

$where:=""
$rows:=WP Table get rows:C1475(Form:C1466.selection)
If ($rows=Null:C1517)
	$isTable:=False:C215
Else 
	$isTable:=True:C214
End if 

$menu:=Create menu:C408  // MAIN menu

If ($applyTo="insertTable")
	
	If ($isTable=False:C215)  // insert a table submenu 
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"table_templates"
		If (Test path name:C476($path)=Is a folder:K24:2)
			
			$folder:=Folder:C1567($path; fk platform path:K87:2)
			$files:=$folder.files(fk ignore invisible:K87:22)
			$_templates:=$files.query("extension = :1"; ".4wp").orderBy("path")  //.extract("path")
			$_icons:=$files.query("extension = :1"; ".png").orderBy("path")  //.extract("path")
			If ($_templates.length=$_icons.length)
				
				$i:=0
				For each ($template; $_templates)
					
					APPEND MENU ITEM:C411($menu; " ")  //"Template "+String($i+1))
					SET MENU ITEM PARAMETER:C1004($menu; -1; String:C10($i))
					SET MENU ITEM ICON:C984($menu; -1; "File:table_templates/"+$_icons[$i].fullName)
					
					$i:=$i+1
				End for each 
				
				APPEND MENU ITEM:C411($menu; "-")  // separator
			End if 
			
			
			
			If (OB Keys:C1719(ds:C1482).length>0)
				APPEND MENU ITEM:C411($menu; " ")
				SET MENU ITEM PARAMETER:C1004($menu; -1; "TableWizard")
				SET MENU ITEM ICON:C984($menu; -1; "File:Images/TableTemplate.png")
			End if 
			
			
			$choice:=Dynamic pop up menu:C1006($menu)
			RELEASE MENU:C978($menu)
			
			If ($choice#"")  // only for inserting tables
				If ($choice="TableWizard")
					$document:=WP_TableWizard
					If (ok=1)
						WP INSERT DOCUMENT:C1411(Form:C1466.selection; $document; wk replace:K81:177)
					End if 
				Else 
					$i:=Num:C11($choice)
					$path:=$_templates[$i].platformPath
					WP INSERT DOCUMENT:C1411(Form:C1466.selection; WP Import document:C1318($path); wk append:K81:179)
					SET TIMER:C645(-1)  // update interface
				End if 
				
			End if 
			
		End if 
		
		
	End if 
	
Else 
	
	//EXEMPLE
	
	//APPEND MENU ITEM($menu; "-")
	//APPEND MENU ITEM($menu; ak standard action title)
	//SET MENU ITEM PROPERTY($menu; -1; Associated standard action name; ak cut)
	
	If ($isTable=True:C214)
		
		// Common except for culumns
		If ($applyTo#"column")
			APPEND MENU ITEM:C411($menu; Get localized string:C991("menuBorderStyle"))
			SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/borderStyle"+$where)
			
			APPEND MENU ITEM:C411($menu; Get localized string:C991("menuBorderColor"))
			SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/borderColor"+$where)
			
			APPEND MENU ITEM:C411($menu; Get localized string:C991("menuBorderWidth"))
			SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/borderWidth"+$where)
			
			APPEND MENU ITEM:C411($menu; "-")
		End if 
		
		// Common
		APPEND MENU ITEM:C411($menu; Get localized string:C991("menuBackgroundColor"))
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/backgroundColor"+$where)
		
		
		
		Case of 
			: ($applyTo="table")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuMargins"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/margin")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuAlignment"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/tableAlign")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "table/avoidPageBreakInside")
				
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "headerRowCount")  //à remplacer par constante
				
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "bottomCarryOverRow")  //à remplacer par constante
				
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "emptyDatasource")  //à remplacer par constante
				
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("SetDatasourceEllipsis"))
				SET MENU ITEM PARAMETER:C1004($menu; -1; "SetDatasource")
				
			: ($applyTo="row")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuPadding"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/padding")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuVerticalAlignment"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/verticalAlign")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuHeight"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/height")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "row/avoidPageBreakInside")
				
				
				// add "set break…" if possible
				
				If (Not:C34(Undefined:C82(Form:C1466.selection)))
					$range:=Form:C1466.selection
					If ($range.type#2)  // anchored picture
						
						$tables:=WP Get elements:C1550($range; wk type table:K81:222)
						Case of 
							: ($tables.length=0)
								//ALERT("select a table first")
							: ($tables.length>1)
								//ALERT("select a single table first")
							: ($tables.length=1)  // == else
								rows:=WP Table get rows:C1475($range)
								If (rows.rowCount>1)
									//ALERT("select a single row first")
								Else 
									$table:=$tables[0]
									WP GET ATTRIBUTES:C1345($table; wk header row count:K81:364; $headerRowCount)
									If (rows.firstRow<=$headerRowCount)
										//ALERT("select a row below the header")
									Else 
										// ok ! 
										
										APPEND MENU ITEM:C411($menu; "-")
										// set break
										APPEND MENU ITEM:C411($menu; Get localized string:C991("DefineAsBreakRow"))
										SET MENU ITEM PARAMETER:C1004($menu; -1; "SetBreak")
										
										// remove break (if any)
										
										WP GET ATTRIBUTES:C1345(rows; "breakFormula"; $breakFormula)
										If ($breakFormula#Null:C1517)
											APPEND MENU ITEM:C411($menu; Get localized string:C991("RemoveBreak"))
											SET MENU ITEM PARAMETER:C1004($menu; -1; "RemoveBreak")
										End if 
										
										
									End if 
								End if 
						End case 
					Else 
						//ALERT("This is a picture, not")
					End if 
					// bug
				End if 
				
				
				
				
			: ($applyTo="column")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuPadding"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/padding")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuVerticalAlignment"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/verticalAlign")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuWidth"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/width")
				
				
			: ($applyTo="cell")
				
				APPEND MENU ITEM:C411($menu; "-")
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuPadding"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/padding")
				
				APPEND MENU ITEM:C411($menu; Get localized string:C991("menuVerticalAlignment"))
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; $applyTo+"/verticalAlign")
				
				APPEND MENU ITEM:C411($menu; "-")
				
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "cell/merge")
				
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "cell/split")
				
		End case 
		
		
		$choice:=Dynamic pop up menu:C1006($menu)
		//C_COLLECTION()
		If ($choice#"")
			
			//$i:=1
			//While (Not(Is table number valid($i))) & ($i<Get last table number)
			//$i:=$i+1
			//End while 
			//If (Is table number valid($i))
			//$4Dtable:=Table($i)
			//End if 
			
			$i:=1
			Repeat 
				If (Is table number valid:C999($i))
					$4Dtable:=Table:C252($i)
					$i:=MAXLONG:K35:2
				Else 
					$i:=$i+1
				End if 
			Until ($i>Get last table number:C254)
			
			
			Case of 
				: ($choice="SetDatasource")
					//ALERT("work in progress…")
					
					$wpTable:=WP Get elements:C1550(Form:C1466.selection; wk type table:K81:222)[0]
					WP GET ATTRIBUTES:C1345($wpTable; wk datasource:K81:367; $formula)
					
					If ($formula#Null:C1517)
						$formulaSource:=$formula.source
					Else 
						$formulaSource:=""
					End if 
					
					
					If (Not:C34(Is nil pointer:C315($4Dtable)))
						EDIT FORMULA:C806($4Dtable->; $formulaSource)
						If (ok=1)
							If ($formulaSource#"")
								$formula:=Formula from string:C1601($formulaSource; 1)  // ∆∆∆ Feature 125
								WP SET ATTRIBUTES:C1342($wpTable; wk datasource:K81:367; $formula)
							Else 
								WP RESET ATTRIBUTES:C1344($wpTable; wk datasource:K81:367)
							End if 
						End if 
					End if 
					
				: ($choice="SetBreak")
					
					WP GET ATTRIBUTES:C1345(rows; "breakFormula"; $formula)
					If ($formula#Null:C1517)
						$formulaSource:=$formula.source
					Else 
						$formulaSource:="This.item."
					End if 
					
					If (Not:C34(Is nil pointer:C315($4Dtable)))
						EDIT FORMULA:C806($4Dtable->; $formulaSource)
						If (ok=1)
							If ($formulaSource#"")
								$formula:=Formula from string:C1601($formulaSource; 1)  // ∆∆∆ Feature 125
								WP SET ATTRIBUTES:C1342(rows; "breakFormula"; $formula)
							End if 
						End if 
					End if 
					
				: ($choice="RemoveBreak")
					WP RESET ATTRIBUTES:C1344(rows; "breakFormula")
			End case 
			
			
		End if   // choice #""
	End if   // is table
End if 



