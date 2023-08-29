//%attributes = {"invisible":true}

#DECLARE($changeWhat : Text)  // <ACI0104082>

var $typeSelection : Integer
var $index : Integer
var $size : Real
var $oldUnit; $newUnit : Text
var $unitsRef : Object


If (UI_isProtected(False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
Else 
	
	$typeSelection:=Form:C1466.selection.type
	Case of 
			
		: ($typeSelection=2)  // static picture
			OBJECT SET ENABLED:C1123(*; "@"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
			
		: ($typeSelection=0)
			OBJECT SET ENABLED:C1123(*; "@"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
			
			If (Not:C34(Undefined:C82(oSettings1)))
				If (Not:C34(OB Is empty:C1297(oSettings1)))
					OBJECT SET ENABLED:C1123(*; "btnPaste"; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(*; "btnPaste"; False:C215)
				End if 
			Else 
				OBJECT SET ENABLED:C1123(*; "btnPaste"; False:C215)
			End if 
			
	End case 
	
End if 

// <ACI0104082>
If (Count parameters:C259>0)
	
	OBJECT SET ENABLED:C1123(*; "verticalSizeUnits"; True:C214)
	OBJECT SET ENTERABLE:C238(*; "bgndSizeVert"; True:C214)
	
	Case of 
		: ($changeWhat="bgndSizeHor")  // ------------------------------------------------- INPUT AREA FOR NUMERIC HORIZONTAL VALUE
			$size:=OBJECT Get value:C1743($changeWhat)
			If ($size<=0)
				OBJECT SET VALUE:C1742($changeWhat; 0)
				oForm.horizontalSizeUnits.index:=0  // "auto"
			Else 
				If (oForm.horizontalSizeUnits.index<=2)
					// can't be "auto", "cover" nor "contain" anymore
					oForm.horizontalSizeUnits.index:=4  //mm
					oForm.horizontalSizeUnits.memoUnit:="mm"
				End if 
			End if 
			
		: ($changeWhat="bgndSizeVert")  // ------------------------------------------------- INPUT AREA FOR NUMERIC VERTICAL VALUE
			$size:=OBJECT Get value:C1743($changeWhat)
			If ($size<=0)
				OBJECT SET VALUE:C1742($changeWhat; 0)
				oForm.verticalSizeUnits.index:=0  // "auto"
			Else 
				If (oForm.verticalSizeUnits.index=0)
					// can't be "auto" anymore
					oForm.verticalSizeUnits.index:=2  //mm
					oForm.verticalSizeUnits.memoUnit:="mm"
				End if 
			End if 
			
		: ($changeWhat="horizontalSizeUnits")  // ------------------------------------------------- DROPDOWN FOR HORIZONTAL UNIT
			$index:=oForm.horizontalSizeUnits.index
			If ($index<=2)  // "auto", "cover" or "contain"
				//if unit = auto, cover or contain, then value MUST be 0
				
				OBJECT SET VALUE:C1742("bgndSizeHor"; 0)
				oForm.horizontalSizeUnits.memoUnit:=""
				
				// two SPECIAL cases : "cover" and "contain"
				If ($index=1) || ($index=2)
					OBJECT SET VALUE:C1742("bgndSizeVert"; 0)
					oForm.verticalSizeUnits.index:=0  // force to "auto"
					OBJECT SET ENABLED:C1123(*; "verticalSizeUnits"; False:C215)
					OBJECT SET ENTERABLE:C238(*; "bgndSizeVert"; False:C215)
				End if 
				
			Else 
				$size:=Num:C11(OBJECT Get value:C1743("bgndSizeHor"))
				$index:=oForm.horizontalSizeUnits.index
				$newUnit:=oForm.horizontalSizeUnits.css[$index]
				
				If ($size<=0)
					// value can't be 0 anymore
					$size:=Choose:C955($index; 0; 0; 0; 100; 10; 1; 0.25; 10; 10)  //;0;0;0; to skip "auto"/"cover"/"contain"
					OBJECT SET VALUE:C1742("bgndSizeHor"; $size)  // 100% 10mm 1cm 0.25in 10pt 10px
				Else 
					// convert from previous unit to new unit
					$oldUnit:=oForm.horizontalSizeUnits.memoUnit
					
					If ($oldUnit#"") && ($oldUnit#"%") && ($newUnit#"") & ($newUnit#"%")
						$size:=WP_Convert($size; $oldUnit; $newUnit)
						OBJECT SET VALUE:C1742("bgndSizeHor"; $size)
					End if 
				End if 
				oForm.horizontalSizeUnits.memoUnit:=$newUnit
			End if 
			
		: ($changeWhat="verticalSizeUnits")  // ------------------------------------------------- DROPDOWN FOR VERTICAL UNIT
			//if unit = auto then value = ""
			If (oForm.verticalSizeUnits.index=0)
				OBJECT SET VALUE:C1742("bgndSizeVert"; 0)
				oForm.verticalSizeUnits.memoUnit:=""
			Else 
				$size:=Num:C11(OBJECT Get value:C1743("bgndSizeVert"))
				$index:=oForm.verticalSizeUnits.index
				$newUnit:=oForm.verticalSizeUnits.css[$index]
				If ($size=0)
					// value can not be ""
					$index:=oForm.verticalSizeUnits.index
					$size:=Choose:C955($index; 0; 100; 10; 1; 0.25; 10; 10)  //;0; to skip "auto"
					OBJECT SET VALUE:C1742("bgndSizeVert"; $size)  // 100% 10mm 1cm 0.25in 10pt 10px
					
					oForm.verticalSizeUnits.memoUnit:=oForm.verticalSizeUnits.css[$index]
					
				Else 
					// convert from previous unit to new unit
					// convert from previous unit to new unit
					$oldUnit:=oForm.verticalSizeUnits.memoUnit
					
					If ($oldUnit#"") && ($oldUnit#"%") && ($newUnit#"") & ($newUnit#"%")
						$size:=WP_Convert($size; $oldUnit; $newUnit)
						OBJECT SET VALUE:C1742("bgndSizeVert"; $size)
					End if 
					oForm.verticalSizeUnits.memoUnit:=$newUnit
					
				End if 
			End if 
	End case 
	
	
	// once this is done, lets check the max sizes
	Case of 
		: ($changeWhat="bgndSizeHor") || ($changeWhat="horizontalSizeUnits")
			$changeWhat:="bgndSizeHor"
			$unitsRef:=oForm.horizontalSizeUnits
		: ($changeWhat="bgndSizeVert") || ($changeWhat="verticalSizeUnits")
			$changeWhat:="bgndSizeVert"
			$unitsRef:=oForm.verticalSizeUnits
	End case 
	
	$size:=OBJECT Get value:C1743($changeWhat)
	$newUnit:=$unitsRef.memoUnit
	Case of 
		: ($newUnit="") && ($size>0)  // should never happend
			$size:=0
		: ($newUnit="%") && ($size>1000)
			$size:=1000
			
		: ($newUnit="mm") && ($size>(10000/72*25.4))
			$size:=Int:C8(10000/72*25.4)
		: ($newUnit="cm") && ($size>(10000/72*2.54))
			$size:=Int:C8(10000/72*2.54)
		: ($newUnit="in") && ($size>(10000/72))
			$size:=Int:C8(10000/72)
		: ($newUnit="pt") && ($size>(10000))
			$size:=Int:C8(10000)
		: ($newUnit="px") && ($size>(10000))
			$size:=Int:C8(10000)
	End case 
	
	OBJECT SET VALUE:C1742($changeWhat; $size)
	
End if 
// </ACI0104082>