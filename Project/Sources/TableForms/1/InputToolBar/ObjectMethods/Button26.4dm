var $context : Object

$context:=New object:C1471
$context.table:=ds:C1482.SAMPLE.all()

WP SET DATA CONTEXT:C1786([SAMPLE:1]WP:2; $context)

