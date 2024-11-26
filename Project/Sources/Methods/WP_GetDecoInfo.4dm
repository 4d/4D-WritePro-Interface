//%attributes = {"invisible":true}
//WP_GetDecoInfo
#DECLARE($range : Object)

var $ptr : Pointer
var $color; $frameColor; $linethrough; $underline; $p : Integer

$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "cbLinethrough")
	WP Get attributes:C1345($range; wk text linethrough style:K81:75; $linethrough)
	Case of 
		: ($linethrough=wk mixed:K81:89)
			$ptr->:=2
		: ($linethrough=wk none:K81:91)
			$ptr->:=0
		Else 
			$ptr->:=1
	End case 
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "cbUnderline")
	WP Get attributes:C1345($range; wk text underline style:K81:73; $underline)
	Case of 
		: ($underline=wk mixed:K81:89)
			$ptr->:=2
		: ($underline=wk none:K81:91)
			$ptr->:=0
		Else 
			$ptr->:=1
			
			//re-use of the pointer
			$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "underlineStylesValues")
			$p:=Find in array:C230($ptr->; $underline)
			If ($p>0)
				$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "underlineStylesNames")
				$ptr->:=$p
			End if 
			
	End case 
	
	
	WP Get attributes:C1345($range; wk text underline color:K81:74; $color)
	If ($color=wk mixed:K81:89)
		OBJECT SET VISIBLE:C603(*; "MultiLineColor"; True:C214)
		OBJECT SET RGB COLORS:C628(*; "UnderlineColor"; $frameColor; 0)
	Else 
		OBJECT SET VISIBLE:C603(*; "MultiLineColor"; False:C215)
		If ($color>0)
			OBJECT SET RGB COLORS:C628(*; "UnderlineColor"; $frameColor; $color)
		End if 
	End if 
	
End if 

