C_TEXT:C284($name)
C_OBJECT:C1216($range)
C_LONGINT:C283($p)
C_POINTER:C301($ptrListbox;$ptrNames)

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_Bookmarks")
$ptrNames:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_bookmarkNames")

If (areaName#"") & (areaName=OBJECT Get name:C1087(Object with focus:K67:3))
	
	$range:=WP Selection range:C1340(*;areaName)
	If (OB Is defined:C1231($range))
		
		$p:=Find in array:C230($ptrListbox->;True:C214)
		
		If ($p>0)
			
			$name:=$ptrNames->{$p}
			
			WP NEW BOOKMARK:C1415($range;$name)
			WP_GetBookmarks   // re-order by apparition in the document.
			
		End if 
	End if 
Else 
	BEEP:C151
End if 

