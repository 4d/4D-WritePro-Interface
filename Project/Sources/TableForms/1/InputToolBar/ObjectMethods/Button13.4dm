C_TEXT:C284($path)
C_OBJECT:C1216($doc)

$doc:=WP New:C1317(WP Selection range:C1340([SAMPLE:1]WP:2))
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"table_templates"
If (Test path name:C476($path)#Is a folder:K24:2)
	CREATE FOLDER:C475($path)
End if 
$path:=$path+Folder separator:K24:12+"TableTemplate_"+String:C10(templateID;"00")+".4wp"
WP EXPORT DOCUMENT:C1337($doc;$path;wk 4wp:K81:4)
