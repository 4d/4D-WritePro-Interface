//%attributes = {"invisible":true}

var $ptrLabel; $ptrURL : Pointer
var $_URLs : Collection
var $range1; $range2 : Object
var $start; $end : Integer
var $label; $URL : Text  // ACI0105031

$ptrLabel:=OBJECT Get pointer:C1124(Object named:K67:5; "URLlabel")
$ptrURL:=OBJECT Get pointer:C1124(Object named:K67:5; "URLurl")

If (Not:C34((Is nil pointer:C315($ptrLabel)) | (Is nil pointer:C315($ptrURL))))
	
	$label:=$ptrLabel->  // ACI0105031
	$URL:=$ptrURL->  // ACI0105031
	
	$_URLs:=WP Get links:C1643(Form:C1466.selection)
	If ($_URLs.length>0)
		
		
		// text currenttly selected in the area
		$range1:=Form:C1466.selection
		
		If ($URL#"")  // ACI0105031
			
			// range of the first URL
			$range2:=WP Text range:C1341(Form:C1466.selection.owner; $_URLs[0].range.start; $_URLs[0].range.end)
			
			If ($range1.start<$range2.start)
				$start:=$range1.start
			Else 
				$start:=$range2.start
			End if 
			
			If ($range1.end>$range2.end)
				$end:=$range1.end
			Else 
				$end:=$range2.end
			End if 
			$range1:=WP Text range:C1341(Form:C1466.selection.owner; $start; $end)
			
		End if 
		
	Else 
		
		$range1:=Form:C1466.selection
		
	End if 
	
	// user friendly help // ACI0105031 
	If ($URL="www@")
		$URL:="http://"+$URL
	End if 
	
	Try  // ACI0105031 
		WP SET TEXT:C1574($range1; $label; wk replace:K81:177)  // ACI0105031  (two lines of code switched… the label must be set FIRST)
		WP SET ATTRIBUTES:C1342($range1; wk link url:K81:202; $URL)  // ACI0105031   (two lines of code switched… the label must be set FIRST)
		//Catch
		//ALERT("An error occured while setting the URL") // to be translated
	End try
	
End if 
