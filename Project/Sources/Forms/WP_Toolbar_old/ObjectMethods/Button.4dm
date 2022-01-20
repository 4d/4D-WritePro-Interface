C_TEXT:C284($path)

If (Form:C1466#Null:C1517)  //ACI0100560
	If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
		If (Form:C1466.selection#Null:C1517)  //ACI0100560
			
			$path:=Get 4D folder:C485(Current resources folder:K5:16)+"lorem.txt"
			If (Test path name:C476($path)=Is a document:K24:1)
				WP SET TEXT:C1574(Form:C1466.selection; Document to text:C1236($path; "utf-8"); wk replace:K81:177)
			End if 
		End if 
	End if 
End if 
