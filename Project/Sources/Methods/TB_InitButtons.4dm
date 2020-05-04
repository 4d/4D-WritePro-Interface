//%attributes = {"invisible":true}

C_LONGINT:C283($i;$NbButton)
C_POINTER:C301($DummyPtr)

ARRAY TEXT:C222($_ObjectNames;0)

ARRAY LONGINT:C221($_Height;2)
ARRAY LONGINT:C221($_Margin;2)
ARRAY LONGINT:C221($_Space;2)
ARRAY LONGINT:C221($_MinWidth;2)

$_Height{1}:=20  //win
$_Height{2}:=20  //mac

$_Margin{1}:=6  //win 
$_Margin{2}:=6  //mac

$_Space{1}:=2  //win 
$_Space{2}:=2  //mac

$_MinWidth{1}:=40  // Win
$_MinWidth{2}:=40  // Mac

APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Home")  //overview
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Insert")  //users
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Margins")  //process
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Borders")  //maintenance
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Images")  //4D appl server
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Printing")  //SQL Server
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Tables")  //web server
APPEND TO ARRAY:C911($_ObjectNames;"tabBtn_Spell")  //Real Time Monitor

$NbButton:=Size of array:C274($_ObjectNames)

TOOL_WPIAlignButtons (->$_ObjectNames;$DummyPtr;On the left:K39:2;At the top:K39:5;"Horizontal";"Proportional";0;->$_Height;->$_Margin;->$_Space;->$_MinWidth)



