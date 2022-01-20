C_POINTER:C301($ptr)
C_OBJECT:C1216($wpRange)
C_LONGINT:C283($memoBold; $memoItalic)

// update font in selection
$ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)
If (Not:C34(Is nil pointer:C315($ptr)))
	If (OB Is defined:C1231($ptr->; "selection"))
		$wpRange:=OB Get:C1224($ptr->; "selection")
		
		
		
		If (False:C215)  // one way to fix : memorise bold and italic then re-apply
			
			$memoBold:=(OBJECT Get pointer:C1124(Object named:K67:5; "cbBold"))->
			$memoItalic:=(OBJECT Get pointer:C1124(Object named:K67:5; "cbItalic"))->
			
			ARRAY TEXT:C222(WP_fontStyle; 0)
			ARRAY TEXT:C222(WP_fontLongName; 0)
			FONT STYLE LIST:C1362(WP_fontFamilly{WP_fontFamilly}; WP_fontStyle; WP_fontLongName)
			WP_fontStyle:=1
			WP_fontLongName:=1
			
			WP SET ATTRIBUTES:C1342($wpRange; wk font:K81:69; WP_fontLongName{WP_fontStyle})
			WP SET ATTRIBUTES:C1342($wpRange; wk font bold:K81:68; $memoBold; wk font italic:K81:67; $memoItalic)
			
		Else   // second way to fix : just set the font familly instead of font
			
			WP SET ATTRIBUTES:C1342($wpRange; wk font family:K81:65; WP_fontFamilly{WP_fontFamilly})
			
		End if 
		
	End if 
End if 
