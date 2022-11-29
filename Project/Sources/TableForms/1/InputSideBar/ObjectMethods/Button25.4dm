var $menu; $value : Text

$menu:=Create menu:C408

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "insertTextBox")


$menu:=Create menu:C408
APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/borderStyle")

//APPEND MENU ITEM($menuRef; Get localized string("bordersColor"))
APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/borderColor")

//APPEND MENU ITEM($menuRef; Get localized string("borderWidth"))
APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/borderWidth")

APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; "textBox/backgroundColor")

$value:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)
