//%attributes = {"invisible":true}
#DECLARE($doc : Object; $options : Object)->$picture : Picture

var $text; $svg : Text
var $allDefined : Boolean

If (Count parameters:C259<2)
	$options:=New object:C1471
End if 

Repeat 
	$allDefined:=False:C215
	Case of 
		: (Undefined:C82($options[wk visible background:K81:289]))
			$options[wk visible background:K81:289]:=True:C214
		: (Undefined:C82($options[wk visible headers:K81:287]))
			$options[wk visible headers:K81:287]:=True:C214
		: (Undefined:C82($options[wk visible footers:K81:288]))
			$options[wk visible footers:K81:288]:=True:C214
		: (Undefined:C82($options[wk recompute formulas:K81:320]))
			$options[wk recompute formulas:K81:320]:=True:C214
		: (Undefined:C82($options[wk optimized for:K81:317]))
			$options[wk optimized for:K81:317]:=wk screen:K81:319
		: (Undefined:C82($options[wk max picture DPI:K81:316]))
			$options[wk max picture DPI:K81:316]:=192
		: (Undefined:C82($options.pageIndex))
			$options.pageIndex:=1
		: (Undefined:C82($options.importGoogleFonts))
			$options.importGoogleFonts:=False:C215
		Else 
			$allDefined:=True:C214
	End case 
Until ($allDefined)

$options.embeddedPictures:=True:C214
$options[wk HTML pretty print:K81:322]:=False:C215


WP EXPORT VARIABLE:C1319($doc; $text; wk svg:K81:356; $options)
$svg:=DOM Parse XML variable:C720($text; False:C215)
SVG EXPORT TO PICTURE:C1017($svg; $picture; Own XML data source:K45:18)




