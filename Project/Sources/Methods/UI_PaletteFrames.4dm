//%attributes = {"invisible":true}
C_LONGINT:C283($typeSelection)

If (UI_isProtected (False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*;"@";True:C214)
	OBJECT SET ENTERABLE:C238(*;"@";True:C214)
	
	$typeSelection:=Form:C1466.selection.type
	
	Case of 
			
		: ($typeSelection=2)
			
			OBJECT SET ENABLED:C1123(*;"TargetSelector@";False:C215)
			OBJECT SET ENABLED:C1123(*;"TargetSelector4";True:C214)
			(OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector4"))->:=1
			
		: ($typeSelection=0)
			
			OBJECT SET ENABLED:C1123(*;"TargetSelector@";True:C214)
			OBJECT SET ENABLED:C1123(*;"TargetSelector4";False:C215)  // target4 disabled
			(OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector4"))->:=0
			
			Case of 
				: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector1"))->=1)
					
					OBJECT SET ENABLED:C1123(*;"textIndent@";True:C214)
					OBJECT SET ENABLED:C1123(*;"listStyleNames";True:C214)
					OBJECT SET ENABLED:C1123(*;"bAlign@";True:C214)
					
				: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector2"))->=1)
					
					OBJECT SET ENABLED:C1123(*;"textIndent@";True:C214)
					OBJECT SET ENABLED:C1123(*;"listStyleNames";True:C214)
					OBJECT SET ENABLED:C1123(*;"bAlign@";True:C214)
					
				: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector3"))->=1)
					
					OBJECT SET ENABLED:C1123(*;"textIndent@";False:C215)
					OBJECT SET ENABLED:C1123(*;"listStyleNames";False:C215)
					OBJECT SET ENABLED:C1123(*;"bAlign@";False:C215)
					
			End case 
			
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
	
	OBJECT SET FORMAT:C236(*;"padding@";numFormat+" "+unitName)
	
End if 