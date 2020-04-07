//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_POINTER:C301($ptrVal;$ptrUnit)
C_TEXT:C284($size)
C_TEXT:C284($sizeVal)
C_TEXT:C284($sizeUnit)
C_TEXT:C284($Char)

C_LONGINT:C283($type;$i;$n;$p)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	For ($type;1;2)
		
		$sizeVal:=""
		$sizeUnit:=""
		
		If ($type=1)
			WP GET ATTRIBUTES:C1345($range;wk background width:K81:27;$size)
			$ptrVal:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeHor")
			$ptrUnit:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeHorUnit")
		Else 
			WP GET ATTRIBUTES:C1345($range;wk background height:K81:28;$size)
			$ptrVal:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeVert")
			$ptrUnit:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndSizeVertUnit")
		End if 
		
		
		If ($size="auto")
			$sizeVal:=""
			$sizeUnit:="auto"
		Else 
			$n:=Length:C16($size)
			For ($i;1;$n)
				$char:=$size[[$i]]
				If ((($char>="0") & ($char<="9")) | (($char=".") | ($char=",")))
					$sizeVal:=$sizeVal+$char
				Else 
					$sizeUnit:=Substring:C12($size;$i)
					$i:=$n
				End if 
			End for 
		End if 
		
		$ptrVal->:=$sizeVal
		
		$p:=Find in array:C230($ptrUnit->;$sizeUnit)
		If ($p>0)
			$ptrUnit->:=$p
		Else 
			$ptrUnit->:=0
		End if 
		
	End for 
	
End if 




