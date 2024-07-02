Class constructor($target : Object; $index : Integer)
	
	Case of 
		: (Count parameters:C259=2)
			This:C1470.section:=WP Get section:C1581($target; $index)  // document + index
			
		: (Value type:C1509($target)=Is object:K8:27)
			This:C1470.section:=WP Get section:C1581($target)  //element
	End case 
	
	
Function newHeader()->$header : Object
	$header:=WP New header:C1586(This:C1470.section)
	
Function newFooter($section : Object)->$footer : Object
	$footer:=WP New footer:C1587(This:C1470.section)