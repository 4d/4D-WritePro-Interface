C_POINTER:C301($ptrSource;$ptrTarget)

Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		  // Generated either from the "top" or the "bottom"
		$ptrSource:=OBJECT Get pointer:C1124(Object named:K67:5;"PaletteSubform")  // self
		
		  // If comming from the "bottom" it must be reflected to the "top"
		  // to check that, lets see if there is an "exec" in the object
		  // if "exec" exists it means it has been modified by the "bottom"
		
		If (Not:C34(Undefined:C82($ptrSource->)))
			If (OB Is defined:C1231($ptrSource->;"exec"))
				
				$ptrTarget:=OBJECT Get pointer:C1124(Object subform container:K67:4)  // parent
				$ptrTarget->:=$ptrSource->
				
			End if 
		End if 
		
End case 
