var $text; $size : Text
var $wp; $range : Object
var $paragraphs; $replaced : Collection
var $paragraph : Object
var $remove; $p1; $p2 : Integer

$text:=WP Get text:C1575(Form:C1466.WPai)

$wp:=WP New:C1317()
WP SET TEXT:C1574($wp; $text; wk replace:K81:177)
WP SET ATTRIBUTES:C1342($wp; wk font size:K81:66; "18pt")

$paragraphs:=WP Get elements:C1550($wp; wk type paragraph:K81:191)

For each ($paragraph; $paragraphs)
	
	
	$text:=WP Get text:C1575($paragraph; wk expressions as value:K81:255)
	
	Case of 
		: ($text="####@")
			$remove:=6
			$size:="24pt"
			
		: ($text="###@")
			$remove:=5
			$size:="28pt"
			
		: ($text="##@")
			$remove:=4
			$size:="32pt"
			
		: ($text="#@")
			$remove:=3
			$size:="36pt"
			
		Else 
			$remove:=0
	End case 
	
	If ($remove#0)
		$text:=Substring:C12($text; $remove)
		WP SET TEXT:C1574($paragraph; $text; wk replace:K81:177)
		WP SET ATTRIBUTES:C1342($paragraph; wk font size:K81:66; $size)
	End if 
	
	$p1:=Position:C15("**"; $text; 0)
	If ($p1>0)
		$p2:=Position:C15("**"; $text; $p1+1)
		If ($p2>0)
			$range:=WP Paragraph range:C1346($paragraph)
			$range:=WP Text range:C1341($range; $range.start+$p1+1; $range.start+$p2-1)
			
			WP SET ATTRIBUTES:C1342($range; wk font bold:K81:68; wk true:K81:174)
			
		End if 
	End if 
	
End for each 

$replaced:=WP Find all:C1755($wp; "**"; wk all insensitive:K81:334; "")


Form:C1466.WPai:=WP New:C1317($wp)

