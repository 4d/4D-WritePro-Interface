Form:C1466.font:=Form:C1466.wizard.themeGetFont(Form:C1466.fontFamily.values[Form:C1466.fontFamily.index])

//InitFont(Form.fontFamily.values[Form.fontFamily.index])

Form:C1466.currentRow.fontFamily:=Form:C1466.fontFamily.values[Form:C1466.fontFamily.index]
Form:C1466.currentRow.font:=Form:C1466.font.fontNames[Form:C1466.font.index]

SET TIMER:C645(-1)
