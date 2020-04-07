//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)

C_OBJECT:C1216($range)
C_TEXT:C284($context)

C_LONGINT:C283($i;$n)

$range:=$1
$context:=$2

C_REAL:C285($height;$minHeight)
C_REAL:C285($width;$minWidth)

ARRAY POINTER:C280($_ptr;0)
APPEND TO ARRAY:C911($_ptr;->$height)
APPEND TO ARRAY:C911($_ptr;->$width)
APPEND TO ARRAY:C911($_ptr;->$minHeight)
APPEND TO ARRAY:C911($_ptr;->$minWidth)

If (Not:C34(OB Is empty:C1297($range)))
	
	Case of 
		: ($context="picture")
			
			WP GET ATTRIBUTES:C1345($range;wk height:K81:46;$_ptr{1}->)
			WP GET ATTRIBUTES:C1345($range;wk width:K81:45;$_ptr{2}->)
			WP GET ATTRIBUTES:C1345($range;wk min height:K81:48;$_ptr{3}->)
			WP GET ATTRIBUTES:C1345($range;wk min width:K81:47;$_ptr{4}->)
			
		: ($context="paragraph")
			
			$_ptr{1}->:=0
			WP GET ATTRIBUTES:C1345($range;wk width:K81:45;$_ptr{2}->)
			WP GET ATTRIBUTES:C1345($range;wk min height:K81:48;$_ptr{3}->)
			WP GET ATTRIBUTES:C1345($range;wk min width:K81:47;$_ptr{4}->)
			
	End case 
	
	  // replaces wk mixed by zeros
	$n:=Size of array:C274($_ptr)
	For ($i;1;$n)
		If ($_ptr{$i}->=wk mixed:K81:89)
			$_ptr{$i}->:=0
		End if 
	End for 
	
	
	Case of 
			
		: ($context="picture")
			
			(OBJECT Get pointer:C1124(Object named:K67:5;"pictureHeight"))->:=$_ptr{1}->
			(OBJECT Get pointer:C1124(Object named:K67:5;"pictureWidth"))->:=$_ptr{2}->
			(OBJECT Get pointer:C1124(Object named:K67:5;"pictureMinHeight"))->:=$_ptr{3}->
			(OBJECT Get pointer:C1124(Object named:K67:5;"pictureMinWidth"))->:=$_ptr{4}->
			
		: ($context="paragraph")
			
			(OBJECT Get pointer:C1124(Object named:K67:5;"paragraphWidth"))->:=$_ptr{2}->
			(OBJECT Get pointer:C1124(Object named:K67:5;"paragraphMinHeight"))->:=$_ptr{3}->
			(OBJECT Get pointer:C1124(Object named:K67:5;"paragraphMinWidth"))->:=$_ptr{4}->
			
			
			Case of 
				: ($_ptr{2}->#0)  // width is SET
					
					(OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption1"))->:=1
					(OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption2"))->:=0
					
				: ($_ptr{4}->#0)  // min width is SET
					
					(OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption1"))->:=0
					(OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption2"))->:=1
					
				Else 
					
					(OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption1"))->:=1
					(OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption2"))->:=0
					
			End case 
			
			
	End case 
	
End if 
