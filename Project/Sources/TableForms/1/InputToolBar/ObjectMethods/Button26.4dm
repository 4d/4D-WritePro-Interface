//var $context : Object

//$context:=New object
//$context.table:=ds.SAMPLE.all()

//WP SET DATA CONTEXT([SAMPLE]WP; $context)

var $path; $json : Text
var $context : Object

$path:=Get 4D folder:C485(Current resources folder:K5:16)+"context.json"
$json:=Document to text:C1236($path)
$context:=JSON Parse:C1218($json)

WP SET DATA CONTEXT:C1786([SAMPLE:1]WP:2; $context)
WP COMPUTE FORMULAS:C1707([SAMPLE:1]WP:2)

WP UpdateWidget("WPtoolbar"; "WParea")

