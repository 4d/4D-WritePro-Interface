Class constructor()
	
	This:C1470.hlist:=New list:C375
	
Function append($label : Text; $itemRef : Integer; $sublist : Integer; $expanded : Boolean)
	
	Case of 
		: (Count parameters:C259=2)
			APPEND TO LIST:C376(This:C1470.hlist; $label; $itemRef)
			
		: (Count parameters:C259=4)
			APPEND TO LIST:C376(This:C1470.hlist; $label; $itemRef; $sublist; $expanded)
			
	End case 
	
Function clear
	
	CLEAR LIST:C377(This:C1470.hlist; *)  // list and sublists
	
Function clone()->$clone : Object
	
	$clone:=OB Copy:C1225(This:C1470)
	$clone.hlist:=Copy list:C626(This:C1470.hlist)
	
Function expandItem($id : Integer)
	
	var $sublist : Integer
	var $itemText : Text
	var $isExpanded : Boolean
	
	GET LIST ITEM:C378(This:C1470.hlist; $id; $itemRef; $itemText; $sublist; $isExpanded)
	If ($sublist#0) && ($isExpanded)
		SET LIST ITEM:C385(This:C1470.hlist; $itemRef; $itemText; $itemRef; $sublist; True:C214)
	End if 
	
Function expandAll
	
	var $list; $i; $n; $itemRef; $sublist : Integer
	var $itemText : Text
	var $isExpanded : Boolean
	
	$list:=This:C1470.hlist
	$n:=Count list items:C380($list)
	$i:=1
	While ($i<=$n)
		GET LIST ITEM:C378($list; $i; $itemRef; $itemText; $sublist; $isExpanded)
		If ($sublist#0) && ($isExpanded=False:C215)
			SET LIST ITEM:C385($list; $itemRef; $itemText; $itemRef; $sublist; True:C214)
			$n:=Count list items:C380($list)
		End if 
		$i:=$i+1
	End while 
	
	
Function setParameter($itemRef : Integer; $paramName : Text; $paramValue : Text)
	
	SET LIST ITEM PARAMETER:C986(This:C1470.hlist; $itemRef; $paramName; $paramValue)
	
	
	//SET LIST ITEM PROPERTIES ( {* ;} liste ; refElément | * ; saisissable ; style {; icône {; couleur}}
Function setProperties($itemRef : Integer; $enterable : Boolean; $style : Integer; $iconPath : Text; $color : Integer)
	
	Case of 
		: (Count parameters:C259=3)
			SET LIST ITEM PROPERTIES:C386(This:C1470.hlist; $itemRef; $enterable; $style)
		: (Count parameters:C259=4)
			SET LIST ITEM PROPERTIES:C386(This:C1470.hlist; $itemRef; $enterable; $style; $iconPath)
		: (Count parameters:C259=5)
			SET LIST ITEM PROPERTIES:C386(This:C1470.hlist; $itemRef; $enterable; $style; $iconPath; $color)
		Else 
			ALERT:C41("incorrect number of  parameters in HList.setProperties() function.")
	End case 
	
	
	
Function countItems()->$count : Integer
	
	$count:=Count list items:C380(This:C1470.hlist; *)
	
	
	
Function filter($filter : Collection)
	
	
	ARRAY LONGINT:C221($_references; 0)
	var $item : Text
	var $pos; $i; $n; $p : Integer
	var $delete : Boolean
	var $itemRef; $parentRef : Integer
	var $itemText : Text
	var $list; $sublist : Integer
	var $expanded; $deleted : Boolean
	
	$list:=This:C1470.hlist
	
	For each ($item; $filter)
		
		$item:="@"+$item+"@"
		$pos:=Find in list:C952($list; $item; 1; $_references; *)
		
		// FIRST remove all items WITHOUT SUBLIST that do NOT belong to the $_references array
		
		$n:=Count list items:C380($list; *)
		For ($i; $n; 1; -1)
			
			SELECT LIST ITEMS BY POSITION:C381($list; $i)
			GET LIST ITEM:C378($list; *; $itemRef; $itemText; $sublist; $expanded)
			
			$p:=Find in array:C230($_references; $itemRef)
			If ($p<0)  // not in the found list
				If ($sublist=0)  // if no sublist
					// check if parent(s) (if any) has not been found before deleting
					
					$delete:=True:C214
					$parentRef:=List item parent:C633($list; $itemRef)
					While ($parentRef#0) && ($delete=True:C214)
						$p:=Find in array:C230($_references; $parentRef)
						If ($p>0)
							$delete:=False:C215
						Else 
							$parentRef:=List item parent:C633($list; $parentRef)
						End if 
					End while 
					If ($delete)
						DELETE FROM LIST:C624($list; $itemRef)
					Else 
						// searched string found in parent (or grand parent…) 
					End if 
				End if 
			End if 
		End for 
		
	End for each 
	
	// THEN remove items with empty sublists
	
	Repeat 
		$deleted:=False:C215
		
		$n:=Count list items:C380($list; *)
		For ($i; $n; 1; -1)
			GET LIST ITEM:C378($list; $i; $itemRef; $itemText; $sublist; $expanded)
			If ($sublist#0)  // if no sublist
				$n:=Count list items:C380($sublist)
				If ($n=0)
					DELETE FROM LIST:C624($list; $itemRef)  // delete item and its empty sublist
					$deleted:=True:C214
				End if 
			End if 
		End for 
	Until ($deleted=False:C215)
	
	
Function findInParameter($paramName : Text; $paramValue : Text)
	
	var $list : Integer
	var $i; $n; $itemRef : Integer
	var $paramContent : Text
	
	This:C1470.expandAll()
	$list:=This:C1470.hlist
	
	$n:=Count list items:C380($list; *)
	For ($i; 1; $n)
		GET LIST ITEM:C378($list; $i; $itemRef; $itemText)
		GET LIST ITEM PARAMETER:C985($list; $itemRef; $paramName; $paramContent)
		If ($paramContent=$paramValue)
			SELECT LIST ITEMS BY REFERENCE:C630($list; $itemRef)
			
			If (Not:C34(Undefined:C82(This:C1470.formObject)))
				OBJECT SET SCROLL POSITION:C906(*; This:C1470.formObject; $i)
			End if 
			
			$i:=$n
		End if 
	End for 
	