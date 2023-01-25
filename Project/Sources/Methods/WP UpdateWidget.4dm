//%attributes = {"shared":true,"invisible":true}
// this method is executed in the main form context

#DECLARE($widgetName : Text; $areaName : Text; $skin : Object)

var $oWidget; $oArea : Variant
var $typeWidget; $typeArea : Integer
var $oWidgetUpdate : Object

C_BOOLEAN:C305($send)
//C_OBJECT($oWidget)  // variable used manage to the 4D WritePro Widget
C_POINTER:C301($widgetPtr; $areaPtr)  // Pointers on the area and widget
C_POINTER:C301($p)
//C_TEXT($areaName; $widgetName)  // "4DWritePro area" and "4DWritePro widget" object names

Case of 
	: (Count parameters:C259=1)
		
		//$widgetName:=$1
		$p:=OBJECT Get pointer:C1124(Object named:K67:5; $widgetName)
		If (Not:C34(Is nil pointer:C315($p)))
			$p->:=$p->
		End if 
		
	: (Count parameters:C259>=2)
		
		//$widgetName:=$1
		//$areaName:=$2
		
		$p:=OBJECT Get pointer:C1124(Object named:K67:5; $widgetName)
		
		$oWidget:=OBJECT Get value:C1743($widgetName)
		$oArea:=OBJECT Get value:C1743($areaName)
		
		$typeWidget:=Value type:C1509($oWidget)
		$typeArea:=Value type:C1509($oArea)
		
		//-----------------------------------------------------------
		
		$areaPtr:=OBJECT Get pointer:C1124(Object named:K67:5; $areaName)
		//$widgetPtr:=OBJECT Get pointer(Object named; $widgetName)
		
		//If ((Not(Is nil pointer($areaPtr))) & (Not(Is nil pointer($widgetPtr))))
		//If (Not(Undefined($areaPtr->)))
		//If (Type($areaPtr->)=Is object)
		//If (Not(OB Is empty($areaPtr->)))  //
		
		
		If ($typeWidget=Is object:K8:27) && ($typeArea=Is object:K8:27) && (Not:C34(OB Is empty:C1297($oArea)))
			
			
			$oWidgetUpdate:=New object:C1471
			
			$oWidgetUpdate.selection:=WP Selection range:C1340(*; $areaName)
			$oWidgetUpdate.areaPointer:=$areaPtr  //Self
			$oWidgetUpdate.area:=$oArea
			$oWidgetUpdate.areaName:=$areaName  //mandatory to use ST Commands
			$oWidgetUpdate.masterTable:=Current form table:C627  // or a pointer or any other table (for formula)
			$oWidgetUpdate.spellCheck:=OBJECT Get auto spellcheck:C1174(*; $areaName)  // true or false according to the setting
			
			$oWidgetUpdate.enterable:=OBJECT Get enterable:C1067(*; $areaName)
			$oWidgetUpdate.keyboard:=OBJECT Get keyboard layout:C1180(*; $areaName)
			
			$oWidgetUpdate.eventCode:=Form event code:C388  // Added 2023/01/25 by RL for more accuracy in UI
			
			//$oWidgetUpdate.callback:=Formula(Formula from string($1))
			//$oWidget.event:=FORM Event
			
			Case of 
				: (Form event code:C388=On Losing Focus:K2:8) | (Form event code:C388=On Load:K2:1)
					$oWidgetUpdate.focus:=False:C215  // anticipate lost of focus to disable interface
				: (Form event code:C388=On Getting Focus:K2:7)
					$oWidgetUpdate.focus:=True:C214
			End case 
			
			
			If (Count parameters:C259>=3)
				//$skin:=$3
				$oWidgetUpdate.skin:=$skin
			End if 
			
			$send:=True:C214
			Case of 
				: (Form event code:C388=On Load:K2:1)
				: (Form event code:C388=On After Edit:K2:43)
				: (Form event code:C388=On Selection Change:K2:29)
				: (Form event code:C388=On Getting Focus:K2:7)
				: (Form event code:C388=On Losing Focus:K2:8)
				: (Form event code:C388=On Clicked:K2:4)  // when called from a button !
					//: (Form event code=On Double Clicked)  // for pictures and formulas
				: (Form event code:C388=On Timer:K2:25)
					
				Else 
					$send:=False:C215
			End case 
			
			If ($send)
				
				$p->:=$oWidgetUpdate  // shall trigger "on bound variable change" inside the widget
				//$oWidget:=$oWidgetUpdate  // does NOT WORK
			End if 
			
		End if 
		
		//Else 
		//// [compiled mode : page 2 of form (during on load)] OR [interpreted mode with dynamic var]
		//End if 
		//Else 
		//// bad type… programming error
		//End if 
		//Else 
		//// Interpreted mode and page 2
		//End if 
		//Else 
		//// Either $areaName or $widgetName is not well defined
		//End if 
		
End case 

