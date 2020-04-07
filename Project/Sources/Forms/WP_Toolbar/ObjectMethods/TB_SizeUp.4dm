C_TEXT:C284($size_t)
C_POINTER:C301($ptr)
C_LONGINT:C283($p)
C_OBJECT:C1216($wpRange)

If (Form event code:C388=On Clicked:K2:4)
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"TB_FontSize")
	$p:=$ptr->
	If (($p>0) & ($p<Size of array:C274($ptr->)))
		$size_t:=$ptr->{$p+1}+"pt"
		
		
		$ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		If (Not:C34(Is nil pointer:C315($ptr)))
			If (OB Is defined:C1231($ptr->;"selection"))
				$wpRange:=OB Get:C1224($ptr->;"selection")
				WP SET ATTRIBUTES:C1342($wpRange;wk font size:K81:66;$size_t)
			End if 
		End if 
		
	Else 
		BEEP:C151
	End if 
End if 
