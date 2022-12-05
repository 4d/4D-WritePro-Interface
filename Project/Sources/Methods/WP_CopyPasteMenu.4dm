//%attributes = {"invisible":true}
C_TEXT:C284($1)

C_BOOLEAN:C305($hasPasteMenu1)
C_BOOLEAN:C305($hasPasteMenu2)

C_LONGINT:C283($i; $n; $type)

C_TEXT:C284($menu)
C_TEXT:C284($Parameter)
C_TEXT:C284($textValue)
C_TEXT:C284($context)
C_TEXT:C284($unit)
C_TEXT:C284($attribute)

C_REAL:C285($numValue)

C_OBJECT:C1216($oSettings)
C_OBJECT:C1216($oCurrent)

C_OBJECT:C1216(oSettings1)
C_OBJECT:C1216(oSettings2)

C_POINTER:C301($ptrPreviewCopy)

$context:=$1

If (Not:C34(Undefined:C82(oSettings1)))
	If (Not:C34(OB Is empty:C1297(oSettings1)))
		$hasPasteMenu1:=True:C214
	Else 
		$hasPasteMenu1:=False:C215
	End if 
Else 
	$hasPasteMenu1:=False:C215
End if 

If (Not:C34(Undefined:C82(oSettings2)))
	If (Not:C34(OB Is empty:C1297(oSettings2)))
		$hasPasteMenu2:=True:C214
	Else 
		$hasPasteMenu2:=False:C215
	End if 
Else 
	$hasPasteMenu2:=False:C215
End if 

//If ($context="FrameBackground")
//$oSettings2:=(OBJECT Get pointer(Object named;"oSettings2"))->
//If (Not(OB Is empty($oSettings2)))
//$hasPasteMenu2:=True
//Else 
//$hasPasteMenu2:=False
//End if 
//End if 

// get the RANGE according to context ----------------------------------------------------------------------------------------------

Case of 
	: (($context="fontFamilly") | ($context="Tabulations"))
		$oCurrent:=Form:C1466.selection
	Else 
		$oCurrent:=WP_FillCurrent  // document, paragraphs, pictures
End case 

// create the menu according to context ----------------------------------------------------------------------------------------------

$menu:=Create menu:C408
Case of 
	: ($context="fontFamilly")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("CopyStyle"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "Copy1")
		If ($hasPasteMenu1)
			APPEND MENU ITEM:C411($menu; "(-")
			APPEND MENU ITEM:C411($menu; Get localized string:C991("PasteStyle"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "Paste1")
		End if 
		
	: ($context="AlignmentsAndMargins")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("CopyTextSettings"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "Copy1")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("CopyMargins"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "Copy2")
		
		If (($hasPasteMenu1) | ($hasPasteMenu2))
			APPEND MENU ITEM:C411($menu; "(-")
		End if 
		If ($hasPasteMenu1)
			APPEND MENU ITEM:C411($menu; Get localized string:C991("PasteTextSettings"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "Paste1")
		End if 
		If ($hasPasteMenu2)
			APPEND MENU ITEM:C411($menu; Get localized string:C991("PasteMargins"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "Paste2")
		End if 
		
	: ($context="Tabulations")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("CopyTabulation"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "Copy1")
		If ($hasPasteMenu1)
			APPEND MENU ITEM:C411($menu; "(-")
			APPEND MENU ITEM:C411($menu; Get localized string:C991("PasteTabulation"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "Paste1")
		End if 
		
	: ($context="Frame")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("CopyFrame"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "Copy1")
		
		If (($hasPasteMenu1) | ($hasPasteMenu2))
			APPEND MENU ITEM:C411($menu; "(-")
		End if 
		If ($hasPasteMenu1)
			APPEND MENU ITEM:C411($menu; Get localized string:C991("PasteFrame"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "Paste1")
		End if 
		
	: ($context="Background")
		
		APPEND MENU ITEM:C411($menu; Get localized string:C991("CopyBackground"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "Copy1")
		
		If ($hasPasteMenu1)
			APPEND MENU ITEM:C411($menu; "(-")
		End if 
		
		If ($hasPasteMenu1)
			APPEND MENU ITEM:C411($menu; Get localized string:C991("PasteBackground"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "Paste1")
		End if 
		
End case 

// call the menu ------------------------------------------------------------------------------------------------------------------------------
$Parameter:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)


Case of 
	: ($Parameter="Copy@")
		
		ARRAY TEXT:C222($_attributes; 0)
		ARRAY REAL:C219($_numValues1; 0)
		ARRAY REAL:C219($_numValues2; 0)
		
		//CLEAR VARIABLE(oSettings1)
		//CLEAR VARIABLE($oSettings2)
		
		Case of 
			: ($context="fontFamilly")
				
				APPEND TO ARRAY:C911($_attributes; wk font family:K81:65)
				APPEND TO ARRAY:C911($_attributes; wk font:K81:69)  //2020/06/02   ACI0100924
				//
				APPEND TO ARRAY:C911($_attributes; wk font size:K81:66)
				APPEND TO ARRAY:C911($_attributes; wk text color:K81:64)
				APPEND TO ARRAY:C911($_attributes; wk background color:K81:20)
				APPEND TO ARRAY:C911($_attributes; wk font bold:K81:68)
				APPEND TO ARRAY:C911($_attributes; wk font italic:K81:67)
				APPEND TO ARRAY:C911($_attributes; wk text underline style:K81:73)
				APPEND TO ARRAY:C911($_attributes; wk text underline color:K81:74)
				APPEND TO ARRAY:C911($_attributes; wk text linethrough style:K81:75)
				APPEND TO ARRAY:C911($_attributes; wk text shadow color:K81:71)
				APPEND TO ARRAY:C911($_attributes; wk vertical align:K81:9)
				APPEND TO ARRAY:C911($_attributes; wk text transform:K81:70)
				//
				APPEND TO ARRAY:C911($_attributes; wk text shadow offset:K81:72)
				
				CLEAR VARIABLE:C89(oSettings1)
				C_OBJECT:C1216(oSettings1)
				$n:=Size of array:C274($_attributes)
				
				For ($i; 1; $n)
					
					Case of 
						: ($_attributes{$i}=wk font family:K81:65) | ($_attributes{$i}=wk font:K81:69)  //2020/06/02   ACI0100924
							
							WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $textValue)
							OB SET:C1220(oSettings1; $_attributes{$i}; $textValue)
							
						: ($_attributes{$i}=wk text shadow offset:K81:72)
							
							WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $_numValues1)
							OB SET ARRAY:C1227(oSettings1; $_attributes{$i}; $_numValues1)
							
						Else 
							
							WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $numValue)
							If ($numValue#wk mixed:K81:89)
								OB SET:C1220(oSettings1; $_attributes{$i}; $numValue)
							End if 
							
					End case 
					
				End for 
				
			: ($context="AlignmentsAndMargins")
				
				
				Case of 
					: ($Parameter="Copy1")
						
						APPEND TO ARRAY:C911($_attributes; wk background color:K81:20)
						
						//If ((OBJECT Get pointer(Object named; "TargetSelector3"))->#1)
						APPEND TO ARRAY:C911($_attributes; wk text align:K81:49)
						APPEND TO ARRAY:C911($_attributes; wk list style type:K81:55)
						APPEND TO ARRAY:C911($_attributes; wk text indent:K81:52)
						//End if 
						
						CLEAR VARIABLE:C89(oSettings1)
						C_OBJECT:C1216(oSettings1)
						$n:=Size of array:C274($_attributes)
						For ($i; 1; $n)
							
							Case of 
								: ($_attributes{$i}=wk line height:K81:51)
									
									//If ((OBJECT Get pointer(Object named; "TargetSelector3"))->#1)
									
									WP GET ATTRIBUTES:C1345($oCurrent; wk layout unit:K81:78; $unit)  // memo current unit
									WP SET ATTRIBUTES:C1342($oCurrent; wk layout unit:K81:78; wk unit percent:K81:139)  // tempo set to %
									WP GET ATTRIBUTES:C1345($oCurrent; wk line height:K81:51; $numValue)  // set the line height (in %)
									WP SET ATTRIBUTES:C1342($oCurrent; wk layout unit:K81:78; $unit)  // back to current unit
									
									//Else 
									//$numValue:=wk mixed
									//End if 
									
								Else 
									WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $numValue)
									
							End case 
							
							If ($numValue#wk mixed:K81:89)
								OB SET:C1220(oSettings1; $_attributes{$i}; $numValue)
							End if 
							
						End for 
						
					: ($Parameter="Copy2")
						
						APPEND TO ARRAY:C911($_attributes; wk margin left:K81:11)
						APPEND TO ARRAY:C911($_attributes; wk margin top:K81:13)
						APPEND TO ARRAY:C911($_attributes; wk margin right:K81:12)
						APPEND TO ARRAY:C911($_attributes; wk margin bottom:K81:14)
						
						CLEAR VARIABLE:C89(oSettings2)
						C_OBJECT:C1216(oSettings2)
						$n:=Size of array:C274($_attributes)
						For ($i; 1; $n)
							WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $numValue)
							If ($numValue#wk mixed:K81:89)
								OB SET:C1220(oSettings2; $_attributes{$i}; $numValue)
							End if 
						End for 
						
				End case 
				
				
			: ($context="Tabulations")
				
				//CLEAR VARIABLE(oSettings1)
				
				//WP GET ATTRIBUTES($oCurrent;wk tab stop offsets;$_numValues1)
				//WP GET ATTRIBUTES($oCurrent;wk tab stop types;$_numValues2)
				
				//OB SET ARRAY(oSettings1;wk tab stop offsets;$_numValues1)
				//OB SET ARRAY(oSettings1;wk tab stop types;$_numValues2)
				
				oSettings1:=New object:C1471
				oSettings1[wk tabs:K81:278]:=_tabs
				oSettings1[wk tab default:K81:279]:=tabDefault
				
			: ($context="Frame")
				
				APPEND TO ARRAY:C911($_attributes; wk border style left:K81:30)
				APPEND TO ARRAY:C911($_attributes; wk border width left:K81:40)
				APPEND TO ARRAY:C911($_attributes; wk border color left:K81:35)
				APPEND TO ARRAY:C911($_attributes; wk border style top:K81:32)
				APPEND TO ARRAY:C911($_attributes; wk border width top:K81:42)
				APPEND TO ARRAY:C911($_attributes; wk border color top:K81:37)
				APPEND TO ARRAY:C911($_attributes; wk border style right:K81:31)
				APPEND TO ARRAY:C911($_attributes; wk border width right:K81:41)
				APPEND TO ARRAY:C911($_attributes; wk border color right:K81:36)
				APPEND TO ARRAY:C911($_attributes; wk border style bottom:K81:33)
				APPEND TO ARRAY:C911($_attributes; wk border width bottom:K81:43)
				APPEND TO ARRAY:C911($_attributes; wk border color bottom:K81:38)
				
				APPEND TO ARRAY:C911($_attributes; wk border radius:K81:44)
				
				APPEND TO ARRAY:C911($_attributes; wk padding left:K81:16)
				APPEND TO ARRAY:C911($_attributes; wk padding top:K81:18)
				APPEND TO ARRAY:C911($_attributes; wk padding right:K81:17)
				APPEND TO ARRAY:C911($_attributes; wk padding bottom:K81:19)
				
				
				CLEAR VARIABLE:C89(oSettings1)
				$n:=Size of array:C274($_attributes)
				For ($i; 1; $n)
					WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $numValue)
					If ($numValue#wk mixed:K81:89)
						OB SET:C1220(oSettings1; $_attributes{$i}; $numValue)
					End if 
				End for 
				
				oSettings1:=oSettings1
				
			: ($context="Background")
				
				CLEAR VARIABLE:C89(oSettings1)
				
				// numeric values 
				ARRAY TEXT:C222($_attributes; 0)
				APPEND TO ARRAY:C911($_attributes; wk background position horizontal:K81:22)
				APPEND TO ARRAY:C911($_attributes; wk background position vertical:K81:23)
				APPEND TO ARRAY:C911($_attributes; wk background repeat:K81:24)
				APPEND TO ARRAY:C911($_attributes; wk background clip:K81:25)
				APPEND TO ARRAY:C911($_attributes; wk background origin:K81:26)
				
				$n:=Size of array:C274($_attributes)
				For ($i; 1; $n)
					WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $numValue)
					If ($numValue#wk mixed:K81:89)
						OB SET:C1220(oSettings1; $_attributes{$i}; $numValue)
					End if 
				End for 
				
				// text values
				ARRAY TEXT:C222($_attributes; 0)
				APPEND TO ARRAY:C911($_attributes; wk background width:K81:27)
				APPEND TO ARRAY:C911($_attributes; wk background height:K81:28)
				$n:=Size of array:C274($_attributes)
				For ($i; 1; $n)
					WP GET ATTRIBUTES:C1345($oCurrent; $_attributes{$i}; $textValue)
					If ($textValue#"")
						OB SET:C1220(oSettings1; $_attributes{$i}; $textValue)
					End if 
				End for 
				oSettings1:=oSettings1
				
				// +++
				(OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreviewCopy"))->:=(OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreview"))->
				
				
		End case 
		
		
	: ($Parameter="Paste@")
		
		ARRAY TEXT:C222($_attributes; 0)
		ARRAY REAL:C219($_numValues1; 0)
		ARRAY REAL:C219($_numValues2; 0)
		
		Case of 
			: ($Parameter="Paste1")
				$oSettings:=oSettings1
			: ($Parameter="Paste2")
				$oSettings:=oSettings2
		End case 
		
		If (Not:C34(Undefined:C82($oSettings)))
			
			OB GET PROPERTY NAMES:C1232($oSettings; $_attributes)
			$n:=Size of array:C274($_attributes)
			
			For ($i; 1; $n)
				$attribute:=$_attributes{$i}
				
				Case of 
					: ($attribute=wk tabs:K81:278)
						
						//wk tabs
						_tabs:=$oSettings[wk tabs:K81:278]
						tabDefault:=$oSettings[wk tab default:K81:279]
						
						WP SET ATTRIBUTES:C1342($oCurrent; wk tabs:K81:278; _tabs)
						WP SET ATTRIBUTES:C1342($oCurrent; wk tab default:K81:279; tabDefault)
						
						
						//: ($attribute=wk tab stop offsets)
						//OB GET ARRAY($oSettings;$attribute;$_numValues1)
						//WP SET ATTRIBUTES($oCurrent;$attribute;$_numValues1)
						
						//: ($attribute=wk tab stop types)
						//OB GET ARRAY($oSettings;$attribute;$_numValues2)
						//WP SET ATTRIBUTES($oCurrent;$attribute;$_numValues2)
						
					: ($attribute=wk text shadow offset:K81:72)
						
						OB GET ARRAY:C1229($oSettings; $attribute; $_numValues1)
						WP SET ATTRIBUTES:C1342($oCurrent; $attribute; $_numValues1)
						
					: ($attribute=wk line height:K81:51)
						
						WP GET ATTRIBUTES:C1345($oCurrent; wk layout unit:K81:78; $unit)
						WP SET ATTRIBUTES:C1342($oCurrent; wk layout unit:K81:78; wk unit percent:K81:139)
						WP SET ATTRIBUTES:C1342($oCurrent; wk line height:K81:51; $numValue)
						WP SET ATTRIBUTES:C1342($oCurrent; wk layout unit:K81:78; $unit)
						
					Else 
						
						$type:=OB Get type:C1230($oSettings; $attribute)
						
						Case of 
							: ($type=Is text:K8:3)
								$textValue:=OB Get:C1224($oSettings; $attribute)
								WP SET ATTRIBUTES:C1342($oCurrent; $_attributes{$i}; $textValue)
								
							: ($type=Is real:K8:4) | ($type=Is longint:K8:6)
								$numValue:=OB Get:C1224($oSettings; $attribute)
								WP SET ATTRIBUTES:C1342($oCurrent; $_attributes{$i}; $numValue)
								
						End case 
				End case 
			End for 
		End if 
		
		If ($context="Background")
			
			//$ptrPreview:=(OBJECT Get pointer(Object named;"bgndPictPreview"))
			$ptrPreviewCopy:=(OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreviewCopy"))
			//$ptrPreview->:=$ptrPreviewCopy->
			WP_SetBackgroundPicture($oCurrent; $ptrPreviewCopy->)
			
		End if 
		
		SET TIMER:C645(-1)
		
End case 



