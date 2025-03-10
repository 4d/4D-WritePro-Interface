var $winLeft; $winTop; $winRight; $WinBottom : Integer
var $x1; $y1; $x2; $y2 : Integer



GET WINDOW RECT:C443($winLeft; $winTop; $winRight; $WinBottom; Form:C1466.windowID)

OBJECT GET COORDINATES:C663(*; "Rect_Frame"; $x1; $y1; $x2; $y2)

If (Form:C1466._extra.expanded)
	//FORM SET SIZE($x1; $y2)
	SET WINDOW RECT:C444($winLeft; $winTop; $winLeft+$x1-1; $winTop+$y2; Form:C1466.windowID)
Else 
	//FORM SET SIZE($x2; $y2)
	SET WINDOW RECT:C444($winLeft; $winTop; $winLeft+$x2; $winTop+$y2; Form:C1466.windowID)
End if 

Form:C1466._extra.expanded:=Not:C34(Form:C1466._extra.expanded)