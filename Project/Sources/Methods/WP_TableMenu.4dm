//%attributes = {"invisible":true}
#DECLARE($applyTo : Text)->$choice : Text  // $applyTo = "insertTable", "table", "row"; column or "cell"

var $headerRowCount; $i; $win : Integer
var $range; $table; $folder; $template; $rows; $formula; $wpTable; $o : Object
var $isTable : Boolean
var $files; $_templates; $_icons; $tables : Collection
var $4Dtable : Pointer
var $path; $menu; $choice; $where; $formulaText; $propertyName : Text


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
			End if 
			
			$choice:=Dynamic pop up menu:C1006($menu)
			RELEASE MENU:C978($menu)
			
			If ($choice#"")  // only for inserting tables
				$i:=Num:C11($choice)
				$path:=$_templates[$i].platformPath
				WP INSERT DOCUMENT:C1411(Form:C1466.selection; WP Import document:C1318($path); wk append:K81:179)
				SET TIMER:C645(-1)  // update interface
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
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "headerRowCount")  //a remplacer par constante
				
				APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
				SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "bottomCarryOverRow")  //a remplacer par constante
				
				
				
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
										WP GET ATTRIBUTES:C1345(rows; "breakPropertyName"; $propertyName)
										If ($propertyName#"")
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
				APPEND MENU ITEM:C411($menu; "Merge cells")
				APPEND MENU ITEM:C411($menu; "Unmerge cells")
				
				
		End case 
		
		
		$choice:=Dynamic pop up menu:C1006($menu)
		//C_COLLECTION()
		
		Case of 
			: ($choice="SetDatasource")
				//ALERT("work in progress…")
				
				$wpTable:=WP Get elements:C1550(Form:C1466.selection; wk type table:K81:222)[0]
				WP GET ATTRIBUTES:C1345($wpTable; wk datasource:K81:367; $formula)
				
				If ($formula#Null:C1517)
					$formulaText:=$formula.source
				Else 
					$formulaText:=""
				End if 
				
				
				$i:=1
				While (Not:C34(Is table number valid:C999($i))) & ($i<Get last table number:C254)
					$i:=$i+1
				End while 
				
				If (Is table number valid:C999($i))
					$4Dtable:=Table:C252($i)
					EDIT FORMULA:C806($4Dtable->; $formulaText)
					
					If (ok=1)
						If ($formulaText#"")
							$formula:=Formula from string:C1601($formulaText)
							WP SET ATTRIBUTES:C1342($wpTable; wk datasource:K81:367; $formula)
						Else 
							WP RESET ATTRIBUTES:C1344($wpTable; wk datasource:K81:367)
						End if 
					End if 
					
				Else 
					// aucune table valide
				End if 
				
			: ($choice="SetBreak")
				
				$o:=New object:C1471
				$o.label:=Get localized string:C991("EnterBreakName")
				$o.windowTitle:=Get localized string:C991("BreakFormula")
				$o.expression:="This.item."
				$o.placeHolder:="This.item."
				
				$win:=Open form window:C675("D_TinyFormula"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
				DIALOG:C40("D_TinyFormula"; $o)
				
				//$propertyName:=Request(Get localized string("EnterBreakName"); $propertyName; Get localized string("SetBreak"); Get localized string("cancel"))
				
				If (ok=1)
					If ($o.expression#"")
						WP SET ATTRIBUTES:C1342(rows; "breakPropertyName"; $o.expression)
						//WP SET ATTRIBUTES(rows; "breakFormula"; $o.formula)
					Else 
						WP RESET ATTRIBUTES:C1344(rows; "breakPropertyName")
					End if 
				End if 
				
			: ($choice="RemoveBreak")
				WP RESET ATTRIBUTES:C1344(rows; "breakPropertyName")
		End case 
		
	End if   // is table
End if 



