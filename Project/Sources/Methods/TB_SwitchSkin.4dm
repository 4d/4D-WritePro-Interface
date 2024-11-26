//%attributes = {"invisible":true}
#DECLARE($folderName : Text)

var $format : Text
var $i; $n; $p1; $p2 : Integer

FORM GET OBJECTS:C898($_objectNames)
$n:=Size of array:C274($_objectNames)
For ($i; 1; $n)
	
	$format:=OBJECT Get format:C894(*; $_objectNames{$i})
	//Button 3D;#Images/Toolbar1/Home/Cut_24.png;0;5;0;1;3;0;0;0;0;0;4
	
	$p1:=Position:C15("#Images/"; $format)
	If ($p1>0)
		
		$p2:=Position:C15("/"; $format; $p1+8)  // second "/"
		If ($p2>0)
			$format:=Substring:C12($format; 1; $p1+7)+$folderName+Substring:C12($format; $p2)
			OBJECT SET FORMAT:C236(*; $_objectNames{$i}; $format)
		End if 
	End if 
	
End for 
