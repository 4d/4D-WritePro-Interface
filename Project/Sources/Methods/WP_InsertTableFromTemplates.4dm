//%attributes = {"invisible":true}
C_COLLECTION:C1488($files)

C_LONGINT:C283($i)

C_TEXT:C284($path)
C_TEXT:C284($menu)
C_TEXT:C284($choice)

C_COLLECTION:C1488($_templates;$_icons)

C_OBJECT:C1216($folder)
C_OBJECT:C1216($template)


$path:=Get 4D folder:C485(Current resources folder:K5:16)+"table_templates"
If (Test path name:C476($path)=Is a folder:K24:2)
	$folder:=Folder:C1567($path;fk platform path:K87:2)
	
	$files:=$folder.files(fk ignore invisible:K87:22)
	
	$_templates:=$files.query("extension = :1";".4wp").orderBy("path")  //.extract("path")
	$_icons:=$files.query("extension = :1";".png").orderBy("path")  //.extract("path")
	
	If ($_templates.length=$_icons.length)
		
		$menu:=Create menu:C408
		$i:=0
		For each ($template;$_templates)
			
			APPEND MENU ITEM:C411($menu;" ")  //"Template "+String($i+1))
			SET MENU ITEM PARAMETER:C1004($menu;-1;String:C10($i))
			SET MENU ITEM ICON:C984($menu;-1;"File:table_templates/"+$_icons[$i].fullName)
			
			$i:=$i+1
		End for each 
		
		$choice:=Dynamic pop up menu:C1006($menu)
		
		If ($choice#"")
			$i:=Num:C11($choice)
			$path:=$_templates[$i].platformPath
			
			WP INSERT DOCUMENT:C1411(Form:C1466.selection;WP Import document:C1318($path);wk append:K81:179)
			
		End if 
		
		RELEASE MENU:C978($menu)
		
	End if 
End if 


