//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_TEXT:C284($size)
C_TEXT:C284($sizeVal)
C_TEXT:C284($sizeUnit)
C_TEXT:C284($target)

C_LONGINT:C283($type)

C_POINTER:C301($ptrVal;$ptrUnit)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	For ($type;1;2)
		
		If ($type=1)
			$target:=wk background width:K81:27
			$ptrVal:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeHor")
			$ptrUnit:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeHorUnit")
		Else 
			$target:=wk background height:K81:28
			$ptrVal:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeVert")
			$ptrUnit:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeVertUnit")
		End if 
		
		$sizeVal:=$ptrVal->
		$sizeUnit:=$ptrUnit->{$ptrUnit->}
		
		If ($sizeUnit="auto")
			$sizeVal:=""
			  //$ptrVal->:=""
		Else 
			$sizeVal:=$ptrVal->
			If ($sizeVal="")
				$sizeVal:="10"
				$ptrVal->:=$sizeVal
			End if 
		End if 
		
		$size:=$sizeVal+$sizeUnit
		
		WP SET ATTRIBUTES:C1342($range;$target;$size)
		
	End for 
	
End if 




