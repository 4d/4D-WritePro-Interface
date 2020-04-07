
C_OBJECT:C1216($WP_object)  // variable used manage to the 4D WritePro Widget

C_POINTER:C301($WP_widgetPtr;$WP_areaPtr;$WP_pointer)  // Pointers on the area and widget
C_TEXT:C284($WP_areaName;$WP_widgetName)  // "4DWritePro area" and "4DWritePro widget" object names



  // Change the lines below if you change the form object names

$WP_areaName:="WParea"
$WP_widgetName:="WPwidget"

  //-----------------------------------------------------------
$WP_areaPtr:=OBJECT Get pointer:C1124(Object named:K67:5;$WP_areaName)
$WP_widgetPtr:=OBJECT Get pointer:C1124(Object named:K67:5;$WP_widgetName)


  //C_OBJECT($WP_skin)
  //$WP_skin:=New object

  //OB SET($WP_skin;"skinName";"00"+String(0x00400040))  // "light", "dark"
  // or step by step
  //$WP_skin.separatorColor:=0x80FF
  //$WP_skin.backgroundColor:=0x0040
  //$WP_skin.font:="Optima"
  //$WP_skin.fontSize:=12
  //$WP_skin.fontColor:=0xC0FF
  //$WP_skin.separatorFontColor:=0x00D0D0FF


If ((Not:C34(Is nil pointer:C315($WP_areaPtr))) & (Not:C34(Is nil pointer:C315($WP_widgetPtr))))
	
	$WP_object:=New object:C1471
	
	$WP_object.selection:=WP Selection range:C1340(*;$WP_areaName)
	$WP_object.areaName:=$WP_areaName  //mandatory to use ST Commands
	$WP_object.areaPointer:=$WP_areaPtr  //mandatory to use WP SELECT
	  //$WP_object.skin:=$WP_skin
	$WP_object.masterTable:=->[SAMPLE:1]
	
	Case of 
			
		: (Form event code:C388=On Load:K2:1)
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
	BEEP:C151  // either $WP_areaName or $WP_widgetName is not well defined
End if 

