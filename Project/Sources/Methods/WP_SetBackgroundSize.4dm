//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)
C_OBJECT:C1216($range)

C_TEXT:C284($size)
C_TEXT:C284($sizeVal)
C_TEXT:C284($sizeUnit)
C_TEXT:C284($target)
C_TEXT:C284($changeWhat)

C_LONGINT:C283($type)

C_POINTER:C301($ptrVal; $ptrUnit; $ptrCSS)

$range:=$1
$changeWhat:=$2

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrCSS:=OBJECT Get pointer:C1124(Object named:K67:5; "CSSUnits")
	
	If (False:C215)
		//For ($type; 1; 2)
		
		// 2023/07/19 RL
		
		
		For ($type; 2; 1; -1)  // set HEIGHT before WIDTH
			
			If ($type=1)
				$target:=wk background width:K81:27
				$ptrVal:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeHor")
				$ptrUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeHorUnit")
			Else 
				$target:=wk background height:K81:28
				$ptrVal:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeVert")
				$ptrUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeVertUnit")
			End if 
			
			$sizeVal:=$ptrVal->
			$sizeUnit:=$ptrCSS->{$ptrUnit->}
			
			Case of   //2023/07/19 RL
				: ($sizeUnit="Auto")
					WP SET ATTRIBUTES:C1342($range; $target; wk auto:K81:105)
				: ($sizeUnit="Cover")
					WP SET ATTRIBUTES:C1342($range; $target; wk cover:K81:114)
				: ($sizeUnit="Contain")
					WP SET ATTRIBUTES:C1342($range; $target; wk contain:K81:113)
				Else 
					$sizeVal:=$ptrVal->
					If ($sizeVal="")
						$sizeVal:="10"
						$ptrVal->:=$sizeVal
					End if 
					$size:=$sizeVal+$sizeUnit
					WP SET ATTRIBUTES:C1342($range; $target; $size)
			End case 
			
		End for 
		
		
	Else   //2023/07/19 RL
		
		var $value1; $value2; $unit1; $unit2 : Text
		var $ptr1; $ptr2 : Pointer
		var $variant1; $variant2 : Variant
		
		$value1:=String:C10((OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeHor"))->)
		$ptr1:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeHorUnit")
		$unit1:=$ptrCSS->{$ptr1->}
		
		
		$value2:=String:C10((OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeVert"))->)
		$ptr2:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeVertUnit")
		$unit2:=$ptrCSS->{$ptr2->}
		
		Case of 
			: ($changeWhat="valueH")
				// unit can't be auto, cover nor contain
				
			: ($changeWhat="valueV")
				// unit can't be auto, cover nor contain
				
				
				
			: ($changeWhat="unitH")
				//if unit = auto, cover or contain, then value = ""
				
			: ($changeWhat="unitV")
				//if unit = auto, cover or contain, then value = ""
				
		End case 
		
		
		
		
		
		
		Case of 
			: ($unit1="Auto")
				$variant1:=wk auto:K81:105
			: ($unit1="Cover")
				$variant1:=wk cover:K81:114
			: ($unit1="Contain")
				$variant1:=wk contain:K81:113
			Else 
				If ($value1="")
					$value1:="10"
					//$ptr1->:=10
				End if 
				$variant1:=$value1+$unit1
		End case 
		
		Case of 
			: ($unit2="Auto")
				$variant2:=wk auto:K81:105
			: ($unit2="Cover")
				$variant2:=wk cover:K81:114
			: ($unit2="Contain")
				$variant2:=wk contain:K81:113
			Else 
				If ($value2="")
					$value2:="10"
					//$ptr2->:=10
				End if 
				$variant2:=$value2+$unit2
		End case 
		
		
		WP SET ATTRIBUTES:C1342($range; wk background width:K81:27; $variant1; wk background height:K81:28; $variant2)
		
	End if 
	
End if 




