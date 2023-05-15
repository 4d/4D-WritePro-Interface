var $type : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		Form:C1466.wizard:=cs:C1710.TableWizard.new()
		
		
		//  ******     THEMES    ******
		
		Form:C1466.themeList:=Form:C1466.wizard.themeDropDownList()
		Form:C1466.theme:=Form:C1466.wizard.themeGet(0)
		Form:C1466.wizard.themeNormalize(Form:C1466.theme)
		
		Form:C1466.area:=WP New:C1317()
		
		// ******     DROP DOWN LISTS    ******
		
		Form:C1466.borderStyle:=New object:C1471  // drop down
		Form:C1466.borderStyle.values:=New collection:C1472("None"; "Solid"; "Dotted"; "Dashed"; "Double"; "Groove"; "Ridge")
		
		Form:C1466.unit:=New object:C1471  // drop down
		Form:C1466.unit.values:=New collection:C1472("pt"; "mm"; "cm"; "in")
		Form:C1466.unit.index:=0
		
		
		Form:C1466.fontFamily:=Form:C1466.wizard.themeGetFontFamily()
		Form:C1466.font:=Form:C1466.wizard.themeGetFont(Form:C1466.fontFamily.values[0])
		
		
		//InitFontFamily
		//InitFont(Form.fontFamily.values[Form.fontFamily.index])
		
		
		
		
		Form:C1466.collection:=Form:C1466.wizard.themeToCollection(Form:C1466.theme; "LB_template")
		
		Form:C1466.wp:=Form:C1466.wizard.WP_BuildThemeSample(Form:C1466.collection; "WParea")
		
		LISTBOX SELECT ROW:C912(*; "LB_collection"; 1; lk replace selection:K53:1)
		
		Form:C1466.currentRow:=Form:C1466.collection[0]
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		$type:=Form:C1466.currentRow.type
		
		//Wizard_templateToCollection
		
		Form:C1466.wizard.themeEdit(Form:C1466.currentRow)
		//ThemeEdit(Form.currentRow)
		Form:C1466.wizard.themeUI()
		
		Form:C1466.wp:=Form:C1466.wizard.WP_BuildThemeSample(Form:C1466.collection; "WParea")
		
		Form:C1466.collection:=Form:C1466.collection  // TEMP, update listbox to check
		
End case 
