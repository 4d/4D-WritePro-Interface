var $pict : Picture
var $commonPath : Text


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		$commonPath:=Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"LogIcons"+Folder separator:K24:12
		Form:C1466.icons:=New object:C1471
		
		READ PICTURE FILE:C678($commonPath+"Warning_48@2x.png"; $pict)
		TRANSFORM PICTURE:C988($pict; Crop:K61:7; 1; 97; 96; 96)
		Form:C1466.icons.warning:=$pict
		
		READ PICTURE FILE:C678($commonPath+"Error_48@2x.png"; $pict)
		TRANSFORM PICTURE:C988($pict; Crop:K61:7; 1; 97; 96; 96)
		Form:C1466.icons.error:=$pict
		
		READ PICTURE FILE:C678($commonPath+"Info_48@2x.png"; $pict)
		TRANSFORM PICTURE:C988($pict; Crop:K61:7; 1; 97; 96; 96)
		Form:C1466.icons.info:=$pict
		
		
		Form:C1466.messageLong:=Get localized string:C991("HoverOverTheLines")
		Form:C1466.icon:=Form:C1466.icons.info
		
		OBJECT SET BORDER STYLE:C1262(*; "LB"; Border None:K42:27)
		
End case 