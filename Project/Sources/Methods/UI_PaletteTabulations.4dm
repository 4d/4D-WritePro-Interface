//%attributes = {"invisible":true}
C_TEXT:C284($numFormat)  //•
C_TEXT:C284($unitName)  //•

C_LONGINT:C283($offset)
C_LONGINT:C283($typeSelection)


If (UI_isProtected (False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
Else 
	
	$typeSelection:=Form:C1466.selection.type
	
	Case of 
			
		: ($typeSelection=2)  // static picture
			OBJECT SET ENABLED:C1123(*;"@";False:C215)
			OBJECT SET ENTERABLE:C238(*;"@";False:C215)
			
		: ($typeSelection=0)
			OBJECT SET ENABLED:C1123(*;"@";True:C214)
			OBJECT SET ENTERABLE:C238(*;"@";True:C214)
			
			
			$offset:=(OBJECT Get pointer:C1124(Object named:K67:5;"tabIndentInput"))->
			
			If ($offset<=0)
				OBJECT SET ENTERABLE:C238(*;"tabIndentInput";False:C215)
				OBJECT SET ENTERABLE:C238(*;"tabDefaultLeading";False:C215)
				OBJECT SET ENABLED:C1123(*;"bTabType@";False:C215)
				OBJECT SET ENABLED:C1123(*;"tabIndentRuler";False:C215)
			End if 
			
			
			$unitName:=unitName
			$numFormat:=numFormat
			
			OBJECT SET FORMAT:C236(*;"tabIndentInput";$numFormat+" "+$unitName)
			OBJECT SET FORMAT:C236(*;"lb_offsets";$numFormat+" "+$unitName)
			
			  //$ptr:=OBJECT Get pointer(Object named;"LB_Tabs")
			  //$p:=Find in array($ptr->;True)
			
			  //If ($p>0)
			  //OBJECT SET ENABLED(*;"btnRemove";True)
			  //Else 
			  //OBJECT SET ENABLED(*;"btnRemove";False)
			  //End if 
			If (tabsSelectedRow>0)
				OBJECT SET ENABLED:C1123(*;"btnRemove";True:C214)
			Else 
				OBJECT SET ENABLED:C1123(*;"btnRemove";False:C215)
			End if 
			
			If (Not:C34(Undefined:C82(oSettings1)))
				If (Not:C34(OB Is empty:C1297(oSettings1)))
					OBJECT SET ENABLED:C1123(*;"btnPaste";True:C214)
				Else 
					OBJECT SET ENABLED:C1123(*;"btnPaste";False:C215)
				End if 
			Else 
				OBJECT SET ENABLED:C1123(*;"btnPaste";False:C215)
			End if 
			
	End case 
	
End if 