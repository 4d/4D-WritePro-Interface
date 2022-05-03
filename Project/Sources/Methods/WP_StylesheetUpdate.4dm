//%attributes = {"invisible":true}
C_COLLECTION:C1488($_attributes)

C_LONGINT:C283($stylesheetType)
C_LONGINT:C283($n)

C_OBJECT:C1216($source; $o)
C_OBJECT:C1216($stylesheet)
C_OBJECT:C1216($document)
C_OBJECT:C1216($styleSheet)

C_POINTER:C301($ptrListbox; $ptrStylesheetNames)

C_TEXT:C284($stylesheetName)

$stylesheetType:=WP_GetStylesheetType  // paragraph, char, picture, table, row or cell

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5; "LB_StyleSheets")
$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")


Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Not:C34(Is nil pointer:C315($ptrListbox)))  // from palette
			$n:=Find in array:C230($ptrListbox->; True:C214)  // index
		Else   //                                 from toolbar
			$n:=$ptrStylesheetNames->
		End if 
		If ($n>0)
			$stylesheetName:=$ptrStylesheetNames->{$n}
		End if 
		
		//If (False)
		
		//$menu:=Create menu
		
		//If ($stylesheetType=wk type paragraph)
		//APPEND MENU ITEM($menu;Get localized string("menuEditDefault"))
		//SET MENU ITEM PARAMETER($menu;-1;"EditDefault")
		//End if 
		
		//If ($stylesheetName#"")
		//APPEND MENU ITEM($menu;Replace string(Get localized string("menuEditStylesheet");"<1>";$stylesheetName))
		//SET MENU ITEM PARAMETER($menu;-1;"EditStylesheet")
		//APPEND MENU ITEM($menu;"(-")
		//End if 
		
		//$choice:=Dynamic pop up menu($menu)
		//RELEASE MENU($menu)
		
		//Case of 
		//: ($choice="EditDefault")  // update default style sheet
		
		//$document:=Form.selection[wk owner]
		//$styleSheet:=WP Get style sheet($document;$stylesheetType)
		
		//: ($choice="EditStylesheet")  // update 'zzz' style sheet
		
		//$document:=Form.selection[wk owner]
		//$styleSheet:=WP Get style sheet($document;$stylesheetName)
		
		//End case 
		
		//Else 
		
		If ($stylesheetName#"")
			$document:=Form:C1466.selection[wk owner:K81:168]
			$styleSheet:=WP Get style sheet:C1656($document; $stylesheetName)
			
			If ($stylesheet#Null:C1517)  // should never happen
				
				$_attributes:=WP_GetStyleAttributesByType($stylesheetType)  // all possible attributes for this type of style sheet
				
				Case of 
					: ($stylesheetType=wk type default:K81:190)
						$source:=Form:C1466.selection
						
					: ($stylesheetType=wk type paragraph:K81:191)
						//$source:=WP Paragraph range(Form.selection)
						$source:=Form:C1466.selection
						
				End case 
				
				$o:=New object:C1471
				
				$o.list:=$_attributes
				$o.from:=$source
				$o.to:=$stylesheet
				//$o.remove:=True
				
				WP_StylesheetSetAttributes($o)  //$_attributes;$source;$stylesheet;True)
				
				//WP SET ATTRIBUTES($source; wk style sheet; $styleSheet)
				
			End if 
		End if 
End case 
