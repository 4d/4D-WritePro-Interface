C_TEXT:C284($name)
C_TEXT:C284($str)
C_OBJECT:C1216($range)
C_LONGINT:C283($i;$n;$p)
C_POINTER:C301($ptrListbox;$ptrNames)

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_Bookmarks")
$ptrNames:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_bookmarkNames")



If (areaName#"") & (areaName=OBJECT Get name:C1087(Object with focus:K67:3))
	
	$range:=WP Selection range:C1340(*;areaName)
	If (OB Is defined:C1231($range))
		
		$str:=Get localized string:C991("NewBookmark")
		$str:=Replace string:C233($str;" ";"_")
		
		$i:=0
		Repeat 
			$i:=$i+1
			$name:=$str+String:C10($i)
			$p:=Find in array:C230($ptrNames->;$name)
		Until ($p<0)
		
		WP NEW BOOKMARK:C1415($range;$name)
		WP_GetBookmarks   // re-order by apparition in the document.
		
		$n:=Size of array:C274($ptrNames->)
		$p:=Find in array:C230($ptrNames->;$name)
		
		ARRAY BOOLEAN:C223($ptrListbox->;0)
		ARRAY BOOLEAN:C223($ptrListbox->;$n)
		
		$ptrListbox->{$p}:=True:C214
		EDIT ITEM:C870(*;"lb_bookmarkNames";$p)
		
	End if 
Else 
	BEEP:C151
End if 

