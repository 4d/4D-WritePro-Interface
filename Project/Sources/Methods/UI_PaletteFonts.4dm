//%attributes = {"invisible":true}

  //UI_ApplySkin 
C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type

Case of 
		
	: ($typeSelection=2)  // static picture
		OBJECT SET ENABLED:C1123(*;"@";False:C215)
		OBJECT SET ENTERABLE:C238(*;"@";False:C215)
		
	: ($typeSelection=0)
		OBJECT SET ENABLED:C1123(*;"@";True:C214)
		OBJECT SET ENTERABLE:C238(*;"@";True:C214)
		
		If (Not:C34(Undefined:C82(oSettings1)))
			If (Not:C34(OB Is empty:C1297(oSettings1)))
				OBJECT SET ENABLED:C1123(*;"btnPaste";True:C214)
			Else 
				OBJECT SET ENABLED:C1123(*;"btnPaste";False:C215)
			End if 
		End if 
		
End case 

OBJECT SET ENTERABLE:C238(*;"UnderlineColor";False:C215)
OBJECT SET ENTERABLE:C238(*;"LinethroughColor";False:C215)

