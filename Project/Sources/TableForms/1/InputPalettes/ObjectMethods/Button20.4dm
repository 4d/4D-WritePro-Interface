var $sel : Object
var $font,$ff : Text

$sel:=WP Selection range:C1340(*;"WParea")
WP GET ATTRIBUTES:C1345($sel;wk font family:K81:65;$ff;wk font:K81:69;$font)


Form:C1466.ff:=$ff
Form:C1466.ffont:=$font
ALERT:C41($ff+"/"+$font)

