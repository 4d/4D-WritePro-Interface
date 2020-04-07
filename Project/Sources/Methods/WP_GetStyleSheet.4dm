//%attributes = {"invisible":true}

C_OBJECT:C1216($range)
C_OBJECT:C1216($styleSheet)
C_LONGINT:C283($typeStylesheet)
C_LONGINT:C283($p)
C_POINTER:C301($ptrStylesheetNames)
C_TEXT:C284($name)

$typeStylesheet:=WP_GetStylesheetType 


Case of 
	: ($typeStylesheet=wk type default:K81:190)
		$range:=Form:C1466.selection
		
	: ($typeStylesheet=wk type paragraph:K81:191)
		$range:=WP Paragraph range:C1346(Form:C1466.selection)
		
End case 


If (Not:C34(OB Is empty:C1297($range)))
	
	WP GET ATTRIBUTES:C1345($range;wk style sheet:K81:63;$styleSheet)  // wk name
	If ($styleSheet#Null:C1517)
		$name:=$styleSheet.name
		$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")
		
		$p:=Find in array:C230($ptrStylesheetNames->;$name)
		
		
		If ($p>0)
			$ptrStylesheetNames->:=$p  // toolbar widget
			LISTBOX SELECT ROW:C912(*;"LB_StyleSheets";$p;lk replace selection:K53:1)  // palette widget
		Else 
			$ptrStylesheetNames->:=0  // toolbar widget
			LISTBOX SELECT ROW:C912(*;"LB_StyleSheets";0;lk remove from selection:K53:3)  // palette widget
		End if 
		
	End if 
	
End if 


