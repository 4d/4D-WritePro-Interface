//%attributes = {"invisible":true,"preemptive":"incapable"}
#DECLARE($title : Text; $value : Text; $labelOk : Text; $labelCancel : Text; $placeHolder : Text) : Text

var $formData:={\
title: $title; \
value: $value; \
labelOk: $labelOk; \
labelCancel: $labelCancel; \
placeHolder: $placeHolder; \
windowTitle: ""\
}

var $formName:="D_Request"

If (Is macOS:C1572)
	
	var $winRef:=Open form window:C675($formName; Sheet form window:K39:12)
	
Else 
	
	var $left; $top; $right; $bottom : Integer
	GET WINDOW RECT:C443($left; $top; $right; $bottom)
	
	var $formWidth:=420
	
/*Horizontaly centered in the main window */$left:=(($left+$right)/2)-Int:C8($formWidth/2)
/* Arbitrary 40 pixels from the top */$top+=40
	
	$winRef:=Open form window:C675($formName; Movable form dialog box:K39:8; $left; $top)
	
End if 

DIALOG:C40("D_Request"; $formData)

If (Bool:C1537(OK))
	
	return $formData.value
	
End if 