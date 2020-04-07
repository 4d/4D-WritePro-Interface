//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_LONGINT:C283($borderWidth;$borderColor;$borderStyle;$borderRadius)
C_LONGINT:C283($i;$p)
C_LONGINT:C283($memoStyle)
C_LONGINT:C283($frameColor)
C_BOOLEAN:C305($borderWidthMix;$borderColorMix;$borderStyleMix)

C_POINTER:C301($ptrArrayNames;$ptrArrayValues)

$range:=$1

$frameColor:=0x00404040
$borderStyle:=0

If (Not:C34(OB Is empty:C1297($range)))
	
	
	ARRAY POINTER:C280($_pCB;4)
	$_pCB{1}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB1")
	$_pCB{2}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB2")
	$_pCB{3}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB3")
	$_pCB{4}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB4")
	
	ARRAY TEXT:C222($_target;4;3)
	
	$_target{1}{1}:=wk border style left:K81:30
	$_target{1}{2}:=wk border width left:K81:40
	$_target{1}{3}:=wk border color left:K81:35
	
	$_target{2}{1}:=wk border style top:K81:32
	$_target{2}{2}:=wk border width top:K81:42
	$_target{2}{3}:=wk border color top:K81:37
	
	$_target{3}{1}:=wk border style right:K81:31
	$_target{3}{2}:=wk border width right:K81:41
	$_target{3}{3}:=wk border color right:K81:36
	
	$_target{4}{1}:=wk border style bottom:K81:33
	$_target{4}{2}:=wk border width bottom:K81:43
	$_target{4}{3}:=wk border color bottom:K81:38
	
	
	$borderWidth:=1
	$borderWidthMix:=False:C215
	$borderColor:=0
	$borderColorMix:=False:C215
	
	$borderStyle:=0
	$borderStyleMix:=False:C215
	
	$memoStyle:=wk none:K81:91
	
	
	For ($i;1;4)
		
		WP GET ATTRIBUTES:C1345($range;$_target{$i}{1};$borderStyle)
		Case of 
			: ($borderStyle=wk mixed:K81:89)
				$borderStyleMix:=True:C214
				$_pCB{$i}->:=2
			: ($borderStyle=wk none:K81:91)
				$_pCB{$i}->:=0
				
			Else 
				$_pCB{$i}->:=1
				WP GET ATTRIBUTES:C1345($range;$_target{$i}{2};$borderWidth)  //(always in pt)
				WP GET ATTRIBUTES:C1345($range;$_target{$i}{3};$borderColor)
				$memoStyle:=$borderStyle
				If ($borderWidth=wk mixed:K81:89)
					$borderWidthMix:=True:C214
				End if 
				If ($borderColor=wk mixed:K81:89)
					$borderColorMix:=True:C214
				End if 
				
		End case 
		
	End for 
	
	If ($borderStyleMix)
		(OBJECT Get pointer:C1124(Object named:K67:5;"borderStyleNames"))->:=0
	End if 
	
	If ($borderColorMix)
		OBJECT SET VISIBLE:C603(*;"MultiFrameColor";True:C214)
		OBJECT SET RGB COLORS:C628(*;"borderColor";$frameColor;0x00FFFFFF)
	Else 
		OBJECT SET VISIBLE:C603(*;"MultiFrameColor";False:C215)
		OBJECT SET RGB COLORS:C628(*;"borderColor";$frameColor;$borderColor)
	End if 
	
	  // get the radius (always in pt)
	WP GET ATTRIBUTES:C1345($range;wk border radius:K81:44;$borderRadius)  //(always in pt)
	
	If ($borderRadius=wk mixed:K81:89)
		$borderRadius:=0
	End if 
	(OBJECT Get pointer:C1124(Object named:K67:5;"borderRadiusRuler"))->:=$borderRadius
	(OBJECT Get pointer:C1124(Object named:K67:5;"borderRadiusInput"))->:=$borderRadius
	
	$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"borderStyleNames")
	$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"borderStyleValues")
	
	$p:=Find in array:C230($ptrArrayValues->;$memoStyle)
	If ($p>0)
		$ptrArrayNames->:=$p
	End if 
	
	If ($borderWidthMix=True:C214)
		(OBJECT Get pointer:C1124(Object named:K67:5;"borderWidthRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5;"borderWidthInput"))->:=0
	Else 
		(OBJECT Get pointer:C1124(Object named:K67:5;"borderWidthRuler"))->:=$borderWidth
		(OBJECT Get pointer:C1124(Object named:K67:5;"borderWidthInput"))->:=$borderWidth
	End if 
	
End if 
