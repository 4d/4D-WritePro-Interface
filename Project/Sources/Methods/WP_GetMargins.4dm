//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)

C_OBJECT:C1216($applyTo)

C_LONGINT:C283($i)
C_TEXT:C284($marginOrPadding)

C_REAL:C285($margin)


$applyTo:=$1
$marginOrPadding:=$2

If (Not:C34(OB Is empty:C1297($applyTo)))
	
	ARRAY POINTER:C280($_ptr; 6)
	ARRAY TEXT:C222($_attributes; 4)
	
	If ($marginOrPadding=wk margin:K81:10)
		
		$_ptr{1}:=OBJECT Get pointer:C1124(Object named:K67:5; "MarginLeft")
		$_ptr{2}:=OBJECT Get pointer:C1124(Object named:K67:5; "MarginTop")
		$_ptr{3}:=OBJECT Get pointer:C1124(Object named:K67:5; "MarginRight")
		$_ptr{4}:=OBJECT Get pointer:C1124(Object named:K67:5; "MarginBottom")
		
		$_ptr{5}:=OBJECT Get pointer:C1124(Object named:K67:5; "marginHorizontalRuler")
		$_ptr{6}:=OBJECT Get pointer:C1124(Object named:K67:5; "marginVerticalRuler")
		
		
		If ($applyTo.type#Null:C1517)  //ACI0100306
			$_attributes{1}:=wk margin left:K81:11
			$_attributes{2}:=wk margin top:K81:13
			$_attributes{3}:=wk margin right:K81:12
			$_attributes{4}:=wk margin bottom:K81:14
		Else   //ACI0100306
			$_attributes{1}:=wk page margin left:K81:266
			$_attributes{2}:=wk page margin top:K81:268
			$_attributes{3}:=wk page margin right:K81:267
			$_attributes{4}:=wk page margin bottom:K81:269
			
			$applyTo:=WP Get section:C1581(Form:C1466.selection)
			
		End if 
		
	Else   // wk padding
		
		$_ptr{1}:=OBJECT Get pointer:C1124(Object named:K67:5; "PaddingLeft")
		$_ptr{2}:=OBJECT Get pointer:C1124(Object named:K67:5; "PaddingTop")
		$_ptr{3}:=OBJECT Get pointer:C1124(Object named:K67:5; "PaddingRight")
		$_ptr{4}:=OBJECT Get pointer:C1124(Object named:K67:5; "PaddingBottom")
		
		$_ptr{5}:=OBJECT Get pointer:C1124(Object named:K67:5; "PaddingHorizontalRuler")
		$_ptr{6}:=OBJECT Get pointer:C1124(Object named:K67:5; "PaddingVerticalRuler")
		
		$_attributes{1}:=wk padding left:K81:16
		$_attributes{2}:=wk padding top:K81:18
		$_attributes{3}:=wk padding right:K81:17
		$_attributes{4}:=wk padding bottom:K81:19
		
		If ($applyTo.type=Null:C1517)  //ACI0100306
			$applyTo:=WP Get section:C1581(Form:C1466.selection)
		End if 
		
	End if 
	
	//1°) get the margins/paddings in user units
	
	For ($i; 1; 4)
		
		WP GET ATTRIBUTES:C1345($applyTo; $_attributes{$i}; $margin)
		
		If ($margin#wk mixed:K81:89)
			$_ptr{$i}->:=$margin
		Else 
			$_ptr{$i}->:=0
		End if 
	End for 
	
	
	// translate into pt for horizontal ruler
	
	If ($_ptr{1}->#0) & ($_ptr{3}->#0)
		$_ptr{5}->:=WP_Convert((($_ptr{1}->)+($_ptr{3}->))/2; userUnit; wk unit pt:K81:136)  // top & bottom
	Else 
		$_ptr{5}->:=0
	End if 
	
	// translate into pt for vertical ruler 
	
	If (($_ptr{2}->#0) & ($_ptr{4}->#0))
		$_ptr{6}->:=WP_Convert((($_ptr{2}->)+($_ptr{4}->))/2; userUnit; wk unit pt:K81:136)  // sides
	Else 
		$_ptr{6}->:=0
	End if 
	
End if 


