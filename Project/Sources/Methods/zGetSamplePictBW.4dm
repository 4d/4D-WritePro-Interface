//%attributes = {}
var $0 : Picture
var $pict : Picture
READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"sample.png"; $pict)

TRANSFORM PICTURE:C988($pict; Fade to grey scale:K61:6)

$0:=$pict
