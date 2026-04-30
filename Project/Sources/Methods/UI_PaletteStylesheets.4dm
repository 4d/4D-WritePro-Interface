//%attributes = {"invisible":true}
ARRAY LONGINT:C221($_events; 0)
APPEND TO ARRAY:C911($_events; On Clicked:K2:4)

If (UI_isProtected(False:C215))  // False means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	LISTBOX SET PROPERTY:C1440(*; "LB_StyleSheets1"; lk selection mode:K53:35; lk none:K53:57)
	LISTBOX SELECT ROW:C912(*; "LB_StyleSheets1"; 0; lk remove from selection:K53:3)
	OBJECT SET EVENTS:C1239(*; "LB_StyleSheets1"; $_events; Disable events others unchanged:K42:39)
	
	return 
	
End if 

var $ui:=cs:C1710._ui.me

If ($ui._withSyleSheetsAsCollection)
	
	LISTBOX SET PROPERTY:C1440(*; "LB_StyleSheets1"; lk selection mode:K53:35; lk single:K53:58)
	OBJECT SET EVENTS:C1239(*; "LB_StyleSheets1"; $_events; Enable events others unchanged:K42:38)
	
	If ($ui.selection.type=2)
		
		OBJECT SET ENABLED:C1123(*; "@"; False:C215)
		
	Else 
		
		OBJECT SET ENABLED:C1123(*; "@"; True:C214)
		
		var $name : Text:=Form:C1466.styleSheetsItem#Null:C1517 ? Form:C1466.styleSheetsItem.name : ""
		
	End if 
	
Else 
	
	LISTBOX SET PROPERTY:C1440(*; "LB_StyleSheets"; lk selection mode:K53:35; lk single:K53:58)
	OBJECT SET EVENTS:C1239(*; "LB_StyleSheets"; $_events; Enable events others unchanged:K42:38)
	
	If (Form:C1466.selection.type=2)
		
		OBJECT SET ENABLED:C1123(*; "@"; False:C215)
		
	Else 
		
		OBJECT SET ENABLED:C1123(*; "@"; True:C214)
		
		var $ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5; "LB_StyleSheets")
		var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
		
		var $pos:=Find in array:C230($ptrListbox->; True:C214)
		
		If ($pos>0)\
			 && ($pos<=Size of array:C274($ptrStylesheetNames->))
			
			$name:=$ptrStylesheetNames->{$pos}
			
		Else 
			
			$name:=""
			
		End if 
	End if 
	
	OBJECT SET ENABLED:C1123(*; "btnDelete"; (Length:C16($name)>0) && ($name#"normal"))
	OBJECT SET ENABLED:C1123(*; "btnEdit"; Length:C16($name)>0)
	
End if 