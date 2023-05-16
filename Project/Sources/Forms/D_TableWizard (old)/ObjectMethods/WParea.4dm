//WP UpdateWidget("WPtoolbar"; "WParea")

var $updateTemplate : Boolean
var $menu; $choice; $description : Text
var $range; $cells; $item; $table : Object
var $tables : Collection
var $i : Integer

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Contextual click:C713)
			$range:=WP Selection range:C1340(*; "WParea")
			$tables:=WP Get elements:C1550($range; wk type table:K81:222)
			If ($tables.length>0)  // we ARE inside a table, so the element will be found and [0] exists)
				$table:=$tables[0]
				$cells:=WP Table get cells:C1477($range)
				
				
				If ($cells.rowCount=1)
					
					$menu:=Create menu:C408
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; ak copy:K76:54)
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; ak cut:K76:53)
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; ak paste:K76:55)
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; ak clear:K76:56)
					
					APPEND MENU ITEM:C411($menu; "-")
					
					$description:=Form:C1466.description[$cells.firstRow-1]
					
					Case of 
						: ($description="break@")  // Break row
							
							
							If ($cells.columnCount=1)
								APPEND MENU ITEM:C411($menu; "(Define break formula")  // ∆∆∆
								
								$i:=0
								For each ($item; Form:C1466.template.breakFormulas)
									APPEND MENU ITEM:C411($menu; Form:C1466.wizard.translate("formula"; $item.label; True:C214))
									SET MENU ITEM PARAMETER:C1004($menu; -1; "break_"+String:C10($i))
									$i:=$i+1
								End for each 
							End if 
							
						: ($description="bcor")  // bcor
							
							If ($cells.columnCount=1)
								APPEND MENU ITEM:C411($menu; "(Define bcor formula")
								
								$i:=0
								For each ($item; Form:C1466.template.bcorFormulas)
									APPEND MENU ITEM:C411($menu; Form:C1466.wizard.translate("formula"; $item.label; True:C214))
									SET MENU ITEM PARAMETER:C1004($menu; -1; "bcor_"+String:C10($i))
									$i:=$i+1
								End for each 
							End if 
							
						: ($description="extra@")  // extra row
							If ($cells.columnCount=1)
								APPEND MENU ITEM:C411($menu; "(Define extra row formula")
								$i:=0
								For each ($item; Form:C1466.template.extraFormulas)
									APPEND MENU ITEM:C411($menu; Form:C1466.wizard.translate("formula"; $item.label; True:C214))
									SET MENU ITEM PARAMETER:C1004($menu; -1; "extra_"+String:C10($i))
									$i:=$i+1
								End for each 
							End if 
							
					End case 
					
					$choice:=Dynamic pop up menu:C1006($menu)
					RELEASE MENU:C978($menu)
					
					Case of 
						: ($choice="SetBreak_@")
							ALERT:C41("set break")
							//$row:=WP Table get rows(
							
						: ($choice="break_@")
							$i:=Num:C11($choice)  // 0, 1, 2…
							WP INSERT FORMULA:C1703($range; Formula from string:C1601(Form:C1466.template.breakFormulas[$i].source); wk replace:K81:177)
							
						: ($choice="bcor_@")
							$i:=Num:C11($choice)  // 0, 1, 2…
							WP INSERT FORMULA:C1703($range; Formula from string:C1601(Form:C1466.template.bcorFormulas[$i].source); wk replace:K81:177)
							
						: ($choice="extra_@")
							$i:=Num:C11($choice)  // 0, 1, 2…
							WP INSERT FORMULA:C1703($range; Formula from string:C1601(Form:C1466.template.extraFormulas[$i].source); wk replace:K81:177)
							
					End case 
					
				End if 
				
			End if   //($tables.length>0)  
		End if   // contextual click
		
End case 