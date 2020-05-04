//%attributes = {"invisible":true}
C_POINTER:C301($ptrStylesheetNames)
C_LONGINT:C283($p)
C_TEXT:C284($name)



If (UI_isProtected )
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
Else 
	
	
	OBJECT SET ENABLED:C1123(*;"decor@";False:C215)
	
	If (Form:C1466.selection.type=wk type image:K81:192)
		
		OBJECT SET ENABLED:C1123(*;"Stylesheet_@";False:C215)
		
	Else 
		
		OBJECT SET ENABLED:C1123(*;"Stylesheet_@";True:C214)
		
		$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"Stylesheet_Names")
		
		$p:=$ptrStylesheetNames->
		
		If ($p>0)
			$name:=$ptrStylesheetNames->{$p}
		Else 
			$name:=""
		End if 
		
		If ($name="normal") | ($name="")
			OBJECT SET ENABLED:C1123(*;"Stylesheet_btnDelete";False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;"Stylesheet_btnDelete";True:C214)
		End if 
		
		  //If ($name="")
		  //OBJECT SET ENABLED(*;"Stylesheet_btnEdit";False)
		  //Else 
		  //OBJECT SET ENABLED(*;"Stylesheet_btnEdit";True)
		  //End if 
		
	End if 
End if 
