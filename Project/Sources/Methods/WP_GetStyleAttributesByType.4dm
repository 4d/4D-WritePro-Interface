//%attributes = {"invisible":true}
#DECLARE($type : Integer) : Collection

var $attribtes:=[]

// MARK:- Common: Font, Text
$attribtes.push({properties: [wk font:K81:69]})
$attribtes.push({properties: [wk font size:K81:66]})  // If same as normal don't add in style sheet properties

$attribtes.push({properties: [wk text color:K81:64]})
$attribtes.push({properties: [wk background color:K81:20]})

$attribtes.push({properties: [wk text underline style:K81:73; wk text linethrough style:K81:75]})  // Special case
$attribtes.push({properties: [wk text underline color:K81:74]})
$attribtes.push({properties: [wk text linethrough color:K81:76]})

$attribtes.push({properties: [wk text shadow color:K81:71; wk text shadow offset:K81:72]})  // Special case

$attribtes.push({properties: [wk text transform:K81:70]})

If ($type=wk type paragraph:K81:191)\
 || ($type=6)
	
	// MARK:- Align, indent, tabs
	$attribtes.push({properties: [wk text align:K81:49]})
	$attribtes.push({properties: [wk vertical align:K81:9]})
	
	$attribtes.push({properties: [wk text indent:K81:52]})
	$attribtes.push({properties: [wk line height:K81:51]})
	
	$attribtes.push({properties: [wk tabs:K81:278; wk tab default:K81:279]})
	
	$attribtes.push({properties: [wk background image:K81:21]})  // Problem because it's not in “normal”
	$attribtes.push({properties: [wk list style type:K81:55]})
	
	$attribtes.push({properties: [wk width:K81:45; wk min height:K81:48; wk min width:K81:47]})
	$attribtes.push({properties: [wk background position horizontal:K81:22; wk background position vertical:K81:23]})
	$attribtes.push({properties: [wk background width:K81:27; wk background height:K81:28]})
	
	$attribtes.push({properties: [wk avoid widows and orphans:K81:261; wk keep with next:K81:366; wk page break inside paragraph:K81:360]})  // RL 08/03/22
	
	// MARK:- Margin and padding
	$attribtes.push({properties: [wk margin left:K81:11; wk margin right:K81:12; wk margin top:K81:13; wk margin bottom:K81:14]})  // Special case
	$attribtes.push({properties: [wk padding left:K81:16; wk padding right:K81:17; wk padding top:K81:18; wk padding bottom:K81:19]})  // Special case
	
	// MARK:- Borders (style, width color, radius)
	$attribtes.push({properties: [wk border style top:K81:32; wk border style left:K81:30; wk border style bottom:K81:33; wk border style right:K81:31]})  // Special case
	$attribtes.push({properties: [wk border width top:K81:42; wk border width left:K81:40; wk border width bottom:K81:43; wk border width right:K81:41]})  // Special case
	$attribtes.push({properties: [wk border color top:K81:37; wk border color left:K81:35; wk border color bottom:K81:38; wk border color right:K81:36]})  // Special case
	$attribtes.push({properties: [wk border radius:K81:44]})
	
End if 

If ($type=6)
	
	$attribtes.push({properties: [wk list concat string format:K81:395]})
	$attribtes.push({properties: [wk list font:K81:60]})
	$attribtes.push({properties: [wk list level count:K81:394]})
	$attribtes.push({properties: [wk list level index:K81:393]})
	$attribtes.push({properties: [wk list root style:K81:392]})
	$attribtes.push({properties: [wk list start number:K81:61]})
	$attribtes.push({properties: [wk list string format LTR:K81:58]})
	$attribtes.push({properties: [wk list string format RTL:K81:59]})
	$attribtes.push({properties: [wk list style image:K81:56]})
	$attribtes.push({properties: [wk list style image height:K81:57]})
	$attribtes.push({properties: [wk list style image url:K81:219]})
	$attribtes.push({properties: [wk list style type:K81:55]})
	
End if 

return $attribtes