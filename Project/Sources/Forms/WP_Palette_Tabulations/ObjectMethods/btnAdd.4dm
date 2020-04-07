
C_REAL:C285($newTabPosition)
C_REAL:C285($tabValue)

C_LONGINT:C283($n)


  //$ptrOffsets:=OBJECT Get pointer(Object named;"lb_offsets")
  //$ptrTypes:=OBJECT Get pointer(Object named;"lb_types")

C_OBJECT:C1216($newTab)
$newTab:=New object:C1471

  // offset
$tabValue:=(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->  // default value
$n:=_tabs.length
If ($n=0)  // new
	$newTab.offsetNum:=$tabValue
Else   // same as previous
	$newTab.offsetNum:=_tabs[$n-1].offsetNum+$tabValue
End if 

  // type
Case of 
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType0"))->=1)
		$newTab.type:=wk left:K81:95
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType1"))->=1)
		$newTab.type:=wk right:K81:96
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType2"))->=1)
		$newTab.type:=wk center:K81:99
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType3"))->=1)
		$newTab.type:=wk decimal:K81:126
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"bTabType4"))->=1)
		$newTab.type:=wk bar:K81:127
End case 

  // leading char
$newTab.leading:=(OBJECT Get pointer:C1124(Object named:K67:5;"tabDefaultLeading"))->


If ($newTabPosition<=maxTabValue)
	
	
	_tabs.push($newTab)
	
	tabsSelectedRow:=_tabs.length
	  //LISTBOX SELECT ROW(*;"LB_tabs";tabsSelectedRow)
	
	
	  //APPEND TO ARRAY($ptrOffsets->;$newTabPosition)
	  //APPEND TO ARRAY($ptrTypes->;$newType)
	
	  //UI_PaletteTabulations 
	WP_SetTabInfos 
	
	_tabs:=_tabs  // redarw LB
Else 
	BEEP:C151
End if 
