//%attributes = {"invisible":true}
  //ACI0098389  2018/07/10

C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_REAL:C285($textLineHeight)
C_TEXT:C284($textLineHeight_t)
C_POINTER:C301($ptrLineHeightUnit)
C_LONGINT:C283($p)

$range:=$1
If (Not:C34(OB Is empty:C1297($range)))
	
	
	If (True:C214)  //ACI0098389  2018/07/10
		
		$ptrLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5;"lineHeightUnit")
		
		WP GET ATTRIBUTES:C1345($range;wk line height:K81:51;$textLineHeight_t)  // get the line height as TEXT
		
		$p:=Position:C15("pt";$textLineHeight_t)  // expressed in "pt" ?
		If ($p>0)
			$textLineHeight:=Num:C11(Substring:C12($textLineHeight_t;1;$p-1))
			$ptrLineHeightUnit->:=2
		Else 
			$p:=Position:C15("%";$textLineHeight_t)  // expressed in "%" ?
			If ($p>0)
				$textLineHeight:=Num:C11(Substring:C12($textLineHeight_t;1;$p-1))
				$ptrLineHeightUnit->:=1
			Else 
				$ptrLineHeightUnit->:=1
				$textLineHeight:=100
			End if 
		End if 
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"lineHeightRuler"))->:=$textLineHeight
		(OBJECT Get pointer:C1124(Object named:K67:5;"lineHeightInput"))->:=$textLineHeight
		
	Else   // previous way to calculate
		
		
		  // // read current unit
		  //WP GET ATTRIBUTES($range;wk layout unit;$unit)
		
		  //If ($unit#wk unit percent)
		  //  // changes unit temporarly to "percent"
		  //WP SET ATTRIBUTES($range;wk layout unit;wk unit percent)
		  //  // get the indent in percent
		  //WP GET ATTRIBUTES($range;wk line height;$textLineHeight)  // result in "%"
		  //  // sets the unit back to current
		  //WP SET ATTRIBUTES($range;wk layout unit;$unit)
		
		  //Else 
		  //WP GET ATTRIBUTES($range;wk line height;$textLineHeight)  // result in "%"
		  //End if 
		
		  //If ($textLineHeight#wk mixed)
		  //(OBJECT Get pointer(Object named;"lineHeightRuler"))->:=$textLineHeight
		  //(OBJECT Get pointer(Object named;"lineHeightInput"))->:=$textLineHeight
		  //Else 
		  //(OBJECT Get pointer(Object named;"lineHeightRuler"))->:=100
		  //(OBJECT Get pointer(Object named;"lineHeightInput"))->:=100
		  //End if 
		
	End if 
	
End if 
