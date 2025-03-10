//%attributes = {}
#DECLARE($mdText : Text; $mdStyles : Object)->$wp : Object

var $text; $size : Text
var $range; $paragraphRange; $textRange : Object
var $paragraphs; $mdTags; $mdTitles : Collection
var $paragraph; $mdTitle; $mdTag : Object
var $remove; $p1; $p2 : Integer
var $exit; $found : Boolean
var $findReplace; $item; $replaced : Collection  // of strings


If (Count parameters:C259<2)
	$mdStyles:=New object:C1471
End if 

//MARK: Manage Default styles 
If (Undefined:C82($mdStyles.title1))
	$mdStyles.title1:={fontSize: 36; fontFamily: "Times New Roman"}
End if 
If (Undefined:C82($mdStyles.title2))
	$mdStyles.title2:={fontSize: 32; fontFamily: "Times New Roman"}
End if 
If (Undefined:C82($mdStyles.title3))
	$mdStyles.title3:={fontSize: 28; fontFamily: "Times New Roman"}
End if 
If (Undefined:C82($mdStyles.title4))
	$mdStyles.title4:={fontSize: 24; fontFamily: "Times New Roman"}
End if 
If (Undefined:C82($mdStyles.title5))
	$mdStyles.title5:={fontSize: 22; fontFamily: "Times New Roman"}
End if 
If (Undefined:C82($mdStyles.title6))
	$mdStyles.title6:={fontSize: 20; fontFamily: "Times New Roman"}
End if 

If (Undefined:C82($mdStyles.fontSize))
	$mdStyles.fontSize:="16pt"
End if 
If (Undefined:C82($mdStyles.italic))
	$mdStyles.italic:={fontItalic: 1}
End if 
If (Undefined:C82($mdStyles.bold))
	$mdStyles.bold:={fontBold: 1}
End if 
If (Undefined:C82($mdStyles.lineThrough))
	$mdStyles.lineThrough:={textLinethroughStyle: 1; textLinethroughColor: "black"}
End if 
If (Undefined:C82($mdStyles.monospace))
	$mdStyles.monospace:={fontFamily: "courier new"}
End if 


//If (Undefined($mdStyles.boldItalic))
//$mdStyles.boldItalic:={}
//For each ($attribute; $mdStyles.italic)  // italic first
//$mdStyles.boldItalic[$attribute]:=$mdStyles.italic[$attribute]
//End for each 
//For each ($attribute; $mdStyles.bold)  // bold will win if any common attributes
//$mdStyles.boldItalic[$attribute]:=$mdStyles.bold[$attribute]
//End for each 
//End if 


$mdTitles:=[]
$mdTitles.push({start: "######"; style: $mdStyles.title6})
$mdTitles.push({start: "#####"; style: $mdStyles.title5})
$mdTitles.push({start: "####"; style: $mdStyles.title4})
$mdTitles.push({start: "###"; style: $mdStyles.title3})
$mdTitles.push({start: "##"; style: $mdStyles.title2})
$mdTitles.push({start: "#"; style: $mdStyles.title1})

$mdTags:=[]
//$mdTags.push({tagStart: "***"; tagEnd: "***"; style: $mdStyles.boldItalic})
//$mdTags.push({tagStart: "___"; tagEnd: "___"; style: $mdStyles.boldItalic})
//$mdTags.push({tagStart: "_**"; tagEnd: "**_"; style: $mdStyles.boldItalic})
//$mdTags.push({tagStart: "**_"; tagEnd: "_**"; style: $mdStyles.boldItalic})
//$mdTags.push({tagStart: "__*"; tagEnd: "*__"; style: $mdStyles.boldItalic})
//$mdTags.push({tagStart: "*__"; tagEnd: "__*"; style: $mdStyles.boldItalic})

$mdTags.push({tagStart: "**"; tagEnd: "**"; style: $mdStyles.bold})
$mdTags.push({tagStart: "__"; tagEnd: "__"; style: $mdStyles.bold})

$mdTags.push({tagStart: "~~"; tagEnd: "~~"; style: $mdStyles.lineThrough})
$mdTags.push({tagStart: "*"; tagEnd: "*"; style: $mdStyles.italic})
$mdTags.push({tagStart: "_"; tagEnd: "_"; style: $mdStyles.italic})
$mdTags.push({tagStart: "`"; tagEnd: "`"; style: $mdStyles.monospace})


$findReplace:=[]
$findReplace.push(["\\*"; "[star]"])
$findReplace.push(["\\_"; "[underscore]"])
$findReplace.push(["\\\\"; "[antislash]"])

For each ($item; $findReplace)
	$mdText:=Replace string:C233($mdText; $item[0]; $item[1])
End for each 



$wp:=WP New:C1317()
WP SET TEXT:C1574($wp; $mdText; wk replace:K81:177)

WP SET ATTRIBUTES:C1342($wp; wk font size:K81:66; $mdStyles.fontSize)

$paragraphs:=WP Get elements:C1550($wp; wk type paragraph:K81:191)

For each ($paragraph; $paragraphs.reverse())  // reverse is mandatory because the ranges will change each time a tag is removed !
	
	//MARK: Manage TITLES 
	$text:=WP Get text:C1575($paragraph; wk expressions as value:K81:255)
	If ($text#"")
		
		If ($text="#@")
			$exit:=False:C215
			For each ($mdTitle; $mdTitles) Until ($exit)
				
				If ($text=($mdTitle.start+"@"))
					$remove:=Length:C16($mdTitle.start)+2
					
					$text:=Substring:C12($text; $remove)
					WP SET TEXT:C1574($paragraph; $text; wk replace:K81:177)
					WP SET ATTRIBUTES:C1342($paragraph; $mdTitle.style)
					
					$exit:=True:C214
				End if 
			End for each 
		End if 
		
		$paragraphRange:=WP Paragraph range:C1346($paragraph)
		
		
		//MARK: Manage STYLES
		If (True:C214)
			For each ($mdTag; $mdTags)
				
				$p1:=1
				$found:=False:C215
				Repeat 
					$p1:=Position:C15($mdTag.tagStart; $text; $p1)
					If ($p1>0)
						$p2:=Position:C15($mdTag.tagEnd; $text; $p1+Length:C16($mdTag.tagStart))
						If ($p2>0)
							$textRange:=WP Text range:C1341($paragraphRange; $paragraphRange.start+$p1+Length:C16($mdTag.tagStart)-1; $paragraphRange.start+$p2-1)
							
							WP SET ATTRIBUTES:C1342($textRange; $mdTag.style)
							$p1:=$p2+Length:C16($mdTag.tagEnd)
							$found:=True:C214
						End if 
					End if 
				Until ($p1<=0) || ($p2<=0)
				
				If ($found)
					$replaced:=WP Find all:C1755($paragraphRange; $mdTag.tagStart; wk all insensitive:K81:334; "")
					$replaced:=WP Find all:C1755($paragraphRange; $mdTag.tagEnd; wk all insensitive:K81:334; "")
					
					$paragraphRange:=WP Paragraph range:C1346($paragraph)
					$text:=WP Get text:C1575($paragraph; wk expressions as value:K81:255)
					
				End if 
			End for each 
		End if 
		
		
		//If (False)
		//$p1:=MAXLONG
		//For ($i; 0; $mdTags.length-1)
		//$pos:=Position($mdTags[$i].tagStart; $text; $p1)
		//If ($pos>0) & ($pos<$p1)
		//$p1:=$pos
		//$j:=$i
		//End if 
		//End for 
		
		//If ($p1#0)  // first tag found
		//$p2:=Position($mdTags[$j].tagEnd; $text; $p1+Length($mdTags[$j].tagStart))
		//If ($p2>0)
		//$textRange:=WP Text range($paragraphRange; $paragraphRange.start+$p1+Length($mdTag.tagStart)-1; $paragraphRange.start+$p2-1)
		
		//WP SET ATTRIBUTES($textRange; $mdTag.style)
		//$p1:=$p2+Length($mdTag[$j].tagEnd)
		
		//End if 
		//End if 
		//End if 
		
		
	End if 
End for each 



$findReplace:=[]
$findReplace.push(["*"; "[star]"])
$findReplace.push(["_"; "[underscore]"])
$findReplace.push(["\\"; "[antislash]"])

For each ($item; $findReplace)
	$replaced:=WP Find all:C1755($wp; $item[1]; wk all insensitive:K81:334; $item[0])
End for each 



//Form.WPai:=WP New($wp)




