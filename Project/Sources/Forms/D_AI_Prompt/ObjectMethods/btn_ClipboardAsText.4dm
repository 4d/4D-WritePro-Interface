var $text : Text
$text:=WP Get text:C1575(WP Selection range:C1340(*; "WParea"); wk expressions as value:K81:255)

CLEAR PASTEBOARD:C402
SET TEXT TO PASTEBOARD:C523($text)
