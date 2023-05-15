//%attributes = {}
#DECLARE()->$4dwpDocument : Object

var $formData : Object
var $win : Integer

$formData:=New object:C1471
$win:=Open form window:C675("D_TableWizard"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("D_TableWizard"; $formData)

$4dwpDocument:=$formData.area



