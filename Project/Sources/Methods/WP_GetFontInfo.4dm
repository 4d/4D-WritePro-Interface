//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_BOOLEAN:C305($2)  // check if not empty selection

C_OBJECT:C1216($range)
C_BOOLEAN:C305($check)
C_BOOLEAN:C305($redraw)

C_LONGINT:C283($p)
C_LONGINT:C283($frameColor)
C_LONGINT:C283($fontSize;$style;$weight;$color)
C_LONGINT:C283($rangeStart;$rangeEnd)

C_TEXT:C284($fontFamily)
C_TEXT:C284($font)

$range:=$1
If (Count parameters:C259>=2)
	$check:=$2
Else 
	$check:=False:C215
End if 

$frameColor:=0x00404040


If (Not:C34(OB Is empty:C1297($range)))
	
	If ($check)
		
		$rangeStart:=OB Get:C1224($range;wk start:K81:87;Is longint:K8:6)
		$rangeEnd:=OB Get:C1224($range;wk end:K81:88;Is longint:K8:6)
		
		$redraw:=($rangeStart#$rangeEnd)
	Else 
		$redraw:=True:C214
	End if 
	
	
	If ($redraw)
		
		WP GET ATTRIBUTES:C1345($range;wk font family:K81:65;$fontFamily)
		$p:=Find in array:C230(WP_fontFamilly;$fontFamily)
		If ($p<0)
			  // second chance for jamanese :-)
			$p:=Find in array:C230(WP_fontFamillyJapanese;$fontFamily)
		End if 
		
		
		If ($p>0) & ($p<=Size of array:C274(WP_fontFamilly))
			
			  // set the drop down to the right value
			WP_fontFamilly:=$p
			
			  // Then rebuild the font style and long names arrays
			$fontFamily:=WP_fontFamilly{$p}
			ARRAY TEXT:C222(WP_fontStyle;0)
			ARRAY TEXT:C222(WP_fontLongName;0)
			FONT STYLE LIST:C1362($fontFamily;WP_fontStyle;WP_fontLongName)
			
			If (Size of array:C274(WP_fontStyle)=1)
				OBJECT SET ENABLED:C1123(*;"fontStyle";False:C215)
			Else 
				OBJECT SET ENABLED:C1123(*;"fontStyle";True:C214)
			End if 
			
			WP GET ATTRIBUTES:C1345($range;wk font:K81:69;$font)
			$p:=Find in array:C230(WP_fontLongName;$font)
			If ($p>0) & ($p<=Size of array:C274(WP_fontLongName))
				WP_fontStyle:=$p
				WP_fontLongName:=$p
			Else 
				WP_fontStyle{0}:=$font  // just for display, not selectable !
				WP_fontLongName{0}:=$font
				WP_fontFamilly:=0
			End if 
			
			  //OBJECT SET ENABLED(*;"cbBold";WP Is font style supported($range;wk font bold))
			  //OBJECT SET ENABLED(*;"cbItalic";WP Is font style supported($range;wk font italic))
			
		Else 
			  // font familly not found in array !
			
			WP_fontFamilly{0}:=$fontFamily  // just for display, not selectable !
			WP_fontFamilly:=0
			
		End if 
		
		
		  // Get the size (always in pt)
		WP GET ATTRIBUTES:C1345($range;wk font size:K81:66;$fontSize)
		If ($fontSize#wk mixed:K81:89)
			oForm.fontSize:=$fontSize
		End if 
		
		
		WP GET ATTRIBUTES:C1345($range;wk font italic:K81:67;$style)  //0, 1 or wk mixed
		If ($style#wk mixed:K81:89)
			oForm.cbItalic:=$style
		Else 
			oForm.cbItalic:=2
		End if 
		
		WP GET ATTRIBUTES:C1345($range;wk font bold:K81:68;$weight)  //0, 1 or wk mixed
		If ($weight#wk mixed:K81:89)
			oForm.cbBold:=$weight
		Else 
			oForm.cbBold:=2
		End if 
		
		
		
		
		WP GET ATTRIBUTES:C1345($range;wk text color:K81:64;$color)
		If ($color=wk mixed:K81:89)
			OBJECT SET VISIBLE:C603(*;"MultiFontColor";True:C214)
			OBJECT SET RGB COLORS:C628(*;"ColorSample";$frameColor;0x00FFFFFF)
		Else 
			OBJECT SET RGB COLORS:C628(*;"ColorSample";$frameColor;$color)
			OBJECT SET VISIBLE:C603(*;"MultiFontColor";False:C215)
		End if 
		
		  //OBJECT SET VISIBLE(*;"InvisibleBackground";False)
		  //OBJECT SET VISIBLE(*;"MultiBackgroundColor";False)
		  //OBJECT SET RGB COLORS(*;"backgroundColor";$frameColor;0x00FFFFFF)
		
		  //WP GET ATTRIBUTES($range;wk background color;$color)
		  //Case of 
		  //: ($color=wk transparent)
		  //OBJECT SET VISIBLE(*;"InvisibleBackground";True)
		
		  //: ($color=wk mixed)
		  //OBJECT SET VISIBLE(*;"MultiBackgroundColor";True)
		
		  //Else 
		  //OBJECT SET RGB COLORS(*;"backgroundColor";$frameColor;$color)
		  //End case 
		
	End if 
End if 
