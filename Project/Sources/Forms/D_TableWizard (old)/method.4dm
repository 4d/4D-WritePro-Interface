var $o : Object
var $range; $table : Object


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.wizard:=cs:C1710.TableWizard.new()
		Form:C1466.local:=New object:C1471
		Form:C1466.local.tableWidth:=Form:C1466.wizard.WP_GetMaxTableWidth()
		
		//  ******     TEMPLATES    ******
		
		Form:C1466.templateList:=Form:C1466.wizard.templateDropDownList()
		Form:C1466.template:=Form:C1466.wizard.templateGet(0)
		
		//  ******     THEMES    ******
		
		Form:C1466.themeList:=Form:C1466.wizard.themeDropDownList(True:C214)  // True means translate (if any)
		Form:C1466.theme:=Form:C1466.wizard.themeGet(0)
		
		Form:C1466.wizard.themeNormalize(Form:C1466.theme)
		
		
		// DROP DOWNS
		
		Form:C1466.tableHeaders:=New object:C1471
		Form:C1466.tableHeaders.values:=New collection:C1472(0; 1; 2; 3; 4; 5)
		Form:C1466.tableHeaders.index:=1
		
		Form:C1466.tableBreakAbove:=New object:C1471
		Form:C1466.tableBreakAbove.values:=New collection:C1472(0)
		Form:C1466.tableBreakAbove.index:=0
		
		Form:C1466.tableData:=1
		
		Form:C1466.tableBreakBelow:=New object:C1471
		Form:C1466.tableBreakBelow.values:=New collection:C1472(0)
		Form:C1466.tableBreakBelow.index:=0
		
		Form:C1466.tableBCOR:=New object:C1471
		Form:C1466.tableBCOR.values:=New collection:C1472("No"; "Yes")
		Form:C1466.tableBCOR.index:=0
		
		Form:C1466.tableExtraRow:=1
		
		// DISPLAY MODE (Formulas / Data)
		Form:C1466.displayFormulas:=1
		Form:C1466.displayData:=0
		
		$o:=New object:C1471
		$o[wk visible references:K81:286]:=True:C214
		$o[wk display formula as symbol:K81:368]:=True:C214
		WP SET VIEW PROPERTIES:C1648(*; "WParea"; $o)
		
		
		Form:C1466.wizard.templateUI("init")
		
		Form:C1466.local.timerAction:="BuildAll"
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		Case of 
			: (Form:C1466.local.timerAction="BuildAll")
				Form:C1466.wizard.WP_BuildAll(True:C214)
				
				Form:C1466.local.timerAction:="SelectEnd"
				SET TIMER:C645(-1)
				
			: (Form:C1466.local.timerAction="SelectEnd")
				
				$range:=WP Text range:C1341(Form:C1466.wp; wk start text:K81:165; wk end text:K81:164)
				WP SELECT:C1348(Form:C1466.wp; $range.end; $range.end)
				Form:C1466.local.timerAction:=""
				
				$table:=WP Get elements:C1550(Form:C1466.wp; wk type table:K81:222)[0]
				WP SET ATTRIBUTES:C1342($table; wk protected:K81:306; wk false:K81:173)  // UNprotect table
				WP SET ATTRIBUTES:C1342(Form:C1466.wp; wk protection enabled:K81:307; wk true:K81:174)  // protect everything (except table)
				
			Else 
				
				Form:C1466.tableData:=Form:C1466.tableData
				Form:C1466.tableExtraRow:=Form:C1466.tableExtraRow
				Form:C1466.wizard.WP_BuildAll()
				
				Form:C1466.local.timerAction:="SelectEnd"
				SET TIMER:C645(-1)
				
		End case 
		
		Form:C1466.wizard.templateUI()
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		$table:=WP Get elements:C1550(Form:C1466.wp; wk type table:K81:222)[0]
		WP SET ATTRIBUTES:C1342($table; wk protected:K81:306; wk true:K81:174)  // Protect table (default value)
		WP SET ATTRIBUTES:C1342(Form:C1466.wp; wk protection enabled:K81:307; wk false:K81:173)  // disable protection on document (useless, not taken into account after insertion in main document)
		
		OB REMOVE:C1226(Form:C1466; "local")
		
End case 

