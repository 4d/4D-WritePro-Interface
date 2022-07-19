//%attributes = {"invisible":true}
var $0 : Picture
If (Shift down:C543)
	
	var $pict : Picture
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"sample.png"; $pict)
End if 

$0:=$pict
