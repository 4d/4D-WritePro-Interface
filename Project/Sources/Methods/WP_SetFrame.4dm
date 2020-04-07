//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_TEXT:C284($2)
C_TEXT:C284($target)

C_LONGINT:C283($borders)
C_LONGINT:C283($i;$n)

C_REAL:C285($value;$noneValue)

C_POINTER:C301($ptrArrayNames;$ptrArrayValues)

If (Count parameters:C259>=2)
	
	$range:=$1
	$target:=$2
	
	If (Not:C34(OB Is empty:C1297($range)))
		
		ARRAY POINTER:C280($_pCB;4)
		$_pCB{1}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB1")
		$_pCB{2}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB2")
		$_pCB{3}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB3")
		$_pCB{4}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB4")
		
		
		Case of 
				
			: ($target=wk border style:K81:29)
				
				
				ARRAY TEXT:C222($_target;4)
				$_target{1}:=wk border style left:K81:30
				$_target{2}:=wk border style top:K81:32
				$_target{3}:=wk border style right:K81:31
				$_target{4}:=wk border style bottom:K81:33
				
				$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"borderStyleNames")
				$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"borderStyleValues")
				If ($ptrArrayNames->=0)
					$ptrArrayNames->:=1
				End if 
				$value:=$ptrArrayValues->{$ptrArrayNames->}
				$noneValue:=wk none:K81:91
				
			: ($target=wk border width:K81:39)
				
				ARRAY TEXT:C222($_target;4)
				$_target{1}:=wk border width left:K81:40
				$_target{2}:=wk border width top:K81:42
				$_target{3}:=wk border width right:K81:41
				$_target{4}:=wk border width bottom:K81:43
				
				$value:=OBJECT Get pointer:C1124(Object named:K67:5;"borderWidthInput")->
				$noneValue:=wk none:K81:91
				
			: ($target=wk border color:K81:34)
				
				ARRAY TEXT:C222($_target;4)
				$_target{1}:=wk border color left:K81:35
				$_target{2}:=wk border color top:K81:37
				$_target{3}:=wk border color right:K81:36
				$_target{4}:=wk border color bottom:K81:38
				
				OBJECT GET RGB COLORS:C1074(*;"borderColor";$value;$value)
				$noneValue:=wk transparent:K81:134
				
			: ($target=wk border radius:K81:44)
				
				ARRAY TEXT:C222($_target;1)
				$_target{1}:=wk border radius:K81:44
				
				$value:=OBJECT Get pointer:C1124(Object named:K67:5;"borderRadiusinput")->
				$noneValue:=0
				
		End case 
		
		$n:=Size of array:C274($_target)
		$borders:=0
		
		For ($i;1;$n)
			Case of 
				: ($_pCB{$i}->=2)
					  // do nothing
				: ($_pCB{$i}->=0)
					WP SET ATTRIBUTES:C1342($range;$_target{$i};$noneValue)
				Else 
					$borders:=$borders+1
					WP SET ATTRIBUTES:C1342($range;$_target{$i};$value)
			End case 
		End for 
		
		If ($borders=4)
			  // radius is applyed if 4 borders are set
			WP_SetFrame ($range;wk border radius:K81:44)  // RECURSIVE CALL (one level)
		End if 
		
	End if 
	
Else 
	
	ALERT:C41("Missing parameters")
	
End if 
