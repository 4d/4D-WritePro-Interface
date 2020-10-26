//%attributes = {"invisible":true}
var $1 : Collection
var $col : Collection
var $i; $p : Integer

If (Count parameters:C259=0)
	
	// test with doubles
	$col:=New collection:C1472("b"; "a"; "c"; 10; "a"; 20; "d"; 10; "a"; 50; "b"; 20; "y"; "c"; "b"; "b")
	distinctKeepOrder($col)
	
	// test without doubles
	$col:=New collection:C1472("a"; "b"; "c"; "d"; "e")
	distinctKeepOrder($col)
	
Else 
	
	$col:=$1
	
	//$col2:=$col1.distinct()
	//If ($col1.length#$col2.length)  // there are some doubles
	
	$i:=0
	While ($i<($col.length-1))
		$p:=$col.indexOf($col[$i]; $i+1)
		
		If ($p>=0)
			$col.remove($p)
		Else 
			$i:=$i+1
		End if 
		
	End while 
	
	//End if 
	
End if 

