//%attributes = {}
//$folder:=Select folder("")
//DOCUMENT LIST($folder; $files; Ignore invisible)

//$n:=Size of array($files)
//For ($i; 1; $n)

//$fileOldName:=$files{$i}
//$fileNewName:=Uppercase(Substring($fileOldName; 1; 1))+Substring($fileOldName; 2)
//$p:=Position("-"; $fileNewName)

//$fileNewName:=Substring($fileNewName; 1; $p-1)+Uppercase(Substring($fileNewName; $p+1; 1))+Substring($fileNewName; $p+2)

//MOVE DOCUMENT($folder+$fileOldName; $folder+$fileNewName)

//End for 
