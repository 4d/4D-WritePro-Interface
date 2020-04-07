C_OBJECT:C1216($oCurrent)
$oCurrent:=WP_FillCurrent 

C_LONGINT:C283($n)
C_TEXT:C284($path)

Case of 
	: (Form event code:C388=On Drop:K2:12)
		
		  //GET PASTEBOARD DATA TYPE(4Dsignatures;nativeTypes)
		
		$n:=1
		Repeat 
			$path:=Get file from pasteboard:C976($n)
			If ($path#"")
				
				If (Is picture file:C1113($path))
					Self:C308->:=$path
					  //Self->:=Convert path system to POSIX($path)
					$path:=""
				Else 
					$n:=$n+1
				End if 
				
			End if 
		Until ($path="")
		
		
		If (Self:C308->#"")
			
			WP_SetBackgroundPicture ($oCurrent;Self:C308->)
			
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		$path:=Self:C308->
		If (Is picture file:C1113($path))
			
		Else 
			
		End if 
		
		WP_SetBackgroundPicture ($oCurrent;Self:C308->)
		
End case 