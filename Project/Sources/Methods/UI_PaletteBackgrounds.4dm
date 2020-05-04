//%attributes = {"invisible":true}
C_LONGINT:C283($target)
C_POINTER:C301($ptrArrayNames;$ptrArrayValues)
C_LONGINT:C283($typeSelection)

$target:=(OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector1"))->  // 1 if document, 0 otherwise

$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndClip")
$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndClipVal")

ARRAY TEXT:C222($ptrArrayNames->;0)
ARRAY LONGINT:C221($ptrArrayValues->;0)

If ($target=1)
	APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Paper"))
End if 
APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Border"))
APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Padding"))
APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Content"))

If ($target=1)
	APPEND TO ARRAY:C911($ptrArrayValues->;wk paper box:K81:215)
End if 
APPEND TO ARRAY:C911($ptrArrayValues->;wk border box:K81:110)
APPEND TO ARRAY:C911($ptrArrayValues->;wk padding box:K81:111)
APPEND TO ARRAY:C911($ptrArrayValues->;wk content box:K81:112)

  //--------------------------

$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndOrigin")
$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndOriginVal")

ARRAY TEXT:C222($ptrArrayNames->;0)
ARRAY LONGINT:C221($ptrArrayValues->;0)

If ($target=1)
	APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Paper"))
End if 
APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Border"))
APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Padding"))
APPEND TO ARRAY:C911($ptrArrayNames->;Get localized string:C991("Content"))

If ($target=1)
	APPEND TO ARRAY:C911($ptrArrayValues->;wk paper box:K81:215)
End if 
APPEND TO ARRAY:C911($ptrArrayValues->;wk border box:K81:110)
APPEND TO ARRAY:C911($ptrArrayValues->;wk padding box:K81:111)
APPEND TO ARRAY:C911($ptrArrayValues->;wk content box:K81:112)




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
