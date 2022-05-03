//%attributes = {"invisible":true}
////debug_ReformatButtons


//C_LONGINT($i; $n; $p)
//C_TEXT($NewSize)
//C_TEXT($start; $end)

//C_TEXT($format; $folderName; $NewFolderName; $imageName)
//C_TEXT($tip)

//ARRAY TEXT($_formObjects; 0)
//FORM GET OBJECTS($_formObjects)


//$NewSize:=_sizes{_sizes}
//$NewFolderName:=_toolbars{_toolbars}


//$n:=Size of array($_formObjects)
//For ($i; 1; $n)

//// Copy;#Images/

//$format:=OBJECT Get format(*; $_formObjects{$i})

//$p:=Position("#Images"; $format)
//If ($p>0)
//$start:=Substring($format; 1; $p+7)  // Copy;#Images/
//$format:=Substring($format; $p+8)  // Toolbar1/Home/Copy_24.png;0;5;0;1;0;0;0;0;0;0;4
//Else 
//$p:=Position("file:Images"; $format)
//If ($p>0)
//$start:=Substring($format; 1; $p+10)  // file:Images/
//$format:=Substring($format; $p+11)  //  Toolbar1/PageLayout/MarginLeft_24.png

//Else 

//$p:=Position("/RESOURCES/Images/"; $format)
//If ($p>0)
//$start:=Substring($format; 1; $p+17)  // file:Images/
//$format:=Substring($format; $p+18)  //  Toolbar1/PageLayout/MarginLeft_24.png
//End if 
//End if 
//End if 

//If ($p>0)

//$p:=Position("/"; $format)
//$folderName:=Substring($format; 1; $p-1)  //Toolbar1
//$format:=Substring($format; $p)  // /Copy_24.png;0;5;0;1;0;0;0;0;0;0;4  OU Toolbar1/PageLayout/MarginLeft_24.png

//$p:=Position("_"; $format)
//$imageName:=Substring($format; 1; $p)  //   /Copy_

//$p:=Position(";"; $format)
//If ($p>0)
//$end:=Substring($format; $p)  //  ;0;5;0;1;0;0;0;0;0;0;4
//Else 
//$end:=""
//End if 
//$format:=$start+$NewFolderName+$imageName+$NewSize+".png"+$end
//OBJECT SET FORMAT(*; $_formObjects{$i}; $format)

//$tip:=$NewFolderName+$imageName+$NewSize+".png"
//OBJECT SET HELP TIP(*; $_formObjects{$i}; $tip)

//End if 

//End for 