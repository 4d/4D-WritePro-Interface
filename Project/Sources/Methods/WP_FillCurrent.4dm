//%attributes = {"invisible":true}

C_OBJECT:C1216($0)
C_OBJECT:C1216($Current)

C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type

Case of 
		
	: ($typeSelection=2)  // background image
		$Current:=Form:C1466.selection  // ??
		
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector1"))->=1)
		$Current:=Form:C1466.selection[wk owner:K81:168]
		
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector2"))->=1)
		$Current:=Form:C1466.paragraphRange
		
	: ((OBJECT Get pointer:C1124(Object named:K67:5;"TargetSelector3"))->=1)
		$Current:=Form:C1466.imageRange
		
End case 

$0:=$Current
