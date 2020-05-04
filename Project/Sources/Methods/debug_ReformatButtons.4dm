//%attributes = {"invisible":true}
C_LONGINT:C283($i;$n;$p)
C_TEXT:C284($NewSize)
C_TEXT:C284($start;$end)

C_TEXT:C284($format;$folderName;$NewFolderName;$imageName)
C_TEXT:C284($tip)

ARRAY TEXT:C222($_formObjects;0)
FORM GET OBJECTS:C898($_formObjects)


$NewSize:=_sizes{_sizes}
$NewFolderName:=_toolbars{_toolbars}


$n:=Size of array:C274($_formObjects)
For ($i;1;$n)
	
	  // Copy;#Images/
	
	$format:=OBJECT Get format:C894(*;$_formObjects{$i})
	
	$p:=Position:C15("#Images";$format)
	If ($p>0)
		$start:=Substring:C12($format;1;$p+7)  // Copy;#Images/
		$format:=Substring:C12($format;$p+8)  // Toolbar1/Home/Copy_24.png;0;5;0;1;0;0;0;0;0;0;4
	Else 
		$p:=Position:C15("file:Images";$format)
		If ($p>0)
			$start:=Substring:C12($format;1;$p+10)  // file:Images/
			$format:=Substring:C12($format;$p+11)  //  Toolbar1/PageLayout/MarginLeft_24.png
			
		Else 
			
			$p:=Position:C15("/RESOURCES/Images/";$format)
			If ($p>0)
				$start:=Substring:C12($format;1;$p+17)  // file:Images/
				$format:=Substring:C12($format;$p+18)  //  Toolbar1/PageLayout/MarginLeft_24.png
			End if 
		End if 
	End if 
	
	If ($p>0)
		
		$p:=Position:C15("/";$format)
		$folderName:=Substring:C12($format;1;$p-1)  //Toolbar1
		$format:=Substring:C12($format;$p)  // /Copy_24.png;0;5;0;1;0;0;0;0;0;0;4  OU Toolbar1/PageLayout/MarginLeft_24.png
		
		$p:=Position:C15("_";$format)
		$imageName:=Substring:C12($format;1;$p)  //   /Copy_
		
		$p:=Position:C15(";";$format)
		If ($p>0)
			$end:=Substring:C12($format;$p)  //  ;0;5;0;1;0;0;0;0;0;0;4
		Else 
			$end:=""
		End if 
		$format:=$start+$NewFolderName+$imageName+$NewSize+".png"+$end
		OBJECT SET FORMAT:C236(*;$_formObjects{$i};$format)
		
		$tip:=$NewFolderName+$imageName+$NewSize+".png"
		OBJECT SET HELP TIP:C1181(*;$_formObjects{$i};$tip)
		
	End if 
	
End for 