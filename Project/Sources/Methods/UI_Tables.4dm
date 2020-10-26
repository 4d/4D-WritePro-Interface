//%attributes = {"invisible":true}
C_TEXT:C284($1; $widgetType)

C_OBJECT:C1216($rows; $columns)
C_BOOLEAN:C305($result)
C_TEXT:C284($title)

$widgetType:=$1

If (UI_isProtected)
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
Else 
	
	
	If (Form:C1466.selection.type=2)
		OBJECT SET ENABLED:C1123(*; "@"; False:C215)
		
	Else 
		
		OBJECT SET ENABLED:C1123(*; "@"; True:C214)
		
		//***************************************************  TABLE *********************************
		
		$rows:=WP Table get rows:C1475(Form:C1466.selection)
		If ($rows=Null:C1517)
			
			OBJECT SET ENABLED:C1123(*; "btn@"; False:C215)  // disable everything 
			OBJECT SET ENABLED:C1123(*; "btnInsertTable@"; True:C214)  //except insert table button
			
		Else 
			
			OBJECT SET ENABLED:C1123(*; "btn@"; True:C214)  // enable everything
			OBJECT SET ENABLED:C1123(*; "btnInsertTable@"; False:C215)  //except insert table button
			
		End if 
		
		//***************************************************  ROWS *********************************
		
		$rows:=WP Table get rows:C1475(Form:C1466.selection)
		If ($rows#Null:C1517)
			
			//wk first row + wk row count
			If ($rows[wk row count:K81:197]<=1)
				$title:=Get localized string:C991("DeleteRow")
			Else 
				$title:=Get localized string:C991("DeleteRows")
				$title:=Replace string:C233($title; "<n>"; String:C10($rows[wk row count:K81:197]))
			End if 
			If ($widgetType="sidebar")
				OBJECT SET TITLE:C194(*; "btnDeleteRows"; $title)
			Else 
				OBJECT SET HELP TIP:C1181(*; "btnDeleteRows"; $title)
			End if 
			
		Else 
			If ($widgetType="sidebar")
				OBJECT SET TITLE:C194(*; "btnDeleteRows"; Get localized string:C991("DeleteRow"))
			Else 
				OBJECT SET HELP TIP:C1181(*; "btnDeleteRows"; Get localized string:C991("DeleteRow"))
			End if 
			
			//OBJECT SET ENABLED(*;"btnDeleteRows";False)
			//OBJECT SET ENABLED(*;"btnInsertBelowRow";False)
			//OBJECT SET ENABLED(*;"btnInsertAboveRow";False)
			
		End if 
		
		//***************************************************  COLUMNS *********************************
		
		$columns:=WP Table get columns:C1476(Form:C1466.selection)
		
		If ($columns#Null:C1517)
			
			//wk first column + wk column count
			If ($columns[wk column count:K81:199]<=1)
				$title:=Get localized string:C991("DeleteColumn")
			Else 
				$title:=Get localized string:C991("DeleteColumns")
				$title:=Replace string:C233($title; "<n>"; String:C10($columns[wk column count:K81:199]))
			End if 
			If ($widgetType="sidebar")
				OBJECT SET TITLE:C194(*; "btnDeleteColumns"; $title)
			Else 
				OBJECT SET HELP TIP:C1181(*; "btnDeleteColumns"; $title)
			End if 
			
		Else 
			If ($widgetType="sidebar")
				OBJECT SET TITLE:C194(*; "btnDeleteColumns"; Get localized string:C991("DeleteColumn"))
			Else 
				OBJECT SET HELP TIP:C1181(*; "btnDeleteColumns"; Get localized string:C991("DeleteColumn"))
			End if 
			
		End if 
		
		// are automatic actions available or not ?
		// if not, buttons with menus exclusively based on automatic actions should be disabled
		
		$result:=CheckAutomaticAction(New collection:C1472("table/borderStyle"; "table/borderColor"; "table/borderWidth"; "table/backgroundColor"; "table/margin"; "table/tableAlign"))
		OBJECT SET ENABLED:C1123(*; "btnTableSettings"; $result)
		
		$result:=CheckAutomaticAction(New collection:C1472("row/borderStyle"; "row/borderColor"; "row/borderWidth"; "row/backgroundColor"; "row/padding"; "row/verticalAlign"; "row/height"))
		OBJECT SET ENABLED:C1123(*; "btnRowSettings"; $result)
		
		$result:=CheckAutomaticAction(New collection:C1472("column/padding"; "column/verticalAlign"; "column/width"))
		OBJECT SET ENABLED:C1123(*; "btnColumnSettings"; $result)
		
		$result:=CheckAutomaticAction(New collection:C1472("cell/borderStyle"; "cell/borderColor"; "cell/borderWidth"; "cell/backgroundColor"; "cell/padding"; "cell/verticalAlign"))
		OBJECT SET ENABLED:C1123(*; "btnCellSettings"; $result)
		
	End if 
End if 

