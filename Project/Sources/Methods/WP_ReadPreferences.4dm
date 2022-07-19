//%attributes = {"invisible":true}
#DECLARE()->$preferences : Object

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File
var $databaseName : Text
var $oPref : Object

//var $path : Text  // posix path
//var $pathName : Text  // plateform path

$databaseName:=Folder:C1567(fk database folder:K87:14; *).name
$file:=Folder:C1567(fk user preferences folder:K87:10).file($databaseName+"/4dwpInterface.pref")

If ($file.exists=False:C215)
	
	$preferences:=New object:C1471()
	$preferences.dateCreated:=Current date:C33
	$preferences.timeCreated:=Current time:C178
	
	$file.setText(JSON Stringify:C1217($preferences; *))
	
Else 
	
	$preferences:=JSON Parse:C1218($file.getText())
	
End if 

