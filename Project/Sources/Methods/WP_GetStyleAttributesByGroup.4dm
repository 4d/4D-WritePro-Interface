//%attributes = {"invisible":true}

C_TEXT:C284($1;$group)
C_COLLECTION:C1488($0;$col)



$group:=$1

$col:=New collection:C1472

If ($group="fonts")
	
	  //$col.push(New object("property";wk font family;"label";Get localized string("ssFontFamily");"visibleValue";True))
	$col.push(New object:C1471("property";wk font:K81:69;"label";Get localized string:C991("ssFont");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk font size:K81:66;"label";Get localized string:C991("ssFontSize");"visibleValue";True:C214;"valueType";Is text:K8:3))
	  //$col.push(New object("property";wk font bold;"label";Get localized string("ssBold");"visibleValue";False))
	  //$col.push(New object("property";wk font italic;"label";Get localized string("ssItalic");"visibleValue";False))
	$col.push(New object:C1471("property";wk text color:K81:64;"label";Get localized string:C991("ssTextColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	If (Form:C1466.stylesheet.type=wk type default:K81:190)  // character style sheet only
		$col.push(New object:C1471("property";wk background color:K81:20;"label";Get localized string:C991("ssBackgroundColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	End if 
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk text underline style:K81:73;"label";Get localized string:C991("ssUnderlineStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471("property";wk text underline color:K81:74;"label";Get localized string:C991("ssUnderlineColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk text linethrough style:K81:75;"label";Get localized string:C991("ssLinethroughStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471("property";wk text linethrough color:K81:76;"label";Get localized string:C991("ssLinethroughColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk text shadow color:K81:71;"label";Get localized string:C991("ssShadowColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471("property";wk text shadow offset:K81:72;"label";Get localized string:C991("ssShadowOffet");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk text transform:K81:70;"label";Get localized string:C991("ssTransform");"visibleValue";True:C214;"valueType";Is real:K8:4))
	
	If (Form:C1466.stylesheet.type=wk type default:K81:190)  // character style sheet only
		$col.push(New object:C1471)
		$col.push(New object:C1471("property";wk vertical align:K81:9;"label";Get localized string:C991("ssVerticalAlign");"visibleValue";True:C214;"valueType";Is real:K8:4))
	End if 
	
End if 


If ($group="paragraphs")  // align, indent, tabs
	
	$col.push(New object:C1471("property";wk text align:K81:49;"label";Get localized string:C991("ssHorizontalAlign");"visibleValue";True:C214;"valueType";Is real:K8:4))  // OK
	$col.push(New object:C1471("property";wk line height:K81:51;"label";Get localized string:C991("ssLineHeight");"visibleValue";True:C214;"valueType";Is text:K8:3))  // OK
	$col.push(New object:C1471("property";wk vertical align:K81:9;"label";Get localized string:C991("ssVerticalAlign");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk text indent:K81:52;"label";Get localized string:C991("ssTextIndent");"visibleValue";True:C214;"valueType";Is text:K8:3))  // OK
	$col.push(New object:C1471("property";wk tab default:K81:279;"label";Get localized string:C991("ssDefaultTab");"visibleValue";False:C215;"valueType";Is object:K8:27))
	$col.push(New object:C1471("property";wk tabs:K81:278;"label";Get localized string:C991("ssTabs");"visibleValue";False:C215;"valueType";Is collection:K8:32))
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk background color:K81:20;"label";Get localized string:C991("ssBackgroundColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	$col.push(New object:C1471("property";wk list style type:K81:55;"label";Get localized string:C991("ssListStyleType");"visibleValue";True:C214;"valueType";Is real:K8:4))
	
	  //Not in the interface
	  //$col.push(New object("property";wk list start number))
	  //$col.push(New object("property";wk list string format LTR))
	  //$col.push(New object("property";wk list string format RTL))
	  //$col.push(New object("property";wk list style image))
	  //$col.push(New object("property";wk list style image height))
	  //$col.push(New object("property";wk list style image url))
	
End if 


If ($group="margins")
	
	$col.push(New object:C1471("property";wk margin left:K81:11;"label";Get localized string:C991("ssMarginLeft");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk margin right:K81:12;"label";Get localized string:C991("ssMarginTop");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk margin top:K81:13;"label";Get localized string:C991("ssMarginRight");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk margin bottom:K81:14;"label";Get localized string:C991("ssMarginBottom");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471)
	
	$col.push(New object:C1471("property";wk padding left:K81:16;"label";Get localized string:C991("ssPaddingLeft");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk padding right:K81:17;"label";Get localized string:C991("ssPaddingTop");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk padding top:K81:18;"label";Get localized string:C991("ssPaddingRight");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471("property";wk padding bottom:K81:19;"label";Get localized string:C991("ssPaddingBottom");"visibleValue";True:C214;"valueType";Is text:K8:3))
	$col.push(New object:C1471)
	
	  //End if 
	
	  //If ($group="borders")  //  borders (style, width color, radius)
	
	If (True:C214)
		$col.push(New object:C1471("property";wk border style right:K81:31;"label";Get localized string:C991("ssBorderStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border style left:K81:30;"label";Get localized string:C991("ssBorderStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border style top:K81:32;"label";Get localized string:C991("ssBorderStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border style bottom:K81:33;"label";Get localized string:C991("ssBorderStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471)
		$col.push(New object:C1471("property";wk border width right:K81:41;"label";Get localized string:C991("ssBorderWidth");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border width left:K81:40;"label";Get localized string:C991("ssBorderWidth");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border width top:K81:42;"label";Get localized string:C991("ssBorderWidth");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border width bottom:K81:43;"label";Get localized string:C991("ssBorderWidth");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471)
		$col.push(New object:C1471("property";wk border color right:K81:36;"label";Get localized string:C991("ssBorderColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border color left:K81:35;"label";Get localized string:C991("ssBorderColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border color top:K81:37;"label";Get localized string:C991("ssBorderColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border color bottom:K81:38;"label";Get localized string:C991("ssBorderColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
		
	Else 
		$col.push(New object:C1471("property";wk border style:K81:29;"label";Get localized string:C991("ssBorderStyle");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border width:K81:39;"label";Get localized string:C991("ssBorderWidth");"visibleValue";True:C214;"valueType";Is real:K8:4))
		$col.push(New object:C1471("property";wk border color:K81:34;"label";Get localized string:C991("ssBorderColor");"visibleValue";True:C214;"valueType";Is real:K8:4))
	End if 
	
	$col.push(New object:C1471)
	$col.push(New object:C1471("property";wk border radius:K81:44;"label";Get localized string:C991("ssBorderRadius");"visibleValue";True:C214;"valueType";Is real:K8:4))
	
End if 

$0:=$col
