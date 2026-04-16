//%attributes = {"invisible":true}
#DECLARE($name : Text; $doc : Object; $type : Integer) : Text

/*

WP_NormalizeStyleSheetName ( name {; doc {; type}} ) -> Text
  -> name: Propsed name
  -> doc : Write Pro document whether it is necessary to ensure that names are unique
  -> type: Type of stylesheet to check (paragraph by default if not specified)
  <- Normalized name (empty name if not compliant)

The style sheet name must comply with the following rules:

- it must start with a letter
- it can then contain alphanumeric characters, space characters, "-" characters or unicode characters >= 128
- it must be unique in the document regardless of the type
- it must not start with "section", which is reserved
- the "_" is replaced by a space and trailing spaces are removed.

*/

// Must not start with "section", which is reserved
If (Position:C15("section"; $name)=1)\
 || (Length:C16($name)=0)
	
	return 
	
End if 

$name:=Trim:C1853($name)

var $normalized:=""
var $i : Integer

For ($i; 1; Length:C16($name); 1)
	
	var $char:=Substring:C12($name; $i; 1)
	var $code:=Character code:C91($char)
	
	If ($i=1)
		
		// First character = letter or Unicode character >= 128
		If ($code>=128)\
			 || Match regex:C1019("[A-Za-z]"; $char; 1; *)
			
			$normalized+=$char
			
		End if 
		
	Else 
		
		// Next: alnum, space, “-”, Unicode >=128
		If ($code>=128)\
			 || Match regex:C1019("[A-Za-z0-9 -]"; $char; 1; *)
			
			$normalized+=$char
			
		End if 
	End if 
End for 

If ($doc=Null:C1517)
	
	return $normalized
	
End if 

// The name must be unique within the document
var $allStyleSheets:=WP Get style sheets:C1655($doc; $type#0 ? $type : wk type paragraph:K81:191)

While ($allStyleSheets.query("name= :1"; $normalized).first()#Null:C1517)
	
	$normalized:=TOOL_IncrementString($normalized)
	
End while 

return $normalized