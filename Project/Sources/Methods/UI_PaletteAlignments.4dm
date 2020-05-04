//%attributes = {"invisible":true}
  //ACI0098389 (new item added)

C_POINTER:C301($ptrLineHeightUnit)
C_TEXT:C284($format)
C_LONGINT:C283($typeSelection)


If (UI_isProtected (False:C215))  // false means don't take focus into account
	
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
Else 
	
	  // same start…
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
	$typeSelection:=Form:C1466.selection.type
	
	Case of 
			
		: ($typeSelection=2)  // static picture
			
			OBJECT SET ENABLED:C1123(*;"@";False:C215)  // desable everything except below
			OBJECT SET ENTERABLE:C238(*;"@";False:C215)  // desable everything except below
			OBJECT SET VISIBLE:C603(*;"backgroundColor";False:C215)  // fake text behing the color picker button
			
			OBJECT SET ENABLED:C1123(*;"TargetSelector4";True:C214)
			(OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector4"))->:=1
			
			OBJECT SET ENABLED:C1123(*;"margin@";True:C214)
			OBJECT SET ENTERABLE:C238(*;"margin@";True:C214)
			
			
		: ($typeSelection=0)
			
			OBJECT SET ENABLED:C1123(*;"@";True:C214)
			OBJECT SET ENTERABLE:C238(*;"@";True:C214)  // ALL except…
			
			OBJECT SET VISIBLE:C603(*;"backgroundColor";True:C214)  // fake text behing the color picker button
			OBJECT SET ENTERABLE:C238(*;"backgroundColor";False:C215)  //visible but not enterable
			
			OBJECT SET ENABLED:C1123(*;"TargetSelector4";False:C215)  // target4 disabled
			(OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector4"))->:=0
			
			
			Case of 
				: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector1"))->=1)  // document
					
					OBJECT SET ENABLED:C1123(*;"textIndent@";True:C214)
					OBJECT SET ENABLED:C1123(*;"lineHeight@";True:C214)
					OBJECT SET ENABLED:C1123(*;"listStyleNames";True:C214)
					OBJECT SET ENABLED:C1123(*;"bAlign@";True:C214)
					
					OBJECT SET ENABLED:C1123(*;"bAlign5";False:C215)
					OBJECT SET ENABLED:C1123(*;"bAlign6";False:C215)
					OBJECT SET ENABLED:C1123(*;"bAlign7";False:C215)
					
				: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector2"))->=1)  // paragraph
					
					OBJECT SET ENABLED:C1123(*;"textIndent@";True:C214)
					OBJECT SET ENABLED:C1123(*;"lineHeight@";True:C214)
					OBJECT SET ENABLED:C1123(*;"listStyleNames";True:C214)
					OBJECT SET ENABLED:C1123(*;"bAlign@";True:C214)
					
				: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector3"))->=1)  // picture (inline)
					
					OBJECT SET ENABLED:C1123(*;"textIndent@";False:C215)
					OBJECT SET ENABLED:C1123(*;"lineHeight@";False:C215)
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
			
			  //OBJECT SET FORMAT(*;"padding@";$numFormat+" "+$unitName)
			
	End case 
	
	
	OBJECT SET FORMAT:C236(*;"textIndentInput";numFormat+" "+unitName)
	OBJECT SET FORMAT:C236(*;"margin@";numFormat+" "+unitName)
	
	
	  //ACI0098389  2018/07/10
	
	$ptrLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5;"lineHeightUnit")
	$format:=OBJECT Get format:C894(*;"lineHeightRuler")
	
	If (($ptrLineHeightUnit->)=1)  // "%"
		$format:="80;200;1;1;32;### ##0"
	Else   //                         "pt"
		$format:="10;100;1;1;32;### ##0"
	End if 
	OBJECT SET FORMAT:C236(*;"lineHeightRuler";$format)
	
End if 
