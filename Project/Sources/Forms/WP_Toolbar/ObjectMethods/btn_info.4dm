var $doc; $o : Object
var $win : Integer

If (Form:C1466.selection#Null:C1517)
	$doc:=Form:C1466.selection.owner
	
	$o:=New object:C1471
	$o[wk title:K81:79]:=$doc[wk title:K81:79]
	$o[wk subject:K81:80]:=$doc[wk subject:K81:80]
	$o[wk author:K81:81]:=$doc[wk author:K81:81]
	$o[wk company:K81:82]:=$doc[wk company:K81:82]
	$o[wk notes:K81:83]:=$doc[wk notes:K81:83]
	$o[wk date creation:K81:84]:=$doc[wk date creation:K81:84]
	$o[wk date modified:K81:85]:=$doc[wk date modified:K81:85]
	
	$win:=Open form window:C675("D_DocInfo"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("D_DocInfo"; $o)
	
	If (ok=1)
		$doc[wk title:K81:79]:=$o[wk title:K81:79]
		$doc[wk subject:K81:80]:=$o[wk subject:K81:80]
		$doc[wk author:K81:81]:=$o[wk author:K81:81]
		$doc[wk company:K81:82]:=$o[wk company:K81:82]
		$doc[wk notes:K81:83]:=$o[wk notes:K81:83]
		
		WP COMPUTE FORMULAS:C1707($doc)
		
	End if 
	
End if 

