//%attributes = {"invisible":true}
C_POINTER:C301($ptrListbox;$ptrStylesheetNames)
C_LONGINT:C283($p)
C_TEXT:C284($name)

If (Form:C1466.selection.type=2)
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
Else 
	OBJECT SET ENABLED:C1123(*;"@";True:C214)
	
	$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_StyleSheets")
	$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")
	
	$p:=Find in array:C230($ptrListbox->;True:C214)
	
	If ($p>0)
		$name:=$ptrStylesheetNames->{$p}
	Else 
		$name:=""
	End if 
	
	If ($name="normal") | ($name="")
		OBJECT SET ENABLED:C1123(*;"btnDelete";False:C215)
	Else 
		OBJECT SET ENABLED:C1123(*;"btnDelete";True:C214)
	End if 
	
	
	If ($name="")
		OBJECT SET ENABLED:C1123(*;"btnEdit";False:C215)
	Else 
		OBJECT SET ENABLED:C1123(*;"btnEdit";True:C214)
	End if 
	
End if 
