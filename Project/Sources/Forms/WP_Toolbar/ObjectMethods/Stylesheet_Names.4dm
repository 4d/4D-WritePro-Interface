var $stylesheetName : Text:=Self:C308->{Self:C308->}

// Create mutliLevelStyles style sheet if any

var $area : Object:=Form:C1466.area
var $c:=WP Get style sheets:C1655($area; 1)

If ($c.query("name = :1"; $stylesheetName).first()=Null:C1517)
	
	var $template : Object:=Form:C1466.predefinedMultiLevelLists.query("name = :1"; $stylesheetName).first()
	var $levelCount : Integer:=$template.levels.length
	
	
/*
The style sheet name must comply with the following rules:
	
- it must start with a letter
- it can then contain alphanumeric characters, space characters, "-" characters or unicode characters >= 128
- it must be unique in the document regardless of the type
- it must not start with "section", which is reserved
- the "_" is replaced by a space and trailing spaces are removed.
	
*/
	
	$stylesheetName:=Replace string:C233($stylesheetName; "&"; "and")
	
	var $style:=WP New style sheet:C1650($area; wk type paragraph:K81:191; $stylesheetName; $levelCount)
	
	
	var $i : Integer
	For ($i; 0; $levelCount-1; 1)
		
		var $level : Object:=WP Get style sheet:C1656($area; $stylesheetName; $i+1)
		var $currentLevel : Object:=$template.levels[$i]
		var $attribute : Text
		var $o : Object
		For each ($attribute; $currentLevel)
			
			If ($attribute="level")
				
				continue
				
			End if 
			
			If (["listStyleType"].includes($attribute))
				
				var $value:=Formula from string:C1601("wk "+$currentLevel[$attribute]).call()
				
				WP SET ATTRIBUTES:C1342($level; $attribute; $value)
				
			Else 
				
				WP SET ATTRIBUTES:C1342($level; $attribute; $currentLevel[$attribute])
				
				
			End if 
			
			
		End for each 
	End for 
	
	//var $level : Object
	//For each ($level; $template.levels)
	//$i+=1
	//var $attribute : Text
	//For each ($attribute; $level)
	//If ($attribute="level") 
	//continue
	//End if 
	//var $o:={}
	//$o[$attribute]:=$template[$attribute]
	//WP SET ATTRIBUTES($level; $o)
	//End for each 
	//End for each 
	
End if 

WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $stylesheetName)

SET TIMER:C645(-1)