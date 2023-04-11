//%attributes = {}
#DECLARE($areaName : Text; $wpDocument : Object; $where : Integer)


If (Count parameters:C259=2)  // in widget context
	
	CALL FORM:C1391(Frontmost window:C447; "fillArea"; $areaName; $wpDocument; 0)
	
Else 
	
	//mark:-
	
	
	// in main form context
	OBJECT SET VALUE:C1742($areaName; $wpDocument)
	
End if 

