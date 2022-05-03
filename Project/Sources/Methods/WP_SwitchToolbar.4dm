//%attributes = {"invisible":true}
//ACI0099141 fixed 29/01/2019 by RL  (WP SwitchToolbar intead of WP SwichToolbar, without "t")

C_TEXT:C284($1)
C_TEXT:C284($NewfolderName)

C_LONGINT:C283($i; $n; $p; $length)
C_TEXT:C284($start)

C_TEXT:C284($format; $folderName; $NewFolderName)

$NewFolderName:=$1

ARRAY TEXT:C222($_formObjects; 0)
FORM GET OBJECTS:C898($_formObjects)

$n:=Size of array:C274($_formObjects)
For ($i; 1; $n)
	
	// Copy;#Images/
	
	$format:=OBJECT Get format:C894(*; $_formObjects{$i})
	
	
	
	$p:=Position:C15("#Images"; $format)
	If ($p>0)
		$length:=Length:C16("#Images")
	Else 
		$p:=Position:C15("RESOURCES/Images/Toolbar"; $format)
		If ($p>0)
			$length:=Length:C16("RESOURCES/Images")
		End if 
	End if 
	
	If ($p>0)
		
		$start:=Substring:C12($format; 1; $p+$length)  // Copy;#Images/
		$format:=Substring:C12($format; $p+$length+1)  // Toolbar1/Home/Copy_24.png;0;5;0;1;0;0;0;0;0;0;4
		
		
		$p:=Position:C15("/"; $format)
		$folderName:=Substring:C12($format; 1; $p-1)  //Toolbar1
		$format:=Substring:C12($format; $p)  // /Copy_24.png;0;5;0;1;0;0;0;0;0;0;4  OU Toolbar1/PageLayout/MarginLeft_24.png
		
		$format:=$start+$NewFolderName+$format
		OBJECT SET FORMAT:C236(*; $_formObjects{$i}; $format)
		
	End if 
	
End for 
