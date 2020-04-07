
C_TEXT:C284($menu;$result)
$menu:=Create menu:C408

APPEND MENU ITEM:C411($menu;ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;"insertRowAbove")

APPEND MENU ITEM:C411($menu;ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;"insertRowBelow")

APPEND MENU ITEM:C411($menu;ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu;-1;Associated standard action:K28:8;"deleteRows")

$result:=Dynamic pop up menu:C1006($menu)

RELEASE MENU:C978($menu)
