//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_LONGINT:C283($tabType)
C_LONGINT:C283($n;$m)

C_POINTER:C301($ptrOffsets;$ptrTypes)

C_REAL:C285($tabValue)
C_TEXT:C284($unit)

C_OBJECT:C1216($tab)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	WP GET ATTRIBUTES:C1345($range;wk layout unit:K81:78;$unit)
	
	
	  // NEW CODE, USED WITH COLLECTION
	
	WP GET ATTRIBUTES:C1345($range;wk tabs:K81:278;_tabs)
	For each ($tab;_tabs)
		$tab.offsetNum:=Num:C11($tab.offset;".")
	End for each 
	
	  // default values
	(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType0"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType1"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType2"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType3"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType4"))->:=0
	
	WP GET ATTRIBUTES:C1345($range;wk tab default:K81:279;tabDefault)
	
	If (tabDefault#Null:C1517)
		  // offset
		$tabValue:=Num:C11(tabDefault.offset;".")
		(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->:=$tabValue
		$tabValue:=WP_Convert ($tabValue;userUnit;wk unit pt:K81:136)
		(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentRuler"))->:=$tabValue
		
		  // type
		(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType"+String:C10(tabDefault.type)))->:=1
		
		  //Case of 
		  //: (tabDefault.type=wk left)
		  //(OBJECT Get pointer(Object named;"bTabType0"))->:=1
		  //: (tabDefault.type=wk right)
		  //(OBJECT Get pointer(Object named;"bTabType1"))->:=1
		  //: (tabDefault.type=wk center)
		  //(OBJECT Get pointer(Object named;"bTabType2"))->:=1
		  //: (tabDefault.type=wk decimal)
		  //(OBJECT Get pointer(Object named;"bTabType3"))->:=1
		  //: (tabDefault.type=wk bar)
		  //(OBJECT Get pointer(Object named;"bTabType4"))->:=1
		  //End case 
		
		  // leading char
		(OBJECT Get pointer:C1124(Object named:K67:5;"tabDefaultLeading"))->:=tabDefault.leading
		
	Else 
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5;"tabDefaultLeading"))->:=""
		
	End if 
	
	
	  // OLD CODE, USED WITH ARRAYS
	If (False:C215)
		  // arrays
		$ptrOffsets:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_offsets")
		$ptrTypes:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_types")
		
		ARRAY REAL:C219($ptrOffsets->;0)
		WP GET ATTRIBUTES:C1345($range;wk tab stop offsets:K81:53;$ptrOffsets->)
		
		ARRAY LONGINT:C221($ptrTypes->;0)
		WP GET ATTRIBUTES:C1345($range;wk tab stop types:K81:54;$ptrTypes->)
		
		  // interface 
		
		$n:=Size of array:C274($ptrOffsets->)
		$m:=Size of array:C274($ptrTypes->)
		
		If ($n=0) | ($m=0)
			
			ARRAY REAL:C219($ptrOffsets->;0)
			ARRAY LONGINT:C221($ptrTypes->;0)
			
			(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentRuler"))->:=0
			(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->:=0
			
		Else 
			
			  // not the same size ? keep the smaller
			Case of 
				: ($n>$m)
					$n:=$m
					ARRAY REAL:C219($ptrOffsets->;$n)  // resize with smaller
					ARRAY LONGINT:C221($ptrTypes->;$n)  // resize with smaller
					
				: ($m>$n)
					ARRAY REAL:C219($ptrOffsets->;$n)  // resize with smaller
					ARRAY LONGINT:C221($ptrTypes->;$n)  // resize with smaller
			End case 
			
			$tabValue:=$ptrOffsets->{$n}
			$tabType:=$ptrTypes->{$n}
			
			DELETE FROM ARRAY:C228($ptrOffsets->;$n;1)  // remove the default value from the array
			DELETE FROM ARRAY:C228($ptrTypes->;$n;1)  // remove the default value from the array
			
			  // set the default value in the upper part of the interface
			
			(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->:=$tabValue
			$tabValue:=WP_Convert ($tabValue;userUnit;wk unit pt:K81:136)
			(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentRuler"))->:=$tabValue
			
			  // set the default type in the upper part of the interface
			
			(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType0"))->:=0
			(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType1"))->:=0
			(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType2"))->:=0
			(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType3"))->:=0
			(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType4"))->:=0
			Case of 
				: ($tabType=wk left:K81:95)
					(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType0"))->:=1
				: ($tabType=wk right:K81:96)
					(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType1"))->:=1
				: ($tabType=wk center:K81:99)
					(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType2"))->:=1
				: ($tabType=wk decimal:K81:126)
					(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType3"))->:=1
				: ($tabType=wk bar:K81:127)
					(OBJECT Get pointer:C1124(Object named:K67:5;"bTabType4"))->:=1
			End case 
			
			  //End if 
			
		End if 
		
	End if 
	
	
End if 