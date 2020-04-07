C_OBJECT:C1216($WP_object)  // variable used manage to the 4D WritePro Widget
C_POINTER:C301($WP_widgetPtr;$WP_areaPtr)  // Pointers on the area and widget
C_TEXT:C284($WP_areaName;$WP_widgetName)  // "4DWritePro area" and "4DWritePro widget" object names
C_TEXT:C284($WP_toolbarName)
C_BOOLEAN:C305($customize)

  // Change the lines below if you change the form object names
$WP_widgetName:="WPtoolbar"
$WP_areaName:="WParea"

  //-----------------------------------------------------------
$WP_areaPtr:=OBJECT Get pointer:C1124(Object named:K67:5;$WP_areaName)
$WP_widgetPtr:=OBJECT Get pointer:C1124(Object named:K67:5;$WP_widgetName)



If ((Not:C34(Is nil pointer:C315($WP_areaPtr))) & (Not:C34(Is nil pointer:C315($WP_widgetPtr))))
	If (Not:C34(Undefined:C82($WP_areaPtr->)))
		If (Type:C295($WP_areaPtr->)=Is object:K8:27)
			If (Not:C34(OB Is empty:C1297($WP_areaPtr->)))  //
				
				OB SET:C1220($WP_object;"selection";WP Selection range:C1340(*;$WP_areaName))
				OB SET:C1220($WP_object;"areaPointer";Self:C308)
				OB SET:C1220($WP_object;"areaName";$WP_areaName)  //mandatory to use ST Commands
				OB SET:C1220($WP_object;"masterTable";Current form table:C627)  // or a pointer or any other table (for formula)
				OB SET:C1220($WP_object;"spellCheck";OBJECT Get auto spellcheck:C1174(*;$WP_areaName))  // true or false according to the setting
				
				Case of 
						
					: (Form event code:C388=On Load:K2:1)
						
						$customize:=False:C215
						If ($customize & ((Not:C34(Is nil pointer:C315($WP_areaPtr)))))
							$WP_toolbarName:="Toolbar1"  //(default)
							  //$WP_toolbarName:="Toolbar2"
							WP SwitchToolbar ($WP_widgetName;$WP_toolbarName)
						End if 
						
						$WP_WidgetPtr->:=$WP_object
						
					: (Form event code:C388=On After Edit:K2:43)
						$WP_WidgetPtr->:=$WP_object
						
					: (Form event code:C388=On Selection Change:K2:29)
						$WP_WidgetPtr->:=$WP_object
						
					: (Form event code:C388=On Getting Focus:K2:7)
						$WP_WidgetPtr->:=$WP_object
						
					: (Form event code:C388=On Losing Focus:K2:8)
						$WP_WidgetPtr->:=$WP_object
						
				End case 
			Else 
				BEEP:C151  // [compiled mode : page 2 of form (during on load)] OR [interpreted mode with dynamic var]
			End if 
		Else 
			  // bad type… programming error
		End if 
	Else 
		  // Interpreted mode and page 2
	End if 
Else 
	BEEP:C151  // Either $WP_areaName or $WP_widgetName is not well defined
End if 

