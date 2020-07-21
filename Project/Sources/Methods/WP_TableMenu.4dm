//%attributes = {"invisible":true}
C_TEXT:C284($1;$applyTo)


C_BOOLEAN:C305($isTable)

C_COLLECTION:C1488($files)

C_LONGINT:C283($i)

C_TEXT:C284($path)
C_TEXT:C284($menu)
C_TEXT:C284($choice)
C_TEXT:C284($where)

C_COLLECTION:C1488($_templates;$_icons)

C_OBJECT:C1216($folder)
C_OBJECT:C1216($template)
C_OBJECT:C1216($rows)

$applyTo:=$1  // "insertTable", "table", "row"; column or "cell"
$where:=""

$rows:=WP Table get rows:C1475(Form:C1466.selection)
If ($rows=Null:C1517)
	$isTable:=False:C215
Else 
	$isTable:=True:C214
End if 

$menu:=Create menu:C408  // MAIN menu

If ($applyTo="insertTable")
	
	If ($isTable=False:C215)  // insert a table submenu + fake settings
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"table_templates"
		If (Test path name:C476($path)=Is a folder:K24:2)
			
			$folder:=Folder:C1567($path;fk platform path:K87:2)
			$files:=$folder.files(fk ignore invisible:K87:22)
			$_templates:=$files.query("extension = :1";".4wp").orderBy("path")  //.extract("path")
			$_icons:=$files.query("extension = :1";".png").orderBy("path")  //.extract("path")
			If ($_templates.length=$_icons.length)
				
				$i:=0
				For each ($template;$_templates)
					
					APPEND MENU ITEM:C411($menu;" ")  //"Template "+String($i+1))
					SET MENU ITEM PARAMETER:C1004($menu;-1;String:C10($i))
					SET MENU ITEM ICON:C984($menu;-1;"File:table_templates/"+$_icons[$i].fullName)
					
					$i:=$i+1
				End for each 
			End if 
			
			$choice:=Dynamic pop up menu:C1006($menu)
			RELEASE MENU:C978($menu)
			
			If ($choice#"")  // only for inserting tables
				$i:=Num:C11($choice)
				$path:=$_templates[$i].platformPath
				WP INSERT DOCUMENT:C1411(Form:C1466.selection;WP Import document:C1318($path);wk append:K81:179)
				SET TIMER:C645(-1)  // update interface
			End if 
			
		End if 
		
	End if 
	
Else 
	
	
	If ($isTable=True:C214)
		
		  // Common except for culumns
		If ($applyTo#"column")
			APPEND MENU ITEM:C411($menu;Get localized string:C991("menuBorderStyle"))
			SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/borderStyle"+$where)
			
			APPEND MENU ITEM:C411($menu;Get localized string:C991("menuBorderColor"))
			SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/borderColor"+$where)
			
			APPEND MENU ITEM:C411($menu;Get localized string:C991("menuBorderWidth"))
			SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/borderWidth"+$where)
			
			APPEND MENU ITEM:C411($menu;"-")
		End if 
		
		  // Common
		APPEND MENU ITEM:C411($menu;Get localized string:C991("menuBackgroundColor"))
		SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/backgroundColor"+$where)
		
		
		
		Case of 
			: ($applyTo="table")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuMargins"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/margin")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuAlignment"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/tableAlign")
				
			: ($applyTo="row")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuPadding"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/padding")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuVerticalAlignment"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/verticalAlign")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuHeight"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/height")
				
			: ($applyTo="column")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuPadding"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/padding")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuVerticalAlignment"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/verticalAlign")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuWidth"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/width")
				
				
			: ($applyTo="cell")
				
				APPEND MENU ITEM:C411($menu;"-")
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuPadding"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/padding")
				
				APPEND MENU ITEM:C411($menu;Get localized string:C991("menuVerticalAlignment"))
				SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;$applyTo+"/verticalAlign")
				
				
		End case 
		
		
		$choice:=Dynamic pop up menu:C1006($menu)
		
	End if 
End if 



