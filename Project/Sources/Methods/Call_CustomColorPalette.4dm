//%attributes = {"invisible":true}
C_BOOLEAN:C305($1)
C_TEXT:C284($2)

C_LONGINT:C283($0)

C_LONGINT:C283($x1;$y1;$x2;$y2)
C_LONGINT:C283($x;$y;$z)
C_LONGINT:C283($win)
C_TEXT:C284($objectName)

If (Count parameters:C259>=1)
	wp_allowTransparency:=$1
	If (Count parameters:C259>=2)
		$objectName:=$2
	End if 
Else 
	wp_allowTransparency:=True:C214
End if 

  //$ptr:=OBJECT Get pointer(Object current)
  //OBJECT GET COORDINATES($ptr->;$x1;$y1;$x2;$y2)
  // (wait for transform coordinate command)

If ($objectName#"")
	OBJECT GET COORDINATES:C663(*;$objectName;$x1;$y1;$x2;$y2)
	$x:=$x1
	$y:=$y2
	$x:=$x-100+(($x2-$x1)/2)  // half width of the WP_CustomColors form
Else 
	GET MOUSE:C468($x;$y;$z)
End if 

CONVERT COORDINATES:C1365($x;$y;XY Current form:K27:5;XY Main window:K27:8)

wp_customColor:=-1  // default value when window is closed by outside click

$win:=Open form window:C675("WP_CustomColors";Pop up form window:K39:11;$x;$y)  //Pop up form window)
DIALOG:C40("WP_CustomColors")

$0:=wp_customColor



