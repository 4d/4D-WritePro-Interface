//%attributes = {"invisible":true}
// modifiée le 10/oct 2018 par RL
// ACI0098592

var $grey : Integer
var $typeSelection : Integer

If (UI_isProtected(False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
Else 
	
	//$darkGrey:=0x00585858
	//$lightGrey:=0x00C0C0C0
	//$white:=0x00FFFFFF
	$grey:=0x00808080
	$typeSelection:=Form:C1466.selection.type
	
	
	Case of 
			
		: ($typeSelection=2)  // static picture
			OBJECT SET ENABLED:C1123(*; "@"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
			
			// EXCEPT  (May 11 2022 by RL)
			OBJECT SET ENABLED:C1123(*; "btnExpression"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "btnExpression"; True:C214)
			
			OBJECT SET ENABLED:C1123(*; "btn_showHide4Dexpressions"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "btn_showHide4Dexpressions"; True:C214)
			
			// ACI0104129
			OBJECT SET ENABLED:C1123(*; "btn_insertExpression"; True:C214)
			OBJECT SET ENABLED:C1123(*; "btn_computeExpression"; True:C214)
			OBJECT SET ENABLED:C1123(*; "btn_freezeExpressions"; True:C214)
			
		: ($typeSelection=0)
			OBJECT SET ENABLED:C1123(*; "@"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
			
			If (areaName#"") & (areaName=OBJECT Get name:C1087(Object with focus:K67:3))
				
				OBJECT SET ENABLED:C1123(*; "btnDate"; True:C214)
				OBJECT SET ENABLED:C1123(*; "btnExpression"; True:C214)
				OBJECT SET ENABLED:C1123(*; "btnCompute"; True:C214)
				OBJECT SET ENABLED:C1123(*; "btnFreeze"; True:C214)
				OBJECT SET ENABLED:C1123(*; "btnURL"; True:C214)
				
			End if 
			
	End case 
	
	// Never enterable ACI0098592
	//OBJECT SET ENTERABLE(*;"Expression";False) // RL 2019/12/02
	OBJECT SET ENTERABLE:C238(*; "VirtualExpression"; False:C215)  // RL 2019/12/02
	
	OBJECT SET HELP TIP:C1181(*; "btn_displayAsSymbol"; Action info:C1442("displayFormulaAsSymbol").title)
	
End if 
