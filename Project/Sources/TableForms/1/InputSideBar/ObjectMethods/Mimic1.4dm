C_TEXT:C284($menu; $result)

$menu:=Create menu:C408


APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "doc")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "view")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "section")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "header")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "footer")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "paragraph")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "image")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "table")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox")  // NOT TO BE USED UNTIL FEATURE IS REALEASED !!!


$result:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)
