//%attributes = {"invisible":true}
C_LONGINT:C283($offset)

C_OBJECT:C1216($oParagraphs)
C_OBJECT:C1216(tabDefault)
C_OBJECT:C1216($tab)

C_TEXT:C284($unit)

$oParagraphs:=Form:C1466.paragraphRange

If (Not:C34(OB Is empty:C1297($oParagraphs)))
	
	  // NEW CODE WITH COLLECTION
	WP GET ATTRIBUTES:C1345($oParagraphs;wk layout unit:K81:78;$unit)
	For each ($tab;_tabs)
		$tab.offset:=String:C10($tab.offsetNum;"&xml")+$unit  // 
	End for each 
	
	WP SET ATTRIBUTES:C1342($oParagraphs;wk tabs:K81:278;_tabs)
	
	
	  // default values
	
	tabDefault:=New object:C1471
	
	$offset:=(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->
	If ($offset>0)
		tabDefault.offset:=(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->
	End if 
	
	Case of 
		: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType0"))->=1)
			tabDefault.type:=wk left:K81:95
		: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType1"))->=1)
			tabDefault.type:=wk right:K81:96
		: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType2"))->=1)
			tabDefault.type:=wk center:K81:99
		: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType3"))->=1)
			tabDefault.type:=wk decimal:K81:126
		: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType4"))->=1)
			tabDefault.type:=wk bar:K81:127
	End case 
	
	
	tabDefault.leading:=(OBJECT Get pointer:C1124(Object named:K67:5;"tabDefaultLeading"))->
	
	WP SET ATTRIBUTES:C1342($oParagraphs;wk tab default:K81:279;tabDefault)
	
	
	
	  //If (False)  // OLD CODE WITH ARRAYS
	  //$ptrOffsets:=OBJECT Get pointer(Object named;"lb_offsets")
	  //$ptrTypes:=OBJECT Get pointer(Object named;"lb_types")
	
	  //$tabValue:=(OBJECT Get pointer(Object named;"tabIndentInput"))->
	
	  //Case of 
	  //: ((OBJECT Get pointer(Object named;"bTabType0"))->=1)
	  //$tabType:=wk left
	  //: ((OBJECT Get pointer(Object named;"bTabType1"))->=1)
	  //$tabType:=wk right
	  //: ((OBJECT Get pointer(Object named;"bTabType2"))->=1)
	  //$tabType:=wk center
	  //: ((OBJECT Get pointer(Object named;"bTabType3"))->=1)
	  //$tabType:=wk decimal
	  //: ((OBJECT Get pointer(Object named;"bTabType4"))->=1)
	  //$tabType:=wk bar
	  //End case 
	
	  //  // temporary add default values at the top of the array
	  //APPEND TO ARRAY($ptrOffsets->;$tabValue)
	  //APPEND TO ARRAY($ptrTypes->;$tabType)
	
	  //WP SET ATTRIBUTES($oParagraphs;wk tab stop offsets;$ptrOffsets->)
	  //WP SET ATTRIBUTES($oParagraphs;wk tab stop types;$ptrTypes->)
	
	  //  // remove default values
	  //$n:=Size of array($ptrOffsets->)
	  //DELETE FROM ARRAY($ptrOffsets->;$n;1)  // remove the default value from the array
	  //DELETE FROM ARRAY($ptrTypes->;$n;1)  // remove the default value from the array
	
	  //End if 
	
End if 
