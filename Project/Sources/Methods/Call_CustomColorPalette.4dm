//%attributes = {"invisible":true}
#DECLARE($wp_allowTransparency : Boolean; $objectName : Text)->$customColor : Integer

var $x1; $y1; $x2; $y2 : Integer
var $x; $y; $z : Integer
var $win : Integer

If (Count parameters:C259>=1)
	wp_allowTransparency:=$wp_allowTransparency
	
	If (Count parameters:C259>=2)
		$objectName:=$2
	End if 
	
Else 
	wp_allowTransparency:=True:C214
End if 

If ($objectName#"")
	OBJECT GET COORDINATES:C663(*; $objectName; $x1; $y1; $x2; $y2)
	$x:=$x1
	$y:=$y2
	$x:=$x-100+(($x2-$x1)/2)  // half width of the WP_CustomColors form
Else 
	MOUSE POSITION:C468($x; $y; $z)
End if 

CONVERT COORDINATES:C1365($x; $y; XY Current form:K27:5; XY Main window:K27:8)

$customColor:=-1  // default value when window is closed by outside click

If (Test path name:C476(Get 4D folder:C485(Current resources folder:K5:16)+"Colors.svg")=Is a document:K24:1)
	
	$win:=Open form window:C675("WP_CustomColors"; Pop up form window:K39:11; $x; $y)  //Pop up form window)
	DIALOG:C40("WP_CustomColors")
	
	$customColor:=wp_customColor
Else 
	$customColor:=Select RGB color:C956(0x00808080)
End if 


