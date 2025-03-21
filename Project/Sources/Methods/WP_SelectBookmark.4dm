//%attributes = {"invisible":true}
#DECLARE($document : Object; $areaName : Text; $bookmarkName : Text; $selector : Integer)
//selector is used to know the context where the method is executed

var $oRange : Object
var $i; $n : Integer

ARRAY TEXT:C222($_objects; 0)
ARRAY POINTER:C280($_variables; 0)


If (Count parameters:C259=3)  // first call
	
	CALL FORM:C1391(Current form window:C827; Current method name:C684; $document; $areaName; $bookmarkName; 0)  // 0 forces the "else" to be executed
	
Else   //second call : selector is now present (see the line above)
	
	$oRange:=WP Bookmark range:C1416($document; $bookmarkName)
	
	// is the $areaName a form object ?  (ACI0101020)
	
	OBJECT GET COORDINATES:C663(*; $areaName; $x1; $y1; $y1; $y2)  // <ACI0101020> 
	If (($x1+$y1+$y1+$y2)#0)
		WP SELECT:C1348(*; $areaName; $oRange)
		
		If (Shift down:C543)
			GOTO OBJECT:C206(*; $areaName)
		End if 
		
	Else 
		
		FORM GET OBJECTS:C898($_objects; $_variables; Form current page:K67:6)
		$n:=Size of array:C274($_objects)
		For ($i; 1; $n)
			If (OBJECT Get type:C1300(*; $_objects{$i})=Object type subform:K79:40)
				EXECUTE METHOD IN SUBFORM:C1085($_objects{$i}; Current method name:C684; *; $document; $areaName; $bookmarkName; 0)
			End if 
		End for 
		
	End if   // </ACI0101020)
	
End if 