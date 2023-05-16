//%attributes = {}
#DECLARE()->$4dwpDocument : Object

var $formData : Object
var $win : Integer

$formData:=New object:C1471
$formData.range:=Form:C1466.selection
$win:=Open form window:C675("D_TableWizard"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("D_TableWizard"; $formData)

$4dwpDocument:=$formData.wp



