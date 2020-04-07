  //C_POINTER($ptrTabs)
  //C_LONGINT($n;$p;$p1)

  //$ptrTabs:=OBJECT Get pointer(Object named;"LB_Tabs")

  //$p1:=Find in array($ptrTabs->;True)  // remember the first selected
  //If ($p1>0)
  //LISTBOX DELETE ROWS($ptrTabs->;$p1;1)
  //Repeat 
  //$p:=Find in array($ptrTabs->;True)
  //If ($p>0)
  //LISTBOX DELETE ROWS($ptrTabs->;$p;1)
  //End if 
  //Until ($p<=0)
  //End if 

  //$n:=Size of array($ptrTabs->)
  //If (($p1>0) & ($p1<=$n))
  //$ptrTabs->{$p1}:=True
  //Else 
  //If ($n>0)
  //$ptrTabs->{$n}:=True
  //End if 
  //End if 

If (tabsSelectedRow>0)
	_tabs.remove(tabsSelectedRow-1;1)
	
	Case of 
		: (tabsSelectedRow<=_tabs.length)
			  //LISTBOX SELECT ROW(*;"LB_tabs";tabCurPos)  // was 10, stays 10
			
		: (_tabs.length>0)
			
			  //tabsSelectedRow:=0
			tabsSelectedRow:=_tabs.length
			LISTBOX SELECT ROW:C912(*;"LB_tabs";tabsSelectedRow)
			
		Else 
			tabsSelectedRow:=0
	End case 
	
	_tabs:=_tabs
	
End if 

UI_PaletteTabulations 
WP_SetTabInfos 
