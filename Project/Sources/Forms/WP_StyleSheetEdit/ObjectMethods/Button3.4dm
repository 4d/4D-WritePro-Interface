
C_OBJECT:C1216($attribute)
C_COLLECTION:C1488($col)
C_TEXT:C284($tab)

For each ($tab;Form:C1466.tabs)
	
	$col:=Form:C1466.tabs[$tab]
	For each ($attribute;$col)
		If (Not:C34(OB Is empty:C1297($attribute)))  // interface space
			
			If ($attribute.check#Null:C1517)
				If ($attribute.check=True:C214)  // = "USE NORMAL" SO remove the attribute
					
					  // remove property from style sheet if it exists
					If (Form:C1466.stylesheet[$attribute.property]#Null:C1517)
						OB REMOVE:C1226(Form:C1466.stylesheet;$attribute.property)
					End if 
					
				Else 
					
					  // update or add property into style sheet 
					If (Value type:C1509($attribute.value)=Is real:K8:4)
						If ($attribute.value#wk mixed:K81:89)
							Form:C1466.stylesheet[$attribute.property]:=$attribute.value
						End if 
					Else 
						Form:C1466.stylesheet[$attribute.property]:=$attribute.value
					End if 
					
				End if 
			End if 
			
		End if 
	End for each 
End for each 