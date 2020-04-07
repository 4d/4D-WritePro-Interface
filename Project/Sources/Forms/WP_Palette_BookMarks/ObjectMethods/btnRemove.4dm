C_OBJECT:C1216($document)
C_POINTER:C301($ptrListbox;$ptrNames)
C_LONGINT:C283($p)

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_Bookmarks")
$ptrNames:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_bookmarkNames")

$p:=Find in array:C230($ptrListbox->;True:C214)
If ($p>0)
	$document:=Form:C1466.selection[wk owner:K81:168]
	WP DELETE BOOKMARK:C1419($document;$ptrNames->{$p})
	
	WP_GetBookmarks 
	
	  // deselect bookmark (if any still selected)
	$p:=Find in array:C230($ptrListbox->;True:C214)
	If ($p>0) & ($p<=Size of array:C274($ptrListbox->))
		$ptrListbox->{$p}:=False:C215
	End if 
	
	UI_PaletteBookMarks 
	
End if 
