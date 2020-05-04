//%attributes = {"invisible":true}
C_POINTER:C301($ptrListbox;$ptrStylesheetNames)
C_LONGINT:C283($p)
C_TEXT:C284($name)

ARRAY LONGINT:C221($_events;0)
APPEND TO ARRAY:C911($_events;On Clicked:K2:4)

If (UI_isProtected (False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	LISTBOX SET PROPERTY:C1440(*;"LB_StyleSheets";lk selection mode:K53:35;lk none:K53:57)
	LISTBOX SELECT ROW:C912(*;"LB_StyleSheets";0;lk remove from selection:K53:3)
	OBJECT SET EVENTS:C1239(*;"LB_StyleSheets";$_events;Disable events others unchanged:K42:39)
	
Else 
	
	LISTBOX SET PROPERTY:C1440(*;"LB_StyleSheets";lk selection mode:K53:35;lk single:K53:58)
	OBJECT SET EVENTS:C1239(*;"LB_StyleSheets";$_events;Enable events others unchanged:K42:38)
	
	If (Form:C1466.selection.type=2)
		OBJECT SET ENABLED:C1123(*;"@";False:C215)
	Else 
		OBJECT SET ENABLED:C1123(*;"@";True:C214)
		
		$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_StyleSheets")
		$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")
		
		$p:=Find in array:C230($ptrListbox->;True:C214)
		
		If ($p>0)
			$name:=$ptrStylesheetNames->{$p}
		Else 
			$name:=""
		End if 
		
		If ($name="normal") | ($name="")
			OBJECT SET ENABLED:C1123(*;"btnDelete";False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;"btnDelete";True:C214)
		End if 
		
		
		If ($name="")
			OBJECT SET ENABLED:C1123(*;"btnEdit";False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;"btnEdit";True:C214)
		End if 
		
	End if 
	
End if 