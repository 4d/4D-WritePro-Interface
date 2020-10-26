//%attributes = {"invisible":true}
C_BOOLEAN:C305($0)

C_BOOLEAN:C305($skinApplied)

C_REAL:C285($H)
C_REAL:C285($S)
C_REAL:C285($L)

C_LONGINT:C283($color; $fontColor; $separatorColor; $backgroundColor; $separatorFontColor)
C_LONGINT:C283($fontSize)
C_LONGINT:C283($i; $n)

C_TEXT:C284($format)
C_TEXT:C284($button)
C_TEXT:C284($font)
C_TEXT:C284($skinName)
C_TEXT:C284($find)
C_TEXT:C284($replace)

// Default values

$fontColor:=0
$backgroundColor:=0x00C8C8C8
$separatorColor:=0x00A0A0A0
$button:="action_white.png"

$fontColor:=-1
$backgroundColor:=-1
$separatorColor:=-1
$separatorFontColor:=-1

If (Not:C34(Undefined:C82(skin)))
	If (Not:C34(OB Is empty:C1297(skin)))
		
		If (OB Is defined:C1231(skin; "skinName"))
			$skinName:=OB Get:C1224(skin; "skinName")
			
			Case of 
					
				: ($skinName="white")
					
					$backgroundColor:=0x00FFFFFF
					$separatorColor:=0x00F0F0F0
					
				: ($skinName="light")
					
					$backgroundColor:=0x00D8D8D8
					$separatorColor:=0x00C0C0C0
					
				: ($skinName="grey")
					
					$backgroundColor:=0x00C0C0C0
					$separatorColor:=0x00A0A0A0
					
				: ($skinName="dark")
					
					$backgroundColor:=0x00585858
					$separatorColor:=0x00808080
					
				: ($skinName="black")
					
					$backgroundColor:=0x00282828
					$separatorColor:=0x00808080
					
				: ($skinName="night")
					
					$backgroundColor:=0x00101040
					$separatorColor:=0x00101080
					
					$fontColor:=0x00D0D0FF
					$separatorFontColor:=0x00D8D8FF
					
				: ($skinName="00@")
					
					$color:=Num:C11($skinName)
					TOOL_RGBtoHLS($color; ->$H; ->$L; ->$S)
					
					If ($L>50)  // bright
						
						$fontColor:=TOOL_HLStoRGB($H; 5; 20)
						$backgroundColor:=$color
						$L:=$L-21  //30->79
						$separatorColor:=TOOL_HLStoRGB($H; $L; $S)
						
					Else   // dark
						
						$fontColor:=TOOL_HLStoRGB($H; 100; 20)
						$backgroundColor:=$color
						$L:=$L+20  // 30->80
						$separatorColor:=TOOL_HLStoRGB($H; $L; $S)
						
					End if 
					
			End case 
			
		End if 
		
		If (OB Is defined:C1231(skin; "backgroundColor"))
			$backgroundColor:=OB Get:C1224(skin; "backgroundColor")
		End if 
		
		If (OB Is defined:C1231(skin; "separatorColor"))
			$separatorColor:=OB Get:C1224(skin; "separatorColor")
		End if 
		
		If (OB Is defined:C1231(skin; "font"))
			$font:=OB Get:C1224(skin; "font")
		End if 
		
		If (OB Is defined:C1231(skin; "fontSize"))
			$fontSize:=OB Get:C1224(skin; "fontSize")
		End if 
		
		If (OB Is defined:C1231(skin; "fontColor"))
			$fontColor:=OB Get:C1224(skin; "fontColor")
		End if 
		
		If (OB Is defined:C1231(skin; "separatorFontColor"))
			$separatorFontColor:=OB Get:C1224(skin; "separatorFontColor")
		End if 
		
		//******************************************************************
		
		If ($font#"")
			OBJECT SET FONT:C164(*; "@"; $font)
		End if 
		
		If (($fontSize>=9) & ($fontSize<=14))
			OBJECT SET FONT SIZE:C165(*; "@"; $fontSize)
		End if 
		If ($backgroundColor#-1)
			OBJECT SET RGB COLORS:C628(*; "rect@"; $backgroundColor; $backgroundColor)
		End if 
		If ($separatorColor#-1)
			OBJECT SET RGB COLORS:C628(*; "separator@"; $separatorColor; $separatorColor)
			LISTBOX SET GRID COLOR:C842(*; "lb_@"; $separatorColor; True:C214; True:C214)
		End if 
		
		If ($backgroundColor#-1)  // Defined
			TOOL_RGBtoHLS($backgroundColor; ->$H; ->$L; ->$S)
			
			If ($L>70)  // light
				$find:="Dark"
				$replace:="Light"
				If ($fontColor=-1)  // undefined
					$fontColor:=0x00101010  // almost black
				End if 
			Else 
				$find:="Light"
				$replace:="Dark"
				If ($fontColor=-1)
					$fontColor:=0x00F0F0F0  // almost white
				End if 
			End if 
		End if 
		
		If ($separatorColor#-1) & ($separatorFontColor=-1)
			TOOL_RGBtoHLS($separatorColor; ->$H; ->$L; ->$S)
			If ($L>70)  // light
				$separatorFontColor:=0x00101010  // almost black
			Else 
				$separatorFontColor:=0x00F0F0F0  // almost white
			End if 
			
		End if 
		
		If ($fontColor#-1)
			OBJECT SET RGB COLORS:C628(*; "rb@"; $fontColor; Background color:K23:2)
			OBJECT SET RGB COLORS:C628(*; "cb@"; $fontColor; Background color:K23:2)
			OBJECT SET RGB COLORS:C628(*; "lbl_@"; $fontColor)  //;Background color)
			
			OBJECT SET RGB COLORS:C628(*; "lb_@"; $fontColor; Background color none:K23:10)  // tabulations & bookmarks
		End if 
		
		If ($separatorFontColor#-1)
			OBJECT SET RGB COLORS:C628(*; "sepLbl_@"; $separatorFontColor)  //;Background color)
		End if 
		
		
		// dark or light icons to be replaced
		
		ARRAY TEXT:C222($_names; 0)
		
		APPEND TO ARRAY:C911($_names; "btnAction")
		APPEND TO ARRAY:C911($_names; "btnAdd")
		APPEND TO ARRAY:C911($_names; "btnRemove")
		APPEND TO ARRAY:C911($_names; "btnReload")
		APPEND TO ARRAY:C911($_names; "btnDelete")
		APPEND TO ARRAY:C911($_names; "btnUpdateStylesheet")
		
		APPEND TO ARRAY:C911($_names; "tabBtn_Fonts")
		APPEND TO ARRAY:C911($_names; "tabBtn_Alignments")
		APPEND TO ARRAY:C911($_names; "tabBtn_Tabulations")
		APPEND TO ARRAY:C911($_names; "tabBtn_Sizes")
		APPEND TO ARRAY:C911($_names; "tabBtn_Frames")
		APPEND TO ARRAY:C911($_names; "tabBtn_Backgrounds")
		APPEND TO ARRAY:C911($_names; "tabBtn_Expressions")
		APPEND TO ARRAY:C911($_names; "tabBtn_Bookmarks")
		APPEND TO ARRAY:C911($_names; "tabBtn_Stylesheets")
		APPEND TO ARRAY:C911($_names; "tabBtn_Tables")
		APPEND TO ARRAY:C911($_names; "tabBtn_Protection")
		APPEND TO ARRAY:C911($_names; "tabBtn_ImportExport")
		APPEND TO ARRAY:C911($_names; "tabBtn_FindAndReplace")
		
		APPEND TO ARRAY:C911($_names; "TargetSelector1")  // document
		APPEND TO ARRAY:C911($_names; "TargetSelector2")  // paragraphg
		APPEND TO ARRAY:C911($_names; "TargetSelector3")  // image
		APPEND TO ARRAY:C911($_names; "TargetSelector4")  // anchored picture
		
		APPEND TO ARRAY:C911($_names; "ssType1")  // paragraph style sheet
		APPEND TO ARRAY:C911($_names; "ssType2")  // character style sheet
		
		APPEND TO ARRAY:C911($_names; "Decor1")
		APPEND TO ARRAY:C911($_names; "Decor2")
		APPEND TO ARRAY:C911($_names; "Decor3")
		APPEND TO ARRAY:C911($_names; "Decor4")
		
		$n:=Size of array:C274($_names)
		For ($i; 1; $n)
			$format:=OBJECT Get format:C894(*; $_names{$i})
			$format:=Replace string:C233($format; $find; $replace)
			
			OBJECT SET FORMAT:C236(*; $_names{$i}; $format)
		End for 
		
		$skinApplied:=True:C214
		
	End if 
End if 

skinFontColor:=$fontColor  // Also used in bookmarks

$0:=$skinApplied










