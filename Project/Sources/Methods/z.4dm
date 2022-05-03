//%attributes = {}


//***
var $win : Integer

ARRAY TEXT:C222($_titles; 0)
ARRAY LONGINT:C221($_nums; 0)
GET TABLE TITLES:C803($_titles; $_nums)

$_titles{1}:="Exemples"
SET TABLE TITLES:C601($_titles; $_nums; *)

//***

ARRAY TEXT:C222($_titles; 0)
ARRAY LONGINT:C221($_nums; 0)
GET FIELD TITLES:C804([SAMPLE:1]; $_titles; $_nums)

$_titles{1}:="no"
$_titles{2}:="writeProDoc"
$_titles{3}:="titre"

SET FIELD TITLES:C602([SAMPLE:1]; $_titles; $_nums; *)

$win:=Open form window:C675([SAMPLE:1]; "InputSideBar"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
ALL RECORDS:C47([SAMPLE:1])

If (Shift down:C543)
	FORM SET INPUT:C55([SAMPLE:1]; "InputToolBar")
Else 
	FORM SET INPUT:C55([SAMPLE:1]; "InputSideBar")
End if 

FORM SET OUTPUT:C54([SAMPLE:1]; "Output")

MODIFY SELECTION:C204([SAMPLE:1])


