C_LONGINT:C283($col;$row)

Case of 
	: (Form event code:C388=On Clicked:K2:4) | (Form event code:C388=On Data Change:K2:15)
		
		LISTBOX GET CELL POSITION:C971(*;"LBedit";$col;$row)
		
		If (False:C215)
			If ($row>=1) & ($row<=Form:C1466.edit.length)
				
				$row:=$row-1
				If (Not:C34(OB Is empty:C1297(Form:C1466.edit[$row])))
					  //Form.edit[$row].check:=Not(Form.edit[$row].check)  // swicth checkbox value
					
					If (Form:C1466.edit[$row].check)  // checked = use Normal 
						Form:C1466.edit[$row].display:=Form:C1466.edit[$row].displayNormalValue
					Else   // UNchecked  = use Style sheet
						Form:C1466.edit[$row].display:=Form:C1466.edit[$row].displayStylesheetValue
					End if 
					
					Form:C1466.edit:=Form:C1466.edit
				End if 
				
			End if 
		End if 
		
		StyleSheetBuildSample 
		Form:C1466.edit:=Form:C1466.edit
		
End case 
