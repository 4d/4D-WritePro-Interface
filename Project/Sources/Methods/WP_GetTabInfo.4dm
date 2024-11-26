//%attributes = {"invisible":true}
#DECLARE($range : Object)

var $tabType; $n; $m : Integer
var $ptrOffsets; $ptrTypes : Pointer
var $tabValue : Real
var $unit : Text
var $tab : Object

If (Not:C34(OB Is empty:C1297($range)))
	
	WP Get attributes:C1345($range; wk layout unit:K81:78; $unit)
	
	// NEW CODE, USED WITH COLLECTION
	
	WP Get attributes:C1345($range; wk tabs:K81:278; _tabs)
	For each ($tab; _tabs)
		$tab.offsetNum:=Num:C11($tab.offset; ".")
	End for each 
	
	// default values
	(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType0"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType1"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType2"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType3"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType4"))->:=0
	
	WP Get attributes:C1345($range; wk tab default:K81:279; tabDefault)
	
	If (tabDefault#Null:C1517)
		// offset
		$tabValue:=Num:C11(tabDefault.offset; ".")
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabIndentInput"))->:=$tabValue
		$tabValue:=WP_Convert($tabValue; userUnit; wk unit pt:K81:136)
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabIndentRuler"))->:=$tabValue
		
		// type
		(OBJECT Get pointer:C1124(Object named:K67:5; "bTabType"+String:C10(tabDefault.type)))->:=1
		
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
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabDefaultLeading"))->:=tabDefault.leading
		
	Else 
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabIndentInput"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabIndentRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "tabDefaultLeading"))->:=""
		
	End if 
	
End if 