//%attributes = {"invisible":true}
C_BOOLEAN:C305($0)

C_BOOLEAN:C305($skinApplied)

C_REAL:C285($H)
C_REAL:C285($S)
C_REAL:C285($L)

C_LONGINT:C283($color; $fontColor; $separatorColor; $backgroundColor; $separatorFontColor; $iconBackground; $iconBorder)
C_LONGINT:C283($fontSize)

C_TEXT:C284($font)
C_TEXT:C284($skinName)
C_TEXT:C284($name)

C_OBJECT:C1216($skin)


// Default values based on app
// CF Toolbar constructor

If (FORM Get color scheme:C1761="light")
	
	$fontColor:=0x00101010  // font color
	$backgroundColor:=0x00D8D8D8  // background color
	
	$separatorFontColor:=0x00383838  // separator font color
	$separatorColor:=0x00B0B0B0  //
	
	$iconBorder:=0x00E8E8E8  //0x00C0C0C0
	$iconBackground:=0x00E8E8E8
	
Else 
	
	$fontColor:=0x00F0F0F0
	$backgroundColor:=0x00404040
	
	$separatorFontColor:=0x00C8C8C8
	$separatorColor:=0x00303030  // 
	
	$iconBorder:=0x00303030
	$iconBackground:=0x00303030
	
End if 


If (oForm.skin#Null:C1517)
	$skin:=oForm.skin
	
	If (Not:C34(OB Is empty:C1297($skin)))
		
		$fontColor:=-1
		
		If (OB Is defined:C1231($skin; "skinName"))
			$skinName:=OB Get:C1224($skin; "skinName")
			
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
		
		If (OB Is defined:C1231($skin; "backgroundColor"))
			$backgroundColor:=OB Get:C1224($skin; "backgroundColor")
		End if 
		
		If (OB Is defined:C1231($skin; "separatorColor"))
			$separatorColor:=OB Get:C1224($skin; "separatorColor")
		End if 
		
		If (OB Is defined:C1231($skin; "fontColor"))
			$fontColor:=OB Get:C1224($skin; "fontColor")
		End if 
		
		If (OB Is defined:C1231($skin; "separatorFontColor"))
			$separatorFontColor:=OB Get:C1224($skin; "separatorFontColor")
		End if 
		
		If (OB Is defined:C1231($skin; "font"))
			$font:=OB Get:C1224($skin; "font")
		End if 
		
		If (OB Is defined:C1231($skin; "fontSize"))
			$fontSize:=OB Get:C1224($skin; "fontSize")
		End if 
		
		
		//******************************************************************
		
		If ($font#"")
			OBJECT SET FONT:C164(*; "@"; $font)
		End if 
		
		If (($fontSize>=9) & ($fontSize<=14))
			OBJECT SET FONT SIZE:C165(*; "@"; $fontSize)
		End if 
		
	End if 
End if 


OBJECT SET RGB COLORS:C628(*; "background@"; $backgroundColor; $backgroundColor)  // background (toolbar + sidebar)
OBJECT SET RGB COLORS:C628(*; "tabRect_@"; $backgroundColor; $backgroundColor)  // toolbat tabs 

OBJECT SET RGB COLORS:C628(*; "Separator@"; $separatorColor; $separatorColor)
OBJECT SET RGB COLORS:C628(*; "sepLbl@"; $separatorFontColor; $separatorColor)
OBJECT SET RGB COLORS:C628(*; "line@"; $separatorColor; $separatorColor)
OBJECT SET RGB COLORS:C628(*; "IconBgnd@"; $iconBorder; $iconBackground)  // $separatorColor; $separatorColor)


OBJECT SET RGB COLORS:C628(*; "rb@"; $fontColor; Background color:K23:2)  // radio buttons
OBJECT SET RGB COLORS:C628(*; "cb@"; $fontColor; Background color:K23:2)  // check boxes
OBJECT SET RGB COLORS:C628(*; "lbl_@"; $fontColor)  //;Background color) // labels
OBJECT SET RGB COLORS:C628(*; "tabBtn_@"; $fontColor)  // toolbat labels


// listboxes tabulations & bookmarks
LISTBOX SET GRID COLOR:C842(*; "lb_@"; $separatorColor; True:C214; False:C215)
OBJECT SET RGB COLORS:C628(*; "lb_@"; $fontColor; Background color none:K23:10)


If (oForm.ToolbarTabs#Null:C1517)  // toolbar mode
	
	oForm.ToolbarTabs.setColors($fontColor; $backgroundColor; $separatorFontColor; $separatorColor)  // front;back
	
	$name:=oForm.ToolbarTabs.allButtonNames[FORM Get current page:C276(*)-1]
	oForm.ToolbarTabs.activate($name)
	
Else   // side bar mode
	
End if 



$skinApplied:=True:C214

$0:=$skinApplied










