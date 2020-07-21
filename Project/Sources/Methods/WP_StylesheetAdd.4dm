//%attributes = {"invisible":true}
C_COLLECTION:C1488($col)

C_LONGINT:C283($typeStylesheet)
C_LONGINT:C283($i;$n;$p)

C_OBJECT:C1216($newStylesheet)
C_OBJECT:C1216($source;$o)

C_POINTER:C301($ptrStylesheetNames)

C_TEXT:C284($menu;$submenu;$choice)
C_TEXT:C284($rqCancel;$rqOK;$rqPlaceHolder;$rqTitle;$placeHolder)
C_TEXT:C284($newName;$sourceName)

$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")
$typeStylesheet:=WP_GetStylesheetType 

  // create menu *****************

$menu:=Create menu:C408
  //APPEND MENU ITEM($menu;Get localized string("menuNewEmpty"))
  //SET MENU ITEM PARAMETER($menu;-1;"new")
APPEND MENU ITEM:C411($menu;Get localized string:C991("menuNewFromSelection"))
SET MENU ITEM PARAMETER:C1004($menu;-1;"newFromSelection")


$n:=Size of array:C274($ptrStylesheetNames->)
If ($n>0)  // no "duplicate" if no items !
	$submenu:=Create menu:C408
	For ($i;1;$n)
		APPEND MENU ITEM:C411($submenu;$ptrStylesheetNames->{$i})
		SET MENU ITEM PARAMETER:C1004($submenu;-1;"duplicate_"+String:C10($i))
	End for 
	APPEND MENU ITEM:C411($menu;Get localized string:C991("menuDuplicate");$submenu)
	RELEASE MENU:C978($submenu)  // will be cleared later thanks to refcounting
End if 

$choice:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)


If ($choice#"")
	
	  // Action *****************
	
	ARRAY TEXT:C222($allstylesheet_Names;0)
	COLLECTION TO ARRAY:C1562(WP Get style sheets:C1655(Form:C1466.document;wk type character:K81:296).extract("name").concat(WP Get style sheets:C1655(Form:C1466.document;wk type paragraph:K81:191).extract("name"));$allstylesheet_Names)
	
	
	$rqTitle:=Get localized string:C991("requestTitle")
	$rqPlaceHolder:=Get localized string:C991("requestPlaceHolder")
	$rqOK:=Get localized string:C991("requestCreateLabel")
	$rqCancel:=Get localized string:C991("requestCancelLabel")
	$placeHolder:=Get localized string:C991("StyleSheetPlaceHolder")
	
	Case of 
		: ($choice="new") | ($choice="newFromSelection")
			Repeat 
				
				  //$newName:=Request($rqTitle;$rqPlaceHolder;$rqOK;$rqCancel)
				  //Method WP_Request created 2020/06/03 to fix the ACI0100879
				$newName:=WP_Request ($rqTitle;$rqPlaceHolder;$rqOK;$rqCancel;$placeHolder)
				If ($newName="section@")
					ALERT:C41(Get localized string:C991("nameError"))
				End if 
			Until (($newName#"section@") & ($newName#"")) | (ok=0)
			
		: ($choice="duplicate_@")
			$i:=Num:C11(Substring:C12($choice;11))  // 11 = after the "_" in "duplicate_XXX"  
			$sourceName:=$ptrStylesheetNames->{$i}
			$newName:=$sourceName
			Repeat 
				$newName:=TOOL_IncrementString ($newName)
				$p:=Find in array:C230($allstylesheet_Names;$newName)
			Until ($p<0)
			
			  //$newName:=Request($rqTitle;$newName;$rqOK;$rqCancel)
			  //Method WP_Request created 2020/06/03 to fix the ACI0100879
			$newName:=WP_Request ($rqTitle;$rqPlaceHolder;$rqOK;$rqCancel;$placeHolder)
			
	End case 
	
	If (ok=1)  // resuls of Request
		
		  // just in case the user refuses the "x" added at the end…
		$p:=Find in array:C230($allstylesheet_Names;$newName)
		While ($p>0)
			$newName:=TOOL_IncrementString ($newName)
			$p:=Find in array:C230($allstylesheet_Names;$newName)
		End while 
		
		$newStylesheet:=WP New style sheet:C1650(Form:C1466.document;$typeStylesheet;$newName)
		$col:=WP_GetStyleAttributesByType ($typeStylesheet)  // collection of attributes according to stylesheet TYPE
		
		Case of 
				  //: ($choice="new")
				  //  // already done
				
			: ($choice="newFromSelection")
				
				Case of 
					: ($typeStylesheet=wk type default:K81:190)
						$source:=Form:C1466.selection
						
					: ($typeStylesheet=wk type paragraph:K81:191)
						$source:=WP Paragraph range:C1346(Form:C1466.selection)
				End case 
				
				$o:=New object:C1471
				$o.list:=$col
				$o.from:=$source
				$o.to:=$newStylesheet
				$o.remove:=True:C214
				
				WP_StylesheetSetAttributes ($o)  //$col;$source;$newStylesheet;True)
				WP SET ATTRIBUTES:C1342(Form:C1466.selection;wk style sheet:K81:63;$newStylesheet)  // as an object
				
			: ($choice="duplicate_@")
				
				$o:=New object:C1471
				
				  //$o.list:=$col
				$o.from:=WP Get style sheet:C1656(Form:C1466.document;$sourceName)
				$o.to:=$newStylesheet
				
				WP_StylesheetCopyAttributes ($o)  //$col;$sourceStylesheet;$newStylesheet)
				
		End case 
		
		
		WP_GetStyleSheets   // update the list
		
	End if 
End if 


