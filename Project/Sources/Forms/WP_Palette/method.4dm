
C_COLLECTION:C1488($_buttonNames)

C_BOOLEAN:C305($setupOK)

C_LONGINT:C283($width)

C_OBJECT:C1216($o)
C_OBJECT:C1216($param)
C_OBJECT:C1216(oForm)

C_POINTER:C301($ptrSource; $ptrTarget)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//If (oForm=Null)
		
		If (oForm=Null:C1517)
			oForm:=New object:C1471
		End if 
		
		$_buttonNames:=New collection:C1472(\
			"tabBtn_Fonts"; \
			"tabBtn_Alignments"; \
			"tabBtn_Tabulations"; \
			"tabBtn_Sizes"; \
			"tabBtn_Frames"; \
			"tabBtn_Backgrounds"; \
			"tabBtn_Expressions"; \
			"tabBtn_Bookmarks"; \
			"tabBtn_Stylesheets"; \
			"tabBtn_Tables"; \
			"tabBtn_Protection"; \
			"tabBtn_ImportExport"; \
			"tabBtn_FindAndReplace")
		
		oForm.SidebarTabs:=cs:C1710.Toolbar.new($_buttonNames; "TabArea")
		
		OBJECT GET COORDINATES:C663(*; "TabArea"; $x1; $y1; $x2; $y2)
		$width:=Int:C8(($x2-$x1)/$_buttonNames.length)  //-1
		
		oForm.SidebarTabs.setButtonSizes($width; 20)
		oForm.SidebarTabs.setLabelMargins(0; 0)  // no labels
		oForm.SidebarTabs.setButtonMargins(0; 0; 0; 0)
		oForm.SidebarTabs.setBestSize(False:C215)  // no labels
		
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
		
		$param:=New object:C1471
		$param.formName:="sidebar"
		$param.buttonNames:=New collection:C1472("Fonts"; "Alignments"; "Tabulations"; "Sizes"; "Frames"; "Backgrounds"; "Expressions"; "Bookmarks"; "Stylesheets"; "Tables"; "Protection"; "ImportExport"; "FindAndReplace")  // remove ImportExport from 18R3
		InitButtons($param)
		
		//(OBJECT Get pointer(Object named;"tabBtn_Fonts"))->:=1
		UI_Selector(oForm.SidebarTabs.buttonNames[0])
		
		SET TIMER:C645(10)
		
	: (Form event code:C388=On Resize:K2:27)
		UI_Palette
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$setupOK:=SetupLocalVariables
		
		skinAppliedMain:=UI_ApplySkin
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)  //| (Form event=On Outside Call)
		
		SET TIMER:C645(0)
		
		If (Not:C34(skinAppliedMain))
			skinAppliedMain:=UI_ApplySkin
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
		
		CLEAR VARIABLE:C89(oForm)
		
End case 