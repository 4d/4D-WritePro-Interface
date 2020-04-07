C_TEXT:C284($menu;$result)
$menu:=Create menu:C408

APPEND MENU ITEM:C411($menu;ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;"insertColumnToTheLeft")

APPEND MENU ITEM:C411($menu;ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;"insertColumnToTheRight")

APPEND MENU ITEM:C411($menu;ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;"deleteColumns")

$result:=Dynamic pop up menu:C1006($menu)

RELEASE MENU:C978($menu)
