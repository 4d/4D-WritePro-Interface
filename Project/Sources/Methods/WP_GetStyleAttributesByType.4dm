//%attributes = {"invisible":true}

C_LONGINT:C283($1; $type)
C_COLLECTION:C1488($0; $col)

C_LONGINT:C283($type)
C_BOOLEAN:C305($block1; $block2; $block3; $block4)

$type:=$1

Case of 
	: ($type=wk type default:K81:190)  // character
		
		$block1:=True:C214  // char
		$block2:=False:C215  // tabs, align, lists, indent
		$block3:=False:C215  // margins and padding
		$block4:=False:C215  // frames
		
	: ($type=wk type paragraph:K81:191)
		
		$block1:=True:C214  // except wk vertical align
		$block2:=True:C214
		$block3:=True:C214
		$block4:=True:C214
		
End case 

$col:=New collection:C1472

If ($block1)
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk font:K81:69)))
	$col.push(New object:C1471("properties"; New collection:C1472(wk font size:K81:66)))  // if same as normal don't add in style sheet properties
	$col.push(New object:C1471("properties"; New collection:C1472(wk text color:K81:64)))  //OK
	$col.push(New object:C1471("properties"; New collection:C1472(wk background color:K81:20)))  //OK
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk text underline style:K81:73; wk text linethrough style:K81:75)))  // special case
	$col.push(New object:C1471("properties"; New collection:C1472(wk text underline color:K81:74)))
	$col.push(New object:C1471("properties"; New collection:C1472(wk text linethrough color:K81:76)))
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk text shadow color:K81:71; wk text shadow offset:K81:72)))  // special case
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk text transform:K81:70)))
	
	If ($type=wk type default:K81:190)
		$col.push(New object:C1471("properties"; New collection:C1472(wk vertical align:K81:9)))
	End if 
	
End if 


If ($block2)  // align, indent, tabs
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk text align:K81:49)))  // OK
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk text indent:K81:52)))  // OK
	$col.push(New object:C1471("properties"; New collection:C1472(wk line height:K81:51)))  // OK
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk tabs:K81:278; wk tab default:K81:279)))
	
	//$col.push(New object("properties";New collection(wk background color))) // already present for FONTS in $block1
	$col.push(New object:C1471("properties"; New collection:C1472(wk background image:K81:21)))  // pb car pas dans "normal"
	$col.push(New object:C1471("properties"; New collection:C1472(wk list style type:K81:55)))
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk width:K81:45; wk min height:K81:48; wk min width:K81:47)))
	$col.push(New object:C1471("properties"; New collection:C1472(wk background position horizontal:K81:22; wk background position vertical:K81:23)))
	$col.push(New object:C1471("properties"; New collection:C1472(wk background width:K81:27; wk background height:K81:28)))
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk avoid widows and orphans:K81:261; wk keep with next:K81:366; wk page break inside paragraph:K81:360)))  // RL 08/03/22
	
	// Not taken into account
	
	//$col.push(New object("properties";New collection(wk list start number)))
	//$col.push(New object("properties";New collection(wk list string format LTR)))
	//$col.push(New object("properties";New collection(wk list string format RTL)))
	//$col.push(New object("properties";New collection(wk list style image)))
	//$col.push(New object("properties";New collection(wk list style image height)))
	//$col.push(New object("properties";New collection(wk list style image url)))
	
	
End if 


If ($block3)  // margin and padding
	$col.push(New object:C1471("properties"; New collection:C1472(wk margin left:K81:11; wk margin right:K81:12; wk margin top:K81:13; wk margin bottom:K81:14)))  // special case
	$col.push(New object:C1471("properties"; New collection:C1472(wk padding left:K81:16; wk padding right:K81:17; wk padding top:K81:18; wk padding bottom:K81:19)))  // special case
End if 


If ($block4)  //  borders (style, width color, radius)
	
	$col.push(New object:C1471("properties"; New collection:C1472(wk border style top:K81:32; wk border style left:K81:30; wk border style bottom:K81:33; wk border style right:K81:31)))  // special case
	$col.push(New object:C1471("properties"; New collection:C1472(wk border width top:K81:42; wk border width left:K81:40; wk border width bottom:K81:43; wk border width right:K81:41)))  // special case
	$col.push(New object:C1471("properties"; New collection:C1472(wk border color top:K81:37; wk border color left:K81:35; wk border color bottom:K81:38; wk border color right:K81:36)))  // special case
	$col.push(New object:C1471("properties"; New collection:C1472(wk border radius:K81:44)))
	
	//$borders:=New collection
	//$borders.push(wk border style top)
	//$borders.push(wk border style left)
	//$borders.push(wk border style bottom)
	//$borders.push(wk border style right)
	
	//$borders.push(wk border width top)
	//$borders.push(wk border width left)
	//$borders.push(wk border width bottom)
	//$borders.push(wk border width right)
	
	//$borders.push(wk border color top)
	//$borders.push(wk border color left)
	//$borders.push(wk border color bottom)
	//$borders.push(wk border color right)
	
	//$borders.push(wk border radius)
	
	//$col.push(New object("properties";$borders))
	
End if 

$0:=$col

