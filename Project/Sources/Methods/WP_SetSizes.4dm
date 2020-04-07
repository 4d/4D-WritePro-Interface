//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)

C_OBJECT:C1216($range)
C_TEXT:C284($type)

$range:=$1
$type:=$2

ARRAY REAL:C219($_value;4)

If (Not:C34(OB Is empty:C1297($range)))
	
	Case of 
			
		: ($type="picture")
			
			$_value{1}:=(OBJECT Get pointer:C1124(Object named:K67:5;"pictureHeight"))->
			$_value{2}:=(OBJECT Get pointer:C1124(Object named:K67:5;"pictureWidth"))->
			$_value{3}:=(OBJECT Get pointer:C1124(Object named:K67:5;"pictureMinHeight"))->
			$_value{4}:=(OBJECT Get pointer:C1124(Object named:K67:5;"pictureMinWidth"))->
			
		: ($type="paragraph")
			
			$_value{2}:=(OBJECT Get pointer:C1124(Object named:K67:5;"paragraphWidth"))->
			$_value{3}:=(OBJECT Get pointer:C1124(Object named:K67:5;"paragraphMinHeight"))->
			$_value{4}:=(OBJECT Get pointer:C1124(Object named:K67:5;"paragraphMinWidth"))->
			
	End case 
	
	Case of 
		: ($type="picture")
			
			WP SET ATTRIBUTES:C1342($range;wk height:K81:46;$_value{1})
			WP SET ATTRIBUTES:C1342($range;wk width:K81:45;$_value{2})
			WP SET ATTRIBUTES:C1342($range;wk min height:K81:48;$_value{3})
			WP SET ATTRIBUTES:C1342($range;wk min width:K81:47;$_value{4})
			
		: ($type="paragraph")
			
			If ((OBJECT Get pointer:C1124(Object named:K67:5;"rbWidthOption1"))->=1)  //set width by default
				
				$_value{4}:=0
				
				WP SET ATTRIBUTES:C1342($range;wk width:K81:45;$_value{2})
				WP SET ATTRIBUTES:C1342($range;wk min height:K81:48;$_value{3})
				WP SET ATTRIBUTES:C1342($range;wk min width:K81:47;$_value{4})
				
			Else   // min width has been set, so width MUST be set to 0
				
				$_value{2}:=0
				
				WP SET ATTRIBUTES:C1342($range;wk width:K81:45;$_value{2})
				WP SET ATTRIBUTES:C1342($range;wk min height:K81:48;$_value{3})
				WP SET ATTRIBUTES:C1342($range;wk min width:K81:47;$_value{4})
				
			End if 
			
	End case 
	
End if 
