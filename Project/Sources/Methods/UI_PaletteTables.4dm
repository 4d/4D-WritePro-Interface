//%attributes = {"invisible":true}

C_LONGINT:C283($n)

C_OBJECT:C1216($rows;$columns;$cells)

C_TEXT:C284($selectedRawText)
C_TEXT:C284($title)


If (Form:C1466.selection.type=2)
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*;"@";True:C214)
	
	  //***************************************************  TABLE *********************************
	
	$rows:=WP Table get rows:C1475(Form:C1466.selection)
	If ($rows=Null:C1517)
		OBJECT SET ENABLED:C1123(*;"btnInsertTable@";True:C214)
		
		OBJECT SET ENABLED:C1123(*;"btnTableManageRows@";False:C215)
		OBJECT SET ENABLED:C1123(*;"btnTableManageColumns@";False:C215)
		OBJECT SET ENABLED:C1123(*;"btnSetCellsColor";False:C215)
		
	Else 
		OBJECT SET ENABLED:C1123(*;"btnInsertTable@";False:C215)
		
		OBJECT SET ENABLED:C1123(*;"btnTableManageRows@";True:C214)
		OBJECT SET ENABLED:C1123(*;"btnTableManageColumns@";True:C214)
		OBJECT SET ENABLED:C1123(*;"btnSetCellsColor";True:C214)
	End if 
	
	  //***************************************************  ROWS *********************************
	
	$rows:=WP Table get rows:C1475(Form:C1466.selection)
	If ($rows#Null:C1517)
		
		  //wk first row + wk row count
		If ($rows[wk row count:K81:197]<=1)
			$title:=Get localized string:C991("DeleteRow")
		Else 
			$title:=Get localized string:C991("DeleteRows")
			$title:=Replace string:C233($title;"<n>";String:C10($rows[wk row count:K81:197]))
		End if 
		OBJECT SET TITLE:C194(*;"btnDeleteRows";$title)
		
		
	Else 
		
		OBJECT SET TITLE:C194(*;"btnDeleteRows";Get localized string:C991("DeleteRow"))
		
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
			$title:=Replace string:C233($title;"<n>";String:C10($columns[wk column count:K81:199]))
		End if 
		OBJECT SET TITLE:C194(*;"btnDeleteColumns";$title)
		
		
	Else 
		
		OBJECT SET TITLE:C194(*;"btnDeleteColumns";Get localized string:C991("DeleteColumn"))
		
		  //OBJECT SET ENABLED(*;"btnDeleteColumns";False)
		  //OBJECT SET ENABLED(*;"btnInsertBeforeColumn";False)
		  //OBJECT SET ENABLED(*;"btnInsertAfterColumn";False)
		
	End if 
	
	
	  //$cells:=WP Table get cells(Form.selection)
	  //  //wk first row + wk row count + wk first column + wk column count
	  //$n:=$cells[wk column count]*$cells[wk row count]
	  //If ($n<=1)
	  //$title:=Get localized string("DeleteCell")
	  //Else 
	  //$title:=Get localized string("DeleteCells")
	  //$title:=Replace string($title;"<n>";String($n))
	  //End if 
	  //OBJECT SET TITLE(*;"btnDeleteCells";$title)
	
End if 

