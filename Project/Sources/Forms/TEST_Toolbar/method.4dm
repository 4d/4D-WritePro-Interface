var $txt:="Spanish Novels\n20th century\nCien años de soledad\nEl túnel\nFicciones\nFrench "\
+"Novels\n19th century\nLes Misérables\nMadame Bovary\nGerminal\n\n& More"

var $area : Object:=Form:C1466.wp

WP SET TEXT:C1574($area; $txt; wk append:K81:179)

// Create 3 hierarchical list style sheets
WP New style sheet:C1650($area; wk type paragraph:K81:191; "MyList"; 3)

// Retrieve each level
var $level1:=WP Get style sheet:C1656($area; "MyList"; 1)  // Root level
var $level2:=WP Get style sheet:C1656($area; "MyList"; 2)  // 1st sub-level
var $level3:=WP Get style sheet:C1656($area; "MyList"; 3)  // 2nd sub-level

// Customize styles
WP SET ATTRIBUTES:C1342($level1; {listStyleType: wk upper latin:K81:146; fontBold: wk true:K81:174})
WP SET ATTRIBUTES:C1342($level2; {listConcatStringFormat: True:C214})
WP SET ATTRIBUTES:C1342($level3; {listStringFormatLtr: "(#)"})

// Apply hierarchical style sheets to paragraphs
var $paragraphs : Collection
$paragraphs:=WP Get elements:C1550($area; wk type paragraph:K81:191)

WP SET ATTRIBUTES:C1342($paragraphs[0]; wk style sheet:K81:63; $level1)
WP SET ATTRIBUTES:C1342($paragraphs[1]; wk style sheet:K81:63; $level2)
WP SET ATTRIBUTES:C1342($paragraphs[2]; wk style sheet:K81:63; $level3)
WP SET ATTRIBUTES:C1342($paragraphs[3]; wk style sheet:K81:63; $level3)
WP SET ATTRIBUTES:C1342($paragraphs[4]; wk style sheet:K81:63; $level3)

WP SET ATTRIBUTES:C1342($paragraphs[0]; wk style sheet:K81:63; $level1)
WP SET ATTRIBUTES:C1342($paragraphs[6]; wk style sheet:K81:63; $level2)
WP SET ATTRIBUTES:C1342($paragraphs[7]; wk style sheet:K81:63; $level3)
WP SET ATTRIBUTES:C1342($paragraphs[8]; wk style sheet:K81:63; $level3)
WP SET ATTRIBUTES:C1342($paragraphs[9]; wk style sheet:K81:63; $level3)