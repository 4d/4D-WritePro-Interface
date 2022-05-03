
var $options : Object

$options:=New object:C1471

$options[wk visible background:K81:289]:=False:C215
$options[wk visible headers:K81:287]:=False:C215
$options[wk visible footers:K81:288]:=False:C215
$options[wk recompute formulas:K81:320]:=True:C214
$options[wk optimized for:K81:317]:=wk print:K81:318
$options[wk max picture DPI:K81:316]:=300

$options.pageIndex:=1
$options.importGoogleFonts:=False:C215


svgPict:=WP CreatePreview([SAMPLE:1]WP:2; $options)


