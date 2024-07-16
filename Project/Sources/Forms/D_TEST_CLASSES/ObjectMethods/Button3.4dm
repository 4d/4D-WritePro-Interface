
var $area : cs:C1710.WPdocument
var $bookmarks : Collection

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$bookmarks:=$area.getBookmarks(False:C215)

$bookmarks:=$area.getBookmarks(True:C214)
