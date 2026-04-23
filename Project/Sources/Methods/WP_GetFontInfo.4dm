//%attributes = {"invisible":true}
#DECLARE($range : Object; $check : Boolean)

var $index : Integer
var $redraw : Boolean
var $p; $frameColor; $color; $rangeStart; $rangeEnd : Integer
var $fontFamily; $font : Text
var $fontSize : Real  // ACI0104990 Pat Bensky

If (Count parameters:C259<2)
	
	$check:=False:C215
	
End if 

$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($range)))
	
	If ($check)
		
		$rangeStart:=OB Get:C1224($range; wk start:K81:87; Is longint:K8:6)
		$rangeEnd:=OB Get:C1224($range; wk end:K81:88; Is longint:K8:6)
		
		$redraw:=($rangeStart#$rangeEnd)
		
	Else 
		
		$redraw:=True:C214
		
	End if 
	
	If ($redraw)
		
		WP Get attributes:C1345($range; wk font family:K81:65; $fontFamily)
		$p:=Find in array:C230(WP_fontFamilly; $fontFamily)
		
		If ($p<0)
			
			// Second chance for japanese :-)
			$p:=Find in array:C230(WP_fontFamillyJapanese; $fontFamily)
			
		End if 
		
		If ($p>0)\
			 & ($p<=Size of array:C274(WP_fontFamilly))
			
			
			// Set the drop down to the right value
			WP_fontFamilly:=$p
			
			// Then rebuild the font style and long names arrays
			$fontFamily:=WP_fontFamilly{$p}
			
			WP_FillFontStyles($fontFamily)  // ACI0104450
			
			WP Get attributes:C1345($range; wk font:K81:69; $font)
			$p:=Find in array:C230(WP_fontLongName; $font)
			
			If ($p>0)\
				 & ($p<=Size of array:C274(WP_fontLongName))
				
				WP_fontStyle:=$p
				WP_fontLongName:=$p
				
			Else 
				
				WP_fontStyle{0}:=$font  // Just for display, not selectable !
				WP_fontLongName{0}:=$font
				
				WP_fontStyle:=0
				
				// WP_fontFamilly:=0
				
			End if 
			
		Else 
			
			// Font familly not found in array !
			
			WP_fontFamilly{0}:=$fontFamily  // Just for display, not selectable !
			WP_fontFamilly:=0
			
		End if 
		
		If (Not:C34(Undefined:C82(formData.fonts)))
			
			// New font button
			
			WP Get attributes:C1345($range; wk font:K81:69; $font; wk font family:K81:65; $fontFamily)
			$index:=formData.fonts.names.indexOf($font)
			
			If ($index>0)
				
				OBJECT SET TITLE:C194(*; "btnFonts"; formData.fonts.families[$index]+" "+formData.fonts.styles[$index])
				
			Else 
				
				$index:=formData.fonts.families.indexOf($fontFamily)
				
				If ($index>0)
					
					OBJECT SET TITLE:C194(*; "btnFonts"; formData.fonts.families[$index])
					
				Else 
					
					OBJECT SET TITLE:C194(*; "btnFonts"; "-")
					
				End if 
			End if 
		End if 
		
		// Get the size (always in pt)
		WP Get attributes:C1345($range; wk font size:K81:66; $fontSize)
		
		If ($fontSize#wk mixed:K81:89)
			
			formData.fontSize:=$fontSize
			
		End if 
		
		WP Get attributes:C1345($range; wk text color:K81:64; $color)
		
		If ($color=wk mixed:K81:89)
			
			OBJECT SET VISIBLE:C603(*; "MultiFontColor"; True:C214)
			OBJECT SET RGB COLORS:C628(*; "ColorSample"; $frameColor; 0x00FFFFFF)
			
		Else 
			
			OBJECT SET RGB COLORS:C628(*; "ColorSample"; $frameColor; $color)
			OBJECT SET VISIBLE:C603(*; "MultiFontColor"; False:C215)
			
		End if 
	End if 
End if 