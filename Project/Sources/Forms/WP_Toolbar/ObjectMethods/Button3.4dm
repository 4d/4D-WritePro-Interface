var $menuRef : Text

$menuRef:=Create menu:C408


APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K56:1; wk text linethrough style:K81:75)

APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K56:1; wk text linethrough color:K81:76)


APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K56:1; wk text underline style:K81:73)

APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K56:1; wk text underline color:K81:74)

$menuRef:=Dynamic pop up menu:C1006($menuRef)
