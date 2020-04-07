//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)

C_OBJECT:C1216($range)

C_LONGINT:C283($i)
C_TEXT:C284($target)

C_REAL:C285($margin)


$range:=$1
$target:=$2

If (Not:C34(OB Is empty:C1297($range)))
	
	ARRAY POINTER:C280($_ptr;6)
	ARRAY TEXT:C222($_target;4)
	
	If ($target=wk margin:K81:10)
		
		$_ptr{1}:=OBJECT Get pointer:C1124(Object named:K67:5;"MarginLeft")
		$_ptr{2}:=OBJECT Get pointer:C1124(Object named:K67:5;"MarginTop")
		$_ptr{3}:=OBJECT Get pointer:C1124(Object named:K67:5;"MarginRight")
		$_ptr{4}:=OBJECT Get pointer:C1124(Object named:K67:5;"MarginBottom")
		
		$_ptr{5}:=OBJECT Get pointer:C1124(Object named:K67:5;"marginHorizontalRuler")
		$_ptr{6}:=OBJECT Get pointer:C1124(Object named:K67:5;"marginVerticalRuler")
		
		
		$_target{1}:=wk margin left:K81:11
		$_target{2}:=wk margin top:K81:13
		$_target{3}:=wk margin right:K81:12
		$_target{4}:=wk margin bottom:K81:14
		
	Else 
		
		$_ptr{1}:=OBJECT Get pointer:C1124(Object named:K67:5;"PaddingLeft")
		$_ptr{2}:=OBJECT Get pointer:C1124(Object named:K67:5;"PaddingTop")
		$_ptr{3}:=OBJECT Get pointer:C1124(Object named:K67:5;"PaddingRight")
		$_ptr{4}:=OBJECT Get pointer:C1124(Object named:K67:5;"PaddingBottom")
		
		$_ptr{5}:=OBJECT Get pointer:C1124(Object named:K67:5;"PaddingHorizontalRuler")
		$_ptr{6}:=OBJECT Get pointer:C1124(Object named:K67:5;"PaddingVerticalRuler")
		
		$_target{1}:=wk padding left:K81:16
		$_target{2}:=wk padding top:K81:18
		$_target{3}:=wk padding right:K81:17
		$_target{4}:=wk padding bottom:K81:19
		
	End if 
	
	  //1°) get the margins/paddings in user units
	
	For ($i;1;4)
		
		WP GET ATTRIBUTES:C1345($range;$_target{$i};$margin)
		
		If ($margin#wk mixed:K81:89)
			$_ptr{$i}->:=$margin
		Else 
			$_ptr{$i}->:=0
		End if 
	End for 
	
	  // translate into pt for horizontal ruler
	
	If ($_ptr{1}->#0) & ($_ptr{3}->#0)
		$_ptr{5}->:=WP_Convert ((($_ptr{1}->)+($_ptr{3}->))/2;userUnit;wk unit pt:K81:136)  // top & bottom
	Else 
		$_ptr{5}->:=0
	End if 
	
	  // translate into pt for vertical ruler 
	
	If (($_ptr{2}->#0) & ($_ptr{4}->#0))
		$_ptr{6}->:=WP_Convert ((($_ptr{2}->)+($_ptr{4}->))/2;userUnit;wk unit pt:K81:136)  // sides
	Else 
		$_ptr{6}->:=0
	End if 
	
End if 


