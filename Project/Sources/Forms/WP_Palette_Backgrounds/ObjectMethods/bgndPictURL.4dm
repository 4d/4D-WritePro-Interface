C_OBJECT:C1216($oCurrent)
$oCurrent:=WP_FillCurrent 

C_PICTURE:C286($pict)
C_POINTER:C301($ptrPreview)
C_POINTER:C301($ptrURL)
C_LONGINT:C283($result)
C_TEXT:C284($path)
C_TEXT:C284($menu)
C_TEXT:C284($parameter)
C_LONGINT:C283($i;$n)

ARRAY TEXT:C222($_docNames;0)

$ptrPreview:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndPictPreview")
$ptrURL:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndPictURL")

Case of 
	: (Form event code:C388=On Drop:K2:12)
		
		GET PICTURE FROM PASTEBOARD:C522($pict)
		If (Picture size:C356($pict)#0)
			$ptrPreview->:=$pict
			$ptrURL->:=""
		End if 
		
		WP_SetBackgroundPicture ($oCurrent;$ptrPreview->)
		
	: (Form event code:C388=On Data Change:K2:15)
		
		If (Self:C308->#"")
			
			If (Is picture file:C1113(Self:C308->))
				READ PICTURE FILE:C678(Self:C308->;$pict)
			Else 
				$result:=HTTP Get:C1157(Self:C308->;$pict)
			End if 
			
			If (Picture size:C356($pict)#0)
				$ptrPreview->:=$pict
				$ptrURL->:=""
			Else 
				
			End if 
			
		Else 
			$ptrPreview->:=$pict
		End if 
		
		WP_SetBackgroundPicture ($oCurrent;$pict)
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Contextual click:C713)
			$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Patterns"+Folder separator:K24:12
			If (Test path name:C476($path)=Is a folder:K24:2)
				DOCUMENT LIST:C474($path;$_docNames;Ignore invisible:K24:16)
				$n:=Size of array:C274($_docNames)
				If ($n>0)
					$menu:=Create menu:C408
					For ($i;1;$n)
						APPEND MENU ITEM:C411($menu;$_docNames{$i})
						SET MENU ITEM PARAMETER:C1004($menu;-1;$_docNames{$i})
					End for 
					$parameter:=Dynamic pop up menu:C1006($menu)
					If ($parameter#"")
						$ptrPreview:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndPictPreview")
						READ PICTURE FILE:C678($path+$parameter;$ptrPreview->)
						WP_SetBackgroundPicture ($oCurrent;$ptrPreview->)
					End if 
				End if 
			End if 
		End if 
		
End case 




