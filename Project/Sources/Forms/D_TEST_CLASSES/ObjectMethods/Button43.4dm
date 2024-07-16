var $doc : cs:C1710.WPdocument
var $header; $footer : cs:C1710.WPelement
var $section; $subsection : cs:C1710.WPsection

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(1)
$section.delete(wk left page:K81:204)
