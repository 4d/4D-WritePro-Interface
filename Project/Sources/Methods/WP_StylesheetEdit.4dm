//%attributes = {"invisible":true}
var $ui:=cs:C1710._ui.me
var $name : Text:=Form:C1466.styleSheets.currentValue

If (Length:C16($name)=0)
	
	return 
	
End if 

var $styleSheet:=WP Get style sheet:C1656($ui.document; $name)

If ($styleSheet=Null:C1517)
	
	return 
	
End if 

var $form:={\
stylesheet: $styleSheet; \
selection: Form:C1466.selection; \
name: $form.stylesheet.name}  // If stylesheet.name = "normal" the dialog will disable almost everything

$form.winRef:=Open form window:C675("WP_StyleSheetEdit"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("WP_StyleSheetEdit"; $form)
CLOSE WINDOW:C154($form.winRef)

If ($form.name#$form.stylesheet.name)
	
	// Changed named, must be checked
	var $c:=$ui.styleSheets
	var $t : Text:=$form.name
	
	While ($c.query("name = :1"; $t).length>0)
		
		$t:=cs:C1710._tools.me.incrementString($t)
		
	End while 
	
	$form.stylesheet.name:=$t
	
End if 

$ui.updateListOfStyleSheets()

SET TIMER:C645(-1)