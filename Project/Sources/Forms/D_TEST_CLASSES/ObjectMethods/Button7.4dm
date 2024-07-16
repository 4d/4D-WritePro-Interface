
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange
var $sections : Collection
var $s : cs:C1710.WPsection

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$sections:=$area.getSections()
For each ($s; $sections)
	ALERT:C41($s.getText())
End for each 

$sections:=$area.getSections(False:C215)




