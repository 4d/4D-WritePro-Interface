//%attributes = {"invisible":true}
#DECLARE($checkObject : Text)->$current : Object


var $typeSelection : Integer
var $applyTo : Text


If (Count parameters:C259=0)  // as before
	
	$current:=Form:C1466.paragraphRange
	
	//$typeSelection:=Form.selection.type
	
	//Case of 
	
	//: ($typeSelection=2)  // background image
	//$current:=Form.selection  // ??
	
	//: ((OBJECT Get pointer(Object named; "TargetSelector1"))->=1)
	//$current:=Form.selection[wk owner]
	
	//: ((OBJECT Get pointer(Object named; "TargetSelector2"))->=1)
	//$current:=Form.paragraphRange
	
	//: ((OBJECT Get pointer(Object named; "TargetSelector3"))->=1)
	//$current:=Form.imageRange
	
	//End case 
	
	
Else   //$checkObject = "popup"
	
	$applyTo:=UI_GetApplyTo
	
	Case of 
			
		: (Form:C1466.selection.type=2)  // background image
			$current:=Form:C1466.selection
			
			
		: ($applyTo="doc")
			$current:=Form:C1466.selection[wk owner:K81:168]
			
		: ($applyTo="header")
			$current:=WP Get subsection:C1582(Form:C1466.selection)
			If ($current=Null:C1517)
				$current:=WP Get section:C1581(Form:C1466.selection)
			End if 
			$current:=WP Get header:C1503($current)
			
		: ($applyTo="footer")
			
			$current:=WP Get subsection:C1582(Form:C1466.selection)
			If ($current=Null:C1517)
				$current:=WP Get section:C1581(Form:C1466.selection)
			End if 
			$current:=WP Get footer:C1504($current)
			
		: ($applyTo="section")
			$current:=WP Get subsection:C1582(Form:C1466.selection)
			If ($current=Null:C1517)
				$current:=WP Get section:C1581(Form:C1466.selection)
			End if 
			
		: ($applyTo="paragraph")
			$current:=Form:C1466.paragraphRange
			
		: ($applyTo="image")
			$current:=Form:C1466.imageRange
			
		: ($applyTo="textBox")
			If (Not:C34(Undefined:C82(Form:C1466.selection.container))) && (Form:C1466.selection.container.type=300)
				$current:=Form:C1466.selection.container
			End if 
			
		: ($applyTo="table")
			$current:=WP Table range:C1553(Form:C1466.selection)
			
		: ($applyTo="cell")
			$current:=WP Table get cells:C1477(Form:C1466.selection)
			
		: ($applyTo="row")
			$current:=WP Table get rows:C1475(Form:C1466.selection)
			
		Else 
			
	End case 
	
End if 
