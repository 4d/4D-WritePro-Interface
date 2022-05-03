//%attributes = {"invisible":true}
C_POINTER:C301($ptrLabel; $ptrURL)
C_TEXT:C284($label1; $label2)
C_COLLECTION:C1488($_URLs)


$ptrLabel:=OBJECT Get pointer:C1124(Object named:K67:5; "URLlabel")
If (Not:C34(Is nil pointer:C315($ptrLabel)))
	$ptrLabel->:=""
End if 

$ptrURL:=OBJECT Get pointer:C1124(Object named:K67:5; "URLurl")
If (Not:C34(Is nil pointer:C315($ptrURL)))
	$ptrURL->:=""
End if 


If (Not:C34((Is nil pointer:C315($ptrLabel)) | (Is nil pointer:C315($ptrURL))))
	
	$_URLs:=WP Get links:C1643(Form:C1466.selection)
	If ($_URLs.length>0)
		
		$ptrURL->:=$_URLs[0].url
		
		// Label based on selected text (may be shorter or longer than URL)
		$label1:=WP Get text:C1575(Form:C1466.selection)
		// Label based on URL range
		$label2:=WP Get text:C1575(WP Text range:C1341(Form:C1466.selection.owner; $_URLs[0].range.start; $_URLs[0].range.end))
		
		If (Length:C16($label1)>Length:C16($label2))
			$ptrLabel->:=$label1
		Else 
			$ptrLabel->:=$label2
		End if 
		
	Else 
		
		$ptrLabel->:=WP Get text:C1575(Form:C1466.selection)
		If (Length:C16($ptrLabel->)>200)
			$ptrLabel->:=""
		End if 
		
	End if 
	
End if 
