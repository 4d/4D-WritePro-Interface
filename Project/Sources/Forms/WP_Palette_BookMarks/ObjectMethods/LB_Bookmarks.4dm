var $document : Object
var $ptrListbox; $ptrNames : Pointer
var $p : Integer

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5; "LB_Bookmarks")
$ptrNames:=OBJECT Get pointer:C1124(Object named:K67:5; "lb_bookmarkNames")

UI_PaletteBookMarks

Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		$p:=Find in array:C230($ptrListbox->; True:C214)
		
		If ($p>0)
			$document:=Form:C1466.selection[wk owner:K81:168]
			WP_SelectBookmark($document; areaName; $ptrNames->{$p})  // ACI0101020
		End if 
		
	: (Form event code:C388=On Before Data Entry:K2:39)
		
End case 
