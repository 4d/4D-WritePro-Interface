
C_COLLECTION:C1488($_buttonNames)
C_BOOLEAN:C305($setupOK)
C_LONGINT:C283($width)
C_OBJECT:C1216($o)
C_POINTER:C301($ptrSource; $ptrTarget)

C_OBJECT:C1216(oForm)


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)
			oForm:=New object:C1471
		End if 
		
		// WITHOUT PREFIX !!! (tabBtn_ or tabRect_" managed in class)
		$_buttonNames:=New collection:C1472(\
			"Fonts"; \
			"Alignments"; \
			"Tabulations"; \
			"Sizes"; \
			"Frames"; \
			"Backgrounds"; \
			"Expressions"; \
			"Bookmarks"; \
			"Stylesheets"; \
			"Tables"; \
			"Protection"; \
			"ImportExport"; \
			"FindAndReplace")
		
		
		oForm.SidebarTabs:=cs:C1710.Toolbar.new($_buttonNames; "TabArea")  // NEW
		
		OBJECT GET COORDINATES:C663(*; "TabArea"; $x1; $y1; $x2; $y2)
		$width:=Int:C8(($x2-$x1)/$_buttonNames.length)  //-1
		
		oForm.SidebarTabs.setBestSize(False:C215)  // no labels !
		oForm.SidebarTabs.setButtonSizes($width; 20)  // for side bar ONLY
		oForm.SidebarTabs.setLabelMargins(0; 0)  // no labels
		oForm.SidebarTabs.setButtonMargins(0; 0; 0; 0)
		
		oForm.SidebarTabs.subforms:=New collection:C1472(\
			"WP_Palette_Fonts"; \
			"WP_Palette_Alignments"; \
			"WP_Palette_Tabulations"; \
			"WP_Palette_Sizes"; \
			"WP_Palette_Frames"; \
			"WP_Palette_Backgrounds"; \
			"WP_Palette_Expressions"; \
			"WP_Palette_Bookmarks"; \
			"WP_Palette_Stylesheets"; \
			"WP_Palette_Tables"; \
			"WP_Palette_Protection"; \
			"WP_Palette_ImportExport"; \
			"WP_Palette_FindAndReplace")
		
		UI_Selector(oForm.SidebarTabs.buttonNames[0])
		
		oForm.eventCode:=-1  //ACI0103661 report to v19R7
		oForm.eventForcedCode:=-1  //ACI0103661 report to v19R7
		
		oForm.skinAppliedMain:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$setupOK:=SetupLocalVariables
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)  //| (Form event=On Outside Call)
		
		SET TIMER:C645(0)
		
		If (Not:C34(oForm.skinAppliedMain))
			oForm.skinAppliedMain:=UI_ApplySkin
		End if 
		
		//UI_Palette
		
		$ptrSource:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		$ptrTarget:=OBJECT Get pointer:C1124(Object named:K67:5; "PaletteSubform")
		
		If (Not:C34(Is nil pointer:C315($ptrSource)))
			If (Not:C34(Undefined:C82($ptrSource->)))
				
				$o:=$ptrSource->
				If (Not:C34(OB Is empty:C1297($o)))
					
					// the object selection is transfered to the current subform
					
					$ptrTarget->:=$ptrSource->  // will generate "On Bound Variable Change" in the currently opened palette
					
					// an "on data change" event will be generated because it's a subform object
					
				End if 
			End if 
		End if 
		
		//UI_Palette
		
		
	: (Form event code:C388=On Unload:K2:2)
		//CLEAR VARIABLE(oForm)  // don't clear it, it may still be used in other windows in the same process
		oForm:=New object:C1471  // just make it smaller (!)
		
End case 