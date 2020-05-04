//%attributes = {"invisible":true}

C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_POINTER:C301($ptr)

C_LONGINT:C283($color)
C_LONGINT:C283($frameColor)
C_LONGINT:C283($i;$p)
C_LONGINT:C283($styleValue)

C_TEXT:C284($styleAttribute)
C_TEXT:C284($colorAttribute)

C_TEXT:C284($widgetStyleValues)
C_TEXT:C284($widgetStyleNames)
C_TEXT:C284($widgetColor)
C_TEXT:C284($widgetMultiColor)
C_TEXT:C284($widgetCheckbox)


$range:=$1
$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($range)))
	
	For ($i;1;2)
		
		If ($i=1)  // ---------------- LINETHROUGH ------------------------
			
			$styleAttribute:=wk text linethrough style:K81:75
			$colorAttribute:=wk text linethrough color:K81:76
			
			$widgetStyleValues:="linethroughStylesValues"
			$widgetStyleNames:="linethroughStylesNames"
			$widgetColor:="LinethroughColor"
			$widgetMultiColor:="MultiLinethroughColor"
			$widgetCheckbox:="cbLinethrough"
			
		Else   // ___________________ UNDERLINE ______________________
			
			$styleAttribute:=wk text underline style:K81:73
			$colorAttribute:=wk text underline color:K81:74
			
			$widgetStyleValues:="underlineStylesValues"
			$widgetStyleNames:="underlineStylesNames"
			$widgetColor:="UnderlineColor"
			$widgetMultiColor:="MultiUnderlineColor"
			$widgetCheckbox:="cbUnderline"
			
		End if 
		
		WP GET ATTRIBUTES:C1345($range;$styleAttribute;$styleValue)
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$widgetCheckbox)
		Case of 
			: ($styleValue=wk mixed:K81:89)
				$ptr->:=2
			: ($styleValue=wk none:K81:91)
				$ptr->:=0
			Else 
				$ptr->:=1
				
				$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$widgetStyleValues)
				$p:=Find in array:C230($ptr->;$styleValue)
				
				If ($p>0)
					$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$widgetStyleNames)
					$ptr->:=$p
				End if 
				
		End case 
		
		If ($styleValue=wk none:K81:91)
			OBJECT SET VISIBLE:C603(*;$widgetMultiColor;False:C215)
			OBJECT SET RGB COLORS:C628(*;$widgetColor;$frameColor;"transparent")
		Else 
			
			WP GET ATTRIBUTES:C1345($range;$colorAttribute;$color)
			If ($color=-1)  // automatic
				WP GET ATTRIBUTES:C1345($range;wk text color:K81:64;$color)  // lets display as text color (maybe mixed too…)
			End if 
			
			If ($color=wk mixed:K81:89)
				OBJECT SET VISIBLE:C603(*;$widgetMultiColor;True:C214)
				OBJECT SET RGB COLORS:C628(*;$widgetColor;$frameColor;0x00FFFFFF)
			Else 
				OBJECT SET VISIBLE:C603(*;$widgetMultiColor;False:C215)
				If ($color>=0)
					OBJECT SET RGB COLORS:C628(*;$widgetColor;$frameColor;$color)
				End if 
			End if 
			
		End if 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		  //WP GET ATTRIBUTES($range;wk text underline style;$underline)
		  //Case of 
		  //: ($underline=wk mixed)
		  //oForm.cbUnderline:=2
		  //$ptr:=OBJECT Get pointer(Object named;"underlineStylesNames")
		  //$ptr->:=0
		
		  //: ($underline=wk none)
		  //oForm.cbUnderline:=0
		
		  //Else 
		  //oForm.cbUnderline:=1
		
		  //  //re-use of the pointer
		  //$ptr:=OBJECT Get pointer(Object named;"underlineStylesValues")
		  //$p:=Find in array($ptr->;$underline)
		
		  //If ($p>0)
		  //$ptr:=OBJECT Get pointer(Object named;"underlineStylesNames")
		  //$ptr->:=$p
		  //End if 
		
		  //End case 
		
		
		
		
		
		  //WP GET ATTRIBUTES($range;wk text underline color;$color)
		
		  //  // (($color=-1) & ($underline#wk none))  // -1 = automatic
		
		  //If ($underline=wk none)
		  //OBJECT SET VISIBLE(*;"MultiLineColor";False)
		  //OBJECT SET RGB COLORS(*;"UnderlineColor";$frameColor;"transparent")
		  //Else 
		
		  //If ($color=-1)  // automatic
		  //WP GET ATTRIBUTES($range;wk text color;$color)  // lets display as text color (maybe mixed too…)
		  //End if 
		
		  //If ($color=wk mixed)
		  //OBJECT SET VISIBLE(*;"MultiLineColor";True)
		  //OBJECT SET RGB COLORS(*;"UnderlineColor";$frameColor;0x00FFFFFF)
		  //Else 
		  //OBJECT SET VISIBLE(*;"MultiLineColor";False)
		  //If ($color>0)
		  //OBJECT SET RGB COLORS(*;"UnderlineColor";$frameColor;$color)
		  //End if 
		  //End if 
		
		  //End if 
		
	End for 
	
End if 



