C_TEXT:C284($menuRef; $choice)
$menuRef:=Create menu:C408

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("subscript"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "fontSubscript")
SET MENU ITEM ICON:C984($menuRef; -1; "Path:/RESOURCES/Images/MenuIcons/Subscript_24_1.png")

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("superscript"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "fontSuperscript")
SET MENU ITEM ICON:C984($menuRef; -1; "Path:/RESOURCES/Images/MenuIcons/Superscript_24_1.png")

APPEND MENU ITEM:C411($menuRef; "-")

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("Uppercase"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "textTransform?value=uppercase")

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("Lowercase"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "textTransform?value=lowercase")

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("Capitalize"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "textTransform?value=capitalize")

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("SmallUppercase"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "textTransform?value=small-uppercase")

APPEND MENU ITEM:C411($menuRef; Get localized string:C991("TextTransformNone"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "textTransform?value=none")

APPEND MENU ITEM:C411($menuRef; "-")
APPEND MENU ITEM:C411($menuRef; Get localized string:C991("FontsElipsis"))
SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action:K28:8; "font/showDialog")






$choice:=Dynamic pop up menu:C1006($menuRef)

RELEASE MENU:C978($menuRef)




//APPEND TO ARRAY($ptrArrayNames->; Get localized string("TextTransformNone"))
//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Capitalize"))
//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Lowercase"))
//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Uppercase"))
//APPEND TO ARRAY($ptrArrayNames->; Get localized string("SmallUppercase"))

//APPEND TO ARRAY($ptrArrayValues->; wk none)
//APPEND TO ARRAY($ptrArrayValues->; wk capitalize)
//APPEND TO ARRAY($ptrArrayValues->; wk lowercase)
//APPEND TO ARRAY($ptrArrayValues->; wk uppercase)
//APPEND TO ARRAY($ptrArrayValues->; wk small uppercase)
