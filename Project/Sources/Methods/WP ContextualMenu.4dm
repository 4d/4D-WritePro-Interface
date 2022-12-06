//%attributes = {"invisible":true}
#DECLARE($_menuContent : Collection)  // "pictureSettings"; "formulaSettings"

var $menu : Text
var $item; $parameter : Text
var $range; $formula : Object
var $ok : Boolean

If (Contextual click:C713)
	
	$range:=WP Selection range:C1340(Self:C308->)
	$menu:=Create menu:C408
	
	For each ($item; $_menuContent)
		
		Case of 
				
				
			: ($item="tableSettings")
				
				
				$ok:=False:C215
				Case of 
						
					: (Not:C34(Undefined:C82($range.start))) && (Not:C34(Undefined:C82($range.end)))  // it's a range
						If (WP Get elements:C1550($range; wk type table:K81:222).length>=1)
							$ok:=True:C214
						End if 
						
				End case 
				
				If ($ok)
					APPEND MENU ITEM:C411($menu; "Table settings")
					SET MENU ITEM PARAMETER:C1004($menu; -1; "tableSettings")
				End if 
				
			: ($item="pictureSettings")
				
				
				$ok:=False:C215
				Case of 
						
					: (Not:C34(Undefined:C82($range.start))) && (Not:C34(Undefined:C82($range.end)))  // it's a range
						If (WP Get elements:C1550($range; wk type image:K81:192).length>=1)
							$ok:=True:C214
						End if 
						
					: (Not:C34(Undefined:C82($range.anchorOrigin)))
						$ok:=True:C214
						
				End case 
				
				If ($ok)
					APPEND MENU ITEM:C411($menu; "Picture settings")
					SET MENU ITEM PARAMETER:C1004($menu; -1; "pictureSettings")
				End if 
				
				
				
			: ($item="formulaSettings")
				
				$ok:=False:C215
				Case of 
					: (Not:C34(Undefined:C82($range.start))) && (Not:C34(Undefined:C82($range.end)))  // it's a range
						
						If (WP Get formulas:C1702($range).length>0)
							$ok:=True:C214
						End if 
						
					: (Not:C34(Undefined:C82($range.anchorOrigin)))
						WP GET ATTRIBUTES:C1345($range; wk image formula:K81:305; $formula)
						If ($formula#Null:C1517)
							$ok:=True:C214
						End if 
						
				End case 
				
				If ($ok)
					APPEND MENU ITEM:C411($menu; "Edit formula")
					SET MENU ITEM PARAMETER:C1004($menu; -1; "formulaSettings")
				End if 
				
		End case 
		
	End for each 
	
	
	$parameter:=Dynamic pop up menu:C1006($menu)
	If ($parameter#"")
		
		Case of 
			: ($parameter="pictureSettings")
				WP PictureSettings()
				
			: ($parameter="formulaSettings")
				WP FormulaSettings()
				
			: ($parameter="tableSettings")
				WP TableSettings()
				
		End case 
	End if 
	
	
End if 