
C_BOOLEAN:C305($setupOK)
C_LONGINT:C283($n)
C_OBJECT:C1216($o)
C_POINTER:C301($ptrSource;$ptrTarget)
C_POINTER:C301($ptr)

C_OBJECT:C1216(oForm)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		  //If (oForm=Null)
		
		oForm:=New object:C1471
		
		oForm.paletteNames:=New collection:C1472(\
			"WP_Palette_Fonts";\
			"WP_Palette_Alignments";\
			"WP_Palette_Tabulations";\
			"WP_Palette_Information";\
			"WP_Palette_Frames";\
			"WP_Palette_Sizes";\
			"WP_Palette_Backgrounds";\
			"WP_Palette_Bookmarks";\
			"WP_Palette_Stylesheets";\
			"WP_Palette_Tables")
		
		oForm.paletteHeights:=New collection:C1472(\
			450;\
			400;\
			440;\
			620;\
			400;\
			400;\
			370;\
			440;\
			440;\
			460)
		
		  //oForm:=Storage.form
		
		  //End if 
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"PaletteSelector1"))->:=1
		
		UI_Selector (1)
		  //SET TIMER(10)
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$setupOK:=SetupLocalVariables 
		
		skinAppliedMain:=UI_ApplySkin 
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)  //| (Form event=On Outside Call)
		
		SET TIMER:C645(0)
		
		If (Not:C34(skinAppliedMain))
			skinAppliedMain:=UI_ApplySkin 
		End if 
		
		UI_Palette 
		
		$ptrSource:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		$ptrTarget:=OBJECT Get pointer:C1124(Object named:K67:5;"PaletteSubform")
		
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
		
		UI_Palette 
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		CLEAR VARIABLE:C89(oForm)
		
End case 