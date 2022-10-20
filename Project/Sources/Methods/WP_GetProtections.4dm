//%attributes = {"invisible":true}
C_OBJECT:C1216($1; $range)

C_BOOLEAN:C305($docProtected)
C_LONGINT:C283($protection)
C_OBJECT:C1216($document)
C_OBJECT:C1216($tableRange)
C_OBJECT:C1216($rows; $cells)
$range:=$1
$document:=$range.owner



//-------------------- document ----------------------

WP GET ATTRIBUTES:C1345($document; wk protection enabled:K81:307; $docProtected)

Form:C1466.protectionEnabled:=$docProtected

//-------------------- paragraph ----------------------

WP GET ATTRIBUTES:C1345($range; wk protected:K81:306; $protection)
If ($protection=wk mixed:K81:89)
	$protection:=2  // semi-checked on palettes, checked on toolbar 
End if 

Form:C1466.paragraphProtected:=$protection


If ($range.type#2)  // anchored picture (check added 2021/01/13 by RL)
	
	//---------------------- table ------------------------
	If (WP Get elements:C1550($range; wk type table:K81:222).length>0)
		
		$tableRange:=WP Table range:C1553($range)
		WP GET ATTRIBUTES:C1345($tableRange; wk protected:K81:306; $protection)
		
		If ($protection=wk mixed:K81:89)
			$protection:=2  // semi-checked on palettes, checked on toolbar 
		End if 
		
	Else 
		$protection:=0
	End if 
	
	Form:C1466.tableProtected:=$protection
	
	//---------------------- row ------------------------
	
	$rows:=WP Table get rows:C1475($range)
	If (Not:C34($rows=Null:C1517))
		WP GET ATTRIBUTES:C1345($rows; wk protected:K81:306; $protection)
		
		If ($protection=wk mixed:K81:89)
			$protection:=2  // semi-checked on palettes, checked on toolbar 
		End if 
		
	Else 
		$protection:=0
	End if 
	
	Form:C1466.rowProtected:=$protection
	
	//---------------------- cell ------------------------
	
	$cells:=WP Table get cells:C1477($range)
	If (Not:C34($cells=Null:C1517))
		
		WP GET ATTRIBUTES:C1345($cells; wk protected:K81:306; $protection)
		
		If ($protection=wk mixed:K81:89)
			$protection:=2  // semi-checked on palettes, checked on toolbar 
		End if 
		
	Else 
		$protection:=0
	End if 
	
	Form:C1466.cellProtected:=$protection
	
	
	//----------------- text box --------------------
	
	If ($range#Null:C1517) && (OB Is defined:C1231($range; "container")) && ($range.container.type=300)  // 300 == wk type text box
		WP GET ATTRIBUTES:C1345($range.container; wk protected:K81:306; $protection)
		Form:C1466.textboxProtected:=$protection
	End if 
	
Else 
	
	Form:C1466.tableProtected:=0
	Form:C1466.rowProtected:=0
	Form:C1466.cellProtected:=0
	
End if 

