var $doc : cs:C1710.WPdocument
var $section; $subsection : cs:C1710.WPsection

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(1)

$subsection:=$section.newSubsection(wk left page:K81:204)
$subsection.setAttributes({backgroundColor: "lightgreen"})

$subsection:=$section.getSubsection(wk right page:K81:205)  // GET not NEW :-)
$subsection.setAttributes({backgroundColor: "lightblue"})


