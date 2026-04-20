//%attributes = {}
ASSERT:C1129(cs:C1710._tools.me.incrementString("abcd")="abcd1")
ASSERT:C1129(cs:C1710._tools.me.incrementString("abcd1")="abcd2")
ASSERT:C1129(cs:C1710._tools.me.incrementString("abcd01"; ""; "00")="abcd02")
ASSERT:C1129(cs:C1710._tools.me.incrementString("abcd 1"; " ")="abcd 2")
ASSERT:C1129(cs:C1710._tools.me.incrementString("abcd 01"; " "; "00")="abcd 02")

