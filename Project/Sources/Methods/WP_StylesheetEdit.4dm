//%attributes = {"invisible":true}

C_LONGINT:C283($n;$p;$win)

C_OBJECT:C1216($document)
C_OBJECT:C1216($styleSheet)
C_OBJECT:C1216($form)

C_POINTER:C301($ptrStylesheetNames;$ptrListbox)

C_TEXT:C284($stylesheetName;$newName)

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_StyleSheets")
$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")

If (Not:C34(Is nil pointer:C315($ptrListbox)))  // from palette
	$n:=Find in array:C230($ptrListbox->;True:C214)  // index
Else   //                                 from toolbar
	$n:=$ptrStylesheetNames->
End if 
If ($n>0)
	$stylesheetName:=$ptrStylesheetNames->{$n}
End if 

  //$stylesheetType:=WP_GetStylesheetType   // wk type default or wk type paragraph

If ($stylesheetName#"")
	$document:=Form:C1466.selection[wk owner:K81:168]
	$styleSheet:=WP Get style sheet:C1656($document;$stylesheetName)
End if 


If ($styleSheet#Null:C1517)
	$form:=New object:C1471
	$form.stylesheet:=$styleSheet
	$form.selection:=Form:C1466.selection
	$form.name:=$form.stylesheet.name  // if stylesheet.name = "normal" the dialog will disable almost everything
	
	$win:=Open form window:C675("WP_StyleSheetEdit";Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4)
	DIALOG:C40("WP_StyleSheetEdit";$form)
	
	If ($form.name#$form.stylesheet.name)
		  // changed named, must be checked
		ARRAY TEXT:C222($allstylesheet_Names;0)
		
		
		COLLECTION TO ARRAY:C1562(WP Get style sheets:C1655(Form:C1466.document;wk type paragraph:K81:191).concat(WP Get style sheets:C1655(Form:C1466.document;wk type character:K81:296));$allstylesheet_Names;"name")
		
		$newName:=$form.name
		$p:=Find in array:C230($allstylesheet_Names;$newName)
		While ($p>0)
			$newName:=TOOL_IncrementString ($newName)
			$p:=Find in array:C230($allstylesheet_Names;$newName)
		End while 
		$form.stylesheet.name:=$form.name
	End if 
	
	  // force stype sheet apply (test)
	  //WP SET ATTRIBUTES(Form.selection;wk style sheet;$form.stylesheet)
	
	WP_GetStyleSheets   // reload list
	
End if 


SET TIMER:C645(-1)

  //End case 
