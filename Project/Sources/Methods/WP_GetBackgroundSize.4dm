//%attributes = {"invisible":true}
#DECLARE($range : Object)

var $refValue; $size; $sizeVal; $sizeUnit; $Char : Text
var $refUnit : Object
var $type; $i; $n : Integer

If (Not:C34(OB Is empty:C1297($range)))
	
	For ($type; 1; 2)
		
		$sizeVal:=""
		$sizeUnit:=""
		
		If ($type=1)
			WP GET ATTRIBUTES:C1345($range; wk background width:K81:27; $size)
			$refValue:="bgndSizeHor"  //Form.horizontalSizeValue
			$refUnit:=oForm.horizontalSizeUnits
		Else 
			WP GET ATTRIBUTES:C1345($range; wk background height:K81:28; $size)
			$refValue:="bgndSizeVert"  //Form.verticalSizeValue
			$refUnit:=oForm.verticalSizeUnits
		End if 
		
		// <ACI0104082>
		
		If ($size="auto") | ($size="cover") | ($size="contain")
			
			OBJECT SET VALUE:C1742($refValue; 0)
			$refUnit.index:=$refUnit.css.indexOf($size)
			$refUnit.memoUnit:=""
			
		Else   // ex 50%, 10mm, 2.5cm, 5in or 120pt
			
			$n:=Length:C16($size)
			For ($i; 1; $n)
				$char:=$size[[$i]]
				If (($char>="0") & ($char<="9")) | ($char=".")
					$sizeVal:=$sizeVal+$char
				Else 
					$sizeUnit:=Substring:C12($size; $i)
					$i:=$n
				End if 
			End for 
			
			OBJECT SET VALUE:C1742($refValue; Num:C11($sizeVal; "."))
			$refUnit.index:=$refUnit.css.indexOf($sizeUnit)
			$refUnit.memoUnit:=$refUnit.css[$refUnit.index]  // "%","mm","cm","in" or "pt"
			
		End if 
		// </ACI0104082>
		
	End for 
	
End if 
