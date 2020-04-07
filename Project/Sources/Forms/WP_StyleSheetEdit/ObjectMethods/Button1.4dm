C_TEXT:C284($category)

  //WP_StyleFillEditLB (0)  // get from selection

WP_StyleFillEditLB (1;0)
WP_StyleFillEditLB (2;0)
WP_StyleFillEditLB (3;0)

GET LIST ITEM:C378(_StylesheetTabs;*;$page;$text)
$category:=Choose:C955($page;"bug";"fonts";"paragraphs";"margins")
Form:C1466.edit:=Form:C1466.tabs[$category]

SET TIMER:C645(-1)