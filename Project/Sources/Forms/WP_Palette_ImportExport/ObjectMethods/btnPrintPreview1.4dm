var $orientation : Integer
var $document : Object
var $width_s; $height_s : Text
var $paper : Text
var $p : Integer

ARRAY TEXT:C222($_Names; 0)
ARRAY LONGINT:C221($_heights; 0)
ARRAY LONGINT:C221($_widths; 0)


PRINT SETTINGS:C106(Page setup dialog:K47:16)

$document:=Form:C1466.selection[wk owner:K81:168]
If ($document#Null:C1517)
	
	// #1 page orientation setting
	
	GET PRINT OPTION:C734(Orientation option:K47:2; $orientation)  // 1-2
	If ($orientation=1)
		WP SET ATTRIBUTES:C1342($document; wk page orientation:K81:264; wk portrait:K81:274)  // 0
	Else 
		WP SET ATTRIBUTES:C1342($document; wk page orientation:K81:264; wk landscape:K81:275)  //1
	End if 
	
	// #2 page width and height settings
	
	GET PRINT OPTION:C734(Paper option:K47:1; $paper)
	PRINT OPTION VALUES:C785(Paper option:K47:1; $_Names; $_heights; $_widths)
	
	$p:=Find in array:C230($_Names; $paper)
	If ($p>0)
		
		$width_s:=String:C10(Round:C94($_widths{$p}*25.4/72; 0); "####0mm")
		$height_s:=String:C10(Round:C94($_heights{$p}*25.4/72; 0); "####0mm")
		WP SET ATTRIBUTES:C1342($document; wk page width:K81:262; $width_s; wk page height:K81:263; $height_s)
		
	End if 
	
End if 
