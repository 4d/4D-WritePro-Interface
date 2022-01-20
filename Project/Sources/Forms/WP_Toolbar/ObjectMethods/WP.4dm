//C_POINTER($ptr)
//C_OBJECT($wpRange)
//C_LONGINT($memoBold; $memoItalic)

//// update font in selection
//$ptr:=OBJECT Get pointer(Object subform container)
//If (Not(Is nil pointer($ptr)))
//If (OB Is defined($ptr->; "selection"))
//$wpRange:=OB Get($ptr->; "selection")



//If (False)  // one way to fix : memorise bold and italic then re-apply

//$memoBold:=(OBJECT Get pointer(Object named; "cbBold"))->
//$memoItalic:=(OBJECT Get pointer(Object named; "cbItalic"))->

//ARRAY TEXT(WP_fontStyle; 0)
//ARRAY TEXT(WP_fontLongName; 0)
//FONT STYLE LIST(WP_fontFamilly{WP_fontFamilly}; WP_fontStyle; WP_fontLongName)
//WP_fontStyle:=1
//WP_fontLongName:=1

//WP SET ATTRIBUTES($wpRange; wk font; WP_fontLongName{WP_fontStyle})
//WP SET ATTRIBUTES($wpRange; wk font bold; $memoBold; wk font italic; $memoItalic)

//Else   // second way to fix : just set the font familly instead of font

//WP SET ATTRIBUTES($wpRange; wk font family; WP_fontFamilly{WP_fontFamilly})

//End if 

//End if 
//End if 


WP_SetFontFamily(Form:C1466.selection; Self:C308->{Self:C308->})

WP_GetFontInfo(Form:C1466.selection; True:C214)


